##
#
# Copyright (c) 2011 fpgaminer@bitcoin-mining.com
#
#
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 
##

package require http
package require struct
package require base64

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

# Platform USB Cable
set PLATFORM_USB_CABLE_ARGS [list "port=USB2" \
                                  "frequency=3000000"]

set CABLE_NAME $CSEJTAG_TARGET_PLATFORMUSB
set CABLE_ARGS $PLATFORM_USB_CABLE_ARGS

# TODO: We need to indetify the correct device # and user reg # automatically from the JTAG chain
set MIDSTATE_CTL [list 2 1 0]
set DATA_CTL [list 2 1 1]
set GOLDEN_NONCE_CTL [list 2 1 2]

source config.tcl
set userpass [::base64::encode $userpass]


proc reverseHex {hexstring} {
	set result ""
	
	for {set x 0} {$x < [string length $hexstring]} {incr x} {
		set piece [string range $hexstring $x [expr {$x+1}]]
		set result "${piece}${result}"
	
		incr x
	}
	
	return $result
}

proc dirty_json {json field} {
	set indx [string first "\"$field\"" $json]

	if {$indx == -1} {
		return ""
	}

	set indx [expr {$indx + [string length $field] + 2}]
	set json [string range $json $indx end]

	set indx [string first "\"" $json]

	if {$indx == -1} {
		return ""
	}

	set indx [expr {$indx + 1}]
	set json [string range $json $indx end]

	set endx [string first "\"" $json]

	if {$indx == -1} {
		return ""
	}

	set endx [expr {$endx - 1}]

	return [string range $json 0 $endx]
}

proc do_rpc_request {request} {
	global userpass
	global url
	global httpresult
	global rpc_request

	set headers [list "Authorization" "Basic $userpass"]

	set token [::http::geturl $url -query $request -headers $headers -type "application/json"]

	set httpresult [::http::data $token]
	
	return $httpresult
}

proc get_work {handle} {
	global MIDSTATE_CTL
	global DATA_CTL
	global GOLDEN_NONCE_CTL

	set request "{\"method\": \"getwork\", \"params\": \[\], \"id\":0}"
	set json_result [do_rpc_request $request]

	set midstate [dirty_json $json_result midstate]
	set data [dirty_json $json_result data]

	if {([string length $midstate] != 64) || ([string length $data] != 256)} {
		puts "ERROR: Unable to parse the HTTP response for a getwork request. Either the server returned an error, or we just couldn't parse out the JSON."
		puts "Request: $request"
		puts "HTTP Response:"
		puts $json_result
		puts "Midstate: $midstate"
		puts "Data: $data"

		return -1
	}

	# Give data to the chip
	set outputTclArray(midstate) [reverseHex $midstate]
	csevio_write_values $handle $MIDSTATE_CTL outputTclArray

	set outputTclArray2(data2) [string range [reverseHex $data] 64 127]
	csevio_write_values $handle $DATA_CTL outputTclArray2
	
	return $data
}

proc read_nonce {handle} {
	global GOLDEN_NONCE_CTL

	csevio_read_values $handle $GOLDEN_NONCE_CTL inputTclArray
	return "$inputTclArray(golden_nonce.value)"
}

proc wait_for_golden_ticket {handle timeout} {
	set begin_time [clock seconds]
	
	puts "Current nonce"
	set current_nonce [read_nonce $handle]
	puts $current_nonce

	puts "FPGA is now searching for lottery ticket..."

	while {1} {
		if { [string compare $current_nonce [read_nonce $handle]] != 0} {
			break
		}
		
		if { [expr {[clock seconds] - $begin_time}] >= $timeout } {
			return ""
		}
	}

	puts "I've got a Golden Ticket!!"
	set nonce [read_nonce $handle]
	puts $nonce
	
	return $nonce
}

proc submit_work {data nonce} {
	puts "Hex nonce: $nonce"
	set nonce [expr 0x$nonce]
	set nonce [format %08x $nonce]
	puts "New nonce hex: $nonce"

	set hexdata1 [string range $data 0 151]
	set hexdata2 [reverseHex $nonce]
	set hexdata3 [string range $data 160 255]
	set hexdata "${hexdata1}${hexdata2}${hexdata3}"

	puts "Original data: $data"
	puts "Golden data: $hexdata"

	puts "Submitting work ..."

	set json_result [do_rpc_request "{\"method\": \"getwork\", \"params\": \[ \"$hexdata\" \], \"id\":1}"]
	puts "Result: $json_result"
}

proc main {argc argv} {
	global MIDSTATE_CTL
	global DATA_CTL
	global GOLDEN_NONCE_CTL
    
	# Begin the JTAG session
	set handle [csejtag_session create "writeMessage" $argv]
    
	# Setup the ChipScope stuff and get the VIOs ready
	initChipScopeVIO $handle

	while {1} {
		# Get new work
		if [catch {set data [get_work $handle]}] {
			puts "ERROR! Waiting to try again ..."
			after 20000
			continue
		}

		if {$data == -1} {
			puts "ERROR! Waiting to try again ..."
			after 5000
			continue
		}
	
		if [catch {
			set golden_nonce [wait_for_golden_ticket $handle 20]
	
			if { [string compare $golden_nonce ""] != 0 } {
			submit_work $data $golden_nonce
			}
		}] {
			puts "ERROR! Waiting to try again ..."
			after 20000
			continue
		}
	}

	# Cleanup
	csevio_terminate_core $handle $GOLDEN_NONCE_CTL
	csevio_terminate_core $handle $MIDSTATE_CTL
	csevio_terminate_core $handle $DATA_CTL
	csejtag_target close $handle
	csejtag_session send_message $handle $CSE_MSG_INFO "Closed cable successfully\n"
    
	csejtag_session destroy $handle
}

proc initChipScopeVIO {handle} {
	global CABLE_NAME
	global CABLE_ARGS
	global CSE_MSG_ERROR
	global CSE_MSG_INFO
	global CSEJTAG_SCAN_DEFAULT
	global CSEJTAG_LOCKED_ME
	global CSEVIO_SYNC_OUTPUT
	global CSEVIO_SYNC_INPUT
	global MIDSTATE_CTL
	global DATA_CTL
	global GOLDEN_NONCE_CTL


	csejtag_target open $handle \
			$CABLE_NAME \
                        0 \
                        $CABLE_ARGS

	csejtag_session send_message $handle $CSE_MSG_INFO "Cable opened successfully.\n"
    
	set cablelock [csejtag_target lock $handle 5000]
	if {$cablelock != $CSEJTAG_LOCKED_ME} {
		csejtag_session send_message $handle $CSE_MSG_ERROR "cse_lock_target failed"
		csejtag_target close $handle
		return
    	}
    
	csejtag_session send_message $handle $CSE_MSG_INFO "Cable Locked.\n"
    
    	if {[catch {
			csejtag_tap autodetect_chain $handle $CSEJTAG_SCAN_DEFAULT
    
			# set up signals for each VIO core

			csevio_init_core $handle $GOLDEN_NONCE_CTL
			csevio_init_core $handle $MIDSTATE_CTL
			csevio_init_core $handle $DATA_CTL
			csevio_define_bus $handle $MIDSTATE_CTL "midstate" $CSEVIO_SYNC_OUTPUT [struct::list iota 256]
			csevio_define_bus $handle $DATA_CTL "data2" $CSEVIO_SYNC_OUTPUT [struct::list iota 256]
			csevio_define_bus $handle $GOLDEN_NONCE_CTL "golden_nonce" $CSEVIO_SYNC_INPUT [struct::list iota 32]

    			set outputTclArray(midstate) 228ea4732a3c9ba860c009cda7252b9161a5e75ec8c582a5f106abb3af41f790
    			csevio_write_values $handle $MIDSTATE_CTL outputTclArray

			set outputTclArray2(data2) 00000000000000000000000080000000000000002194261a9395e64dbed17115
			csevio_write_values $handle $DATA_CTL outputTclArray2

			csevio_read_values $handle $GOLDEN_NONCE_CTL inputTclArray
			puts "golden_nonce = $inputTclArray(golden_nonce.value)"
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
	csejtag_target unlock $handle
	csejtag_session send_message $handle $CSE_MSG_INFO "Cable Unlocked.\n"
}

proc writeMessage {handle msgFlags msg} {
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


# Start the program
main $argc $argv

