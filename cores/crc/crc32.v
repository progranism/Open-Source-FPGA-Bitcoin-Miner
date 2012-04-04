
// Calculates a CRC32 (Ethernet, polynomial 0x04C11DB7).
//
module CRC32 (
	input clk,
	input reset,
	input rx_we,
	input [7:0] rx_byte,
	output [31:0] tx_crc
);

	localparam [31:0] poly = 32'b0000_0100_1100_0001_0001_1101_1011_0111;

	reg [31:0] crc = 32'd0;

	wire [31:0] shifted0 = {crc[30:0], rx_byte[7]} ^ ({32{crc[31]}} & poly);
	wire [31:0] shifted1 = {shifted0[30:0], rx_byte[6]} ^ ({32{shifted0[31]}} & poly);
	wire [31:0] shifted2 = {shifted1[30:0], rx_byte[5]} ^ ({32{shifted1[31]}} & poly);
	wire [31:0] shifted3 = {shifted2[30:0], rx_byte[4]} ^ ({32{shifted2[31]}} & poly);
	wire [31:0] shifted4 = {shifted3[30:0], rx_byte[3]} ^ ({32{shifted3[31]}} & poly);
	wire [31:0] shifted5 = {shifted4[30:0], rx_byte[2]} ^ ({32{shifted4[31]}} & poly);
	wire [31:0] shifted6 = {shifted5[30:0], rx_byte[1]} ^ ({32{shifted5[31]}} & poly);
	wire [31:0] shifted7 = {shifted6[30:0], rx_byte[0]} ^ ({32{shifted6[31]}} & poly);

	assign tx_crc = crc;

	always @ (posedge clk)
	begin
		if (rx_we)
			crc <= shifted7;

		if (reset)
			crc <= 32'd0;
	end

endmodule

