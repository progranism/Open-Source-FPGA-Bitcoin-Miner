// Testbench for fpgaminer_top.v
// TODO: Expand and generalize to test any mining core or complete design.
//


`timescale 1ns/1ps

module test_fpgaminer_top ();

	reg clk = 1'b0;

	fpgaminer_top # (.LOOP_LOG2(0)) uut (clk);


	reg [31:0] cycle = 32'd0;

	initial begin
		clk = 0;
		#100

		// Test data
		uut.midstate_buf = 256'h228ea4732a3c9ba860c009cda7252b9161a5e75ec8c582a5f106abb3af41f790;
		uut.data_buf = 512'h000002800000000000000000000000000000000000000000000000000000000000000000000000000000000080000000000000002194261a9395e64dbed17115;
		uut.nonce = 32'h0e33337a - 256;	// Minus a little so we can exercise the code a bit

		while(1)
		begin
			#5 clk = 1; #5 clk = 0;
		end
	end


	always @ (posedge clk)
	begin
		cycle <= cycle + 32'd1;
	end

endmodule

