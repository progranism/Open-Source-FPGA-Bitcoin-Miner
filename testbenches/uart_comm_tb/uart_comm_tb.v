`timescale 1ns/1ps

// Works with Icarus Verilog
module uart_comm_tb;

	// Clocks
	reg serial_clk = 0;
	reg uart_clk = 0;

	initial while(1) begin
		#160 uart_clk = ~uart_clk;
	end

	initial while(1) begin
		#10 serial_clk = ~serial_clk;
	end


	// Test data
	reg [7*10+1:0] testdata = {1'b1, "N", 1'b0, 1'b1, "i", 1'b0, 1'b1, "O", 1'b0, 1'b1, "c", 1'b0, 1'b1, "T", 1'b0, 1'b1, "i", 1'b0, 1'b1, "B", 1'b0, 1'b1, 1'b1};
	
	always @ (posedge uart_clk)
	begin
		testdata <= {1'b1, testdata[7*10+1:1]};
	end


	// UUT
	wire uut_tx;

	uart_comm uut (
		.serial_clk (serial_clk),
		.rx_serial (testdata[0]),
		.tx_serial (uut_tx)
	);


	// VCD Dump
	initial
	begin
		$dumpfile("uart_comm_tb.vcd");
		$dumpvars;

		#30000 $finish;
	end

endmodule

