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


`timescale 1ns/1ps

// TODO: Stop hashing if no new data has come in.
module fpgaminer_top (
	input CLK_100MHZ
);

	//// Clock Buffer
	wire clkin_100MHZ;
	IBUFG clkin1_buf ( .I (CLK_100MHZ), .O (clkin_100MHZ));

	//// 
	reg [255:0] midstate = 0;
	reg [95:0] data = 0;
	reg [31:0] nonce = 32'd254, nonce2 = 32'h0;


	//// PLL
	wire hash_clk;
	wire dcm_progdata, dcm_progen, dcm_progdone;
`ifndef SIM
	dynamic_clock # (
		.INPUT_FREQUENCY (100),
		.SYNTHESIS_FREQUENCY (200)
	) dynamic_clk_blk (
		.CLK_IN1 (clkin_100MHZ),
		.CLK_OUT1 (hash_clk),
		.PROGCLK (clkin_100MHZ),
		.PROGDATA (dcm_progdata),
		.PROGEN (dcm_progen),
		.PROGDONE (dcm_progdone)
	);
`else
	assign hash_clk = CLK_100MHZ;
`endif


	//// ZTEX Hashers
	// Counter for testing
	reg [31:0] hash = 32'd0;

	always @ (posedge hash_clk)
		hash <= hash + 32'd1;


	//// Communication Module
	wire [255:0] comm_midstate;
	wire [95:0] comm_data;
	reg old_is_golden_ticket = 1'b0;
	reg [31:0] golden_nonce = 0;

`ifndef SIM
	jtag_comm # (
		.INPUT_FREQUENCY (100),
		.MAXIMUM_FREQUENCY (200)
	) comm_blk (
		.rx_hash_clk (hash_clk),
		.rx_new_nonce (old_is_golden_ticket),
		.rx_golden_nonce (golden_nonce),
		.tx_midstate(comm_midstate),
		.tx_data(comm_data),

		.rx_dcm_progclk (clkin_100MHZ),
		.tx_dcm_progdata (dcm_progdata),
		.tx_dcm_progen (dcm_progen),
		.rx_dcm_progdone (dcm_progdone)
	);
`endif


	//// Control Unit
	reg is_golden_ticket = 1'b0;
	
	always @ (posedge hash_clk)
	begin
		// Give new data to the hasher
		midstate <= comm_midstate;
		data <= comm_data[95:0];
		nonce <= nonce + 32'd1;
		nonce2 <= nonce2 + 32'd1;


		// Check to see if the last hash generated is valid.
		//is_golden_ticket <= hash2_w == 32'hA41F32E7;
		//old_is_golden_ticket <= is_golden_ticket;
		
		//if(is_golden_ticket)
			//golden_nonce <= nonce2;

		// For testing the dynamic clock
		golden_nonce <= hash;
		old_is_golden_ticket <= 1'b1;
	end

endmodule

