// UART RX Module
//
// 8 data bits, 0 parity, 1 stop.
//
// * Expects a clock which is 16x the serial data rate.
// * Oversamples at 16x the baud rate, and will synchronize to the start bit.
// * Samples in the middle of each bit.
// * Does not tolerate noise ( will reject noisy data).

// Sampling graph:
// State:   [  S  S  ]                    [  M  ]                                         [  M  ]
// Serial:  1  1  1  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  0  1  1  1  1  1  1  1  1  1  1  1  1  1
// Counter: X  0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 0  1  2  3  4  5  6  7  8  9  10 11 12 13 14
// 

module uart_rx (
	input clk,
	input rx_serial,
	output reg tx_flag = 1'b0,
	output reg [7:0] tx_byte = 8'd0
);

	//
	reg [5:0] serial = 6'b1111_11;
	reg [3:0] counter = 4'd0;
	reg [3:0] state = 4'd0;
	reg [8:0] partial_byte = 9'd0;

	// Detectors
	wire start_detect = serial[5] & serial[4] & serial[3] & ~serial[2];
	wire one_detect = serial[5] & serial[4] & serial[3];
	wire zero_detect = ~serial[5] & ~serial[4] & ~serial[3];

	//
	always @ (posedge clk)
	begin
		// Meta-stability protection and history
		serial <= {serial[4:0], rx_serial};

		// What fraction of bit time are we at
		counter <= counter + 4'd1;

		if (tx_flag)
			tx_flag <= 1'b0;

		// Finite-State-Machine
		if (state == 4'd0)
		begin
			if (start_detect)
			begin
				state <= 4'd1;
				counter <= 4'd0;
			end
		end
		else if (counter == 4'd9)
		begin
			state <= state + 4'd1;
			partial_byte <= {one_detect, partial_byte[8:1]};

			// Noise error! Reset!
			if (~one_detect & ~zero_detect)
				state <= 4'd0;
			else if ((state == 4'd1) & ~zero_detect)	// Start bit error
				state <= 4'd0;
		end
		else if (state == 4'd11)
		begin
			state <= 4'd0;
			
			// Stop bit correctly received?
			if (partial_byte[8])
			begin
				tx_flag <= 1'b1;
				tx_byte <= partial_byte[7:0];
			end
		end
	end

endmodule

