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
// PING, GET_INFO
//
// TODO: RESET, ACK?, RESEND?, PUSH_JOB, QUEUE_JOB, GET_CURRENT_NONCE?,
// GET_BASE_CLOCK, GET_CLOCK, SET_CLOCK
//
// Implemented outgoing messages
// PONG, INFO, INVALID
//
// TODO: ACK, RESEND, NONCE_FOUND, QUEUED_JOB_STARTED, CURRENT_NONCE,
// BASE_CLOCK, CURRENT_CLOCK, NONCERANGE_EXHAUSTED


module uart_comm (
	// Hashing Clock Domain
	input hash_clk,
	input rx_new_nonce,
	input [31:0] rx_golden_nonce,
	output reg tx_new_work = 1'b0,
	output reg [255:0] tx_midstate = 256'd0,
	output reg [95:0] tx_data = 96'd0,

	// UART Clock Domain
	input comm_clk,
	input rx_serial,
	output tx_serial
);

	localparam MSG_BUF_LEN = 60;

	// States
	localparam STATE_IDLE = 4'b0001;
	localparam STATE_READ = 4'b0010;
	localparam STATE_PARSE = 4'b0100;
	localparam STATE_SEND = 4'b1000;

	// Message Types
	localparam MSG_INFO = 0;
	localparam MSG_INVALID = 1;


	// Configuration data
	reg [351:0] current_job = 352'd0;
	reg [255:0] midstate = 256'd0;
	reg new_work_flag = 1'b0;
	reg [95:0] data = 96'd0;

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
		length <= length + 8'd1;

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

				if (msg_type == MSG_INFO && msg_length == 8)
				begin
					msg_type <= MSG_INFO;
					msg_data <= system_info;
					msg_length <= 8'd16;
				end
				else
					msg_type <= MSG_INVALID;
			end

			//// Send packet
			STATE_SEND: begin
				uart_tx_we <= 1'b1;

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

endmodule

