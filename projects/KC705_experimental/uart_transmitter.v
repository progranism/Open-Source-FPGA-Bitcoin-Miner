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
module uart_transmitter # (
	parameter comm_clk_frequency = 100000000,
	parameter baud_rate = 115200
) (
	input clk,

	// UART interface
	output uart_tx,

	// Data to send
	input rx_new_byte,
	input [7:0] rx_byte,

	// Status
	output tx_ready
);

	localparam [15:0] baud_delay = (comm_clk_frequency / baud_rate) - 1;

	reg [15:0] delay_cnt = 16'd0;
	reg [9:0] state = 10'd1023, outgoing = 10'd1023;

	assign uart_tx = outgoing[0];
	assign tx_ready = state[0] & ~rx_new_byte;


	always @ (posedge clk)
	begin
		delay_cnt <= delay_cnt + 16'd1;

		if (delay_cnt >= baud_delay)
		begin
			delay_cnt <= 16'd0;
			state <= {1'b1, state[9:1]};
			outgoing <= {1'b1, outgoing[9:1]};
		end

		if (rx_new_byte && state[0])
		begin
			delay_cnt <= 16'd0;
			state <= 10'd0;
			outgoing <= {1'b1, rx_byte, 1'b0};
		end
	end

endmodule
