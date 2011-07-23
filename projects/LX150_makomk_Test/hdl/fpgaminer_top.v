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

module fpgaminer_top (CLK_100MHZ);

	parameter LOOP_LOG2 = 0;

	localparam [5:0] LOOP = (6'd1 << LOOP_LOG2);
	localparam [31:0] GOLDEN_NONCE_OFFSET = (32'd1 << (7 - LOOP_LOG2)) + 32'd1;

	input CLK_100MHZ;


	//// 
	reg [255:0] state = 0;
	reg [127:0] data = 0;
	reg [31:0] nonce = 32'h0;


	//// PLL
	wire hash_clk;
`ifndef SIM
	main_pll pll_blk (.CLK_IN1(CLK_100MHZ), .CLK_OUT1(hash_clk));
`else
	assign hash_clk = CLK_100MHZ;
`endif


	//// Hashers
	wire [255:0] hash, hash2;
	reg [5:0] cnt = 6'd0;
	reg feedback = 1'b0;

	sha256_transform #(.LOOP(LOOP), .NUM_ROUNDS(64)) uut (
		.clk(hash_clk),
		.feedback(feedback),
		.cnt(cnt),
		.rx_state(state),
		.rx_input({384'h000002800000000000000000000000000000000000000000000000000000000000000000000000000000000080000000, data}),
		.tx_hash(hash)
	);
	sha256_transform #(.LOOP(LOOP), .NUM_ROUNDS(LOOP == 1 ? 61 : 64)) uut2 (
		.clk(hash_clk),
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
	reg is_golden_ticket = 1'b0;
	reg feedback_d1 = 1'b1;
	wire [5:0] cnt_next;
	wire [31:0] nonce_next;
	wire feedback_next;

	assign cnt_next =  (LOOP == 1) ? 6'd0 : (cnt + 6'd1) & (LOOP-1);
	// On the first count (cnt==0), load data from previous stage (no feedback)
	// on 1..LOOP-1, take feedback from current stage
	// This reduces the throughput by a factor of (LOOP), but also reduces the design size by the same amount
	assign feedback_next = (LOOP == 1) ? 1'b0 : (cnt_next != {(LOOP_LOG2){1'b0}});
	assign nonce_next = feedback_next ? nonce : (nonce + 32'd1);
	
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

		cnt <= cnt_next;
		feedback <= feedback_next;
		feedback_d1 <= feedback;

		// Give new data to the hasher
		state <= midstate_buf;
		data <= {nonce_next, data_buf[95:0]};
		nonce <= nonce_next;


		// Check to see if the last hash generated is valid.
		if (LOOP == 1)
			is_golden_ticket <= (hash2[159:128] + 32'h5be0cd19 == 32'h00000000);
		else
			is_golden_ticket <= (hash2[255:224] == 32'h00000000) && !feedback;
		
		if(is_golden_ticket)
		begin
			// TODO: Find a more compact calculation for this
			if (LOOP == 1)
				golden_nonce <= nonce - 32'd128;
			else if (LOOP == 2)
				golden_nonce <= nonce - 32'd66;
			else
				golden_nonce <= nonce - GOLDEN_NONCE_OFFSET;
		end

`ifdef SIM
		if (!feedback_d1)
			$display ("nonce: %8x\nhash2: %64x\n", nonce, hash2);
`endif
	end

endmodule

