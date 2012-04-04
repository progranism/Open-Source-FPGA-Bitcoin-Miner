
// Calculates a CRC32 (Ethernet, polynomial 0x04C11DB7).
//
module CRC32 (
	input clk,
	input reset,
	input rx_we,
	input [7:0] rx_byte,
	output reg [31:0] tx_crc = 32'd0
);

	localparam [31:0] poly = 32'b0000_0100_1100_0001_0001_1101_1011_0111;

	wire [31:0] crc = reset ? 32'd0 : tx_crc;
	wire [7:0] byte = rx_we ? rx_byte : 8'd0;

	wire [31:0] shifted0 = {crc[30:0], byte[7]} ^ ({32{crc[31]}} & poly);
	wire [31:0] shifted1 = {shifted0[30:0], byte[6]} ^ ({32{shifted0[31]}} & poly);
	wire [31:0] shifted2 = {shifted1[30:0], byte[5]} ^ ({32{shifted1[31]}} & poly);
	wire [31:0] shifted3 = {shifted2[30:0], byte[4]} ^ ({32{shifted2[31]}} & poly);
	wire [31:0] shifted4 = {shifted3[30:0], byte[3]} ^ ({32{shifted3[31]}} & poly);
	wire [31:0] shifted5 = {shifted4[30:0], byte[2]} ^ ({32{shifted4[31]}} & poly);
	wire [31:0] shifted6 = {shifted5[30:0], byte[1]} ^ ({32{shifted5[31]}} & poly);
	wire [31:0] shifted7 = {shifted6[30:0], byte[0]} ^ ({32{shifted6[31]}} & poly);

	always @ (posedge clk)
	begin
		if (rx_we | reset)
			tx_crc <= shifted7;
	end

endmodule

