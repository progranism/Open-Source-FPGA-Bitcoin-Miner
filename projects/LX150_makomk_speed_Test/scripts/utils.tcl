# Reverse a hex string
proc reverseHex {hexstring} {
	set result ""
	
	for {set x 0} {$x < [string length $hexstring]} {incr x} {
		set piece [string range $hexstring $x [expr {$x+1}]]
		set result "${piece}${result}"
	
		incr x
	}
	
	return $result
}

# A pure TCL implementation of very basic JSON parsing.
# Xilinx's TCL is too old to support the standard json library right now.
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

