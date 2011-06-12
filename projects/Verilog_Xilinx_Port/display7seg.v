module display7seg(clk, segment, anode, word);

   // by teknohog at iki 0 fi
   
   // Display a 32-bit word on the 4x 7-segment display. To display
   // legible text, use external modules/software to figure out the
   // mapping.
   
   input clk;
   output [3:0] anode;
   output [7:0] segment;

   input [31:0] word;

   // cnt is used as a prescaler
   reg [15:0] 	cnt;
   
   always @(posedge clk) cnt<=cnt+16'h1;
   wire 	cntovf = &cnt;

   // counter from 0 to 3
   reg [3:0] 	an_index;
   always @(posedge clk) if(cntovf) an_index <= (an_index==4'h3 ? 4'h0 : an_index+4'h1);

   assign anode[0] = ~(an_index == 4'h0);
   assign anode[1] = ~(an_index == 4'h1);
   assign anode[2] = ~(an_index == 4'h2);
   assign anode[3] = ~(an_index == 4'h3);

   // Procedural assignment to a non-register segment is not permitted
   reg [7:0] 	SevenSeg;
   always @(*)
     case(an_index)
       // nexys2 needs inverted signals for lighting up leds

       4'h0: SevenSeg = ~word[7:0];
       4'h1: SevenSeg = ~word[15:8];
       4'h2: SevenSeg = ~word[23:16];
       4'h3: SevenSeg = ~word[31:24];
       default: SevenSeg = 8'b11111111;
     endcase // case (an_index)

   assign segment = SevenSeg;
   
endmodule