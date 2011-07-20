////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2011 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: O.40d
//  \   \         Application: netgen
//  /   /         Filename: chipscope_vio_fromchip.v
// /___/   /\     Timestamp: Thu May 19 17:39:18 2011
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -w -sim -ofmt verilog D:/Documents/Projects/xilinx_fpgaminer/ipcore_dir/tmp/_cg/chipscope_vio_fromchip.ngc D:/Documents/Projects/xilinx_fpgaminer/ipcore_dir/tmp/_cg/chipscope_vio_fromchip.v 
// Device	: xc6slx150t-fgg676-3
// Input file	: D:/Documents/Projects/xilinx_fpgaminer/ipcore_dir/tmp/_cg/chipscope_vio_fromchip.ngc
// Output file	: D:/Documents/Projects/xilinx_fpgaminer/ipcore_dir/tmp/_cg/chipscope_vio_fromchip.v
// # of Modules	: 1
// Design Name	: chipscope_vio_fromchip
// Xilinx        : F:\Xilinx\13.1\ISE_DS\ISE\
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module chipscope_vio_fromchip (
  CLK, SYNC_IN, CONTROL
)/* synthesis syn_black_box syn_noprune=1 */;
  input CLK;
  input [31 : 0] SYNC_IN;
  inout [35 : 0] CONTROL;
  
  // synthesis translate_off
  
  wire N0;
  wire N1;
  wire \U0/I_VIO/DATA_DOUT ;
  wire \U0/I_VIO/RESET ;
  wire \U0/I_VIO/STAT_DOUT ;
  wire \U0/I_VIO/U_STATUS/TDO_next ;
  wire \U0/I_VIO/U_STATUS/CFG_CE_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/falling_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/async_mux_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/async_mux_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/mux1_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/rising_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/user_in_n ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_f_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/falling ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_r_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/rising ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/clocked ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/fd5_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/fd4_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/fd3_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/fd2_out ;
  wire \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/fd1_out ;
  wire \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O2 ;
  wire \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O21_854 ;
  wire \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O22_855 ;
  wire \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O23_856 ;
  wire \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O24_857 ;
  wire \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O25_858 ;
  wire \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O26_859 ;
  wire \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O27_860 ;
  wire \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O28_861 ;
  wire [1 : 0] \U0/I_VIO/reset_f_edge/iDOUT ;
  wire [32 : 1] \U0/I_VIO/INPUT_SHIFT ;
  wire [7 : 0] \U0/I_VIO/U_STATUS/iSTAT ;
  wire [7 : 0] \U0/I_VIO/U_STATUS/iSTAT_CNT ;
  wire [7 : 0] \U0/I_VIO/U_STATUS/U_STAT_CNT/D ;
  wire [7 : 1] \U0/I_VIO/U_STATUS/U_STAT_CNT/CI ;
  wire [7 : 0] \U0/I_VIO/U_STATUS/U_STAT_CNT/S ;
  VCC   XST_VCC (
    .P(N0)
  );
  GND   XST_GND (
    .G(N1)
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/U_DOUT  (
    .I0(\U0/I_VIO/STAT_DOUT ),
    .I1(\U0/I_VIO/DATA_DOUT ),
    .I2(CONTROL[7]),
    .O(CONTROL[3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/reset_f_edge/U_DOUT0  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(CONTROL[7]),
    .Q(\U0/I_VIO/reset_f_edge/iDOUT [0])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/reset_f_edge/U_DOUT1  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/reset_f_edge/iDOUT [0]),
    .Q(\U0/I_VIO/reset_f_edge/iDOUT [1])
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/reset_f_edge/I_H2L.U_DOUT  (
    .C(CONTROL[0]),
    .D(\U0/I_VIO/reset_f_edge/iDOUT [1]),
    .R(\U0/I_VIO/reset_f_edge/iDOUT [0]),
    .Q(\U0/I_VIO/RESET )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/U_DATA_OUT  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/INPUT_SHIFT [32]),
    .Q(\U0/I_VIO/DATA_DOUT )
  );
  LUT4 #(
    .INIT ( 16'h0101 ))
  \U0/I_VIO/U_STATUS/F_STAT[0].I_STAT.U_STAT  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [0]),
    .I1(\U0/I_VIO/U_STATUS/iSTAT_CNT [1]),
    .I2(\U0/I_VIO/U_STATUS/iSTAT_CNT [2]),
    .I3(\U0/I_VIO/U_STATUS/iSTAT_CNT [3]),
    .O(\U0/I_VIO/U_STATUS/iSTAT [0])
  );
  LUT4 #(
    .INIT ( 16'hD109 ))
  \U0/I_VIO/U_STATUS/F_STAT[1].I_STAT.U_STAT  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [0]),
    .I1(\U0/I_VIO/U_STATUS/iSTAT_CNT [1]),
    .I2(\U0/I_VIO/U_STATUS/iSTAT_CNT [2]),
    .I3(\U0/I_VIO/U_STATUS/iSTAT_CNT [3]),
    .O(\U0/I_VIO/U_STATUS/iSTAT [1])
  );
  LUT4 #(
    .INIT ( 16'h2100 ))
  \U0/I_VIO/U_STATUS/F_STAT[2].I_STAT.U_STAT  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [0]),
    .I1(\U0/I_VIO/U_STATUS/iSTAT_CNT [1]),
    .I2(\U0/I_VIO/U_STATUS/iSTAT_CNT [2]),
    .I3(\U0/I_VIO/U_STATUS/iSTAT_CNT [3]),
    .O(\U0/I_VIO/U_STATUS/iSTAT [2])
  );
  LUT4 #(
    .INIT ( 16'h0610 ))
  \U0/I_VIO/U_STATUS/F_STAT[3].I_STAT.U_STAT  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [0]),
    .I1(\U0/I_VIO/U_STATUS/iSTAT_CNT [1]),
    .I2(\U0/I_VIO/U_STATUS/iSTAT_CNT [2]),
    .I3(\U0/I_VIO/U_STATUS/iSTAT_CNT [3]),
    .O(\U0/I_VIO/U_STATUS/iSTAT [3])
  );
  LUT4 #(
    .INIT ( 16'h0000 ))
  \U0/I_VIO/U_STATUS/F_STAT[4].I_STAT.U_STAT  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [0]),
    .I1(\U0/I_VIO/U_STATUS/iSTAT_CNT [1]),
    .I2(\U0/I_VIO/U_STATUS/iSTAT_CNT [2]),
    .I3(\U0/I_VIO/U_STATUS/iSTAT_CNT [3]),
    .O(\U0/I_VIO/U_STATUS/iSTAT [4])
  );
  LUT4 #(
    .INIT ( 16'h0002 ))
  \U0/I_VIO/U_STATUS/F_STAT[5].I_STAT.U_STAT  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [0]),
    .I1(\U0/I_VIO/U_STATUS/iSTAT_CNT [1]),
    .I2(\U0/I_VIO/U_STATUS/iSTAT_CNT [2]),
    .I3(\U0/I_VIO/U_STATUS/iSTAT_CNT [3]),
    .O(\U0/I_VIO/U_STATUS/iSTAT [5])
  );
  LUT4 #(
    .INIT ( 16'h0000 ))
  \U0/I_VIO/U_STATUS/F_STAT[6].I_STAT.U_STAT  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [0]),
    .I1(\U0/I_VIO/U_STATUS/iSTAT_CNT [1]),
    .I2(\U0/I_VIO/U_STATUS/iSTAT_CNT [2]),
    .I3(\U0/I_VIO/U_STATUS/iSTAT_CNT [3]),
    .O(\U0/I_VIO/U_STATUS/iSTAT [6])
  );
  LUT4 #(
    .INIT ( 16'h0000 ))
  \U0/I_VIO/U_STATUS/F_STAT[7].I_STAT.U_STAT  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [0]),
    .I1(\U0/I_VIO/U_STATUS/iSTAT_CNT [1]),
    .I2(\U0/I_VIO/U_STATUS/iSTAT_CNT [2]),
    .I3(\U0/I_VIO/U_STATUS/iSTAT_CNT [3]),
    .O(\U0/I_VIO/U_STATUS/iSTAT [7])
  );
  INV   \U0/I_VIO/U_STATUS/U_CE_n  (
    .I(CONTROL[4]),
    .O(\U0/I_VIO/U_STATUS/CFG_CE_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/U_STATUS/U_TDO  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/U_STATUS/TDO_next ),
    .Q(\U0/I_VIO/STAT_DOUT )
  );
  XORCY   \U0/I_VIO/U_STATUS/U_STAT_CNT/G[0].U_XORCY  (
    .CI(N0),
    .LI(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [0]),
    .O(\U0/I_VIO/U_STATUS/U_STAT_CNT/D [0])
  );
  MUXCY_L   \U0/I_VIO/U_STATUS/U_STAT_CNT/G[0].GnH.U_MUXCY  (
    .CI(N0),
    .DI(N1),
    .S(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [0]),
    .LO(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [1])
  );
  XORCY   \U0/I_VIO/U_STATUS/U_STAT_CNT/G[1].U_XORCY  (
    .CI(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [1]),
    .LI(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [1]),
    .O(\U0/I_VIO/U_STATUS/U_STAT_CNT/D [1])
  );
  MUXCY_L   \U0/I_VIO/U_STATUS/U_STAT_CNT/G[1].GnH.U_MUXCY  (
    .CI(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [1]),
    .DI(N1),
    .S(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [1]),
    .LO(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [2])
  );
  XORCY   \U0/I_VIO/U_STATUS/U_STAT_CNT/G[2].U_XORCY  (
    .CI(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [2]),
    .LI(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [2]),
    .O(\U0/I_VIO/U_STATUS/U_STAT_CNT/D [2])
  );
  MUXCY_L   \U0/I_VIO/U_STATUS/U_STAT_CNT/G[2].GnH.U_MUXCY  (
    .CI(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [2]),
    .DI(N1),
    .S(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [2]),
    .LO(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [3])
  );
  XORCY   \U0/I_VIO/U_STATUS/U_STAT_CNT/G[3].U_XORCY  (
    .CI(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [3]),
    .LI(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [3]),
    .O(\U0/I_VIO/U_STATUS/U_STAT_CNT/D [3])
  );
  MUXCY_L   \U0/I_VIO/U_STATUS/U_STAT_CNT/G[3].GnH.U_MUXCY  (
    .CI(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [3]),
    .DI(N1),
    .S(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [3]),
    .LO(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [4])
  );
  XORCY   \U0/I_VIO/U_STATUS/U_STAT_CNT/G[4].U_XORCY  (
    .CI(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [4]),
    .LI(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [4]),
    .O(\U0/I_VIO/U_STATUS/U_STAT_CNT/D [4])
  );
  MUXCY_L   \U0/I_VIO/U_STATUS/U_STAT_CNT/G[4].GnH.U_MUXCY  (
    .CI(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [4]),
    .DI(N1),
    .S(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [4]),
    .LO(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [5])
  );
  XORCY   \U0/I_VIO/U_STATUS/U_STAT_CNT/G[5].U_XORCY  (
    .CI(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [5]),
    .LI(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [5]),
    .O(\U0/I_VIO/U_STATUS/U_STAT_CNT/D [5])
  );
  MUXCY_L   \U0/I_VIO/U_STATUS/U_STAT_CNT/G[5].GnH.U_MUXCY  (
    .CI(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [5]),
    .DI(N1),
    .S(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [5]),
    .LO(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [6])
  );
  XORCY   \U0/I_VIO/U_STATUS/U_STAT_CNT/G[6].U_XORCY  (
    .CI(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [6]),
    .LI(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [6]),
    .O(\U0/I_VIO/U_STATUS/U_STAT_CNT/D [6])
  );
  MUXCY_L   \U0/I_VIO/U_STATUS/U_STAT_CNT/G[6].GnH.U_MUXCY  (
    .CI(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [6]),
    .DI(N1),
    .S(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [6]),
    .LO(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [7])
  );
  XORCY   \U0/I_VIO/U_STATUS/U_STAT_CNT/G[7].U_XORCY  (
    .CI(\U0/I_VIO/U_STATUS/U_STAT_CNT/CI [7]),
    .LI(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [7]),
    .O(\U0/I_VIO/U_STATUS/U_STAT_CNT/D [7])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/I_VIO/U_STATUS/U_STAT_CNT/G[0].U_LUT  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [0]),
    .O(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [0])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/I_VIO/U_STATUS/U_STAT_CNT/G[1].U_LUT  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [1]),
    .O(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [1])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/I_VIO/U_STATUS/U_STAT_CNT/G[2].U_LUT  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [2]),
    .O(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [2])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/I_VIO/U_STATUS/U_STAT_CNT/G[3].U_LUT  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [3]),
    .O(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [3])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/I_VIO/U_STATUS/U_STAT_CNT/G[4].U_LUT  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [4]),
    .O(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [4])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/I_VIO/U_STATUS/U_STAT_CNT/G[5].U_LUT  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [5]),
    .O(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [5])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/I_VIO/U_STATUS/U_STAT_CNT/G[6].U_LUT  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [6]),
    .O(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [6])
  );
  LUT1 #(
    .INIT ( 2'h2 ))
  \U0/I_VIO/U_STATUS/U_STAT_CNT/G[7].U_LUT  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [7]),
    .O(\U0/I_VIO/U_STATUS/U_STAT_CNT/S [7])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/U_STATUS/U_STAT_CNT/G[0].U_FDRE  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/U_STATUS/U_STAT_CNT/D [0]),
    .R(\U0/I_VIO/U_STATUS/CFG_CE_n ),
    .Q(\U0/I_VIO/U_STATUS/iSTAT_CNT [0])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/U_STATUS/U_STAT_CNT/G[1].U_FDRE  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/U_STATUS/U_STAT_CNT/D [1]),
    .R(\U0/I_VIO/U_STATUS/CFG_CE_n ),
    .Q(\U0/I_VIO/U_STATUS/iSTAT_CNT [1])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/U_STATUS/U_STAT_CNT/G[2].U_FDRE  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/U_STATUS/U_STAT_CNT/D [2]),
    .R(\U0/I_VIO/U_STATUS/CFG_CE_n ),
    .Q(\U0/I_VIO/U_STATUS/iSTAT_CNT [2])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/U_STATUS/U_STAT_CNT/G[3].U_FDRE  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/U_STATUS/U_STAT_CNT/D [3]),
    .R(\U0/I_VIO/U_STATUS/CFG_CE_n ),
    .Q(\U0/I_VIO/U_STATUS/iSTAT_CNT [3])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/U_STATUS/U_STAT_CNT/G[4].U_FDRE  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/U_STATUS/U_STAT_CNT/D [4]),
    .R(\U0/I_VIO/U_STATUS/CFG_CE_n ),
    .Q(\U0/I_VIO/U_STATUS/iSTAT_CNT [4])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/U_STATUS/U_STAT_CNT/G[5].U_FDRE  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/U_STATUS/U_STAT_CNT/D [5]),
    .R(\U0/I_VIO/U_STATUS/CFG_CE_n ),
    .Q(\U0/I_VIO/U_STATUS/iSTAT_CNT [5])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/U_STATUS/U_STAT_CNT/G[6].U_FDRE  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/U_STATUS/U_STAT_CNT/D [6]),
    .R(\U0/I_VIO/U_STATUS/CFG_CE_n ),
    .Q(\U0/I_VIO/U_STATUS/iSTAT_CNT [6])
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/U_STATUS/U_STAT_CNT/G[7].U_FDRE  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/U_STATUS/U_STAT_CNT/D [7]),
    .R(\U0/I_VIO/U_STATUS/CFG_CE_n ),
    .Q(\U0/I_VIO/U_STATUS/iSTAT_CNT [7])
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [31]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[31]),
    .O(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[31]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[31]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[31]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [32])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [30]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[30]),
    .O(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[30]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[30]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[30]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [31])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [29]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[29]),
    .O(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[29]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[29]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[29]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [30])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [28]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[28]),
    .O(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[28]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[28]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[28]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [29])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [27]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[27]),
    .O(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[27]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[27]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[27]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [28])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [26]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[26]),
    .O(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[26]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[26]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[26]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [27])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [25]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[25]),
    .O(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[25]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[25]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[25]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [26])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [24]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[24]),
    .O(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[24]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[24]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[24]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [25])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [23]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[23]),
    .O(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[23]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[23]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[23]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [24])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [22]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[22]),
    .O(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[22]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[22]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[22]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [23])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [21]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[21]),
    .O(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[21]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[21]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[21]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [22])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [20]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[20]),
    .O(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[20]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[20]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[20]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [21])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [19]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[19]),
    .O(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[19]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[19]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[19]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [20])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [18]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[18]),
    .O(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[18]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[18]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[18]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [19])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [17]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[17]),
    .O(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[17]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[17]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[17]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [18])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [16]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[16]),
    .O(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[16]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[16]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[16]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [17])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [15]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[15]),
    .O(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[15]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[15]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[15]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [16])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [14]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[14]),
    .O(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[14]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[14]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[14]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [15])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [13]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[13]),
    .O(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[13]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[13]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[13]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [14])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [12]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[12]),
    .O(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[12]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[12]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[12]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [13])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [11]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[11]),
    .O(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[11]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[11]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[11]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [12])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [10]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[10]),
    .O(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[10]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[10]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[10]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [11])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [9]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[9]),
    .O(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[9]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[9]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[9]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [10])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [8]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[8]),
    .O(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[8]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[8]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[8]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [9])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [7]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[7]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[7]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[7]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [8])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [6]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[6]),
    .O(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[6]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[6]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[6]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [7])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [5]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[5]),
    .O(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[5]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[5]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[5]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [6])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [4]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[4]),
    .O(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[4]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[4]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[4]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [5])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [3]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[3]),
    .O(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[3]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[3]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[3]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [4])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [2]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[2]),
    .O(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[2]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[2]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[2]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [3])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/clocked ),
    .I1(\U0/I_VIO/INPUT_SHIFT [1]),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[1]),
    .O(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[1]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[1]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[1]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [2])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/fd1_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/SYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_f_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/fd4_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/SYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_r_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/fd3_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/ASYNC_F_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/falling_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/fd2_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/async_mux_f_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/ASYNC_R_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/rising_out ),
    .I1(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/fd1_out ),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/async_mux_r_out )
  );
  LUT3 #(
    .INIT ( 8'hCA ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/USER_MUX  (
    .I0(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/clocked ),
    .I1(N1),
    .I2(CONTROL[7]),
    .O(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/mux1_out )
  );
  INV   \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/U_STATCMD_n  (
    .I(SYNC_IN[0]),
    .O(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/user_in_n )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_f_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[0]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_f_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_f_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_f_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_f_edge/I_H2L.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_f_edge/iDOUT<1> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_f_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/falling )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_r_edge/U_DOUT0  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[0]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_r_edge/iDOUT<0> )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_r_edge/U_DOUT1  (
    .C(CLK),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_r_edge/iDOUT<1> )
  );
  FDR #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_r_edge/I_L2H.U_DOUT  (
    .C(CLK),
    .D(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_r_edge/iDOUT<0> ),
    .R(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_r_edge/iDOUT<1> ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/rising )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/U_SYNC_F  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/falling ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_f_out )
  );
  FDRE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/U_SYNC_R  (
    .C(CLK),
    .CE(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/rising ),
    .D(N0),
    .R(\U0/I_VIO/RESET ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_r_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/USER_CLK_REG  (
    .C(CLK),
    .CE(N0),
    .D(SYNC_IN[0]),
    .Q(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/clocked )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/SHIFT_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/fd5_out ),
    .Q(\U0/I_VIO/INPUT_SHIFT [1])
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/S_SYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/fd5_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/S_SYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/sync_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/fd4_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/S_ASYNC_F_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/async_mux_f_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/fd3_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/S_ASYNC_R_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/async_mux_r_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/fd2_out )
  );
  FDE #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/USER_REG  (
    .C(CONTROL[0]),
    .CE(N0),
    .D(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/mux1_out ),
    .Q(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/fd1_out )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O21  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [5]),
    .I1(\U0/I_VIO/U_STATUS/iSTAT_CNT [6]),
    .I2(\U0/I_VIO/U_STATUS/iSTAT [3]),
    .I3(\U0/I_VIO/U_STATUS/iSTAT [7]),
    .I4(\U0/I_VIO/U_STATUS/iSTAT [5]),
    .I5(\U0/I_VIO/U_STATUS/iSTAT [1]),
    .O(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O2 )
  );
  LUT6 #(
    .INIT ( 64'hFD75B931EC64A820 ))
  \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O22  (
    .I0(\U0/I_VIO/U_STATUS/iSTAT_CNT [5]),
    .I1(\U0/I_VIO/U_STATUS/iSTAT_CNT [6]),
    .I2(\U0/I_VIO/U_STATUS/iSTAT [2]),
    .I3(\U0/I_VIO/U_STATUS/iSTAT [6]),
    .I4(\U0/I_VIO/U_STATUS/iSTAT [4]),
    .I5(\U0/I_VIO/U_STATUS/iSTAT [0]),
    .O(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O21_854 )
  );
  LUT6 #(
    .INIT ( 64'h7FFFFFFFFFFFFFFF ))
  \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O23  (
    .I0(CONTROL[15]),
    .I1(CONTROL[14]),
    .I2(CONTROL[16]),
    .I3(CONTROL[17]),
    .I4(CONTROL[18]),
    .I5(CONTROL[19]),
    .O(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O22_855 )
  );
  LUT6 #(
    .INIT ( 64'h7FFFFFFFFFFFFFFF ))
  \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O24  (
    .I0(CONTROL[21]),
    .I1(CONTROL[20]),
    .I2(CONTROL[22]),
    .I3(CONTROL[23]),
    .I4(CONTROL[24]),
    .I5(CONTROL[25]),
    .O(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O23_856 )
  );
  LUT6 #(
    .INIT ( 64'h7FFFFFFFFFFFFFFF ))
  \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O25  (
    .I0(CONTROL[2]),
    .I1(CONTROL[1]),
    .I2(CONTROL[4]),
    .I3(CONTROL[5]),
    .I4(CONTROL[6]),
    .I5(CONTROL[7]),
    .O(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O24_857 )
  );
  LUT6 #(
    .INIT ( 64'h7FFFFFFFFFFFFFFF ))
  \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O26  (
    .I0(CONTROL[9]),
    .I1(CONTROL[8]),
    .I2(CONTROL[10]),
    .I3(CONTROL[11]),
    .I4(CONTROL[12]),
    .I5(CONTROL[13]),
    .O(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O25_858 )
  );
  LUT6 #(
    .INIT ( 64'h7FFFFFFFFFFFFFFF ))
  \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O27  (
    .I0(CONTROL[27]),
    .I1(CONTROL[26]),
    .I2(CONTROL[28]),
    .I3(CONTROL[29]),
    .I4(CONTROL[30]),
    .I5(CONTROL[31]),
    .O(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O26_859 )
  );
  LUT4 #(
    .INIT ( 16'h7FFF ))
  \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O28  (
    .I0(CONTROL[33]),
    .I1(CONTROL[32]),
    .I2(CONTROL[34]),
    .I3(CONTROL[35]),
    .O(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O27_860 )
  );
  LUT6 #(
    .INIT ( 64'hFFFFFFFFFFFFFFFE ))
  \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O29  (
    .I0(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O22_855 ),
    .I1(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O23_856 ),
    .I2(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O24_857 ),
    .I3(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O25_858 ),
    .I4(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O26_859 ),
    .I5(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O27_860 ),
    .O(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O28_861 )
  );
  LUT5 #(
    .INIT ( 32'hAFACA3A0 ))
  \U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O210  (
    .I0(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O28_861 ),
    .I1(\U0/I_VIO/U_STATUS/iSTAT_CNT [4]),
    .I2(\U0/I_VIO/U_STATUS/iSTAT_CNT [7]),
    .I3(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O21_854 ),
    .I4(\U0/I_VIO/U_STATUS/U_SMUX/U_CS_MUX/I4.U_MUX16/Mmux_O2 ),
    .O(\U0/I_VIO/U_STATUS/TDO_next )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[31]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[31].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[30]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[30].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[29]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[29].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[28]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[28].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[27]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[27].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[26]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[26].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[25]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[25].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[24]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[24].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[23]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[23].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[22]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[22].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[21]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[21].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[20]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[20].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[19]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[19].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[18]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[18].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[17]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[17].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[16]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[16].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[15]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[15].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[14]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[14].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[13]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[13].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[12]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[12].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[11]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[11].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[10]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[10].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[9]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[9].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[8]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[8].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[7]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[7].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[6]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[6].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[5]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[5].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[4]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[4].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[3]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[3].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[2]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[2].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[1]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[1].SYNC_IN_CELL/rising_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/U_FALLING  (
    .C(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/user_in_n ),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/falling_out )
  );
  FDC #(
    .INIT ( 1'b0 ))
  \U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/U_RISING  (
    .C(SYNC_IN[0]),
    .CLR(\U0/I_VIO/RESET ),
    .D(N0),
    .Q(\U0/I_VIO/GEN_SYNC_IN[0].SYNC_IN_CELL/rising_out )
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
