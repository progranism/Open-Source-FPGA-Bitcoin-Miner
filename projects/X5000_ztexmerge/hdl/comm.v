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


module comm (
	input hash_clk,
	input rx_new_nonce,
	input [31:0] rx_golden_nonce,
	output [255:0] tx_midstate,
	output [95:0] tx_data
);
	
	reg [351:0] jtag_data_shift = 352'd0;
	reg [255:0] midstate = 256'd0;
	reg [95:0] data = 96'd0;

	assign tx_midstate = midstate;
	assign tx_data = data;


	reg [31:0] golden_out = 32'd0;
	reg [3:0] golden_count = 3'd0;
	reg read = 1'b0;
	wire [8:0] jtag_data;
	wire full, empty;
	reg [5:0] jtag_data_count = 6'd0;

	wire golden_writing = golden_count[0];

	jtag_fifo jtag_fifo_blk (
		.rx_clk (hash_clk),
		.rx_data ({golden_count, golden_out[7:0]}),
		.wr_en (golden_writing & ~full),
		.rd_en (read),
		.tx_data (jtag_data),
		.tx_full (full),
		.tx_empty (empty)
	);


	always @ (posedge hash_clk)
	begin
		// Writing to JTAG
		if (!golden_writing & rx_new_nonce)
		begin
			golden_out <= rx_golden_nonce;
			golden_count <= 4'b1111;
		end
		else if (golden_writing & !full)
		begin
			golden_out <= golden_out >> 8;
			golden_count <= {1'b0, golden_count[3:1]};
		end

		// Reading from JTAG
		if (!empty & !read)
			read <= 1'b1;

		if (read)
		begin
			read <= 1'b0;

			jtag_data_shift <= {jtag_data_shift[343:0], jtag_data[7:0]};

			if (jtag_data[8] == 1'b0)
				jtag_data_count <= 6'd1;
			else if (jtag_data_count == 6'd43)
			begin
				jtag_data_count <= 6'd0;
				{midstate, data} <= {jtag_data_shift[343:0], jtag_data[7:0]};
			end
			else
				jtag_data_count <= jtag_data_count + 6'd1;
		end
	end

endmodule

