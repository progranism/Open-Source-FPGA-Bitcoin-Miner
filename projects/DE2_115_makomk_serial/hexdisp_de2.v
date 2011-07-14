module hexdisp(inword, outword);

   // by teknohog 0 iki 8 fi

   // Converts numbers into legible hexadecimals for a 7-segment display.

   // The DE2-115 has 8 digits with no decimal points connected, so
   // only 7 wires per digit. Treated as a single 56-bit word.

   // Strangely, all these 56 LEDs are wired directly into the
   // FPGA. The guys at Terasic must have had a great time routing all
   // those wires. Maybe someone should tell them about this new thing
   // called multiplexing, so we could get more general I/O pins, and
   // maybe even decimal points :-/

   // There is also the ergonomic point that these LEDs are much
   // brighter than multiplexed ones. Of course, one could add some
   // PWM here...
   
   // Size of 7-seg display to use, also determines the input word
   // size which must be 4 times this. No need to be a power of 2.
   parameter HEX_DIGITS = 8;
   parameter SEGS_PER_DIGIT = 7;
   
   input [(HEX_DIGITS * 4 - 1):0] inword;

   output [(HEX_DIGITS * SEGS_PER_DIGIT - 1):0] outword;

   generate
      genvar 			   i;
      for (i = 0; i < HEX_DIGITS; i = i + 1)
	begin: for_digits
	   hexdigit7seg H(.nibble(inword[(4*i + 3):(4*i)]), .sseg(outword[(SEGS_PER_DIGIT*i + SEGS_PER_DIGIT - 1):(SEGS_PER_DIGIT*i)]));
	end
   endgenerate
   
endmodule // hex27seg

module hexdigit7seg(nibble, sseg);

   input [3:0] nibble;
   output [6:0] sseg;

   reg [6:0] 	segment;

   // DE2-115 needs inverted signals
   assign sseg = ~segment;
   
   always @(*)
     case(nibble)
       4'b0000: segment <= 7'b1111110;
       4'b0001: segment <= 7'b0110000;
       4'b0010: segment <= 7'b1101101;
       4'b0011: segment <= 7'b1111001;
       4'b0100: segment <= 7'b0110011;
       4'b0101: segment <= 7'b1011011;
       4'b0110: segment <= 7'b1011111;
       4'b0111: segment <= 7'b1110000;
       4'b1000: segment <= 7'b1111111;
       4'b1001: segment <= 7'b1111011;
       4'b1010: segment <= 7'b1110111;
       4'b1011: segment <= 7'b0011111;
       4'b1100: segment <= 7'b1001110;
       4'b1101: segment <= 7'b0111101;
       4'b1110: segment <= 7'b1001111;
       4'b1111: segment <= 7'b1000111;
     endcase

endmodule