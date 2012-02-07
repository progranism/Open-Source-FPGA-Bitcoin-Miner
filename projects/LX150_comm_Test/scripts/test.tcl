source utils.tcl
source jtag_comm.tcl

fpga_init


set golden_nonce2 [read_fpga_register 14]

while {1} {
	set golden_nonce $golden_nonce2
	after 1000
	set golden_nonce2 [read_fpga_register 14]

	puts [expr {($golden_nonce2 - $golden_nonce)}]
}

