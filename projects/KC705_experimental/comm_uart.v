/*
*
* Copyright (c) 2013 fpgaminer@bitcoin-mining.com
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

/*
* Golden nonces are sent over UART, hex encoded, with new-lines between each
* result.
* 
* New work is received over UART, hex encoded, little-endian, and with
* new-lines between each new piece of work.
* 
* If using the getwork protocol, new work should be sent as follows (Python
* pseudo-code):
* uart_write (data[128:128+24] + midstate + '\n')
*
*/
module comm_uart # (
	parameter comm_clk_frequency = 100000000,
	parameter baud_rate = 115200
) (
	input comm_clk,
	input uart_rx,
	output uart_tx,

	input hash_clk,
	input rx_new_golden_ticket,
	input [31:0] rx_golden_ticket,

	output reg tx_new_work = 1'b0,
	output [255:0] tx_midstate,
	output [95:0] tx_blockdata
);

	localparam temperature_report_delay = comm_clk_frequency * 4;	// Every 4 seconds

	//-----------------------------------------------------------------------------
	// Transfer golden tickets from hashing clock domain to comm clock domain.
	//-----------------------------------------------------------------------------
	reg fifo_rd = 1'b0;

	wire fifo_full, fifo_empty;
	wire [31:0] fifo_q;

	golden_ticket_fifo golden_ticket_fifo_blk (
		.wr_clk (hash_clk),
		.din (rx_golden_ticket),
		.wr_en (rx_new_golden_ticket & ~fifo_full),
		
		.rd_clk (comm_clk),
		.rd_en (fifo_rd),
		.dout (fifo_q),
		.full (fifo_full),
		.empty (fifo_empty)
	);


	//-----------------------------------------------------------------------------
	// UART Transmitter
	//-----------------------------------------------------------------------------
	reg uart_tx_new_byte = 1'b0;
	reg [7:0] uart_tx_byte = 8'd0;
	wire uart_tx_ready;

	uart_transmitter # (
		.comm_clk_frequency (comm_clk_frequency),
		.baud_rate (baud_rate)
	) uart_transmitter_blk (
		.clk (comm_clk),
		.uart_tx (uart_tx),
		.rx_new_byte (uart_tx_new_byte),
		.rx_byte (uart_tx_byte),
		.tx_ready (uart_tx_ready)
	);


	//-----------------------------------------------------------------------------
	// Temperature Measurement
	//-----------------------------------------------------------------------------
	wire [15:0] measured_temperature;

	comm_temperature_measurement temperature_blk (
		.clk (comm_clk),
		.tx_temp (measured_temperature)
	);


	//-----------------------------------------------------------------------------
	// Comm Clock Domain
	//-----------------------------------------------------------------------------
	reg [31:0] temperature_timeout = 32'd0;
	reg [4:0] transmit_state = 5'b00001;
	reg [31:0] outgoing_nonce = 32'd0;
	reg [7:0] outgoing_state = 8'd0;
	
	// Read golden tickets and output over UART.
	always @ (posedge comm_clk)
	begin
		if (temperature_timeout != temperature_report_delay)
			temperature_timeout <= temperature_timeout + 32'd1;
		uart_tx_new_byte <= 1'b0;
		fifo_rd <= 1'b0;

		case (transmit_state)
			5'b00001: if (!fifo_empty) begin
				transmit_state <= 5'b00010;
				fifo_rd <= 1'b1;
			end
			else if (temperature_timeout == temperature_report_delay)
			begin
				temperature_timeout <= 32'd0;
				outgoing_nonce <= {measured_temperature, 16'h0000};
				outgoing_state <= 8'h0F;
				transmit_state <= 5'b10000;
			end
			5'b00010: transmit_state <= 5'b00100;
			5'b00100: transmit_state <= 5'b01000;
			5'b01000: begin
				outgoing_nonce <= fifo_q;
				outgoing_state <= 8'hFF;
				transmit_state <= 5'b10000;
			end
			5'b10000: if (uart_tx_ready) begin
				if (outgoing_state == 8'd0)
				begin
					transmit_state <= 5'b00001;
					uart_tx_new_byte <= 1'b1;
					uart_tx_byte <= 8'd10;
				end
				else
				begin
					outgoing_state <= {1'b0, outgoing_state[7:1]};
					outgoing_nonce <= outgoing_nonce << 4;
					uart_tx_new_byte <= 1'b1;

					// Hex encode 4 bits of nonce
					if (outgoing_nonce[31:28] < 10)
						uart_tx_byte <= outgoing_nonce[31:28] + 8'd48;
					else
						uart_tx_byte <= outgoing_nonce[31:28] + 8'd65 - 8'd10;
				end
			end
			default: transmit_state <= 5'b00001;
		endcase
	end


	//-----------------------------------------------------------------------------
	// Receive new work
	//-----------------------------------------------------------------------------
	wire uart_rx_new_byte;
	wire [7:0] uart_rx_byte;

	uart_receiver # (
		.comm_clk_frequency (comm_clk_frequency),
		.baud_rate (baud_rate)
	) uart_receiver_blk (
		.clk (comm_clk),
		.uart_rx (uart_rx),
		.tx_new_byte (uart_rx_new_byte),
		.tx_byte (uart_rx_byte)
	);


	reg [351:0] job;
	reg new_job_flag = 1'b0;
	reg [256+96-1:0] incoming_work = 352'd0;
	reg digit = 1'b0;
	reg [3:0] uart_rx_hex, uart_last_digit;

	always @ (posedge comm_clk)
	begin
		// Decode incoming UART byte as hexidecimal
		if (uart_rx_byte >= "A" && uart_rx_byte <= "F")
			uart_rx_hex = uart_rx_byte - "A" + 4'd10;
		else if (uart_rx_byte >= "a" && uart_rx_byte <= "f")
			uart_rx_hex = uart_rx_byte - "A" + 4'd10;
		else
			uart_rx_hex = uart_rx_byte - "0";

		if (uart_rx_new_byte)
		begin
			uart_last_digit <= uart_rx_hex;
			digit <= ~digit;

			if (digit == 1'b1)
				incoming_work <= {uart_last_digit, uart_rx_hex, incoming_work[351:8]};

			if (uart_rx_byte == "\n")
			begin
				digit <= 1'b0;
				job <= incoming_work;
				new_job_flag <= ~new_job_flag;
			end
		end
	end


	// Transfer job from comm clock domain to hash clock domain
	reg [351:0] job_meta0, job_meta1;
	reg [2:0] new_job_meta;
	always @ (posedge hash_clk)
	begin
		{job_meta1, job_meta0} <= {job_meta0, job};
		new_job_meta <= {new_job_meta[1:0], new_job_flag};

		if (new_job_meta[2] != new_job_meta[1])
			tx_new_work <= 1'b1;
		else
			tx_new_work <= 1'b0;
	end

	assign {tx_midstate, tx_blockdata} = job_meta1;

endmodule


module comm_temperature_measurement (
	input clk,
	output reg [15:0] tx_temp
);

	wire drdy;
	wire [15:0] do;

	xadc_temp_sensor xadc_blk (
		.daddr_in (7'd0),
		.dclk_in (clk),
		.den_in (1'b1),
		.di_in (16'd0),
		.dwe_in (1'b0),
		.vp_in (),
		.vn_in (),
		.busy_out (),
		.channel_out (),
		.do_out (do),
		.drdy_out (drdy),
		.eoc_out (),
		.eos_out (),
		.ot_out (),
		.vccaux_alarm_out (),
		.vccint_alarm_out (),
		.user_temp_alarm_out (),
		.alarm_out ()
	);

	always @ (posedge clk)
	begin
		if (drdy)
			tx_temp <= do;
	end

endmodule
