# Legal Notice: (C)2011 Altera Corporation. All rights reserved.  Your
# use of Altera Corporation's design tools, logic functions and other
# software and tools, and its AMPP partner logic functions, and any
# output files any of the foregoing (including device programming or
# simulation files), and any associated documentation or information are
# expressly subject to the terms and conditions of the Altera Program
# License Subscription Agreement or other applicable license agreement,
# including, without limitation, that your use is for the sole purpose
# of programming logic devices manufactured by Altera and sold by Altera
# or its authorized distributors.  Please refer to the applicable
# agreement for further details.

#**************************************************************
# Timequest JTAG clock definition
#   Uncommenting the following lines will define the JTAG
#   clock in TimeQuest Timing Analyzer
#**************************************************************

#create_clock -period 10MHz {altera_reserved_tck}
#set_clock_groups -asynchronous -group {altera_reserved_tck}

#**************************************************************
# Set TCL Path Variables 
#**************************************************************

set 	cpu_0 	cpu_0:the_cpu_0
set 	cpu_0_oci 	cpu_0_nios2_oci:the_cpu_0_nios2_oci
set 	cpu_0_oci_break 	cpu_0_nios2_oci_break:the_cpu_0_nios2_oci_break
set 	cpu_0_ocimem 	cpu_0_nios2_ocimem:the_cpu_0_nios2_ocimem
set 	cpu_0_oci_debug 	cpu_0_nios2_oci_debug:the_cpu_0_nios2_oci_debug
set 	cpu_0_wrapper 	cpu_0_jtag_debug_module_wrapper:the_cpu_0_jtag_debug_module_wrapper
set 	cpu_0_jtag_tck 	cpu_0_jtag_debug_module_tck:the_cpu_0_jtag_debug_module_tck
set 	cpu_0_jtag_sysclk 	cpu_0_jtag_debug_module_sysclk:the_cpu_0_jtag_debug_module_sysclk
set 	cpu_0_oci_path 	 [format "%s|%s" $cpu_0 $cpu_0_oci]
set 	cpu_0_oci_break_path 	 [format "%s|%s" $cpu_0_oci_path $cpu_0_oci_break]
set 	cpu_0_ocimem_path 	 [format "%s|%s" $cpu_0_oci_path $cpu_0_ocimem]
set 	cpu_0_oci_debug_path 	 [format "%s|%s" $cpu_0_oci_path $cpu_0_oci_debug]
set 	cpu_0_jtag_tck_path 	 [format "%s|%s|%s" $cpu_0_oci_path $cpu_0_wrapper $cpu_0_jtag_tck]
set 	cpu_0_jtag_sysclk_path 	 [format "%s|%s|%s" $cpu_0_oci_path $cpu_0_wrapper $cpu_0_jtag_sysclk]
set 	cpu_0_jtag_sr 	 [format "%s|*sr" $cpu_0_jtag_tck_path]

#**************************************************************
# Set False Paths
#**************************************************************

set_false_path -from [get_keepers *$cpu_0_oci_break_path|break_readreg*] -to [get_keepers *$cpu_0_jtag_sr*]
set_false_path -from [get_keepers *$cpu_0_oci_debug_path|*resetlatch]     -to [get_keepers *$cpu_0_jtag_sr[33]]
set_false_path -from [get_keepers *$cpu_0_oci_debug_path|monitor_ready]  -to [get_keepers *$cpu_0_jtag_sr[0]]
set_false_path -from [get_keepers *$cpu_0_oci_debug_path|monitor_error]  -to [get_keepers *$cpu_0_jtag_sr[34]]
set_false_path -from [get_keepers *$cpu_0_ocimem_path|*MonDReg*] -to [get_keepers *$cpu_0_jtag_sr*]
set_false_path -from *$cpu_0_jtag_sr*    -to *$cpu_0_jtag_sysclk_path|*jdo*
set_false_path -from sld_hub:*|irf_reg* -to *$cpu_0_jtag_sysclk_path|ir*
set_false_path -from sld_hub:*|sld_shadow_jsm:shadow_jsm|state[1] -to *$cpu_0_oci_debug_path|monitor_go
