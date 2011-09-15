# JTAG Communication Functions
# Abstracts the JTAG interface away to a few interface functions

# User API Functions
# These should be generic and be the same no matter what the underlying FPGA is.
# Use these to interact with the FPGA.
# TODO: These are designed to assume a single FPGA. Re-design to handle multiple FPGAs, assigning
# an arbitrary ID to each FPGA.


# Import Xilinx ChipScope Engine Interface
if {[info exists env(XIL_CSE_TCL)]} {
    if {[string length $env(XIL_CSE_TCL)] > 0} {
        puts "Sourcing from XIL_CSE_TCL: $env(XIL_CSE_TCL) ..."
        source $env(XIL_CSE_TCL)/csejtag.tcl
        source $env(XIL_CSE_TCL)/csefpga.tcl
        source $env(XIL_CSE_TCL)/csecore.tcl
        source $env(XIL_CSE_TCL)/csevio.tcl
    } else {
        puts "Sourcing from XILINX: $env(XILINX)/cse/tcl ..."
        source $env(XILINX)/cse/tcl/csejtag.tcl
        source $env(XILINX)/cse/tcl/csefpga.tcl
        source $env(XILINX)/cse/tcl/csecore.tcl
        source $env(XILINX)/cse/tcl/csevio.tcl
    }
} else {
    puts "Sourcing from XILINX: $env(XILINX)/cse/tcl ..."
    source $env(XILINX)/cse/tcl/csejtag.tcl
    source $env(XILINX)/cse/tcl/csefpga.tcl
    source $env(XILINX)/cse/tcl/csecore.tcl
    source $env(XILINX)/cse/tcl/csevio.tcl
}

namespace import ::chipscope::*


# Initialize the FPGA
proc fpga_init {} {
	global fpga_name
	global jtag_handle
	global fpga_deviceIndex

	set jtag_handle [csejtag_session create "jtagWriteMessage"]

	set fpga_deviceIndex [find_miner_fpga]

	if {$fpga_deviceIndex == -1} {
		return -1
	}

	return 0
}

proc fpga_cleanup {} {
	global jtag_handle

	csejtag_target close $jtag_handle
	csejtag_session destroy $jtag_handle
}


# Push new work to the FPGA
proc push_work_to_fpga {workl} {
	global jtag_handle
	global fpga_deviceIndex
	global CSEJTAG_LOCKED_ME
	global CSE_MSG_ERROR
	global CSEJTAG_SHIFT_READWRITE
	global CSEJTAG_RUN_TEST_IDLE
	global USER_NUM

	array set work $workl

	set midstate [reverseHex $work(midstate)]
	set data [string range [reverseHex $work(data)] 104 127]
	set hexdata "${midstate}${data}"

	set cablelock [csejtag_target lock $jtag_handle 5000]
    	if {$cablelock != $CSEJTAG_LOCKED_ME} {
        	csejtag_session send_message $jtag_handle $CSE_MSG_ERROR "cse_lock_target failed"
		csejtag_target close $jtag_handle
        	return
	}

	if {[catch {

		csejtag_tap shift_device_ir $jtag_handle $fpga_deviceIndex $CSEJTAG_SHIFT_READWRITE $CSEJTAG_RUN_TEST_IDLE 0 6 $USER_NUM

		for {set i 0} {$i < 45} {incr i} {
			if {$i >= 44} {
				set tx_data "FF"
			} else {
				set tx_data [string range $hexdata [expr {$i*2}] [expr {$i*2+1}]]
			}

			if {$i == 0} {
				set tx_data "00$tx_data"
			} else {
				set tx_data "01$tx_data"
			}

			#puts "SEND: $tx_data"

			set rx_data [csejtag_tap shift_device_dr $jtag_handle $fpga_deviceIndex $CSEJTAG_SHIFT_READWRITE $CSEJTAG_RUN_TEST_IDLE 0 13 $tx_data]

			puts "RECV: $rx_data"
		}
		
	} result]} {
		global errorCode
		global errorInfo
		puts stderr "\nCaught error: $result"
		puts stderr "**** Error Code ***"
		puts stderr $errorCode
		puts stderr "**** Tcl Trace ****"
		puts stderr $errorInfo
		puts stderr "*******************"
	}

	csejtag_target unlock $jtag_handle
}


# Clear all work on the FPGA
proc clear_fpga_work {} {
	# Currently does nothing, since there is no work queue
}


# Get a new result from the FPGA if one is available. Returns Golden Nonce (integer).
# If no results are available, returns -1
proc get_result_from_fpga {} {
	global jtag_handle
	global fpga_deviceIndex
	global CSEJTAG_LOCKED_ME
	global CSE_MSG_ERROR
	global CSEJTAG_SHIFT_READWRITE
	global CSEJTAG_RUN_TEST_IDLE
	global USER_NUM

	set golden_nonce -1

	# Lock the cable
	set cablelock [csejtag_target lock $jtag_handle 5000]
    	if {$cablelock != $CSEJTAG_LOCKED_ME} {
        	csejtag_session send_message $jtag_handle $CSE_MSG_ERROR "cse_lock_target failed"
		csejtag_target close $jtag_handle
        	return -1
	}

	if {[catch {

		csejtag_tap shift_device_ir $jtag_handle $fpga_deviceIndex $CSEJTAG_SHIFT_READWRITE $CSEJTAG_RUN_TEST_IDLE 0 6 $USER_NUM

		for {set i 0} {$i < 4} {incr i} {
			set tx_data "0000"

			set rx_data [csejtag_tap shift_device_dr $jtag_handle $fpga_deviceIndex $CSEJTAG_SHIFT_READWRITE $CSEJTAG_RUN_TEST_IDLE 0 13 $tx_data]

			#puts "RECV: $rx_data"
			set rx_data [expr 0x$rx_data]

			if {$rx_data >= 0x1000} {
				if {$golden_nonce == -1} {
					set golden_nonce 0
				}

				set golden_nonce [expr {$golden_nonce | (($rx_data & 0xFF) << ($i * 8))}]
			} else {
				set golden_nonce -1
				break
			}
		}
	} result]} {
		global errorCode
		global errorInfo
		puts stderr "\nCaught error: $result"
		puts stderr "**** Error Code ***"
		puts stderr $errorCode
		puts stderr "**** Tcl Trace ****"
		puts stderr $errorInfo
		puts stderr "*******************"
	}

	# Unlock the cable
	csejtag_target unlock $jtag_handle

	return $golden_nonce
}


# Return the current nonce the FPGA is on.
# This can be sampled to calculate how fast the FPGA is running.
# Returns -1 if that information is not available.
proc get_current_fpga_nonce {} {
	return -1
	#if { [instance_exists NONC] } {
	#	set nonce [read_instance NONC]
	#	return [expr 0x$nonce]
	#} else {
	#	return -1
	#}
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

set fpga_name "Unknown"
set fpga_deviceIndex -1
set jtag_handle 0

# Platform USB Cable
set PLATFORM_USB_CABLE_ARGS [list "port=USB2" "frequency=3000000"]
set CABLE_NAME $CSEJTAG_TARGET_PLATFORMUSB
set CABLE_ARGS $PLATFORM_USB_CABLE_ARGS

# BSCAN_SPARTAN6 is set for USER1, which is JTAG opcode 000010
set USER_NUM "2"


# Try to find an FPGA on the JTAG chain that has mining firmware loaded into it.
# TODO: Return multiple FPGAs if more than one are found (that have mining firmware).
proc find_miner_fpga {} {
	global jtag_handle
	global CABLE_NAME
	global CABLE_ARGS
	global CSE_MSG_ERROR
	global CSE_MSG_INFO
	global CSEJTAG_SCAN_DEFAULT
	global CSEJTAG_LOCKED_ME

	csejtag_target open $jtag_handle $CABLE_NAME 0 $CABLE_ARGS

	csejtag_session send_message $jtag_handle $CSE_MSG_INFO "Cable opened successfully.\n"

	set cablelock [csejtag_target lock $jtag_handle 5000]
	if {$cablelock != $CSEJTAG_LOCKED_ME} {
		csejtag_session send_message $jtag_handle $CSE_MSG_ERROR "ERROR: cse_lock_target Failed."
		csejtag_target close $jtag_handle
		return -1
    	}

	csejtag_session send_message $jtag_handle $CSE_MSG_INFO "Cable Locked.\n"

	set validIndex -1

	if {[catch {
		csejtag_tap autodetect_chain $jtag_handle $CSEJTAG_SCAN_DEFAULT

		set deviceCount [csejtag_tap get_device_count $jtag_handle]

		for {set deviceIndex 0} {$deviceIndex < $deviceCount} {incr deviceIndex} {
			if {[check_if_fpga_is_miner $jtag_handle $deviceIndex] == 1} {
				set validIndex $deviceIndex
				break
			}
		}
	} result]} {
        	global errorCode
	        global errorInfo
        	puts stderr "\nCaught error: $result"
	        puts stderr "**** Error Code ***"
        	puts stderr $errorCode
	        puts stderr "**** Tcl Trace ****"
        	puts stderr $errorInfo
	        puts stderr "*******************"
	}

	csejtag_target unlock $jtag_handle

	if {$validIndex != -1} {
		return $validIndex
	}

	puts stderr "ERROR: There are no Xilinx FPGAs with mining firmware loaded on them."
	puts stderr "Please program your FPGA with mining firmware and re-run this script.\n"

	return -1
}


# Check if the specified FPGA is loaded with miner firmware
proc check_if_fpga_is_miner {jtag_handle deviceIndex} {
	global fpga_name

	set idcodeBuffer [csejtag_tap get_device_idcode $jtag_handle $deviceIndex]

	set irLength 0
	set irLength [csejtag_db get_irlength_for_idcode $jtag_handle $idcodeBuffer]

	if {$irLength == 0} {
		return 0
	}

	set deviceName [csejtag_db get_device_name_for_idcode $jtag_handle $idcodeBuffer]

	if {[string compare $deviceName XC6SLX150T] != 0} {
		return 0
	}

	set fpga_name $deviceName

	return 1
}


proc jtagWriteMessage {handle msgFlags msg} {
	global CSE_MSG_ERROR
	global CSE_MSG_WARNING
	global CSE_MSG_STATUS
	global CSE_MSG_INFO
	global CSE_MSG_NOISE
	global CSE_MSG_DEBUG

	if {[expr ($msgFlags != $CSE_MSG_DEBUG)]} {
		if {$msgFlags == $CSE_MSG_ERROR}      {
			puts -nonewline "Error:"
		} elseif {$msgFlags == $CSE_MSG_WARNING}	{
			puts -nonewline "Warning:"
        	} elseif {$msgFlags == $CSE_MSG_INFO}		{
			puts -nonewline "Info:"
		} elseif {$msgFlags == $CSE_MSG_STATUS}		{
			puts -nonewline "Status:"
		} elseif {$msgFlags == $CSE_MSG_DEBUG}		{
			puts -nonewline "Debug:"
		}

        	puts -nonewline $msg
        	flush stdout
	}
}



