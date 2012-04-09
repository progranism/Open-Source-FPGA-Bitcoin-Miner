/*
*
* Copyright (c) 2011-2012 fpgaminer@bitcoin-mining.com
*
*
*
* This program is free software: you can redistribute it and/or modify
* it under the terms of the GNU General Public License as published by
* the Free Software Foundation, either version 3 of the License, or
* (at your option) any later version.
*
* This program is distributed in the hope that it will be useful,
* but WITHOUT ANY WARRANTY; without even the implied warranty of
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
* GNU General Public License for more details.
*
* You should have received a copy of the GNU General Public License
* along with this program.  If not, see <http://www.gnu.org/licenses/>.
* 
*/

// hash_clk:		Clock for new_nonce, golden_nonce, new_work, midstate, data.
// rx_new_nonce:	Indicate new data on rx_golden_nonce
// rx_golden_nonce:	Golden Nonce
// tx_new_work:		Indicate new work on midstate, data.
// tx_midstate:		Work midstate.
// tx_data:		Work data.
//
// comm_clk:	16x the desired UART baud rate.
// rx_serial:	UART RX (incoming)
// tx_serial:	UART TX (outgoing)


// Implemented incoming messages:
// PING, GET_INFO, PUSH_JOB, QUEUE_JOB
//
// TODO: RESET, ACK?, RESEND?, GET_CURRENT_NONCE,
// GET_BASE_CLOCK, GET_CLOCK, SET_CLOCK
//
// Implemented outgoing messages
// PONG, INFO, INVALID, RESEND, ACK
//
// TODO: NONCE_FOUND, QUEUED_JOB_STARTED, CURRENT_NONCE,
// BASE_CLOCK, CURRENT_CLOCK, NONCERANGE_EXHAUSTED


module uart_comm (
	// Hashing Clock Domain
	input hash_clk,
	input rx_need_work,
	input rx_new_nonce,
	input [31:0] rx_golden_nonce,
	output reg tx_new_work = 1'b0,
	output reg [255:0] tx_midstate = 256'd0,
	output reg [95:0] tx_data = 96'd0,
	output reg [31:0] tx_noncemin = 32'd0,
	output reg [31:0] tx_noncemax = 32'd0,

	// UART Clock Domain
	input comm_clk,
	input rx_serial,
	output tx_serial
);

	localparam MSG_BUF_LEN = 60;
	localparam JOB_SIZE = 256 + 96 + 32 + 32;

	// States
	localparam STATE_IDLE = 4'b0001;
	localparam STATE_READ = 4'b0010;
	localparam STATE_PARSE = 4'b0100;
	localparam STATE_SEND = 4'b1000;

	// Message Types
	localparam MSG_INFO = 0;
	localparam MSG_INVALID = 1;
	localparam MSG_ACK = 2;
	localparam MSG_RESEND = 3;
	localparam MSG_PUSH_JOB = 4;
	localparam MSG_QUEUE_JOB = 5;


	// Configuration data
	reg [JOB_SIZE-1:0] current_job = {JOB_SIZE{1'b0}}, queued_job = {JOB_SIZE{1'b0}};
	reg queued_job_en = 1'b0;
	reg new_work_flag = 1'b0;

	// UART Modules
	wire uart_rx_flag, uart_tx_busy;
	wire [7:0] uart_rx_byte;
	reg uart_tx_we;
	reg [7:0] uart_tx_data;

	uart_rx uart_rx_blk (
		.clk (comm_clk),
		.rx_serial (rx_serial),
		.tx_flag (uart_rx_flag),
		.tx_byte (uart_rx_byte)
	);

	uart_tx_fifo uart_tx_blk (
		.clk (comm_clk),
		.rx_we (uart_tx_we),
		.rx_data (uart_tx_data),
		.tx_busy (uart_tx_busy),
		.tx_serial (tx_serial)
	);

	// CRC32 Module
	wire crc_reset = (state == STATE_IDLE);
	wire crc_we = uart_rx_flag & (state == STATE_IDLE || state == STATE_READ);
	wire [7:0] crc_data = uart_rx_byte;
	wire [31:0] crc;

	CRC32 crc_blk (
		.clk (comm_clk),
		.reset (crc_reset),
		.rx_we (crc_we),
		.rx_byte (crc_data),
		.tx_crc (crc)
	);

	//
	reg [63:0] system_info = 256'hDEADBEEF13370D13;

	// RX Message Buffer
	reg [63:0] outgoing_msg;
	reg [7:0] outgoing_msg_type;
	reg [MSG_BUF_LEN*8-1:0] msg_data;
	reg [7:0] msg_length, length, msg_type;
	reg [3:0] state = STATE_IDLE;


	always @ (posedge comm_clk)
	begin
		uart_tx_we <= 1'b0;

		case (state)
			//// Waiting for new packet
			STATE_IDLE: if (uart_rx_flag) begin
				if (uart_rx_byte == 0)	// PING
				begin
					uart_tx_we <= 1'b1;
					uart_tx_data <= 8'd1;	// PONG
				end
				else if (uart_rx_byte < 8)	// Invalid Length
				begin
					length <= 8'd1;
					msg_length <= 8'h8;
					msg_type <= MSG_INVALID;
					state <= STATE_SEND;
				end
				else
				begin
					length <= 8'd2;
					msg_length <= uart_rx_byte;
					state <= STATE_READ;
				end
			end

			//// Reading packet
			STATE_READ: if (uart_rx_flag) begin
				msg_data <= {uart_rx_byte, msg_data[MSG_BUF_LEN*8-1:8]};
				length <= length + 8'd1;

				if (length == 8'd4)
					msg_type <= uart_rx_byte;

				if (length == msg_length)
					state <= STATE_PARSE;
			end

			//// Parse packet
			STATE_PARSE: begin
				// By default, we'll send some kind of
				// response. Special cases are handled below.
				length <= 8'd1;
				msg_length <= 8'd8;
				state <= STATE_SEND;

				if (crc != 32'd0)
					msg_type <= MSG_RESEND;
				else if (msg_type == MSG_INFO && msg_length == 8)
				begin
					msg_type <= MSG_INFO;
					msg_data <= system_info;
					msg_length <= 8'd16;
				end
				else if (msg_type == MSG_PUSH_JOB && msg_length == (JOB_SIZE/8 + 8))
				begin
					queued_job_en <= 1'b0;
					current_job <= msg_data[MSG_BUF_LEN*8-32-1:MSG_BUF_LEN*8-32-JOB_SIZE];
					new_work_flag <= ~new_work_flag;

					msg_type <= MSG_ACK;
				end
				else if (msg_type == MSG_QUEUE_JOB && msg_length == (JOB_SIZE/8 + 8))
				begin
					queued_job_en <= 1'b1;
					queued_job <= msg_data[MSG_BUF_LEN*8-32-1:MSG_BUF_LEN*8-32-JOB_SIZE];

					msg_type <= MSG_ACK;
				end
				else
					msg_type <= MSG_INVALID;
			end

			//// Send packet
			STATE_SEND: begin
				uart_tx_we <= 1'b1;
				length <= length + 8'd1;

				if (length == 8'd1)
					uart_tx_data <= msg_length;
				else if (length == 8'd2 || length == 8'd3)
					uart_tx_data <= 8'h00;
				else if (length == 8'd4)
					uart_tx_data <= msg_type;
				else if (length <= msg_length)
				begin
					uart_tx_data <= msg_data[7:0];
					msg_data <= {8'd0, msg_data[MSG_BUF_LEN*8-1:8]};
				end

				if (length == msg_length)
					state <= STATE_IDLE;
			end
		endcase
	end


	// Cross from comm_clk to hash_clk
	reg [JOB_SIZE-1:0] meta_job;
	reg [2:0] meta_new_work_flag;

	always @ (posedge hash_clk)
	begin
		meta_job <= current_job;
		meta_new_work_flag <= {new_work_flag, meta_new_work_flag[2:1]};

		tx_new_work <= meta_new_work_flag[2] ^ meta_new_work_flag[1];
		{tx_midstate, tx_data, tx_noncemin, tx_noncemax} <= meta_job;
	end

endmodule

