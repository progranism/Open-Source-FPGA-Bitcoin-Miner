/*
*
* Copyright (c) 2011-2013 fpgaminer@bitcoin-mining.com
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
* When tx_ready is high, uart_transmitter is ready to send a new byte. Drive
* rx_new_byte high for one cycle, and the byte to transmit on rx_byte for one
* cycle.
*/
module uart_receiver # (
	parameter comm_clk_frequency = 100000000,
	parameter baud_rate = 115200
) (
	input clk,

	// UART interface
	input uart_rx,

	// Data received
	output reg tx_new_byte = 1'b0,
	output reg [7:0] tx_byte = 8'd0
);

	localparam [15:0] baud_delay = (comm_clk_frequency / baud_rate) - 1;

	//-----------------------------------------------------------------------------
	// UART Filtering
	//-----------------------------------------------------------------------------
	wire rx;

	uart_filter uart_fitler_blk (
		.clk (clk),
		.uart_rx (uart_rx),
		.tx_rx (rx)
	);


	//-----------------------------------------------------------------------------
	// UART Decoding
	//-----------------------------------------------------------------------------
	reg old_rx = 1'b1, idle = 1'b1;
	reg [15:0] delay_cnt = 16'd0;
	reg [8:0] incoming = 9'd0;

	always @ (posedge clk)
	begin
		old_rx <= rx;
		tx_new_byte <= 1'b0;

		delay_cnt <= delay_cnt + 16'd1;

		if (delay_cnt == baud_delay)
			delay_cnt <= 0;

		if (idle && old_rx && !rx)    // Start bit (falling edge)
		begin
			idle <= 1'b0;
			incoming <= 9'd511;
			delay_cnt <= 16'd0;   // Synchronize timer to falling edge
		end
		else if (!idle && (delay_cnt == (baud_delay >> 1)))
		begin
			incoming <= {rx, incoming[8:1]};    // LSB first

			if (incoming == 9'd511 && rx)       // False start bit
				idle <= 1'b1;
		
			if (!incoming[0])    // Expecting stop bit
			begin
				idle <= 1'b1;
				
				if (rx)
				begin
					tx_new_byte <= 1'b1;
					tx_byte <= incoming[8:1];
				end
			end
		end
	end

endmodule


/*
* Provides metastability protection, and some minimal noise filtering.
* Noise is filtered with a 3-way majority vote. This removes any random single
* 'clk' cycle errors.
*/
module uart_filter (
	input clk,
	input uart_rx,
	output reg tx_rx = 1'b0
);

	//-----------------------------------------------------------------------------
	// Metastability Protection
	//-----------------------------------------------------------------------------
	reg rx, meta;

	always @ (posedge clk)
		{rx, meta} <= {meta, uart_rx};


	//-----------------------------------------------------------------------------
	// Noise Filtering
	//-----------------------------------------------------------------------------
	wire sample0 = rx;
	reg sample1, sample2;

	always @ (posedge clk)
	begin
		{sample2, sample1} <= {sample1, sample0};

		if ((sample2 & sample1) | (sample1 & sample0) | (sample2 & sample0))
			tx_rx <= 1'b1;
		else
			tx_rx <= 1'b0;
	end

endmodule
