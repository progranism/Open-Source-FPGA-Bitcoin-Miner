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
	localparam MAXIMUM_FREQUENCY = 100;


	//// Clock Buffer
`ifndef SIM
	wire clkin_100MHZ;
	IBUFG clkin1_buf ( .I (CLK_100MHZ), .O (clkin_100MHZ));
`endif

	//// 
	reg [255:0] midstate = 0;
	reg [95:0] data = 0;
	reg [30:0] nonce = 31'd254, nonce2 = 31'd0;


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


	//// Dual-Hasher
	wire [255:0] hash0, hash1;
	wire [31:0] hash2_w0, hash2_w1;

	dual_sha256_transform first_hash_blk (
		.clk (hash_clk),
		.rx_state (midstate),
		.rx_nonce (nonce),
		.rx_input (data),
		.tx_hash0 (hash0),
		.tx_hash1 (hash1)
	);

	second_sha256_transform second_hash0_blk (
		.clk (hash_clk),
		.rx_input ({256'h0000010000000000000000000000000000000000000000000000000080000000, hash0}),
		.tx_hash (hash2_w0)
	);

	second_sha256_transform second_hash1_blk (
		.clk (hash_clk),
		.rx_input ({256'h0000010000000000000000000000000000000000000000000000000080000000, hash1}),
		.tx_hash (hash2_w1)
	);


	//// Communication Module
	wire comm_new_work;
	wire [255:0] comm_midstate;
	wire [95:0] comm_data;
	reg is_golden_ticket = 1'b0;
	reg [31:0] golden_nonce;
	reg [3:0] golden_ticket_buf = 4'b0;
	reg [127:0] golden_nonce_buf;

`ifndef SIM
	jtag_comm # (
		.INPUT_FREQUENCY (INPUT_CLOCK_FREQUENCY),
		.MAXIMUM_FREQUENCY (MAXIMUM_FREQUENCY),
		.INITIAL_FREQUENCY (BOOTUP_FREQUENCY)
	) comm_blk (
		.rx_hash_clk (hash_clk),
		.rx_new_nonce (golden_ticket_buf[3]),
		.rx_golden_nonce (golden_nonce_buf[127:96]),

		.tx_new_work (comm_new_work),
		.tx_midstate (comm_midstate),
		.tx_data (comm_data),

		.rx_dcm_progclk (clkin_100MHZ),
		.tx_dcm_progdata (dcm_progdata),
		.tx_dcm_progen (dcm_progen),
		.rx_dcm_progdone (dcm_progdone)
	);
`endif


	//// Control Unit
	// NOTE: When the hashers first start churning on new work, results
	// will be invalid for ~254 cycles. Since returning invalid results is
	// not very detrimental (controlling software double checks results)
	// we sacrifice a small amount of accuracy in exchange for simple
	// logic.
	reg reset = 1'b1;
	
	always @ (posedge hash_clk)
	begin
		// Counters
		if (reset | comm_new_work)
		begin
			nonce <= 31'd127;
			nonce2 <= 31'd0;
		end
		else
		begin
			nonce <= nonce + 31'd1;
			nonce2 <= nonce2 + 31'd1;
		end

`ifndef SIM
		// Give new data to the hasher
		midstate <= comm_midstate;
		data <= comm_data[95:0];
`endif

		// Clear the reset signal when we get new work
		if (comm_new_work)
			reset <= 1'b0;
		// Stop hashing if we've run out of nonces to check
		else if (nonce2 == 31'h7FFFFFFF)
			reset <= 1'b1;


		// Check to see if the last hash generated is valid.
		if (hash2_w0 == 32'hA41F32E7)
		begin
			is_golden_ticket <= 1'b1;
			golden_nonce <= {1'b0, nonce2};
		end
		else if (hash2_w1 == 32'hA41F32E7)
		begin
			is_golden_ticket <= 1'b1;
			golden_nonce <= {1'b1, nonce2};
		end
		else
			is_golden_ticket <= 1'b0;

		golden_ticket_buf <= {golden_ticket_buf[2:0], is_golden_ticket};
		golden_nonce_buf <= {golden_nonce_buf[95:0], golden_nonce};
	end

endmodule

