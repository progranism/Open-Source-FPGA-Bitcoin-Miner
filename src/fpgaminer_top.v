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

module fpgaminer_top (osc_clk);

	localparam LOOP_LOG2 = 3;
	localparam [5:0]LOOP = (6'd1 << LOOP_LOG2);
	input osc_clk;


	//// 
	reg [255:0] state = 0;
	reg [511:0] data = 0;
	reg [31:0] nonce = 32'h00000000;

	//// PLL
	wire hash_clk;
	`ifndef SIM
	//main_pll pll_blk (osc_clk, hash_clk);
	assign hash_clk = osc_clk;
	`endif


	//// Simulation Timer
	`ifdef SIM
		reg gen_clk = 0;
		wire clk = gen_clk;
	`else
		wire clk = hash_clk;
	`endif


	//// Hashers
	wire [255:0] hash, hash2;
	reg is_golden_ticket = 0;

	sha256_transform #(.LOOP(LOOP)) uut (
		.clk(clk),
		.feedback(feedback),
		.cnt(cnt),
		.rx_state(state),
		.rx_input(data),
		.tx_hash(hash)
	);
	sha256_transform #(.LOOP(LOOP)) uut2 (
		.clk(clk),
		.feedback(feedback),
		.cnt(cnt),
		.rx_state(256'h5be0cd191f83d9ab9b05688c510e527fa54ff53a3c6ef372bb67ae856a09e667),
		.rx_input({256'h0000010000000000000000000000000000000000000000000000000080000000, hash}),
		.tx_hash(hash2)
	);


	//// Virtual Wire Control
	reg [255:0] midstate_buf = 0, data_buf = 0;
	wire [255:0] midstate_vw, data2_vw;
`ifndef SIM
	virtual_wire # (.PROBE_WIDTH(0), .WIDTH(256), .INSTANCE_ID("STAT")) midstate_vw_blk(.probe(), .source(midstate_vw));
	virtual_wire # (.PROBE_WIDTH(0), .WIDTH(256), .INSTANCE_ID("DAT2")) data2_vw_blk(.probe(), .source(data2_vw));
`endif

	//// Virtual Wire Output
	reg [31:0] golden_nonce = 0;

	reg [5:0]cnt;
	reg feedback, feedback_d1;
	wire [5:0]cnt_next;
	wire [31:0]nonce_next;
	wire feedback_next;
`ifndef SIM
	wire reset;
	assign reset = 1'b0;
`else
	reg reset;
`endif
	
	// Note that the nonce reported to the external world will always be
	// larger than the real nonce. Currently it is 132 bigger. So an
	// external controller (like scripts/mine.tcl) needs to do:
	// golden_nonce = golden_nonce - 132
	// to get the real nonce.
`ifndef SIM
	virtual_wire # (.PROBE_WIDTH(32), .WIDTH(0), .INSTANCE_ID("GNON")) golden_nonce_vw_blk (.probe(golden_nonce), .source());
	virtual_wire # (.PROBE_WIDTH(32), .WIDTH(0), .INSTANCE_ID("NONC")) nonce_vw_blk (.probe(nonce), .source());
`endif

	assign cnt_next =  reset ? 6'd0 : (LOOP == 1) ? 6'd0 : (cnt + 6'd1) & (LOOP-1);
	// On the first count (cnt==0), load data from previous stage (no feedback)
	// on 1..LOOP-1, take feedback from current stage
	// This reduces the throughput by a factor of (LOOP), but also reduces the design size by the same amount
	assign feedback_next = (LOOP == 1) ? 1'b0 : (cnt_next != {(LOOP_LOG2){1'b0}});
	assign nonce_next =
		reset ? 32'd0 :
		feedback_next ? nonce : (nonce + 32'd1);

	
	//// Control Unit
	always @ (posedge clk)
	begin
		`ifdef SIM
			midstate_buf <= 256'h2b3f81261b3cfd001db436cfd4c8f3f9c7450c9a0d049bee71cba0ea2619c0b5;
			data_buf <= 256'h00000000000000000000000080000000_00000000_39f3001b6b7b8d4dc14bfc31;
			//nonce <= 30411740;
		`else
			midstate_buf <= midstate_vw;
			data_buf <= data2_vw;
		`endif

		cnt <= cnt_next;
		feedback <= feedback_next;
		feedback_d1 <= feedback;

		// Give new data to the hasher
		state <= midstate_buf;
		data <= {384'h000002800000000000000000000000000000000000000000000000000000000000000000000000000000000080000000, nonce_next, data_buf[95:0]};
		nonce <= nonce_next;



		// Check to see if the last hash generated is valid.
		is_golden_ticket <= (hash2[255:224] == 32'h00000000) && !feedback_d1;
		if(is_golden_ticket)
		begin
			golden_nonce <= nonce;
		end
`ifdef SIM
		if (!feedback_d1)
			$display ("nonce: %8x\nhash2: %54x\n", nonce, hash2);
`endif
	end


	//// Simulation Clock
`ifdef SIM
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0,fpgaminer_top);
 		reset = 1;
		#100
		#5 gen_clk = 1; #5 gen_clk = 0;
		#5 gen_clk = 1; #5 gen_clk = 0;
		reset = 0;
		#100
		
		repeat(500)
		begin
			#5 gen_clk = 1; #5 gen_clk = 0;
		end
	end
`endif

endmodule

