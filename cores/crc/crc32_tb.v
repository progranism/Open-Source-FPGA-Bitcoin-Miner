`timescale 1ns/1ps

// Works with Icarus Verilog
module crc32_tb;

	// Clocks
	reg clk = 0;

	initial while(1) begin
		#10 clk = ~clk;
	end


	// UUT
	reg uut_we = 1'b0;
	reg [7:0] uut_data;
	wire [31:0] uut_crc;

	CRC32 uut (
		.clk (clk),
		.reset (1'b0),
		.rx_we (uut_we),
		.rx_byte (uut_data),
		.tx_crc (uut_crc)
	);


	// Test data
	reg [63:0] testdata = 'h00000000_DEADBEEF;
	integer bytes = 8;
	
	always @ (posedge clk)
	begin
		uut_we <= 1'b0;

		if (bytes == 0)
			#20 $finish;

		if (bytes > 0)
		begin
			uut_we <= 1'b1;
			uut_data <= testdata[7:0];
			testdata <= testdata >> 8;
			bytes = bytes - 1;
		end
	end


	// VCD Dump
	initial
	begin
		$dumpfile("crc32_tb.vcd");
		$dumpvars(0, uut);
	end

endmodule

