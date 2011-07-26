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

module mining_core #(
	parameter LOOP_LOG2 = 0,
	parameter NONCE_WIDTH = 32,
	parameter NONCE_PREFIX = 1'b0
) (
	input hash_clk,
	input [255:0] rx_midstate,
	input [95:0] rx_data,
	output reg tx_is_golden_ticket = 1'b0,
	output reg [31:0] tx_golden_nonce = 32'h0
);

	localparam [5:0] LOOP = (6'd1 << LOOP_LOG2);
	localparam [31:0] GOLDEN_NONCE_OFFSET = (32'd1 << (7 - LOOP_LOG2)) + 32'd1;


	//// 
	reg [255:0] state = 0;
	reg [127:0] data = 0;
	reg [NONCE_WIDTH-1:0] nonce = 32'h00000000;


	//// Two SHA-256 Cores
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


	//// Control Unit
	reg is_golden_ticket = 1'b0;
	reg feedback_d1 = 1'b1;
	wire [5:0] cnt_next;
	wire [NONCE_WIDTH-1:0] nonce_next;
	wire feedback_next;

	assign cnt_next =  (LOOP == 1) ? 6'd0 : (cnt + 6'd1) & (LOOP-1);
	// On the first count (cnt==0), load data from previous stage (no feedback)
	// on 1..LOOP-1, take feedback from current stage
	// This reduces the throughput by a factor of (LOOP), but also reduces the design size by the same amount
	assign feedback_next = (LOOP == 1) ? 1'b0 : (cnt_next != {(LOOP_LOG2){1'b0}});
	assign nonce_next = feedback_next ? nonce : (nonce + 32'd1);
	
	always @ (posedge hash_clk)
	begin
		cnt <= cnt_next;
		feedback <= feedback_next;
		feedback_d1 <= feedback;

		// Give new data to the hasher
		state <= rx_midstate;
		if (NONCE_WIDTH == 32)
			data <= {nonce_next, rx_data};
		else
			data <= {NONCE_PREFIX, nonce_next, rx_data};
		nonce <= nonce_next;


		// Check to see if the last hash generated is valid.
		if (LOOP == 1)
			is_golden_ticket <= (hash2[159:128] + 32'h5be0cd19 == 32'h00000000);
		else
			is_golden_ticket <= (hash2[255:224] == 32'h00000000) && !feedback;
		tx_is_golden_ticket <= is_golden_ticket;

		if(is_golden_ticket)
		begin
			// TODO: Find a more compact calculation for this
			if (LOOP == 1)
				tx_golden_nonce <= {NONCE_PREFIX, (nonce - 32'd128)};
			else if (LOOP == 2)
				tx_golden_nonce <= {NONCE_PREFIX, (nonce - 32'd66)};
			else
				tx_golden_nonce <= {NONCE_PREFIX, (nonce - GOLDEN_NONCE_OFFSET)};
		end
	end

endmodule


