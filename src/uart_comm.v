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

	uart_tx uart_tx_blk (
		.clk (comm_clk),
		.rx_we (uart_rx_flag),
		.rx_data (uart_rx_byte+8'd1),
		.tx_busy (uart_tx_busy),
		.tx_serial (tx_serial)
	);


	// DEBUG: LOOPBACK
	always @ (posedge comm_clk)
	begin
		//if (uart_rx_flag & ~uart_tx_busy)

	end

endmodule

