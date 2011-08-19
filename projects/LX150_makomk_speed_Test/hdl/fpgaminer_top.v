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

module fpgaminer_top (
	input CLK_100MHZ
);

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

	sha256_transform #(.NUM_ROUNDS(64)) uut (
		.clk(hash_clk),
		.rx_state(state),
		.rx_input({384'h000002800000000000000000000000000000000000000000000000000000000000000000000000000000000080000000, data}),
		.tx_hash(hash)
	);
	sha256_transform #(.NUM_ROUNDS(61)) uut2 (
		.clk(hash_clk),
		.rx_state(256'h5be0cd191f83d9ab9b05688c510e527fa54ff53a3c6ef372bb67ae856a09e667),
		.rx_input({256'h0000010000000000000000000000000000000000000000000000000080000000, hash}),
		.tx_hash(hash2)
	);


	//// Virtual Wire Control
	wire [255:0] comm_midstate;
	wire [95:0] comm_data;
	reg old_is_golden_ticket = 1'b0;
	reg [31:0] golden_nonce = 0;

`ifndef SIM
	comm comm_test_blk (
		.hash_clk (hash_clk),
		.rx_new_nonce (old_is_golden_ticket),
		.rx_golden_nonce (golden_nonce),
		.tx_midstate(comm_midstate),
		.tx_data(comm_data)
	);
`endif


	//// Control Unit
	reg is_golden_ticket = 1'b0;
	wire [31:0] nonce_next;

	assign nonce_next = nonce + 32'd1;

	//assign hash2[159:128] = state[31:0] ^ state[63:32] ^ state[95:64] ^ state[127:96] ^ state[159:128] ^ state[191:160] ^ state[223:192] ^ state[255:224] ^ data[31:0] ^ data[63:32] ^ data[95:64] ^ data[127:96];
	
	always @ (posedge hash_clk)
	begin
		`ifdef SIM
			//midstate_buf <= 256'h2b3f81261b3cfd001db436cfd4c8f3f9c7450c9a0d049bee71cba0ea2619c0b5;
			//data_buf <= 256'h00000000000000000000000080000000_00000000_39f3001b6b7b8d4dc14bfc31;
			//nonce <= 30411740;
		`else
			//midstate_buf <= midstate_vw;
			//data_buf <= data2_vw;
		`endif


		// Give new data to the hasher
		state <= comm_midstate;
		data <= {nonce_next, comm_data[95:0]};
		nonce <= nonce_next;


		// Check to see if the last hash generated is valid.
		is_golden_ticket <= (hash2[159:128] + 32'h5be0cd19 == 32'h00000000);
		old_is_golden_ticket <= is_golden_ticket;
		
		if(is_golden_ticket)
			golden_nonce <= nonce - 32'd130;
	end

endmodule

