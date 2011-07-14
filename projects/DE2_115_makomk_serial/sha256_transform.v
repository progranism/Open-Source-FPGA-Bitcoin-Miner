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

// A quick define to help index 32-bit words inside a larger register.
`define IDX(x) (((x)+1)*(32)-1):((x)*(32))


// Perform a SHA-256 transformation on the given 512-bit data, and 256-bit
// initial state,
// Outputs one 256-bit hash every LOOP cycle(s).
//
// The LOOP parameter determines both the size and speed of this module.
// A value of 1 implies a fully unrolled SHA-256 calculation spanning 64 round
// modules and calculating a full SHA-256 hash every clock cycle. A value of
// 2 implies a half-unrolled loop, with 32 round modules and calculating
// a full hash in 2 clock cycles. And so forth.
module sha256_transform #(
	parameter LOOP = 6'd4
) (
	input clk,
	input feedback,
	input [5:0] cnt,
	input [255:0] rx_state,
	input [511:0] rx_input,
	output reg [255:0] tx_hash
);

	// Constants defined by the SHA-2 standard.
	localparam Ks = {
		32'h428a2f98, 32'h71374491, 32'hb5c0fbcf, 32'he9b5dba5,
		32'h3956c25b, 32'h59f111f1, 32'h923f82a4, 32'hab1c5ed5,
		32'hd807aa98, 32'h12835b01, 32'h243185be, 32'h550c7dc3,
		32'h72be5d74, 32'h80deb1fe, 32'h9bdc06a7, 32'hc19bf174,
		32'he49b69c1, 32'hefbe4786, 32'h0fc19dc6, 32'h240ca1cc,
		32'h2de92c6f, 32'h4a7484aa, 32'h5cb0a9dc, 32'h76f988da,
		32'h983e5152, 32'ha831c66d, 32'hb00327c8, 32'hbf597fc7,
		32'hc6e00bf3, 32'hd5a79147, 32'h06ca6351, 32'h14292967,
		32'h27b70a85, 32'h2e1b2138, 32'h4d2c6dfc, 32'h53380d13,
		32'h650a7354, 32'h766a0abb, 32'h81c2c92e, 32'h92722c85,
		32'ha2bfe8a1, 32'ha81a664b, 32'hc24b8b70, 32'hc76c51a3,
		32'hd192e819, 32'hd6990624, 32'hf40e3585, 32'h106aa070,
		32'h19a4c116, 32'h1e376c08, 32'h2748774c, 32'h34b0bcb5,
		32'h391c0cb3, 32'h4ed8aa4a, 32'h5b9cca4f, 32'h682e6ff3,
		32'h748f82ee, 32'h78a5636f, 32'h84c87814, 32'h8cc70208,
		32'h90befffa, 32'ha4506ceb, 32'hbef9a3f7, 32'hc67178f2};


	reg [31:0] first_t1_partial = 32'd0;
	reg [255:0] state_d0 = 0;
	reg [511:0] input_d0 = 0;


	genvar i;

	// W0 refers to the oldest word of W, not the most recent. W15 is the
	// W being calculated in the current round.
	generate

		for (i = 0; i < 64/LOOP; i = i + 1) begin : HASHERS
			wire [31:0] new_w15;
			wire [255:0] state;
			wire [31:0] t1_partial_next;
			wire [31:0] cur_w0, cur_w1, cur_w9, cur_w14;
			reg [479:0] new_w14to0;

			//wire [31:0] K = Ks[32*(63-LOOP*i-cnt) +: 32];
			wire [31:0] K_next = Ks[32*(63-LOOP*i-cnt-1) +: 32];


			if (i == 0)
				assign cur_w14 = input_d0[479:448];
			else if (i == 1)
				shifter_32b #(.LENGTH(1)) shift_w14 (clk, input_d0[511:480], cur_w14);
			else
				shifter_32b #(.LENGTH(1)) shift_w14 (clk, HASHERS[i-2].new_w15, cur_w14);


			if (i == 0)
				assign cur_w9 = input_d0[319:288];
			else if (i < 5)
				shifter_32b # (.LENGTH(i)) shift_w9 (clk, input_d0[`IDX(9+i)], cur_w9);
			else
				shifter_32b # (.LENGTH(5)) shift_w9 (clk, HASHERS[i-5].cur_w14, cur_w9);


			if (i == 0)
				assign cur_w1 = input_d0[63:32];
			else if(i < 8)
				shifter_32b #(.LENGTH(i)) shift_w1 (clk, input_d0[`IDX(1+i)], cur_w1);
			else
				shifter_32b #(.LENGTH(8)) shift_w1 (clk, HASHERS[i-8].cur_w9, cur_w1);
			

			if (i == 0)
				assign cur_w0 = input_d0[31:0];
			else
				shifter_32b # (.LENGTH(1)) shift_w0 (clk, HASHERS[i-1].cur_w1, cur_w0);





			if(i == 0)
				sha256_digester U (
					.clk(clk),
					.k_next(K_next),
					.rx_state(feedback ? state : state_d0),
					.rx_t1_partial(first_t1_partial),
					.rx_w1(cur_w1),
					.tx_state(state),
					.tx_t1_partial(t1_partial_next)
				);
			else
				sha256_digester U (
					.clk(clk),
					.k_next(K_next),
					.rx_state(HASHERS[i-1].state),
					.rx_t1_partial(HASHERS[i-1].t1_partial_next),
					.rx_w1(cur_w1),
					.tx_state(state),
					.tx_t1_partial(t1_partial_next)
				);

			sha256_update_w upd_w (
				.clk(clk),
				.rx_w0(cur_w0),
				.rx_w1(cur_w1),
				.rx_w9(cur_w9),
				.rx_w14(cur_w14),
				.tx_w15(new_w15)
			);
		end

	endgenerate

	always @ (posedge clk)
	begin
		state_d0 <= rx_state;
		input_d0 <= rx_input;

		first_t1_partial <= rx_state[`IDX(7)] + rx_input[31:0] + 32'h428a2f98;

		if (!feedback)
		begin
			tx_hash[`IDX(0)] <= rx_state[`IDX(0)] + HASHERS[64/LOOP-6'd1].state[`IDX(0)];
			tx_hash[`IDX(1)] <= rx_state[`IDX(1)] + HASHERS[64/LOOP-6'd1].state[`IDX(1)];
			tx_hash[`IDX(2)] <= rx_state[`IDX(2)] + HASHERS[64/LOOP-6'd1].state[`IDX(2)];
			tx_hash[`IDX(3)] <= rx_state[`IDX(3)] + HASHERS[64/LOOP-6'd1].state[`IDX(3)];
			tx_hash[`IDX(4)] <= rx_state[`IDX(4)] + HASHERS[64/LOOP-6'd1].state[`IDX(4)];
			tx_hash[`IDX(5)] <= rx_state[`IDX(5)] + HASHERS[64/LOOP-6'd1].state[`IDX(5)];
			tx_hash[`IDX(6)] <= rx_state[`IDX(6)] + HASHERS[64/LOOP-6'd1].state[`IDX(6)];
			tx_hash[`IDX(7)] <= rx_state[`IDX(7)] + HASHERS[64/LOOP-6'd1].state[`IDX(7)];
		end
	end


endmodule


// Calculate W.
module sha256_update_w (clk, rx_w0, rx_w1, rx_w9, rx_w14, tx_w15);

	input clk;
	input [31:0] rx_w0, rx_w1, rx_w9, rx_w14;
	output reg [31:0] tx_w15;


	wire [31:0] s0_w, s1_w;

	s0	s0_blk	(rx_w1, s0_w);
	s1	s1_blk	(rx_w14, s1_w);

	wire [31:0] new_w = s1_w + rx_w9 + s0_w + rx_w0;

	always @ (posedge clk)
		tx_w15 <= new_w;

endmodule


// k_next must be the next round's k
// W1 is the second oldest W, where normally T1 would be calculated with the
// oldest W (W0).
// t1_partial is a partial calculation of T1 that can be calculated by the
// round before it.
module sha256_digester (clk, k_next, rx_state, rx_t1_partial, rx_w1, tx_state, tx_t1_partial);

	input clk;
	input [31:0] k_next, rx_t1_partial, rx_w1;
	input [255:0] rx_state;

	output reg [255:0] tx_state;
	output reg [31:0] tx_t1_partial;


	wire [31:0] e0_w, e1_w, ch_w, maj_w;


	e0	e0_blk	(rx_state[`IDX(0)], e0_w);
	e1	e1_blk	(rx_state[`IDX(4)], e1_w);
	ch	ch_blk	(rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
	maj	maj_blk	(rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

	wire [31:0] t1 = rx_t1_partial + e1_w + ch_w;
	wire [31:0] t2 = e0_w + maj_w;
	wire [31:0] partial_t1 = rx_state[`IDX(6)] + rx_w1 + k_next;
	

	always @ (posedge clk)
	begin
		tx_t1_partial <= partial_t1;

		tx_state[`IDX(7)] <= rx_state[`IDX(6)];
		tx_state[`IDX(6)] <= rx_state[`IDX(5)];
		tx_state[`IDX(5)] <= rx_state[`IDX(4)];
		tx_state[`IDX(4)] <= rx_state[`IDX(3)] + t1;
		tx_state[`IDX(3)] <= rx_state[`IDX(2)];
		tx_state[`IDX(2)] <= rx_state[`IDX(1)];
		tx_state[`IDX(1)] <= rx_state[`IDX(0)];
		tx_state[`IDX(0)] <= t1 + t2;
	end

endmodule


module shifter_32b # (
	parameter LENGTH = 1
) (
	input clk,
	input [31:0] val_in,
	output [31:0] val_out
);

	genvar i;

	generate
		if (LENGTH >= 4)
		begin
			altshift_taps # (.number_of_taps(1), .tap_distance(LENGTH), .width(32)) shifttaps
				(.clken(1'b1), .aclr(1'b0), .clock(clk), .shiftin(val_in), .taps(), .shiftout(val_out) );
		end
		else
		begin
			for (i = 0; i < LENGTH; i = i + 1) begin : TAPS
				reg [31:0] r;
				wire [31:0] prev;

				if (i == 0)
					assign prev = val_in;
				else
					assign prev = TAPS[i-1].r;

				always @ (posedge clk)
					r <= prev;
			end

			assign val_out = TAPS[LENGTH-1].r;
		end
	endgenerate

endmodule



