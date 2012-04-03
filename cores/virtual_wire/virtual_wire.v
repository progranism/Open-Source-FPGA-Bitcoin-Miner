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


module virtual_wire # (
	parameter INPUT_WIDTH = 0,
	parameter OUTPUT_WIDTH = 0,
	parameter INITIAL_VALUE = " 0",
	parameter INSTANCE_ID = "NONE"
) (
	input clk,
	input [INPUT_WIDTH-1:0] rx_data,
	output [OUTPUT_WIDTH-1:0] tx_data
);

	altsource_probe	altsource_probe_component (
				.probe (rx_data),
				.source_clk (clk),
				.source (tx_data)
				// synopsys translate_off
				,
				.clrn (),
				.ena (),
				.ir_in (),
				.ir_out (),
				.jtag_state_cdr (),
				.jtag_state_cir (),
				.jtag_state_e1dr (),
				.jtag_state_sdr (),
				.jtag_state_tlr (),
				.jtag_state_udr (),
				.jtag_state_uir (),
				.raw_tck (),
				.source_ena (),
				.tdi (),
				.tdo (),
				.usr1 ()
				// synopsys translate_on
				);
	defparam
		altsource_probe_component.enable_metastability = "YES",
		altsource_probe_component.instance_id = INSTANCE_ID,
		altsource_probe_component.probe_width = INPUT_WIDTH,
		altsource_probe_component.sld_auto_instance_index = "YES",
		altsource_probe_component.sld_instance_index = 0,
		altsource_probe_component.source_initial_value = INITIAL_VALUE,
		altsource_probe_component.source_width = OUTPUT_WIDTH;

endmodule

