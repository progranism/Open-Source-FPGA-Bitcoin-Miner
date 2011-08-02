/*
*
* Copyright (c) 2011 fpgaminer@bitcoin-mining.com
* Copyright (c) 2011 Aidan Thornton <makosoft@gmail.com>
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

// Tweakable options. You can enable these in the project settings.

// On Altera FPGAs, we can use the altshift_taps macro to store W in
// RAM-based shift registers. Alternatively, the optimiser can do this
// for you instead if it's behaving itself properly, but that won't
// save quite as many FPGA registers as doing it explicitly would.

//`define USE_EXPLICIT_ALTSHIFT_FOR_W

// Experimental untested option for Xilinx FPGAs to store W in BRAM-based
// shift registers. Not for use on other FPGA platforms.

`define USE_XILINX_BRAM_FOR_W

// End of options.


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
	parameter LOOP = 6'd4,
	parameter NUM_ROUNDS = 64
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


	genvar i, j;
	
	reg [255:0] state_fb;
	reg [511:0] w_fb;
	reg [31:0] t1_part_fb;
		
	generate

		for (i = 0; i < NUM_ROUNDS/LOOP; i = i + 1) begin : HASHERS
			wire [31:0] new_w15;
			wire [255:0] state;
			wire [31:0] K, K_next;
			wire [31:0] t1_part_next;
			wire feedback_r;
			reg feedback_next;
			
			wire [31:0] K_tbl[0:LOOP-1];
			wire [31:0] K_next_tbl[0:LOOP-1];
			for (j = 0; j < LOOP; j = j + 1) begin : K_NEXT_TBL_INIT
				localparam k_next_idx = ((NUM_ROUNDS/LOOP)*((j+64-i)&(LOOP-1))+i+1)&63;
				assign K_next_tbl[j] = Ks[32*(63-k_next_idx) +: 32];
				assign K_tbl[j] = Ks[32*(63-(NUM_ROUNDS/LOOP)*((j+64-i)&(LOOP-1))-i) +: 32];
			end
			assign K = K_tbl[cnt&(LOOP-1)];
			assign K_next = K_next_tbl[cnt&(LOOP-1)];

			wire [31:0] cur_w0, cur_w1, cur_w9, cur_w14;
			reg [479:0] new_w14to0;
			if(LOOP <= 4)
			begin
				if(i == 0)
					assign feedback_r = feedback;
				else
					assign feedback_r = HASHERS[i-1].feedback_next;
				always @ (posedge clk)
					feedback_next <= feedback_r;
			
				if(i == 0)
				begin
					wire [31:0] fb_w0;
					shifter_32b #(.LENGTH(2)) shift_w0_fb (clk, HASHERS[NUM_ROUNDS/LOOP-1].cur_w1, fb_w0);
					assign cur_w0 = feedback_r ? fb_w0 : rx_input[31:0];
				end
				else
					shifter_32b #(.LENGTH(1)) shift_w0 (clk, HASHERS[i-1].cur_w1, cur_w0);
				
				if(i == 0)
				begin
					wire [31:0] fb_w1;
					shifter_32b #(.LENGTH(9)) shift_w1_fb (clk, HASHERS[NUM_ROUNDS/LOOP-8].cur_w9, fb_w1);
					assign cur_w1 = feedback_r ? fb_w1 : rx_input[63:32];
				end 
				else if(i < 8)
				begin
					wire [31:0] fb_w1; wire[31:0] nonfb_w1;
					shifter_32b #(.LENGTH(9)) shift_w1_fb (clk, HASHERS[NUM_ROUNDS/LOOP+i-8].cur_w9, fb_w1);
					shifter_32b #(.LENGTH(i)) shift_w1 (clk, rx_input[`IDX(1+i)], nonfb_w1);
					assign cur_w1 = feedback_r ? fb_w1 : nonfb_w1;
				end
				else
					shifter_32b #(.LENGTH(8)) shift_w1 (clk, HASHERS[i-8].cur_w9, cur_w1);
				
				
				if(i == 0)
				begin
					wire [31:0] fb_w14;
					shifter_32b #(.LENGTH(2)) shift_w14_fb (clk, HASHERS[NUM_ROUNDS/LOOP-2].new_w15, fb_w14);
					assign cur_w14 = feedback_r ? fb_w14 : rx_input[479:448];
				end
				else if(i == 1)
				begin
					wire [31:0] fb_w14; wire [31:0] nonfb_w14;
					shifter_32b #(.LENGTH(1)) shift_w14 (clk, rx_input[511:480], nonfb_w14);
					shifter_32b #(.LENGTH(2)) shift_w14_fb (clk, HASHERS[NUM_ROUNDS/LOOP-1].new_w15, fb_w14);
					assign cur_w14 = feedback_r ? fb_w14 : nonfb_w14;
				end
				else
					shifter_32b #(.LENGTH(1)) shift_w14 (clk, HASHERS[i-2].new_w15, cur_w14);
				
				if(i == 0)
				begin
					wire [31:0] fb_w9;
					shifter_32b #(.LENGTH(6)) shift_w9_fb (clk, HASHERS[NUM_ROUNDS/LOOP-5].cur_w14, fb_w9);
					assign cur_w9 = feedback_r ? fb_w9 : rx_input[319:288];
				end
				else if(i < 5)
				begin
					wire [31:0] fb_w9; wire [31:0] nonfb_w9;
					shifter_32b #(.LENGTH(6)) shift_w9_fb (clk, HASHERS[NUM_ROUNDS/LOOP+i-5].cur_w14, fb_w9);
					shifter_32b #(.LENGTH(i)) shift_w9 (clk, rx_input[`IDX(9+i)], nonfb_w9);
					assign cur_w9 = feedback_r ? fb_w9 : nonfb_w9;
				end
				else
					shifter_32b #(.LENGTH(5)) shift_w9 (clk, HASHERS[i-5].cur_w14, cur_w9);
			end 
			else // LOOP != 1, so we can't use the shift register-based code yet.
			begin
				wire[511:0] cur_w;
				if(i == 0)
					assign cur_w = feedback ? w_fb : rx_input;
				else
					assign cur_w = {HASHERS[i-1].new_w15, HASHERS[i-1].new_w14to0 };
					
				assign cur_w0 = cur_w[31:0];
				assign cur_w1 = cur_w[63:32];
				assign cur_w9 = cur_w[319:288];
				assign cur_w14 = cur_w[479:448];
				
				always @ (posedge clk)
					new_w14to0 <= cur_w[511:32];
			end

			if(i == 0)
				sha256_digester U (
					.clk(clk),
					.k_next(K_next),
					.rx_state(feedback ? state_fb : rx_state),
					.rx_t1_part(feedback ? t1_part_fb : (rx_state[`IDX(7)] + rx_input[31:0] + K)),
					.rx_w1(cur_w1),
					.tx_state(state),
					.tx_t1_part(t1_part_next)
				);
			else
				sha256_digester U (
					.clk(clk),
					.k_next(K_next),
					.rx_state(HASHERS[i-1].state),
					.rx_t1_part(HASHERS[i-1].t1_part_next),
					.rx_w1(cur_w1),
					.tx_state(state),
					.tx_t1_part(t1_part_next)
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
		state_fb <= HASHERS[NUM_ROUNDS/LOOP-6'd1].state;
		w_fb <= {HASHERS[NUM_ROUNDS/LOOP-6'd1].new_w15, HASHERS[NUM_ROUNDS/LOOP-6'd1].new_w14to0};
		t1_part_fb <= HASHERS[NUM_ROUNDS/LOOP-6'd1].t1_part_next;
		if (NUM_ROUNDS == 64) begin
			tx_hash[`IDX(0)] <= rx_state[`IDX(0)] + HASHERS[NUM_ROUNDS/LOOP-6'd1].state[`IDX(0)];
			tx_hash[`IDX(1)] <= rx_state[`IDX(1)] + HASHERS[NUM_ROUNDS/LOOP-6'd1].state[`IDX(1)];
			tx_hash[`IDX(2)] <= rx_state[`IDX(2)] + HASHERS[NUM_ROUNDS/LOOP-6'd1].state[`IDX(2)];
			tx_hash[`IDX(3)] <= rx_state[`IDX(3)] + HASHERS[NUM_ROUNDS/LOOP-6'd1].state[`IDX(3)];
			tx_hash[`IDX(4)] <= rx_state[`IDX(4)] + HASHERS[NUM_ROUNDS/LOOP-6'd1].state[`IDX(4)];
			tx_hash[`IDX(5)] <= rx_state[`IDX(5)] + HASHERS[NUM_ROUNDS/LOOP-6'd1].state[`IDX(5)];
			tx_hash[`IDX(6)] <= rx_state[`IDX(6)] + HASHERS[NUM_ROUNDS/LOOP-6'd1].state[`IDX(6)];
			tx_hash[`IDX(7)] <= rx_state[`IDX(7)] + HASHERS[NUM_ROUNDS/LOOP-6'd1].state[`IDX(7)];
		end else begin
			tx_hash[`IDX(0)] <= HASHERS[NUM_ROUNDS/LOOP-6'd1].state[`IDX(0)];
			tx_hash[`IDX(1)] <= HASHERS[NUM_ROUNDS/LOOP-6'd1].state[`IDX(1)];
			tx_hash[`IDX(2)] <= HASHERS[NUM_ROUNDS/LOOP-6'd1].state[`IDX(2)];
			tx_hash[`IDX(3)] <= HASHERS[NUM_ROUNDS/LOOP-6'd1].state[`IDX(3)];
			tx_hash[`IDX(4)] <= HASHERS[NUM_ROUNDS/LOOP-6'd1].state[`IDX(4)];
			tx_hash[`IDX(5)] <= HASHERS[NUM_ROUNDS/LOOP-6'd1].state[`IDX(5)];
			tx_hash[`IDX(6)] <= HASHERS[NUM_ROUNDS/LOOP-6'd1].state[`IDX(6)];
			tx_hash[`IDX(7)] <= HASHERS[NUM_ROUNDS/LOOP-6'd1].state[`IDX(7)];
		end
	end


endmodule

module sha256_update_w (clk, rx_w0, rx_w1, rx_w9, rx_w14, tx_w15);
	input clk;
	input [31:0] rx_w0, rx_w1, rx_w9, rx_w14;
	output reg[31:0] tx_w15;
	
	wire [31:0] s0_w, s1_w;
	s0	s0_blk	(rx_w1, s0_w);
	s1	s1_blk	(rx_w14, s1_w);

	wire [31:0] new_w = s1_w + rx_w9 + s0_w + rx_w0;
	always @ (posedge clk)
		tx_w15 <= new_w;
	
endmodule

module sha256_digester (clk, k_next, rx_state, rx_t1_part, rx_w1, 
								tx_state, tx_t1_part);

	input clk;
	input [31:0] k_next;
	input [255:0] rx_state;
	input [31:0] rx_t1_part;
	input [31:0] rx_w1;

	output reg [255:0] tx_state;
	output reg [31:0] tx_t1_part;

	wire [31:0] e0_w, e1_w, ch_w, maj_w;
	
	
	e0	e0_blk	(rx_state[`IDX(0)], e0_w);
	e1	e1_blk	(rx_state[`IDX(4)], e1_w);
	ch	ch_blk	(rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch_w);
	maj	maj_blk	(rx_state[`IDX(0)], rx_state[`IDX(1)], rx_state[`IDX(2)], maj_w);

	wire [31:0] t1 = rx_t1_part + e1_w + ch_w ;
	wire [31:0] t2 = e0_w + maj_w;
	

	always @ (posedge clk)
	begin
		tx_t1_part <= (rx_state[`IDX(6)] + rx_w1 + k_next);
	
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

module shifter_32b #(
	parameter LENGTH = 1
) (
	input clk,
	input [31:0] val_in,
	output [31:0] val_out
);
generate
`ifdef USE_EXPLICIT_ALTSHIFT_FOR_W
	if(LENGTH >= 4) begin
		altshift_taps #(.number_of_taps(1), .tap_distance(LENGTH), .width(32)) shifttaps
		( .clken(1), .aclr(0), .clock(clk), .shiftin(val_in), .taps(), .shiftout(val_out) ); 
	end else begin
`endif
`ifdef USE_XILINX_BRAM_FOR_W
	if(LENGTH >= 8) begin
		reg [7:0] addr = 0;
		reg [31:0] r; 
		reg [31:0] m[0:(LENGTH-2)];
		always @ (posedge clk)
		begin
			addr <= (addr + 1) % (LENGTH - 1);
			r <= m[addr];
			m[addr] <= val_in;
		end
		assign val_out = r;
	end else begin
`endif
		reg [32 * LENGTH - 1:0] r;
		always @ (posedge clk)
			r <= (r << 32) | val_in;
		assign val_out = r[32 * LENGTH - 1:32 * (LENGTH - 1)];
`ifdef USE_XILINX_BRAM_FOR_W
	end
`endif
`ifdef USE_EXPLICIT_ALTSHIFT_FOR_W
	end
`endif
endgenerate
endmodule
