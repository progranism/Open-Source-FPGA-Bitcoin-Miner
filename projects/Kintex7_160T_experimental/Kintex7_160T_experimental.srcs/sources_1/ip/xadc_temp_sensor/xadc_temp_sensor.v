
// file: xadc_temp_sensor.v
// (c) Copyright 2009 - 2013 Xilinx, Inc. All rights reserved.
// 
// This file contains confidential and proprietary information
// of Xilinx, Inc. and is protected under U.S. and
// international copyright and other intellectual property
// laws.
// 
// DISCLAIMER
// This disclaimer is not a license and does not grant any
// rights to the materials distributed herewith. Except as
// otherwise provided in a valid license issued to you by
// Xilinx, and to the maximum extent permitted by applicable
// law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
// WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
// AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
// BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
// INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
// (2) Xilinx shall not be liable (whether in contract or tort,
// including negligence, or under any other theory of
// liability) for any loss or damage of any kind or nature
// related to, arising under or in connection with these
// materials, including for any direct, or any indirect,
// special, incidental, or consequential loss or damage
// (including loss of data, profits, goodwill, or any type of
// loss or damage suffered as a result of any action brought
// by a third party) even if such damage or loss was
// reasonably foreseeable or Xilinx had been advised of the
// possibility of the same.
// 
// CRITICAL APPLICATIONS
// Xilinx products are not designed or intended to be fail-
// safe, or for use in any application requiring fail-safe
// performance, such as life-support or safety devices or
// systems, Class III medical devices, nuclear facilities,
// applications related to the deployment of airbags, or any
// other applications that could lead to death, personal
// injury, or severe property or environmental damage
// (individually and collectively, "Critical
// Applications"). Customer assumes the sole risk and
// liability of any use of Xilinx products in Critical
// Applications, subject only to applicable laws and
// regulations governing limitations on product liability.
// 
// THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
// PART OF THIS FILE AT ALL TIMES.
`timescale 1ns / 1 ps

(* CORE_GENERATION_INFO = "xadc_temp_sensor,xadc_wiz_v3_0,{component_name=xadc_temp_sensor,enable_axi=false,enable_axi4stream=false,dclk_frequency=100,enable_busy=true,enable_convst=false,enable_convstclk=false,enable_dclk=true,enable_drp=true,enable_eoc=true,enable_eos=true,enable_vbram_alaram=false,enable_vccddro_alaram=false,enable_Vccint_Alaram=true,enable_Vccaux_alaram=true,enable_vccpaux_alaram=false,enable_vccpint_alaram=false,ot_alaram=true,user_temp_alaram=true,timing_mode=continuous,channel_averaging=None,sequencer_mode=off,startup_channel_selection=single_channel}" *)


module xadc_temp_sensor
          (
          daddr_in,            // Address bus for the dynamic reconfiguration port
          dclk_in,             // Clock input for the dynamic reconfiguration port
          den_in,              // Enable Signal for the dynamic reconfiguration port
          di_in,               // Input data bus for the dynamic reconfiguration port
          dwe_in,              // Write Enable for the dynamic reconfiguration port
          busy_out,            // ADC Busy signal
          channel_out,         // Channel Selection Outputs
          do_out,              // Output data bus for dynamic reconfiguration port
          drdy_out,            // Data ready signal for the dynamic reconfiguration port
          eoc_out,             // End of Conversion Signal
          eos_out,             // End of Sequence Signal
          ot_out,              // Over-Temperature alarm output
          vccaux_alarm_out,    // VCCAUX-sensor alarm output
          vccint_alarm_out,    //  VCCINT-sensor alarm output
          user_temp_alarm_out, // Temperature-sensor alarm output
          alarm_out,           // OR'ed output of all the Alarms    
          vp_in,               // Dedicated Analog Input Pair
          vn_in);

          input [6:0] daddr_in;
          input dclk_in;
          input den_in;
          input [15:0] di_in;
          input dwe_in;
          input vp_in;
          input vn_in;

          output busy_out;
          output [4:0] channel_out;
          output [15:0] do_out;
          output drdy_out;
          output eoc_out;
          output eos_out;
          output ot_out;
          output vccaux_alarm_out;
          output vccint_alarm_out;
          output user_temp_alarm_out;
          output alarm_out;

          wire GND_BIT;
          assign GND_BIT = 0;
          wire [15:0] aux_channel_p;
          wire [15:0] aux_channel_n;
          wire [7:0]  alm_int;
          assign alarm_out = alm_int[7];
          assign vccaux_alarm_out = alm_int[2];
          assign vccint_alarm_out = alm_int[1];
          assign user_temp_alarm_out = alm_int[0];
          assign aux_channel_p[0] = 1'b0;
          assign aux_channel_n[0] = 1'b0;

          assign aux_channel_p[1] = 1'b0;
          assign aux_channel_n[1] = 1'b0;

          assign aux_channel_p[2] = 1'b0;
          assign aux_channel_n[2] = 1'b0;

          assign aux_channel_p[3] = 1'b0;
          assign aux_channel_n[3] = 1'b0;

          assign aux_channel_p[4] = 1'b0;
          assign aux_channel_n[4] = 1'b0;

          assign aux_channel_p[5] = 1'b0;
          assign aux_channel_n[5] = 1'b0;

          assign aux_channel_p[6] = 1'b0;
          assign aux_channel_n[6] = 1'b0;

          assign aux_channel_p[7] = 1'b0;
          assign aux_channel_n[7] = 1'b0;

          assign aux_channel_p[8] = 1'b0;
          assign aux_channel_n[8] = 1'b0;

          assign aux_channel_p[9] = 1'b0;
          assign aux_channel_n[9] = 1'b0;

          assign aux_channel_p[10] = 1'b0;
          assign aux_channel_n[10] = 1'b0;

          assign aux_channel_p[11] = 1'b0;
          assign aux_channel_n[11] = 1'b0;

          assign aux_channel_p[12] = 1'b0;
          assign aux_channel_n[12] = 1'b0;

          assign aux_channel_p[13] = 1'b0;
          assign aux_channel_n[13] = 1'b0;

          assign aux_channel_p[14] = 1'b0;
          assign aux_channel_n[14] = 1'b0;

          assign aux_channel_p[15] = 1'b0;
          assign aux_channel_n[15] = 1'b0;
XADC #(
        .INIT_40(16'h0000), // config reg 0
        .INIT_41(16'h3100), // config reg 1
        .INIT_42(16'h0400), // config reg 2
        .INIT_48(16'h0100), // Sequencer channel selection
        .INIT_49(16'h0000), // Sequencer channel selection
        .INIT_4A(16'h0000), // Sequencer Average selection
        .INIT_4B(16'h0000), // Sequencer Average selection
        .INIT_4C(16'h0000), // Sequencer Bipolar selection
        .INIT_4D(16'h0000), // Sequencer Bipolar selection
        .INIT_4E(16'h0000), // Sequencer Acq time selection
        .INIT_4F(16'h0000), // Sequencer Acq time selection
        .INIT_50(16'hB5ED), // Temp alarm trigger
        .INIT_51(16'h57E4), // Vccint upper alarm limit
        .INIT_52(16'hA147), // Vccaux upper alarm limit
        .INIT_53(16'hCA33),  // Temp alarm OT upper
        .INIT_54(16'hA93A), // Temp alarm reset
        .INIT_55(16'h52C6), // Vccint lower alarm limit
        .INIT_56(16'h9555), // Vccaux lower alarm limit
        .INIT_57(16'hAE4E),  // Temp alarm OT reset
        .INIT_58(16'h5999), // VBRAM upper alarm limit
        .INIT_5C(16'h5111),  //  VBRAM lower alarm limit
        .SIM_DEVICE("7SERIES"),
        .SIM_MONITOR_FILE("h:/Documents/Projects/opensource_fpgaminer/projects/Kintex7_160T_experimental/Kintex7_160T_experimental.srcs/sources_1/ip/xadc_temp_sensor/xadc_temp_sensor/simulation/functional/design.txt")
)

inst (
        .CONVST(GND_BIT),
        .CONVSTCLK(GND_BIT),
        .DADDR(daddr_in[6:0]),
        .DCLK(dclk_in),
        .DEN(den_in),
        .DI(di_in[15:0]),
        .DWE(dwe_in),
        .RESET(GND_BIT),
        .VAUXN(aux_channel_n[15:0]),
        .VAUXP(aux_channel_p[15:0]),
        .ALM(alm_int),
        .BUSY(busy_out),
        .CHANNEL(channel_out[4:0]),
        .DO(do_out[15:0]),
        .DRDY(drdy_out),
        .EOC(eoc_out),
        .EOS(eos_out),
        .JTAGBUSY(),
        .JTAGLOCKED(),
        .JTAGMODIFIED(),
        .OT(ot_out),
        .MUXADDR(),
        .VP(vp_in),
        .VN(vn_in)
          );

endmodule
