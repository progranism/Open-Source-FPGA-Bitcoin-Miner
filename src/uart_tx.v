// UART TX Module
//
// 8 data bits, 0 parity, 1 stop.
//
// * Excepts a clock which is 16x the serial data rate.
//
// NOTES:
// To send a byte, make sure tx_busy is LOW and then drive rx_we HIGH and
// rx_data to desired byte for one cycle. tx_busy will stay HIGH until byte
// has been sent.

module uart_tx (
	input clk,
	input rx_we,
	input [7:0] rx_data,
	output reg tx_busy = 1'b0,
	output reg tx_serial
);

	//
	reg [9:0] data = 10'b1_11111111_1;
	reg [3:0] counter = 4'd0;
	reg [3:0] sent = 4'd0;


	always @ (posedge clk)
	begin
		counter <= counter + 4'd1;

		if (counter == 4'd15)
			data <= {1'b1, data[9:1]};

		if (rx_we & ~tx_busy)
		begin
			sent <= 4'd0;
			tx_busy <= 1'b1;
			data <= {1'b1, rx_data, 1'b0};
			counter <= 4'd0;
		end

		if (tx_busy & (counter == 4'd14))
		begin
			sent <= sent + 4'd1;

			if (sent == 4'd9)
				tx_busy <= 1'b0;
		end

		tx_serial <= data[0];
	end

endmodule

