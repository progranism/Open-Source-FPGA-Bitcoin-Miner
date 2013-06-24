# JTAG Communication Functions
# Abstracts the JTAG interface away to a few interface functions

# User API Functions
# These should be generic and be the same no matter what the underlying FPGA is.
# Use these to interact with the FPGA.
# TODO: These are designed to assume a single FPGA per JTAG chain. Re-design to handle multiple FPGAs, assigning
# an arbitrary ID to each FPGA.

# Some helpful functions
proc get_selected_list_item {lst idx} {
	# Convert to integer
	if [catch { set idx [expr {int($idx)}] }] {
		set idx -1
	}

	if {$idx < 0 || $idx >= [llength $lst]} {
		set len [llength $lst]
		puts "Invalid number. Please enter a number from 0 to $len"
		exit
	}

	return [lindex $lst $idx]
}

# Initialize the FPGA
proc fpga_init {} {
	global fpga_last_nonce
	global fpga_name

	set fpga [find_miner_fpga]

	if {$fpga == -1} {
		return -1
	}

	set hardware_name [lindex $fpga 0]
	set device_name [lindex $fpga 1]

	start_insystem_source_probe -hardware_name $hardware_name -device_name $device_name

	set fpga_last_nonce [read_instance GNON]
	set fpga_name "$hardware_name $device_name"

	return 0
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
	global fpga_name
	return $fpga_name
}



###
# Internal FPGA/JTAG APIs are below
# These should not be accessed outside of this script
###################################

set fpga_instances [dict create]
set fpga_last_nonce 0
set fpga_name "Unknown"

# Search the specified FPGA device for all Sources and Probes
proc find_instances {hardware_name device_name} {
	global fpga_instances

	set fpga_instances [dict create]

	if {[catch {

		foreach instance [get_insystem_source_probe_instance_info -hardware_name $hardware_name -device_name $device_name] {
			dict set fpga_instances [lindex $instance 3] [lindex $instance 0]
		}

	} exc]} {
		#puts stderr "DEV-REMOVE: Error in find_instances: $exc"
		set fpga_instances [dict create]
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


# Try to find an FPGA on the JTAG chain that has mining firmware loaded into it.
# TODO: Return multiple FPGAs if more than one are found (that have mining firmware) on the selected JTAG chain.
proc find_miner_fpga {} {
	set hardware_names [get_hardware_names]

	set id 0

	# List out all hardware names and the devices connected to them
	foreach hardware_name $hardware_names {
		puts "$id) $hardware_name"
		incr id

		foreach device_name [get_device_names -hardware_name $hardware_name] {
			puts "\t$device_name"
		}
	}

	if {[llength $hardware_names] == 0} {
		puts stderr "ERROR: There are no Altera devices currently connected."
		puts stderr "Please connect an Altera FPGA and re-run this script.\n"
		return -1
	}

	puts -nonewline "\nWhich USB device would you like to scan? "
	gets stdin selected_hardware_id
	puts ""

	set hardware_name [get_selected_list_item $hardware_names $selected_hardware_id]

	puts "Selected USB device: $hardware_name\n\n\n"

	if {[catch { set device_names [get_device_names -hardware_name $hardware_name] } exc]} {
		#puts stderr "DEV-REMOVE: Error on get_device_names: $exc"
		continue
	}

	foreach device_name $device_names {
		if { [check_if_fpga_is_miner $hardware_name $device_name] } {
			return [list $hardware_name $device_name]
		}
	}
	

	puts stderr "ERROR: There are no Altera FPGAs with mining firmware loaded on them."
	puts stderr "Please program your FPGA with mining firmware and re-run this script.\n"

	return -1
}


# Check if the specified FPGA is loaded with miner firmware
proc check_if_fpga_is_miner {hardware_name device_name} {
	find_instances $hardware_name $device_name

	if {[instance_exists STAT] && [instance_exists DAT2] && [instance_exists GNON]} {
		return 1
	}

	return 0
}



