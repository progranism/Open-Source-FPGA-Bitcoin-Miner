module uart_comm_Test (
	input CLK_50MHZ,
	input rx_uart,
	output tx_uart
);

	// PLL
	wire hash_clk, comm_clk;
	main_pll pll (
		.inclk0 (CLK_50MHZ),
		.c0 (hash_clk),
		.c1 (comm_clk)
	);


	// Comm Module
	uart_comm comm (
		.comm_clk (comm_clk),
		.rx_serial (rx_uart),
		.tx_serial (tx_uart)
	);

endmodule

