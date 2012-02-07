/*!
   btcminer -- BTCMiner for ZTEX USB-FPGA Modules: HDL code: hash pipelines
   Copyright (C) 2011 ZTEX GmbH
   http://www.ztex.de

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License version 3 as
   published by the Free Software Foundation.

   This program is distributed in the hope that it will be useful, but
   WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
   General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, see http://www.gnu.org/licenses/.
!*/

`define IDX(x) (((x)+1)*(32)-1):((x)*(32))
`define E0(x) ( {{x}[1:0],{x}[31:2]} ^ {{x}[12:0],{x}[31:13]} ^ {{x}[21:0],{x}[31:22]} )
`define E1(x) ( {{x}[5:0],{x}[31:6]} ^ {{x}[10:0],{x}[31:11]} ^ {{x}[24:0],{x}[31:25]} )
`define CH(x,y,z) ( (z) ^ ((x) & ((y) ^ (z))) )
`define MAJ(x,y,z) ( ((x) & (y)) | ((z) & ((x) | (y))) )
`define S0(x) ( { {x}[6:4] ^ {x}[17:15], {{x}[3:0], {x}[31:7]} ^ {{x}[14:0],{x}[31:18]} ^ {x}[31:3] } )
`define S1(x) ( { {x}[16:7] ^ {x}[18:9], {{x}[6:0], {x}[31:17]} ^ {{x}[8:0],{x}[31:19]} ^ {x}[31:10] } )

module sha256_pipe2_base ( clk, i_state, i_data, out );

	parameter STAGES = 64;
	
	input clk;
	input [255:0] i_state;
	input [511:0] i_data;
	output [255:0] out;

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
		32'h90befffa, 32'ha4506ceb, 32'hbef9a3f7, 32'hc67178f2 
	};

	genvar i;
	
	generate

    	    for (i = 0; i <= STAGES; i = i + 1) begin : S

		reg [511:0] data;
		reg [223:0] state;
		reg [31:0] t1_p1;

		if(i == 0) 
		begin

		    reg [223:0] o_state;
		    
		    always @ (posedge clk)
		    begin
			data <= i_data;
			state <= i_state[223:0];
			t1_p1 <= i_state[`IDX(7)] + i_data[`IDX(0)] + Ks[`IDX(63)];
		    end
		    
		end else
		begin
		
		    reg [511:0] data_buf;
		    reg [223:0] state_buf;
		    reg [31:0] data15_p1, data15_p2, data15_p3, t1;

		    always @ (posedge clk)
		    begin
			data_buf <= S[i-1].data;
			data[479:0] <= data_buf[511:32];

			data15_p1 <= `S1( S[i-1].data[`IDX(15)] );											// 3
			data15_p2 <= data15_p1;														// 1
			data15_p3 <= ( ( i == 1 ) ? `S1( S[i-1].data[`IDX(14)] ) : S[i-1].data15_p2 ) + S[i-1].data[`IDX(9)] + S[i-1].data[`IDX(0)];	// 3
			data[`IDX(15)] <= `S0( data_buf[`IDX(1)] ) + data15_p3;										// 4
			
    	    		state_buf <= S[i-1].state;													// 2
			
		        t1 <= `CH( S[i-1].state[`IDX(4)], S[i-1].state[`IDX(5)], S[i-1].state[`IDX(6)] ) + `E1( S[i-1].state[`IDX(4)] ) + S[i-1].t1_p1;	// 6

	                state[`IDX(0)] <= `MAJ( state_buf[`IDX(0)], state_buf[`IDX(1)], state_buf[`IDX(2)] ) + `E0( state_buf[`IDX(0)] ) + t1;		// 7
			state[`IDX(1)] <= state_buf[`IDX(0)];												// 1
			state[`IDX(2)] <= state_buf[`IDX(1)];												// 1
			state[`IDX(3)] <= state_buf[`IDX(2)];												// 1
			state[`IDX(4)] <= state_buf[`IDX(3)] + t1;											// 2
			state[`IDX(5)] <= state_buf[`IDX(4)];												// 1
			state[`IDX(6)] <= state_buf[`IDX(5)];												// 1

			t1_p1 <= state_buf[`IDX(6)] + data_buf[`IDX(1)] + Ks[`IDX((127-i) & 63)];							// 2
		    end

		end
	    end

	endgenerate

	reg [31:0] state7, state7_buf;

	always @ (posedge clk)
	begin
	    state7_buf <= S[STAGES-1].state[`IDX(6)];
	    state7 <= state7_buf;
	end

 	assign out[223:0] = S[STAGES].state;
	assign out[255:224] = state7;

endmodule


module sha256_pipe130 ( clk, state, state2, data,  hash );

	input clk;
	input [255:0] state, state2;
	input [511:0] data;
	output reg [255:0] hash;

	wire [255:0] out;	

	sha256_pipe2_base #( .STAGES(64) ) P (
	    .clk(clk),
	    .i_state(state),
	    .i_data(data),
	    .out(out)
	);

	always @ (posedge clk)
	begin
	    hash[`IDX(0)] <= state2[`IDX(0)] + out[`IDX(0)];
	    hash[`IDX(1)] <= state2[`IDX(1)] + out[`IDX(1)];
	    hash[`IDX(2)] <= state2[`IDX(2)] + out[`IDX(2)];
	    hash[`IDX(3)] <= state2[`IDX(3)] + out[`IDX(3)];
	    hash[`IDX(4)] <= state2[`IDX(4)] + out[`IDX(4)];
	    hash[`IDX(5)] <= state2[`IDX(5)] + out[`IDX(5)];
	    hash[`IDX(6)] <= state2[`IDX(6)] + out[`IDX(6)];
	    hash[`IDX(7)] <= state2[`IDX(7)] + out[`IDX(7)];
	end 

endmodule


module sha256_pipe123 ( clk, data,  hash );

	parameter state = 256'h5be0cd191f83d9ab9b05688c510e527fa54ff53a3c6ef372bb67ae856a09e667;

	input clk;
	input [511:0] data;
	output [31:0] hash;

	wire [255:0] out;	

	sha256_pipe2_base #( .STAGES(61) ) P (
	    .clk(clk),
	    .i_state(state),
	    .i_data(data),
	    .out(out)
	);

	assign hash = out[`IDX(4)];

endmodule

