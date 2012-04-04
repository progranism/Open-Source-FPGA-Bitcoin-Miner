`timescale 1ns/1ps

// Works with Icarus Verilog
module uart_comm_tb;

	// Clocks
	reg comm_clk = 0;
	reg uart_clk = 0;

	initial while(1) begin
		#160 uart_clk = ~uart_clk;
	end

	initial while(1) begin
		#10 comm_clk = ~comm_clk;
	end


	// Test data
	reg [115:0] testdata = 'b1111_0000000001_1111_0000100001_0000000001_0000000001_0000000001_0100111111_0010101111_0000110011_0010100001_1111_0001000001_1111;
	
	always @ (posedge uart_clk)
	begin
		testdata <= (testdata << 1) | 1'b1;
	end


	// UUT
	wire uut_tx;

	uart_comm uut (
		.comm_clk (comm_clk),
		.rx_serial (testdata[115]),
		.tx_serial (uut_tx)
	);


	// VCD Dump
	initial
	begin
		$dumpfile("uart_comm_tb.vcd");
		$dumpvars(0, uut);

		#120000 $finish;
	end


	// UART Dump
	wire dump_flag;
	wire [7:0] dump_byte;

	uart_rx uart_dump (
		.clk (comm_clk),
		.rx_serial (uut_tx),
		.tx_flag (dump_flag),
		.tx_byte (dump_byte)
	);

	always @ (posedge comm_clk)
		if (dump_flag)
			$display("[%X] ", dump_byte);

endmodule

