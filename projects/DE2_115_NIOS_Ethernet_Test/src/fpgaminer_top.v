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

module fpgaminer_top (osc_clk, MISO, MOSI, SCLK, eth_nRESET, eth_nSCS);

	input osc_clk;
	input MISO;
	output MOSI, SCLK, eth_nRESET, eth_nSCS;


	//// 
	reg [255:0] state = 0;
	reg [511:0] data = 0;
	reg [31:0] nonce = 32'h00000000;


	//// PLL
	wire hash_clk;
	`ifndef SIM
	main_pll pll_blk (osc_clk, hash_clk);
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

	sha256_transform uut (clk, state, data, hash);
	sha256_transform uut2 (clk, 256'h5be0cd191f83d9ab9b05688c510e527fa54ff53a3c6ef372bb67ae856a09e667, {256'h0000010000000000000000000000000000000000000000000000000080000000, hash}, hash2);


	//// Controller
	reg [31:0] golden_nonce = 0;
	wire [255:0] midstate_vw;
	wire [95:0] data2_vw;

	minercontroller minercontroller_inst
	(
		.altpll_0_c0_out		  (),
		.clk_0                            (osc_clk),
		.in_port_to_the_MISO		  (MISO),
		.in_port_to_the_pio_nonce         (golden_nonce),
		.locked_from_the_altpll_0	  (),
		.out_port_from_the_MOSI		  (MOSI),
		.out_port_from_the_SCLK		  (SCLK),
		.out_port_from_the_eth_nRESET	  (eth_nRESET),
		.out_port_from_the_eth_nSCS	  (eth_nSCS),
		.out_port_from_the_pio_data_0     (data2_vw[31:0]),
		.out_port_from_the_pio_data_1     (data2_vw[63:32]),
		.out_port_from_the_pio_data_2     (data2_vw[95:64]),
		.out_port_from_the_pio_midstate_0 (midstate_vw[31:0]),
		.out_port_from_the_pio_midstate_1 (midstate_vw[63:32]),
		.out_port_from_the_pio_midstate_2 (midstate_vw[95:64]),
		.out_port_from_the_pio_midstate_3 (midstate_vw[127:96]),
		.out_port_from_the_pio_midstate_4 (midstate_vw[159:128]),
		.out_port_from_the_pio_midstate_5 (midstate_vw[191:160]),
		.out_port_from_the_pio_midstate_6 (midstate_vw[223:192]),
		.out_port_from_the_pio_midstate_7 (midstate_vw[255:224]),
		.phasedone_from_the_altpll_0	  (),
		.reset_n                          (1'b1)
	);


	reg [255:0] midstate_buf = 0, data_buf = 0;
	//wire [255:0] midstate_vw, data2_vw;
	//virtual_wire # (.PROBE_WIDTH(0), .WIDTH(256), .INSTANCE_ID("STAT")) midstate_vw_blk(.probe(), .source(midstate_vw));
	//virtual_wire # (.PROBE_WIDTH(0), .WIDTH(256), .INSTANCE_ID("DAT2")) data2_vw_blk(.probe(), .source(data2_vw));


	//// Virtual Wire Output
	//reg [31:0] golden_nonce = 0;

	// Note that the nonce reported to the external world will always be
	// larger than the real nonce. Currently it is 132 bigger. So an
	// external controller (like scripts/mine.tcl) needs to do:
	// golden_nonce = golden_nonce - 132
	// to get the real nonce.
	//virtual_wire # (.PROBE_WIDTH(32), .WIDTH(0), .INSTANCE_ID("GNON")) golden_nonce_vw_blk (.probe(golden_nonce), .source());


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


		// Give new data to the hasher
		state <= midstate_buf;
		data <= {384'h000002800000000000000000000000000000000000000000000000000000000000000000000000000000000080000000, nonce, data_buf[95:0]};
		//nonce <= nonce + 32'd1;



		// Check to see if the last hash generated is valid.
		is_golden_ticket <= hash2[255:224] == 32'h00000000;
		if(is_golden_ticket)
		begin
			golden_nonce <= nonce;
		end
	end


	//// Simulation Clock
`ifdef SIM
	initial begin
		#100

		while(1)
		begin
			#6 gen_clk = 1; #6 gen_clk = 0;
		end
	end
`endif

endmodule


