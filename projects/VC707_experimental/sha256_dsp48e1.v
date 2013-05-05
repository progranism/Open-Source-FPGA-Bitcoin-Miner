/*
*
* Copyright (c) 2013 fpgaminer@bitcoin-mining.com
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
`timescale 1ns/1ns

`define IDX(x) (((x)+1)*(32)-1):((x)*(32))
`define MAJ(x,y,z) ( ((x) & (y)) | ((z) & ((x) | (y))) )


module sha256_dsp48e1_rounds (
	input clk,
	input [511:0] rx_data,
	input [255:0] rx_state,
	output reg [255:0] tx_hash,
	output [31:0] tx_midhash
);

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


	// Pre-adder
	wire [31:0] t1ps, t1pc;
	wire [47:0] r0_t1p;

	compressor3_2 compressor_t1p (
		.rx_a (rx_state[`IDX(7)]),
		.rx_b (rx_data[`IDX(0)]),
		.rx_c (32'h428a2f98),
		.tx_sum (t1ps),
		.tx_carry (t1pc)
	);

	dsp48e1_adder dsp_t1p (
		.clk (clk),
		.rx_ab ({16'd0, t1ps}),
		.rx_c ({16'd0, t1pc[30:0], 1'b0}),
		.rx_pcin (),
		.tx_p (),
		.tx_pcout (r0_t1p)
	);

	reg [511:0] delay0_data, delay1_data, delay2_data;


	genvar i;
	generate
	
		for (i = 0; i < 64; i = i + 1) begin : R
			wire [511:0] data;
			wire [47:0] t1p;
			wire [223:0] state;
			wire [511:0] tx_data;
			wire [47:0] tx_t1p;
			wire [223:0] tx_state;

			if (i == 0)
				assign data = delay0_data;
			else
				assign data = R[i-1].tx_data;

			if (i == 0)
				assign t1p = r0_t1p;
			else
				assign t1p = R[i-1].tx_t1p;

			if (i == 0)
				assign state = rx_state[223:0];
			else
				assign state = R[i-1].tx_state;


			/*sha256_dsp48e1_wround blk (
				.clk (clk),
				.rx_data (data),
				.tx_data (tx_data)
			);*/

			sha256_dsp48e1_round # (.next_K (Ks[`IDX((126 - i) & 63)])) blk (
				.clk (clk),
				.rx_data (data),
				.rx_t1p (t1p),
				.rx_state (state),
				.tx_data (tx_data),
				.tx_t1p (tx_t1p),
				.tx_state (tx_state)
			);
		end	

	endgenerate


	assign tx_midhash = R[60].tx_state[`IDX(4)];


	reg [31:0] delay0_state7, delay1_state7, delay2_state7, delay3_state7;


	always @ (posedge clk)
	begin
		{delay2_data, delay1_data, delay0_data} <= {delay1_data, delay0_data, rx_data};

		delay0_state7 <= R[62].tx_state[`IDX(6)];
		{delay3_state7, delay2_state7, delay1_state7} <= {delay2_state7, delay1_state7, delay0_state7};

		tx_hash[`IDX(7)] <= delay3_state7 + rx_state[`IDX(7)];
		tx_hash[`IDX(6)] <= R[63].tx_state[`IDX(6)] + rx_state[`IDX(6)];
		tx_hash[`IDX(5)] <= R[63].tx_state[`IDX(5)] + rx_state[`IDX(5)];
		tx_hash[`IDX(4)] <= R[63].tx_state[`IDX(4)] + rx_state[`IDX(4)];
		tx_hash[`IDX(3)] <= R[63].tx_state[`IDX(3)] + rx_state[`IDX(3)];
		tx_hash[`IDX(2)] <= R[63].tx_state[`IDX(2)] + rx_state[`IDX(2)];
		tx_hash[`IDX(1)] <= R[63].tx_state[`IDX(1)] + rx_state[`IDX(1)];
		tx_hash[`IDX(0)] <= R[63].tx_state[`IDX(0)] + rx_state[`IDX(0)];
	end

endmodule


module compressor3_2 (
	input [31:0] rx_a,
	input [31:0] rx_b,
	input [31:0] rx_c,
	output [31:0] tx_sum,
	output [31:0] tx_carry
);

	assign tx_sum = rx_a ^ rx_b ^ rx_c;
	assign tx_carry = `MAJ(rx_a, rx_b, rx_c);

endmodule


module compressor4_2 (
	input [31:0] rx_a,
	input [31:0] rx_b,
	input [31:0] rx_c,
	input [31:0] rx_d,
	output [31:0] tx_sum,
	output [31:0] tx_carry
);

	wire [31:0] abcs, abcc;
	compressor3_2 abc (.rx_a (rx_a), .rx_b (rx_b), .rx_c (rx_c), .tx_sum (abcs), .tx_carry (abcc));
	compressor3_2 final (.rx_a (abcs), .rx_b ({abcc[30:0], 1'b0}), .rx_c (rx_d), .tx_sum (tx_sum), .tx_carry (tx_carry));

endmodule

/*module shifter # (
	parameter */


module sha256_dsp48e1_round # (
       parameter [31:0] next_K = 32'd0
) (
	input clk,
	input [511:0] rx_data,
	input [47:0] rx_t1p,
	input [223:0] rx_state,
	output [511:0] tx_data,
	output [47:0] tx_t1p,
	output [223:0] tx_state
);

	// W Calculation
	reg [511:0] data0;
	reg [479:0] data1, data2, data3;
	wire [31:0] s0;
	wire [31:0] s1;
	wire [47:0] wp;
	
	s0 s0_blk (data0[`IDX(1)], s0);
	s1 s1_blk (data1[`IDX(13)], s1);

	dsp48e1_adder dsp_wp (
		.clk (clk),
		.rx_ab ({16'd0,s0}),
		.rx_c ({16'd0,data0[`IDX(0)]}),
		.rx_pcin (),
		.tx_p (),
		.tx_pcout (wp)
	);

	dsp48e1_adder # (.OPMODE(7'b0011111)) dsp_w16 (
		.clk (clk),
		.rx_ab ({16'd0,s1}),
		.rx_c ({16'd0,data1[`IDX(8)]}),
		.rx_pcin (wp),
		.tx_p (tx_data[`IDX(15)]),
		.tx_pcout ()
	);

	always @ (posedge clk)
	begin
		data0 <= rx_data;
		{data3, data2, data1} <= {data2, data1, data0[511:32]};
	end

	assign tx_data[479:0] = data3;


	// State Calculation
	reg [31:0] g0, g1, g2, d0, d1, tx_a1, tx_a2, tx_e1, t1ps1, t1pc1;
	reg [63:0] ef0, ef1, ef2, ef3, ef4;
	reg [95:0] abc0, abc1, abc2, abc3, abc4;
	wire [31:0] e1;
	wire [31:0] ch;
	wire [31:0] e0;
	wire [31:0] maj;
	wire [31:0] t1ps, t1pc;
	wire [47:0] t1, t1_pcout;
	wire [31:0] tx_a0, tx_e0;
	
	e0 e0_blk (abc0[`IDX(0)], e0);
	e1 e1_blk (rx_state[`IDX(4)], e1);
	ch ch_blk (rx_state[`IDX(4)], rx_state[`IDX(5)], rx_state[`IDX(6)], ch);
	maj maj_blk (abc0[`IDX(0)], abc0[`IDX(1)], abc0[`IDX(2)], maj);

	dsp48e1_adder # (.OPMODE(7'b0011111)) dsp_t1 (
		.clk (clk),
		.rx_ab ({16'd0,e1}),
		.rx_c ({16'd0,ch}),
		.rx_pcin (rx_t1p),
		.tx_p (t1),
		.tx_pcout (t1_pcout)
	);

	dsp48e1_adder # (.OPMODE(7'b0011111)) dsp_a (
		.clk (clk),
		.rx_ab ({16'd0,e0}),
		.rx_c ({16'd0,maj}),
		.rx_pcin (t1_pcout),
		.tx_p (tx_a0),
		.tx_pcout ()
	);

	dsp48e1_adder dsp_e (
		.clk (clk),
		.rx_ab ({16'd0,d1}),
		.rx_c (t1),
		.rx_pcin (),
		.tx_p (tx_state[`IDX(4)]),
		.tx_pcout ()
	);

	compressor3_2 compressor_t1p (
		.rx_a (g1),
		.rx_b (data1[`IDX(0)]),
		.rx_c (next_K),
		.tx_sum (t1ps),
		.tx_carry (t1pc)
	);

	dsp48e1_adder dsp_t1p (
		.clk (clk),
		.rx_ab ({16'd0,t1ps1}),
		.rx_c ({16'd0,t1pc1[30:0],1'b0}),
		.rx_pcin (),
		.tx_p (),
		.tx_pcout (tx_t1p)
	);
	

	always @ (posedge clk)
	begin
		{t1ps1, t1pc1} <= {t1ps, t1pc};
		{g2, g1, g0} <= {g1, g0, rx_state[`IDX(6)]};
		{ef4, ef3, ef2, ef1, ef0} <= {ef3, ef2, ef1, ef0, rx_state[`IDX(5)], rx_state[`IDX(4)]};
		{abc4, abc3, abc2, abc1, abc0} <= {abc3, abc2, abc1, abc0, rx_state[`IDX(2)], rx_state[`IDX(1)], rx_state[`IDX(0)]};
		{d1, d0} <= {d0, rx_state[`IDX(3)]};
		{tx_a2, tx_a1} <= {tx_a1, tx_a0};
		//tx_e1 <= tx_e0;
	end

	assign {tx_state[`IDX(6)], tx_state[`IDX(5)]} = ef3;
	assign {tx_state[`IDX(3)], tx_state[`IDX(2)], tx_state[`IDX(1)]} = abc3;
	assign tx_state[`IDX(0)] = tx_a1;
	//assign tx_state[`IDX(4)] = tx_e1;

endmodule


// Help to simplify the usage of DSP48E1 slices as 2 or 3 input adders
module dsp48e1_adder # (
	parameter OPMODE = 7'b0001111
) (
	input clk,
	input [47:0] rx_pcin,
	input [47:0] rx_ab,
	input [47:0] rx_c,
	output [47:0] tx_p,
	output [47:0] tx_pcout
);

	DSP48E1 #(
		.A_INPUT("DIRECT"),
		.B_INPUT("DIRECT"),
		.USE_DPORT("FALSE"),
		.USE_MULT("NONE"),
		.AUTORESET_PATDET("NO_RESET"),
		.MASK(48'h3fffffffffff),
		.PATTERN(48'h000000000000),
		.SEL_MASK("MASK"),
		.SEL_PATTERN("PATTERN"),
		.USE_PATTERN_DETECT("NO_PATDET"),
		.ACASCREG(/*2*/1),
		.ADREG(0),
		.ALUMODEREG(1),
		.AREG(/*2*/1),
		.BCASCREG(/*2*/1),
		.BREG(/*2*/1),
		.CARRYINREG(1),
		.CARRYINSELREG(1),
		.CREG(1),
		.DREG(0),
		.INMODEREG(1),
		.MREG(0),
		.OPMODEREG(1),
		.PREG(1),
		.USE_SIMD("ONE48")
	) dsp_blk (
		.ACOUT(),
		.BCOUT(),
		.CARRYCASCOUT(),
		.MULTSIGNOUT(),
		.PCOUT(tx_pcout),
		.OVERFLOW(),
		.PATTERNBDETECT(),
		.PATTERNDETECT(),
		.UNDERFLOW(),
		.CARRYOUT(),
		.P(tx_p),
		.ACIN(),
		.BCIN(),
		.CARRYCASCIN(1'b0), 
		.MULTSIGNIN(1'b0), 
		.PCIN(rx_pcin),
		.ALUMODE(4'b0000),
		.CARRYINSEL(3'b000),
		.CEINMODE(1'b1),
		.CLK(clk),
		.INMODE(5'b00000),
		.OPMODE(OPMODE),
		.RSTINMODE(1'b0),
		.A(rx_ab[47:18]),
		.B(rx_ab[17:0]),
		.C(rx_c),
		.CARRYIN(1'b0),
		.D(),
		.CEA1(1'b1),
		.CEA2(1'b1),
		.CEAD(1'b0),
		.CEALUMODE(1'b1),
		.CEB1(1'b1),
		.CEB2(1'b1),
		.CEC(1'b1),
		.CECARRYIN(1'b1),
		.CECTRL(1'b1),
		.CED(1'b0),
		.CEM(1'b0),
		.CEP(1'b1),
		.RSTA(1'b0),
		.RSTALLCARRYIN(1'b0),
		.RSTALUMODE(1'b0),
		.RSTB(1'b0),
		.RSTC(1'b0),
		.RSTCTRL(1'b0),
		.RSTD(1'b0),
		.RSTM(1'b0),
		.RSTP(1'b0)
	);

endmodule

