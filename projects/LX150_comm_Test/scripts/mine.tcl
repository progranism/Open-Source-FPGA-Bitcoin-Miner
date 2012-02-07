##
#
# Copyright (c) 2011-2012 fpgaminer@bitcoin-mining.com
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


## TODO: Long polling.
## TODO: --verbose option for debugging issues.
## TODO: Handle multiple FPGAs at once.


package require http
#package require json
package require base64

source utils.tcl
source json_rpc.tcl
source jtag_comm.tcl


set total_accepted 0
set total_rejected 0

proc say_line {msg} {
	set t [clock format [clock seconds] -format "%D %T"]
	puts "\[$t\] $msg"
}

proc say_error {msg} {
	set t [clock format [clock seconds] -format "%D %T"]
	puts stderr "\[$t\] $msg"
}

proc say_status {rate est_rate accepted rejected} {
	set submitted [expr {$rejected + $accepted}]

	if {$submitted == 0} {
		set rej_rate [expr {$rejected * 100.0}]
	} else {
		set rej_rate [expr {$rejected * 100.0 / $submitted}]
	}

	say_line [format "%.2f MH/s (~%.2f MH/s) \[Rej: %i/%i (%.2f%%)\]" $rate $est_rate $rejected $submitted $rej_rate]
}

# Loop until a new share is found, or timeout seconds have passed.
# Prints status updates every second.
proc wait_for_golden_ticket {timeout} {
	global total_accepted
	global total_rejected
	global global_start_time

	
	#puts "Current nonce"
	#set current_nonce [read_instance GNON]
	#puts $current_nonce
	set last_nonce [get_current_fpga_nonce]
	set begin_time [clock clicks -milliseconds]

	#puts "FPGA is now searching for lottery ticket..."

	while {$timeout > 0} {
		set golden_nonce [get_result_from_fpga]

		if {$golden_nonce != -1} {
			return $golden_nonce
		}

		# TODO: We may need to sleep for a small amount of time to avoid taxing the CPU
		# Or the JTAG comms might throttle back our CPU usage anyway.
		# If the FPGA had a proper results queue we could just sleep for a second, but
		# for now we might as well loop as fast as possible

		after 1000
		
		set now [clock clicks -milliseconds]
		if { [expr {$now - $begin_time}] >= 2000 } {
			incr timeout -2

			set current_nonce [get_current_fpga_nonce]
			set dt [expr {$now - $begin_time}]
			set begin_time $now

			if {$current_nonce < $last_nonce} {
				set nonces [expr {$current_nonce + (0xFFFFFFFF - $last_nonce) + 1}]
			} else {
				set nonces [expr {$current_nonce - $last_nonce + 1}]
			}

			set last_nonce $current_nonce

			if {$dt == 0} {
				set dt 1
			}

			set rate [expr {$nonces / ($dt * 1000.0)}]
			set current_time [clock seconds]
			# Adding 0.00001 to the denom is a quick way to avoid divide by zero :P
			# Each share is worth ~(2^32 / 1,000,000) MH/s
			set est_rate [expr {($total_accepted + $total_rejected) * 4294.967296 / ($current_time - $global_start_time + 0.00001)}]

			say_status $rate $est_rate $total_accepted $total_rejected
		}
	}

	return -1
}

proc submit_nonce {workl golden_nonce} {
	global total_accepted
	global total_rejected
	global url
	global userpass

	array set work $workl

	set share(data) $work(data)
	set share(nonce) $golden_nonce

	if {[submit_work $url $userpass [array get share]] == true} {
		incr total_accepted
	} else {
		incr total_rejected
	}
}


puts " --- FPGA Mining Tcl Script --- \n\n"


puts "Looking for and preparing FPGAs...\n"
if {[fpga_init] == -1} {
	puts stderr "No mining FPGAs found."
	puts "\n\n --- Shutting Down --- \n\n"
	exit
}

set fpga_name [get_fpga_name]
puts "Mining FPGA Found: $fpga_name\n\n"

if {[get_current_fpga_nonce] == -1} {
	puts "WARNING: The FPGA's mining firmware does not report a hashrate. Status messages will show 0.00 MH/s, but the FPGA should still be running. Check the estimated rate for approximate hashing rate after shares have been submitted.\n\n"
}

source config.tcl
set userpass [::base64::encode $userpass]
set global_start_time [clock seconds]


set work -1

while {1} {
	# Get new work
	set newwork [get_work $url $userpass]
	#set newwork [list midstate 90f741afb3ab06f1a582c5c85ee7a561912b25a7cd09c060a89b3c2a73a48e22 data 000000014cc2c57c7905fd399965282c87fe259e7da366e035dc087a0000141f000000006427b6492f2b052578fb4bc23655ca4e8b9e2b9b69c88041b2ac8c771571d1be4de695931a2694217a33330e000000800000000000000000000000000000000000000000000000000000000000000000000000000000000080020000]
	#set newwork [list midstate dff4af507630991f92fdd78371c1d811f3f45bfcfc808ede72aa751d8e1afa27 data 00000001d2ab3e86ad0bcaa49de46a4e5b2d5963ee2d339af32de8b300000a6e000000001c3337bacce38e66884e223dc10ef5bbf1ad0b409629952e5c4dee03072abb104eff2f3e1a0e76ba00000000000000800000000000000000000000000000000000000000000000000000000000000000000000000000000080020000]

	if {$newwork != -1} {
		# Check to see if the FPGA completed any results while we were getting new work.
		set golden_nonce [get_result_from_fpga]

		if {$golden_nonce != -1 && [array exists work]} {
			#puts "Golden Nonce: $golden_nonce"
			submit_nonce [array get work] $golden_nonce
		}

		push_work_to_fpga $newwork
		unset work
		array set work $newwork
	}

	# Even if we couldn't get new work above, we should still loop looking for results,
	# because the FPGA will (currently) continue to mine.
	# TODO: In the future the FPGA will go idle once it completes its work.
	
	# We wait 20 seconds, because after 20 seconds we should go get new work from the pool.
	# Getting new work every 20 seconds helps prevent stale shares.
	# TODO: Implement Long Polling ... :P
	set golden_nonce [wait_for_golden_ticket 20]

	if {$golden_nonce == -1 || ![array exists work]} {
		continue
	}

	#puts "Golden Nonce: $golden_nonce"
	submit_nonce [array get work] $golden_nonce
}


puts "\n\n --- Shutting Down --- \n\n"



