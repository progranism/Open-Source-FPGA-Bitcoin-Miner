# Handles all the JSON-RPC stuff
package require http
package require json
package require base64

proc do_rpc_request {url userpass request} {
	set headers [list "Authorization" "Basic $userpass"]

	set token [::http::geturl $url -query $request -headers $headers -type "application/json" -timeout 5000]

	set data [::http::data $token]
	::http::cleanup $token

	return [json::json2dict $data]
}

proc get_work {url userpass} {
	array unset work

	if [catch {
		set json_dict [do_rpc_request $url $userpass "{\"method\": \"getwork\", \"params\": \[\], \"id\":0}"]
		set json_result [dict get $json_dict result]

		set work(midstate) [dict get $json_result midstate]
		set work(data) [dict get $json_result data]
	} exc] {
		say_error "ERROR: Unable to getwork. Reason: $exc"
		return -1
	}
	
	return [array get work]
}

proc submit_work {url userpass workl} {
	array set work $workl

	set nonce $work(nonce)
	set data $work(data)

	#set nonce [expr {$nonce - 132}] # No longer need to re-adjust nonce, the FPGA takes care of that.
	set nonce [format %08x $nonce]

	set hexdata1 [string range $data 0 151]
	set hexdata2 [reverseHex $nonce]
	set hexdata3 [string range $data 160 255]
	set hexdata "${hexdata1}${hexdata2}${hexdata3}"

	#puts "Original data: $data"
	#puts "Golden data: $hexdata"

	#puts "Submitting work ..."
	

	set accepted false

	if [catch {
		set json_dict [do_rpc_request $url $userpass "{\"method\": \"getwork\", \"params\": \[ \"$hexdata\" \], \"id\":1}"]
		set json_result [dict get $json_dict result]
		set json_error [dict get $json_dict error]
	
		if {($json_result == true) && ($json_error == {null})} {
			set accepted true
		}
	} exc] {
		say_error "ERROR: Unable to submit share. Reason: $exc"
		set accepted false
	}

	if {$accepted == true} {
		say_line "$nonce accepted"
	} else {
		say_line "$nonce _rejected_"
	}

	return $accepted
}

