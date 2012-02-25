// file: clk_wiz_v3_2.v
// 
// (c) Copyright 2008 - 2011 Xilinx, Inc. All rights reserved.
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
// 
//----------------------------------------------------------------------------
// User entered comments
//----------------------------------------------------------------------------
// None
//
//----------------------------------------------------------------------------
// "Output    Output      Phase     Duty      Pk-to-Pk        Phase"
// "Clock    Freq (MHz) (degrees) Cycle (%) Jitter (ps)  Error (ps)"
//----------------------------------------------------------------------------
// CLK_OUT1___200.000______0.000_______N/A______220.000________N/A
//
//----------------------------------------------------------------------------
// "Input Clock   Freq (MHz)    Input Jitter (UI)"
//----------------------------------------------------------------------------
// __primary_________100.000_____________0.01

`timescale 1ps/1ps

// Please set INPUT_FREQUENCY to the MHz of the incoming clock!!
// WARNING: This module will currently NOT handle anything other than a 100MHz
// clock because the CLKIN_PERIOD is not properly calculated.
//
// SYNTHESIS_FREQUENCY is used to determine at what frequency the design is
// synthesized for.
//
//
// NOTE: Internally, the divider is set to half of
// INPUT_FREQUENCY. This allows a greater range of output frequencies.
// So when you look at the COMM code, you'll see that it takes the requested
// frequency and divides by 2 to get the proper multiplier.

module dynamic_clock # (
	parameter INPUT_FREQUENCY = 100,
	parameter SYNTHESIS_FREQUENCY = 200
) (
	input         CLK_IN1,
	output        CLK_OUT1,
	input         PROGCLK,
	input         PROGDATA,
	input         PROGEN,
	output        PROGDONE
);

	// Input buffering
  //------------------------------------
  /*IBUFG clkin1_buf
   (.O (clkin1),
    .I (CLK_IN1));*/


  // Clocking primitive
  //------------------------------------
  // Instantiation of the DCM primitive
  //    * Unused inputs are tied off
  wire        clkfx;

  DCM_CLKGEN
  #(.CLKFXDV_DIVIDE        (2),
    .CLKFX_DIVIDE          (INPUT_FREQUENCY >> 1),
    .CLKFX_MULTIPLY        (SYNTHESIS_FREQUENCY >> 1),
    .SPREAD_SPECTRUM       ("NONE"),
    .STARTUP_WAIT          ("FALSE"),
    .CLKIN_PERIOD          (10.0),
    .CLKFX_MD_MAX          (0.000))
   dcm_clkgen_inst
    // Input clock
   (.CLKIN                 (CLK_IN1),
    // Output clocks
    .CLKFX                 (clkfx),
    .CLKFX180              (),
    .CLKFXDV               (),
    // Ports for dynamic reconfiguration
    .PROGCLK               (PROGCLK),
    .PROGDATA              (PROGDATA),
    .PROGEN                (PROGEN),
    .PROGDONE              (PROGDONE),
    // Other control and status signals
    .FREEZEDCM             (1'b0),
    .LOCKED                (),
    .STATUS                (),
    .RST                   (1'b0));


  // Output buffering
  //-----------------------------------

  BUFG clkout1_buf
   (.O   (CLK_OUT1),
    .I   (clkfx));




endmodule
