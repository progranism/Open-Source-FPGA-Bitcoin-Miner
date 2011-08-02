# JTAG Communication Functions
# Abstracts the JTAG interface away to a few interface functions

# User API Functions
# These should be generic and be the same no matter what the underlying FPGA is.
# Use these to interact with the FPGA.
# TODO: These are designed to assume a single FPGA. Re-design to handle multiple FPGAs, assigning
# an arbitrary ID to each FPGA.

# Initialize the FPGA
proc fpga_init {} {
	global fpga_last_nonce
	# TODO: Automatically find an FPGA with mining firmware loaded on it.
	# We can use the code from the programming script to accomplish that.
	find_instances
	start_insystem_source_probe -hardware_name "USB-Blaster \[USB-0\]" -device_name "@1: EP3C120/EP4CE115 (0x020F70DD)"

	set fpga_last_nonce [read_instance GNON]
}

# Push new work to the FPGA
proc push_work_to_fpga {workl} {
	global fpga_last_nonce
	array set work $workl

	write_instance "STAT" [reverseHex $work(midstate)]
	write_instance "DAT2" [string range [reverseHex $work(data)] 64 127]

	# Reset the last seen nonce, since we've just given the FPGA new work
	set fpga_last_nonce [read_instance GNON]
}


# Clear all work on the FPGA
proc clear_fpga_work {} {
	# Currently does nothing, since these is no work queue
}


# Get a new result from the FPGA if one is available. Returns Golden Nonce (integer).
# If no results are available, returns -1
proc get_result_from_fpga {} {
	global fpga_last_nonce
	set golden_nonce [read_instance GNON]

	if { [string compare $golden_nonce $fpga_last_nonce] != 0} {
		set fpga_last_nonce $golden_nonce
		# Convert from Hex to integer
		set nonce [expr 0x$golden_nonce]
		return $nonce
	}

	return -1
}


# Return the current nonce the FPGA is on.
# This can be sampled to calculate how fast the FPGA is running.
# Returns -1 if that information is not available.
proc get_current_fpga_nonce {} {
	if { [instance_exists NONC] } {
		set nonce [read_instance NONC]
		return [expr 0x$nonce]
	} else {
		return -1
	}
}


# Return the FPGA's "name", which could be anything but is hopefully helpful (to the user) in
# indentifying which FPGA the software is talking to.
proc get_fpga_name {} {
	return "Unknown"
}


set fpga_instances [dict create]
set fpga_last_nonce 0

proc find_instances {} {
	global fpga_instances

	foreach instance [get_insystem_source_probe_instance_info -hardware_name "USB-Blaster \[USB-0\]" -device_name "@1: EP3C120/EP4CE115 (0x020F70DD)"] {
		dict set fpga_instances [lindex $instance 3] [lindex $instance 0]
	}
}

proc write_instance {name value} {
	global fpga_instances
	write_source_data -instance_index [dict get $fpga_instances $name] -value_in_hex -value $value
}

proc read_instance {name} {
	global fpga_instances
	return [read_probe_data -value_in_hex -instance_index [dict get $fpga_instances $name]]
}

proc instance_exists {name} {
	global fpga_instances
	return [dict exists $fpga_instances $name]
}



