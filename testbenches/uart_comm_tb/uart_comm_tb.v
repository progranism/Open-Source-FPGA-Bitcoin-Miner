`timescale 1ns/1ps

// Works with Icarus Verilog
module uart_comm_tb;

	// Clocks
	reg comm_clk = 0;
	reg hash_clk = 0;

	initial while(1) begin
		#5 comm_clk = ~comm_clk;
	end

	initial while(1) #1 hash_clk = ~hash_clk;

	//
	reg test_passed = 0;


	// UUT
	reg uut_rx = 1'b1;
	reg uut_need_work = 1'b0;
	reg uut_new_nonce = 1'b0;
	reg [31:0] uut_golden_nonce = 32'd0;

	wire uut_tx;
	wire uut_new_work;
	wire [255:0] uut_midstate;
	wire [95:0] uut_data;
	wire [31:0] uut_noncemin, uut_noncemax;

	uart_comm uut (
		.hash_clk (hash_clk),
		.rx_need_work (uut_need_work),
		.rx_new_nonce (uut_new_nonce),
		.rx_golden_nonce (uut_golden_nonce),
		.tx_new_work (uut_new_work),
		.tx_midstate (uut_midstate),
		.tx_data (uut_data),
		.tx_noncemin (uut_noncemin),
		.tx_noncemax (uut_noncemax),

		.comm_clk (comm_clk),
		.rx_serial (uut_rx),
		.tx_serial (uut_tx)
	);


	// Test Input Data
	initial
	begin
		#100;

		uart_gap;

		// PING
		uart_send_byte (8'h00);
		uart_gap;

		// GET_INFO
		uart_send_byte (8'h08);
		uart_send_byte (8'h00);
		uart_send_byte (8'h00);
		uart_send_byte (8'h00);
		uart_send_byte (8'hf9);
		uart_send_byte (8'hea);
		uart_send_byte (8'h98);
		uart_send_byte (8'h0a);
		uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap;
		uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap;

		// Bad length
		uart_send_byte (8'h6);
		uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap;

		// Bad CRC
		uart_send_byte (8'h08);
		uart_send_byte (8'h01);
		uart_send_byte (8'h00);
		uart_send_byte (8'h00);
		uart_send_byte (8'b11111001);
		uart_send_byte (8'b11101010);
		uart_send_byte (8'b10011000);
		uart_send_byte (8'b00001010);
		uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap;

		// QUEUE_JOB
		uart_send_byte (8'd60);
		uart_send_byte (8'h00);
		uart_send_byte (8'h00);
		uart_send_byte (8'h05);
		uart_send_word (32'h00000000);
		uart_send_word (32'hFFFFFFFF);
		uart_send_word (32'h0b0a0908);
		uart_send_word (32'h0f0e0d0c);
		uart_send_word (32'h13121110);
		uart_send_word (32'h17161514);
		uart_send_word (32'h1b1a1918);
		uart_send_word (32'h1f1e1d1c);
		uart_send_word (32'h23222120);
		uart_send_word (32'h27262524);
		uart_send_word (32'h2b2a2928);
		uart_send_word (32'h2f2e2d2c);
		uart_send_word (32'h33323130);
		uart_send_word (32'h38b9b05a);
		uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap;

		// PUSH_JOB
		uart_send_byte (8'd60);
		uart_send_byte (8'h00);
		uart_send_byte (8'h00);
		uart_send_byte (8'h04);
		uart_send_word (32'h00000000);
		uart_send_word (32'h1FFFFFFF);
		uart_send_word (32'h0b0a0908);
		uart_send_word (32'h0f0e0d0c);
		uart_send_word (32'h13121110);
		uart_send_word (32'h17161514);
		uart_send_word (32'h1b1a1918);
		uart_send_word (32'h1f1e1d1c);
		uart_send_word (32'h23222120);
		uart_send_word (32'h27262524);
		uart_send_word (32'h2b2a2928);
		uart_send_word (32'h2f2e2d2c);
		uart_send_word (32'h33323130);
		uart_send_word (32'h98c3a458);
		uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap; uart_gap;

		#3000;
		if (test_passed)
			$display ("\n*** TEST PASSED ***\n");
		else
			$display ("TEST FAILED: Not enough output data.\n");
		$finish;
	end


	// Test Output Data
	reg tmp;

	initial
	begin
		#100;

		// PONG
		$display ("\nExpecting PONG...");
		uart_expect_byte (8'h01);
		$display ("PASSED: PONG\n");

		// INFO
		$display ("Expecting INFO...");
		uart_expect_byte (8'd16);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'h13);
		uart_expect_byte (8'h0D);
		uart_expect_byte (8'h37);
		uart_expect_byte (8'h13);
		uart_expect_byte (8'hEF);
		uart_expect_byte (8'hBE);
		uart_expect_byte (8'hAD);
		uart_expect_byte (8'hDE);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd00);
		$display ("PASSED: INFO\n");

		// INVALID
		$display ("Expecting INVALID...");
		uart_expect_byte (8'd08);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd01);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd00);
		$display ("PASSED: INVALID\n");

		// RESEND
		$display ("Expecting RESEND...");
		uart_expect_byte (8'd08);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd03);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd00);
		$display ("PASSED: RESEND\n");

		// ACK
		$display ("Expecting ACK...");
		uart_expect_byte (8'd08);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd02);
		uart_recv_byte (tmp);
		uart_recv_byte (tmp);
		uart_recv_byte (tmp);
		uart_recv_byte (tmp);
		$display ("PASSED: ACK\n");

		// ACK
		$display ("Expecting ACK...");
		uart_expect_byte (8'd08);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd00);
		uart_expect_byte (8'd02);
		uart_recv_byte (tmp);
		uart_recv_byte (tmp);
		uart_recv_byte (tmp);
		uart_recv_byte (tmp);
		$display ("PASSED: ACK\n");

		// Check job
		if (uut_noncemin != 32'h1FFFFFFF || uut_noncemax != 32'h00000000 || uut_data != 96'h131211100f0e0d0c0b0a0908 || uut_midstate != 256'h333231302f2e2d2c2b2a292827262524232221201f1e1d1c1b1a191817161514)
		begin
			$display ("TEST FAILED: Incorrect job:\n");
			$display ("noncemin: %4X\nnoncemax: %4X\ndata: %24X\nmidstate: %64X\n", uut_noncemin, uut_noncemax, uut_data, uut_midstate);
			$finish;
		end

		test_passed = 1;
	end


	// VCD Dump
	initial
	begin
		$dumpfile("uart_comm_tb.vcd");
		$dumpvars(0, uut);
	end


	// Tasks
	task uart_gap;
	begin
		#1600;
	end
	endtask

	task uart_send_byte;
	input [7:0] byte;
	begin
		uut_rx = 0; #160;
		uut_rx = byte[0]; #160;
		uut_rx = byte[1]; #160;
		uut_rx = byte[2]; #160;
		uut_rx = byte[3]; #160;
		uut_rx = byte[4]; #160;
		uut_rx = byte[5]; #160;
		uut_rx = byte[6]; #160;
		uut_rx = byte[7]; #160;
		uut_rx = 1; #160;
		// Add some timing variance
		while (($random & 3) != 0) #10;
	end
	endtask

	task uart_send_word;
	input [31:0] word;
	begin
		uart_send_byte (word[7:0]);
		uart_send_byte (word[15:8]);
		uart_send_byte (word[23:16]);
		uart_send_byte (word[31:24]);
	end
	endtask

	task uart_recv_byte;
	output [7:0] byte;
	begin
		@ (negedge uut_tx);
		#80;
		if (uut_tx)
		begin
			$display ("TEST FAILED: Floating start bit on uut_tx.\n");
			$finish;
		end
		#160 byte[0] = uut_tx;
		#160 byte[1] = uut_tx;
		#160 byte[2] = uut_tx;
		#160 byte[3] = uut_tx;
		#160 byte[4] = uut_tx;
		#160 byte[5] = uut_tx;
		#160 byte[6] = uut_tx;
		#160 byte[7] = uut_tx;
		#160;
		if (~uut_tx)
		begin
			$display ("TEST FAILED: Floating stop bit on uut_tx.\n");
			$finish;
		end
	end
	endtask

	task uart_expect_byte;
	input [7:0] byte;
	reg [7:0] tmp;
	begin
		uart_recv_byte (tmp);

		if (tmp != byte)
		begin
			$display ("TEST FAILED: Expected 0x%02X got 0x%02X.", byte, tmp);
			$finish;
		end
	end
	endtask

endmodule

