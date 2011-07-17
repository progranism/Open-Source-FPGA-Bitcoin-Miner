`include "async_receiver.v"
`include "async_transmitter.v"

// by teknohog, replaces virtual_wire by rs232

module serial_receive(clk, RxD, midstate, data2);
   input      clk;
   input      RxD;
   
   wire       RxD_data_ready;
   wire [7:0] RxD_data;

   async_receiver deserializer(.clk(clk), .RxD(RxD), .RxD_data_ready(RxD_data_ready), .RxD_data(RxD_data));

   output [255:0] midstate;
   output [255:0] data2;
   
   // 256 bits midstate + 256 bits data at the same time = 64 bytes

   // Might be a good idea to add some fixed start and stop sequences,
   // so we really know we got all the data and nothing more. If a
   // test for these fails, should ask for new data, so it needs more
   // logic on the return side too. The check bits could be legible
   // 7seg for quick feedback :)
   
   reg [511:0] input_buffer;
   reg [511:0] input_copy;
   reg [6:0]   demux_state = 7'b0000000;

   assign midstate = input_copy[511:256];
   assign data2 = input_copy[255:0];
   
   // we probably don't need a busy signal here, just read the latest
   // complete input that is available.
   
   always @(posedge clk)
     case (demux_state)
       7'b1000000:
	 begin
	    input_copy <= input_buffer;
	    demux_state <= 0;
	 end
       
       default:
	 if(RxD_data_ready)
	   begin
	      input_buffer <= input_buffer << 8;
	      input_buffer[7:0] <= RxD_data;
	      demux_state <= demux_state + 1;
	   end
     endcase // case (demux_state)
   
endmodule // serial_receive

module serial_transmit (clk, TxD, busy, send, word);
   
   // split 4-byte output into bytes

   wire TxD_start;
   wire TxD_busy;
   
   reg [7:0]  out_byte;
   reg        serial_start;
   reg [3:0]  mux_state = 4'b0000;

   assign TxD_start = serial_start;

   input      clk;
   output     TxD;
   
   input [31:0] word;
   input 	send;
   output 	busy;

   reg [31:0] 	word_copy;
   
   assign busy = (|mux_state);

   always @(posedge clk)
     begin
	/*
	case (mux_state)
	  4'b0000:
	    if (send)
	      begin
		 mux_state <= 4'b1000;
		 word_copy <= word;
	      end  
	  4'b1000: out_byte <= word_copy[31:24];
	  4'b1010: out_byte <= word_copy[23:16];
	  4'b1100: out_byte <= word_copy[15:8];
	  4'b1110: out_byte <= word_copy[7:0];
	  default: mux_state <= 4'b0000;
	endcase // case (mux_state)
	 */

	// Testing for busy is problematic if we are keeping the
	// module busy all the time :-/ So we need some wait stages
	// between the bytes.

	if (!busy && send)
	  begin
	     mux_state <= 4'b1000;
	     word_copy <= word;
	  end  

	else if (mux_state[3] && ~mux_state[0] && !TxD_busy)
	  begin
	     serial_start <= 1;
	     mux_state <= mux_state + 1;

	     out_byte <= word_copy[31:24];
	     word_copy <= (word_copy << 8);
	  end
	
	// wait stages
	else if (mux_state[3] && mux_state[0])
	  begin
	     serial_start <= 0;
	     if (!TxD_busy) mux_state <= mux_state + 1;
	  end
     end

   async_transmitter serializer(.clk(clk), .TxD(TxD), .TxD_start(TxD_start), .TxD_data(out_byte), .TxD_busy(TxD_busy));
endmodule // serial_send
