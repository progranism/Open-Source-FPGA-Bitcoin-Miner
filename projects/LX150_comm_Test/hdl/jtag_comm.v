/*
*
* Copyright (c) 2011-2012 fpgaminer@bitcoin-mining.com
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


// Provides a JTAG interface for reading and writing hashing data and other
// configuration options.
//
// Access is performed through the JTAG USER1 register.
//
// ----------------------------------------------------------------------------
// To Read a Register:
// First, write the following bits to USER1: C0AAAA
// Where AAAA is a 4-bit register address.
// Where C is a 1-bit checksum (1^C^A^A^A^A)
//
// Now read back 32-bits from USER1.
//
// NOTE: When reading back from USER1, you can write all 0s on JDI to cause
// a checksum fail, and thus cause no changes. However, if you'd like to read
// several registers consecutively, you may make another read request instead.
//
// ----------------------------------------------------------------------------
// To Write a Register:
// Write the following bits to USER1: C1AAAADDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD
// Where AAAA is a 4-bit register address.
// Where C is a 1-bit checksum (1^C^1^A^A^A^A^(D*))
//
// You may read back 32-bits from USER1 to double check that the value was
// correctly written.
//
// ----------------------------------------------------------------------------
// To set the Hashing Clock Frequency:
// Register 0xD lets you set the desired frequency in MHZ.
// Maximum frequency is defined by MAXIMUM_FREQUENCY.
//
//
// ----------------------------------------------------------------------------
// NOTE: Writing to 0xB will cause midstate+data to latch to the mining core.
// So, when you're writing a new job, make sure that's the last thing you
// write.
//
// NOTE: On the controller side of things, it would be best to keep track of
// a history of at least one midstate+data. When a Golden Nonce is read, it
// may belong to an older midstate+data. Simply perform a SHA256 hash on the
// controller side to see which data a Golden Nonce belongs to.
//
// NOTE: There is a 127 entry FIFO to buffer Golden Nonces.
//
// NOTE: When reading the Golden Nonce register, 0xFFFFFFFF is used to
// indicate that there is no new Golden Nonce. Because of this, if a Golden
// Nonce is actually 0xFFFFFFFF it will be ignored. This should only cause
// a loss of 1 in 2**32 Golden Nonces though, so it is not a critical problem.
//
//
// ----------------------------------------------------------------------------
// -------- Register Map --------
// 0x0:		Interface/Firmware Version
// 0x1:		midstate[31:0]
// 0x2:		midstate[63:32]
// 0x3:		midstate[95:64]
// 0x4:		midstate[127:96]
// 0x5:		midstate[159:128]
// 0x6:		midstate[191:160]
// 0x7:		midstate[223:192]
// 0x8:		midstate[255:224]
// 0x9:		data[31:0]
// 0xA:		data[63:32]
// 0xB:		data[95:64]; Writing here also causes midstate+data to latch.
// 0xC:		--
// 0xD:		Clock Configuration (speed in MHz)
// 0xE:		Golden Nonce
// 0xF:		--

// TODO: Perhaps we should calculate a checksum for returned data?
module jtag_comm # (
	parameter INPUT_FREQUENCY = 100,
	parameter MAXIMUM_FREQUENCY = 200,
	parameter INITIAL_FREQUENCY = 50
) (
	input rx_hash_clk,
	input rx_new_nonce,
	input [31:0] rx_golden_nonce,
	output reg [255:0] tx_midstate,
	output reg [95:0] tx_data,

	input rx_dcm_progclk,
	output reg tx_dcm_progdata,
	output reg tx_dcm_progen,
	input rx_dcm_progdone
);

	// Configuration data
	reg [351:0] current_job = 352'd0;
	reg [255:0] midstate = 256'd0;
	reg [95:0] data = 96'd0;
	reg [31:0] clock_config = INITIAL_FREQUENCY;

	// JTAG
	wire jt_capture, jt_drck, jt_reset, jt_sel, jt_shift, jt_tck, jt_tdi, jt_update;
	wire jt_tdo;

	BSCAN_SPARTAN6 # (.JTAG_CHAIN(1)) jtag_blk (
		.CAPTURE(jt_capture),
		.DRCK(jt_drck),
		.RESET(jt_reset),
		.RUNTEST(),
		.SEL(jt_sel),
		.SHIFT(jt_shift),
		.TCK(jt_tck),
		.TDI(jt_tdi),
		.TDO(jt_tdo),
		.TMS(),
		.UPDATE(jt_update)
	);


	reg [3:0] addr = 4'hF;
	reg fifo_data_valid = 1'b0;
	reg [37:0] dr;
	reg checksum;
	wire checksum_valid = ~checksum;

	// Golden Nonce FIFO: from rx_hash_clk to TCK
	wire [31:0] tck_golden_nonce;
	wire fifo_empty, fifo_full;
	wire fifo_we = rx_new_nonce & (rx_golden_nonce != 32'hFFFFFFFF) & ~fifo_full;
	wire fifo_rd = checksum_valid & jt_update & ~jtag_we & (jtag_addr == 4'hE) & ~fifo_empty & ~jt_reset;
	wire jtag_we = dr[36];
	wire [3:0] jtag_addr = dr[35:32];

	golden_nonce_fifo rx_clk_to_tck_blk (
		.wr_clk(rx_hash_clk),
		.rd_clk(jt_tck),
		.din(rx_golden_nonce),
		.wr_en(fifo_we),
		.rd_en(fifo_rd),
		.dout(tck_golden_nonce),
		.full(fifo_full),
		.empty(fifo_empty)
	);


	assign jt_tdo = dr[0];


	always @ (posedge jt_tck or posedge jt_reset)
	begin
		if (jt_reset == 1'b1)
		begin
			dr <= 38'd0;
		end
		else if (jt_capture == 1'b1)
		begin
			// Capture-DR
			checksum <= 1'b1;
			dr[37:32] <= 6'd0;
			addr <= 4'hF;
			fifo_data_valid <= 1'b0;

			case (addr)
				4'h0: dr[31:0] <= 32'h01000100;
				4'h1: dr[31:0] <= midstate[31:0];
				4'h2: dr[31:0] <= midstate[63:32];
				4'h3: dr[31:0] <= midstate[95:64];
				4'h4: dr[31:0] <= midstate[127:96];
				4'h5: dr[31:0] <= midstate[159:128];
				4'h6: dr[31:0] <= midstate[191:160];
				4'h7: dr[31:0] <= midstate[223:192];
				4'h8: dr[31:0] <= midstate[255:224];
				4'h9: dr[31:0] <= data[31:0];
				4'hA: dr[31:0] <= data[63:32];
				4'hB: dr[31:0] <= data[95:64];
				4'hC: dr[31:0] <= 32'h55555555;
				4'hD: dr[31:0] <= clock_config;
				4'hE: dr[31:0] <= fifo_data_valid ? tck_golden_nonce : 32'hFFFFFFFF;
				4'hF: dr[31:0] <= 32'hFFFFFFFF;
			endcase
		end
		else if (jt_shift == 1'b1)
		begin
			dr <= {jt_tdi, dr[37:1]};
			checksum <= checksum ^ jt_tdi;
		end
		else if (jt_update & checksum_valid)
		begin
			addr <= jtag_addr;
			fifo_data_valid <= fifo_rd;

			// TODO: We should min/max the clock_config register
			// here to match the hard limits and resolution.
			if (jtag_we)
			begin
				case (jtag_addr)
					4'h1: midstate[31:0] <= dr[31:0];
					4'h2: midstate[63:32] <= dr[31:0];
					4'h3: midstate[95:64] <= dr[31:0];
					4'h4: midstate[127:96] <= dr[31:0];
					4'h5: midstate[159:128] <= dr[31:0];
					4'h6: midstate[191:160] <= dr[31:0];
					4'h7: midstate[223:192] <= dr[31:0];
					4'h8: midstate[255:224] <= dr[31:0];
					4'h9: data[31:0] <= dr[31:0];
					4'hA: data[63:32] <= dr[31:0];
					4'hB: data[95:64] <= dr[31:0];
					4'hD: clock_config <= dr[31:0];
				endcase
			end

			if (jtag_we && jtag_addr == 4'hB)
				current_job <= {dr[31:0], data[63:0], midstate};
		end
	end


	// Output: Metastability Protection
	// This should be sufficient for the midstate and data signals,
	// because they rarely (relative to the clock) change and come
	// from a slower clock domain.
	reg [351:0] tx_buffer;

	always @ (posedge rx_hash_clk)
	begin
		tx_buffer <= current_job;
		{tx_data, tx_midstate} <= tx_buffer;
	end


	// DCM Frequency Synthesis Control
	// The DCM is configured with a SPI-like interface.
	// We implement a basic state machine based around a SPI cycle counter
	localparam MAXIMUM_FREQUENCY_MULTIPLIER = MAXIMUM_FREQUENCY >> 1;
	reg [7:0] dcm_multiplier = INITIAL_FREQUENCY >> 1, current_dcm_multiplier = 8'd0;
	reg [15:0] dcm_config_buf;
	reg [4:0] dcm_progstate = 5'd31;
	reg [15:0] dcm_data;
	wire [7:0] dcm_divider_s1 = (INPUT_FREQUENCY >> 1) - 8'd1;
	wire [7:0] dcm_multiplier_s1 = dcm_multiplier - 8'd1;

	always @ (posedge rx_dcm_progclk)
	begin
		// NOTE: Request frequency is divided by 2 to get the
		// multiplier (base clock is 2MHz).
		dcm_config_buf <= {clock_config[8:1], dcm_config_buf[15:8]};

		if (dcm_config_buf[7:0] > MAXIMUM_FREQUENCY_MULTIPLIER)
		       	dcm_multiplier <= MAXIMUM_FREQUENCY_MULTIPLIER;
		else if (dcm_config_buf[7:0] < 2)
			dcm_multiplier <= 8'd2;
		else
			dcm_multiplier <= dcm_config_buf[7:0];

		if (dcm_multiplier != current_dcm_multiplier && dcm_progstate == 5'd31 && rx_dcm_progdone)
		begin
			current_dcm_multiplier <= dcm_multiplier;
			dcm_progstate <= 5'd0;
			// DCM expects D-1 and M-1
			dcm_data <= {dcm_multiplier_s1, dcm_divider_s1};
		end

		if (dcm_progstate == 5'd0) {tx_dcm_progen, tx_dcm_progdata} <= 2'b11;
		if (dcm_progstate == 5'd1) {tx_dcm_progen, tx_dcm_progdata} <= 2'b10;
		if ((dcm_progstate >= 5'd2 && dcm_progstate <= 5'd9) || (dcm_progstate >= 5'd15 && dcm_progstate <= 5'd22))
		begin
			tx_dcm_progdata <= dcm_data[0];
			dcm_data <= {1'b0, dcm_data[15:1]};
		end

		if (dcm_progstate == 5'd10) {tx_dcm_progen, tx_dcm_progdata} <= 2'b00;
		if (dcm_progstate == 5'd11) {tx_dcm_progen, tx_dcm_progdata} <= 2'b00;
		if (dcm_progstate == 5'd12) {tx_dcm_progen, tx_dcm_progdata} <= 2'b00;

		if (dcm_progstate == 5'd13) {tx_dcm_progen, tx_dcm_progdata} <= 2'b11;
		if (dcm_progstate == 5'd14) {tx_dcm_progen, tx_dcm_progdata} <= 2'b11;

		if (dcm_progstate == 5'd23) {tx_dcm_progen, tx_dcm_progdata} <= 2'b00;
		if (dcm_progstate == 5'd24) {tx_dcm_progen, tx_dcm_progdata} <= 2'b00;
		if (dcm_progstate == 5'd25) {tx_dcm_progen, tx_dcm_progdata} <= 2'b10;
		if (dcm_progstate == 5'd26) {tx_dcm_progen, tx_dcm_progdata} <= 2'b00;

		if (dcm_progstate <= 5'd25) dcm_progstate <= dcm_progstate + 5'd1;

		if (dcm_progstate == 5'd26 && rx_dcm_progdone)
			dcm_progstate <= 5'd31;
	end

endmodule
