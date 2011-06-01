# Reversed the hex string given on the command line, but only in 2 character chunks.
# Useful for converting from and to getwork responses and Verilog hex strings.

proc reverseHex {hexstring} {
	set result ""
	
	for {set x 0} {$x < [string length $hexstring]} {incr x} {
		set piece [string range $hexstring $x [expr {$x+1}]]
		set result "${piece}${result}"
	
		[incr x]
	}
	
	return $result
}

if { $argc != 1 } {
	puts "USAGE: reverse_hex.tcl HEXSTRING"
} else {
	puts [reverseHex [lindex $argv 0]]
}

