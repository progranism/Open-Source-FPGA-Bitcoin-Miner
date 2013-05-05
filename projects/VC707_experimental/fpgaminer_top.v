/*
*
* Copyright (c) 2011-2013 fpgaminer@bitcoin-mining.com
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
	input sys_clk_p,
	input sys_clk_n,
	input uart_rx,
	output uart_tx
);

	//-----------------------------------------------------------------------------
	// Clock Multiplier
	//-----------------------------------------------------------------------------
	wire hash_clk;
	wire comm_clk;

`ifndef SIM
	hashing_clock_multiplier hashing_clock_multiplier_blk (
		.clk_in1_p (sys_clk_p),
		.clk_in1_n (sys_clk_n),
		.tx_hash_clk (hash_clk),
		.tx_comm_clk (comm_clk)
	);
`else
	reg hash_clk_sim = 1'b0;

	assign hash_clk = hash_clk_sim;
	assign comm_clk = hash_clk_sim;

	initial begin
		hash_clk_sim = 1'b0;

		while (1)
		begin
			#5 hash_clk_sim = 1'b1; #5 hash_clk_sim = 1'b0;
		end
	end
`endif


	//-----------------------------------------------------------------------------
	// DSP48E1 Hasher ---- /*ZTEX Hashers*/
	//-----------------------------------------------------------------------------
	reg [31:0] nonce = 32'd253, nonce2 = 32'd0;
	wire [255:0] comm_midstate;
	wire [95:0] comm_data;

	wire [255:0] hash;
	wire [31:0] hash2_w;

	sha256_dsp48e1_rounds hasher (
		.clk (hash_clk),
		.rx_data ({384'h000002800000000000000000000000000000000000000000000000000000000000000000000000000000000080000000, nonce, comm_data}),
		.rx_state (comm_midstate),
		.tx_hash (hash),
		.tx_midhash ()
	);

	sha256_dsp48e1_rounds hasher2 (
		.clk (hash_clk),
		.rx_data ({256'h0000010000000000000000000000000000000000000000000000000080000000, hash}),
		.rx_state (256'h5be0cd191f83d9ab9b05688c510e527fa54ff53a3c6ef372bb67ae856a09e667),
		.tx_hash (),
		.tx_midhash (hash2_w)
	);

	/*sha256_pipe130 p1 (
		.clk (hash_clk),
		.state (midstate),
		.state2 (midstate),
		.data ({384'h000002800000000000000000000000000000000000000000000000000000000000000000000000000000000080000000, nonce, data}),
		.hash (hash)
	);

	sha256_pipe123 p2 (
		.clk (hash_clk),
		.data ({256'h0000010000000000000000000000000000000000000000000000000080000000, hash}),
		.hash (hash2_w)
	);*/
	
	//-----------------------------------------------------------------------------
	// Dummy Hasher
	//-----------------------------------------------------------------------------
	/*reg [31:0] hash2_w;

	always @ (posedge hash_clk)
	begin
		hash2_w <= midstate[31:0] ^ midstate[63:32] ^ midstate[95:64] ^ midstate[127:96] ^ midstate[159:128] ^ midstate[191:160] ^ midstate[223:192] ^ midstate[255:224] ^ data[31:0] ^ data[63:32] ^ data[95:64] ^ nonce;
	end*/


`ifdef SIM
	reg fake_uart = 1'b1;
	reg [15:0] timer = 16'd0;
	reg [21:0] sequence = 22'b1100010011010010100001;

	always @ (posedge comm_clk)
	begin
		timer <= timer + 16'd1;

		if (timer == 16'd867)
		begin
			timer <= 0;
			{fake_uart, sequence} <= {sequence, 1'b1};
		end
	end
`endif


	//-----------------------------------------------------------------------------
	// Communication Module
	//-----------------------------------------------------------------------------
	wire comm_new_work;
	reg is_golden_ticket = 1'b0, buf_is_golden_ticket = 1'b0, buf2_is_golden_ticket = 1'b0;
	reg [31:0] golden_ticket, buf_golden_ticket, buf2_golden_ticket;

	comm_uart # (
		.comm_clk_frequency (100000000),
		.baud_rate (115200)
	) comm_uart_blk (
		.comm_clk (comm_clk),
`ifdef SIM
		.uart_rx (fake_uart),
`else
		.uart_rx (uart_rx),
`endif
		.uart_tx (uart_tx),

		.hash_clk (hash_clk),
		.rx_new_golden_ticket (buf2_is_golden_ticket),
		.rx_golden_ticket (buf2_golden_ticket),
		
		.tx_new_work (comm_new_work),
		.tx_midstate (comm_midstate),
		.tx_blockdata (comm_data)
	);


	//-----------------------------------------------------------------------------
	// Control Unit
	//-----------------------------------------------------------------------------
	// NOTE: When the hashers first start churning on new work, results
	// will be invalid for ~253 cycles. Since returning invalid results is
	// not very detrimental (controlling software double checks results)
	// we sacrifice a small amount of accuracy in exchange for simple
	// logic.
	// TODO: No longer 253 cycles on DSP based design ... need to update.
	reg reset = 1'b1;
	
	always @ (posedge hash_clk)
	begin
		// Counters
		if (reset | comm_new_work)
		begin
			nonce <= 32'd503;
			nonce2 <= 32'd0;
		end
		else
		begin
			nonce <= nonce + 32'd1;
			nonce2 <= nonce2 + 32'd1;
		end

		// Clear the reset signal when we get new work
		if (comm_new_work)
			reset <= 1'b0;
		// Stop hashing if we've run out of nonces to check
		else if (nonce2 == 32'hFFFFFFFF)
			reset <= 1'b1;

		// Check to see if the last hash generated is valid.
		is_golden_ticket <= hash2_w == 32'hA41F32E7;
		if (hash2_w == 32'hA41F32E7)
			golden_ticket <= nonce2;

		buf_is_golden_ticket <= is_golden_ticket;
		buf_golden_ticket <= golden_ticket;
		{buf2_is_golden_ticket, buf2_golden_ticket} <= {buf_is_golden_ticket, buf_golden_ticket};
	end

endmodule
