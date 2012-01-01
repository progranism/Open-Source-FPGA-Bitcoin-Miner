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


// Provides a FIFO interface for JTAG communication.
module jtag_fifo (
	input rx_clk,
	input [11:0] rx_data,
	input wr_en, rd_en,
	output [8:0] tx_data,
	output tx_full, tx_empty
);

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

	
	reg captured_data_valid = 1'b0;
	reg [12:0] dr;


	// FIFO from TCK to rx_clk
	wire full;
	fifo_generator_v8_2 tck_to_rx_clk_blk (
		.wr_clk(jt_tck),
		.rd_clk(rx_clk),
		.din({7'd0, dr[8:0]}),
		.wr_en(jt_update & jt_sel & !full),
		.rd_en(rd_en & !tx_empty),
		.dout(tx_data),
		.full(full),
		.empty(tx_empty)
	);

	// FIFO from rx_clk to TCK
	wire [11:0] captured_data;
	wire empty;
	fifo_generator_v8_2 rx_clk_to_tck_blk (
		.wr_clk(rx_clk),
		.rd_clk(jt_tck),
		.din({4'd0, rx_data}),
		.wr_en(wr_en & !tx_full),
		.rd_en(jt_capture & ~empty & ~jt_reset),
		.dout(captured_data),
		.full(tx_full),
		.empty(empty)
	);

	assign jt_tdo = captured_data_valid ? captured_data[0] : dr[0];


	always @ (posedge jt_tck or posedge jt_reset)
	begin
		if (jt_reset == 1'b1)
		begin
			dr <= 13'd0;
		end
		else if (jt_capture == 1'b1)
		begin
			// Capture-DR
			captured_data_valid <= !empty;
			dr <= 13'd0;
		end
		else if (jt_shift == 1'b1 & captured_data_valid)
		begin
			// Shift-DR
			captured_data_valid <= 1'b0;

			dr <= {jt_tdi, 1'b1, captured_data[11:1]};
		end
		else if (jt_shift == 1'b1)
		begin
			dr <= {jt_tdi, dr[12:1]};
		end
	end

endmodule
