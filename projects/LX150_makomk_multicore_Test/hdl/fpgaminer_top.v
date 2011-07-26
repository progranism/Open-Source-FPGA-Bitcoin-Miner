/*
*
* Copyright (c) 2011 fpgaminer@bitcoin-mining.com
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


`timescale 1ns/1ps

module fpgaminer_top (
	input CLK_100MHZ
);

	//// PLL
	wire hash_clk;
`ifndef SIM
	main_pll pll_blk (.CLK_IN1(CLK_100MHZ), .CLK_OUT1(hash_clk));
`else
	assign hash_clk = CLK_100MHZ;
`endif


	//// Mining Cores
	reg [255:0] midstate_buf = 0, data_buf = 0;
	wire [1:0] is_golden_ticket;
	wire [31:0] golden_nonce0, golden_nonce1;

	mining_core # (.LOOP_LOG2(0), .NONCE_WIDTH(31), .NONCE_PREFIX(1'b0)) mining_core_0 (
		.hash_clk(hash_clk),
		.rx_midstate(midstate_buf),
		.rx_data(data_buf[95:0]),
		.tx_is_golden_ticket(is_golden_ticket[0]),
		.tx_golden_nonce(golden_nonce0)
	);

	mining_core # (.LOOP_LOG2(0), .NONCE_WIDTH(31), .NONCE_PREFIX(1'b1)) mining_core_1 (
		.hash_clk(hash_clk),
		.rx_midstate(midstate_buf),
		.rx_data(data_buf[95:0]),
		.tx_is_golden_ticket(is_golden_ticket[1]),
		.tx_golden_nonce(golden_nonce1)
	);


	//// Virtual Wire Control
	wire [255:0] midstate_vw, data2_vw;

`ifndef SIM
	wire [35:0] control0, control1, control2;
	chipscope_icon ICON_inst ( .CONTROL0(control0), .CONTROL1(control1), .CONTROL2(control2));
	
	chipscope_vio_tochip midstate_vw_blk ( .CONTROL(control0), .CLK(hash_clk), .SYNC_OUT(midstate_vw) );
	chipscope_vio_tochip data_vw_blk ( .CONTROL(control1), .CLK(hash_clk), .SYNC_OUT(data2_vw) );
`endif


	//// Virtual Wire Output
	reg [31:0] golden_nonce = 0;

`ifndef SIM
	chipscope_vio_fromchip golden_nonce_vw_blk ( .CONTROL(control2), .CLK(hash_clk), .SYNC_IN(golden_nonce) );
`endif


	//// Control Unit
	
	always @ (posedge hash_clk)
	begin
		`ifdef SIM
			//midstate_buf <= 256'h2b3f81261b3cfd001db436cfd4c8f3f9c7450c9a0d049bee71cba0ea2619c0b5;
			//data_buf <= 256'h00000000000000000000000080000000_00000000_39f3001b6b7b8d4dc14bfc31;
			//nonce <= 30411740;
		`else
			midstate_buf <= midstate_vw;
			data_buf <= data2_vw;
		`endif

		if (is_golden_ticket[0])
			golden_nonce <= golden_nonce0;
		else if (is_golden_ticket[1])
			golden_nonce <= golden_nonce1;
	end

endmodule

