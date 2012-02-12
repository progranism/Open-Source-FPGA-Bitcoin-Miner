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

	//// Configuration Options
	//
	// Frequency (MHz) of the incoming clock (CLK_100MHZ)
	localparam INPUT_CLOCK_FREQUENCY = 100;
	// What frequency of operation Synthesis and P&R should target. If
	// ISE can meet timing requirements, then this is the guaranteed
	// frequency of operation.
	localparam SYNTHESIS_FREQUENCY = 50;
	// What frequency the FPGA should boot-up to.
	localparam BOOTUP_FREQUENCY = 50;
	// What is the maximum allowed overclock. User will not be able to set
	// clock frequency above this threshold.
	localparam MAXIMUM_FREQUENCY = 50;


	//// Clock Buffer
	wire clkin_100MHZ;
	IBUFG clkin1_buf ( .I (CLK_100MHZ), .O (clkin_100MHZ));

	//// 
	reg [255:0] midstate = 0;
	reg [95:0] data = 0;
	reg [31:0] nonce = 32'd254, nonce2 = 32'd0;
	reg [31:0] stop_nonce = 32'd0;


	//// PLL
	wire hash_clk;
	wire dcm_progdata, dcm_progen, dcm_progdone;
`ifndef SIM
	dynamic_clock # (
		.INPUT_FREQUENCY (INPUT_CLOCK_FREQUENCY),
		.SYNTHESIS_FREQUENCY (SYNTHESIS_FREQUENCY)
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
	wire [255:0] hash;
	wire [31:0] hash2_w;

	sha256_pipe130 p1 (
		.clk (hash_clk),
		.state (midstate),
		.state2 (midstate),
		.data ({384'h000002800000000000000000000000000000000000000000000000000000000000000000000000000000000080000000, nonce, data}),
		.hash (hash)
	);

	sha256_pipe123 p2 (
		.clk (hash_clk),
		.data ({256'h0000010000000000000000000000000000000000000000000000000080000000, hash}),
		.hash (hash2_w)
	);


	//// Communication Module
	wire [255:0] comm_midstate;
	wire [95:0] comm_data;
	reg old_is_golden_ticket = 1'b0;
	reg [31:0] golden_nonce = 0;

`ifndef SIM
	jtag_comm # (
		.INPUT_FREQUENCY (INPUT_CLOCK_FREQUENCY),
		.MAXIMUM_FREQUENCY (MAXIMUM_FREQUENCY),
		.INITIAL_FREQUENCY (BOOTUP_FREQUENCY)
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

	// If we've checked every nonce without getting new work, then stop hashing.
	reg comm_new_work = 1'b0;
	reg [31:0] ignore_results_stop = 32'd254;
	reg ignore_results = 1'b0;
	wire continue_hashing = nonce2 != stop_nonce || comm_new_work;
	
	always @ (posedge hash_clk)
	begin
		// Give new data to the hasher
		midstate <= comm_midstate;
		data <= comm_data[95:0];
		nonce <= nonce + (continue_hashing ? 32'd1 : 32'd0);
		nonce2 <= nonce2 + (continue_hashing ? 32'd1 : 32'd0);


		// Check to see if the last hash generated is valid.
		is_golden_ticket <= hash2_w == 32'hA41F32E7 && continue_hashing && ~ignore_results;
		old_is_golden_ticket <= is_golden_ticket;
		
		if(is_golden_ticket)
			golden_nonce <= nonce2;

		// Reset stop_nonce when we get new work
		comm_new_work <= midstate != comm_midstate || data != comm_data;

		if (comm_new_work)
		begin
			stop_nonce <= nonce2;

			// Results will be invalid for a period of time if
			// we stopped the engine and are starting it back up.
			if (nonce2 == stop_nonce)
			begin
				ignore_results <= 1'b1;
				ignore_results_stop <= nonce2 + 32'd254;
			end
		end

		if (nonce2 == ignore_results_stop)
			ignore_results <= 1'b0;
	end

endmodule

