################################################################################
################################################################################
####                                  tclcurl.tcl
################################################################################
################################################################################
## Includes the tcl part of TclCurl
################################################################################
################################################################################
## (c) 2001-2009 Andres Garcia Garcia. fandom@telefonica.net
## See the file "license.terms" for information on usage and redistribution
## of this file and for a DISCLAIMER OF ALL WARRANTIES.
################################################################################
################################################################################

package provide TclCurl 7.19.6

namespace eval curl {

################################################################################
# configure
#    Invokes the 'curl-config' script to be able to know what features have
#    been compiled in the installed version of libcurl.
#    Possible options are '-prefix', '-feature' and 'vernum'
################################################################################
proc ::curl::curlConfig {option} {

    if {$::tcl_platform(platform)=="windows"} {
        error "This command is not available in Windows"
    }

    switch -exact -- $option {
        -prefix {
            return [exec curl-config --prefix]
        }
        -feature {
            set featureList [exec curl-config --feature]
            regsub -all {\\n} $featureList { } featureList
            return $featureList
        }
        -vernum {
            return [exec curl-config --vernum]
        }
        -ca {
            return [exec curl-config --ca]
        }
        default {
            error "bad option '$option': must be '-prefix', '-feature', '-vernum' or '-ca'"
        }
    }
    return
}

################################################################################
# transfer
#    The transfer command is used for simple transfers in which you don't
#    want to request more than one file.
#
# Parameters:
#    Use the same parameters you would use in the 'configure' command to
#    configure the download and the same as in 'getinfo' with a 'info'
#    prefix to get info about the transfer.
################################################################################
proc ::curl::transfer {args} {
    variable getInfo
    variable curlBodyVar

    set i 0
    set newArgs ""
    catch {unset getInfo}

    foreach {option value} $args {
        set noPassOption 0
        set block        1
        switch -regexp -- $option {
            -info.* {
                set noPassOption 1
                regsub -- {-info} $option {} option
                set getInfo($option) $value
            }
            -block {
                set noPassOption 1
                set block $value
            }
            -bodyvar {
                upvar $value curlBodyVar
                set    value curlBodyVar
            }
            -headervar {
                upvar $value curlHeaderVar
                set    value curlHeaderVar
            }
            -errorbuffer {
                upvar $value curlErrorVar
                set    value curlErrorVar
            }
        }
        if {$noPassOption==0} {
            lappend newArgs $option $value
        }
    }

    if {[catch {::curl::init} curlHandle]} {
        error "Could not init a curl session: $curlHandle"
    }

    if {[catch {eval $curlHandle configure $newArgs} result]} {
        $curlHandle  cleanup
        error $result
    }

    if {$block==1} {
        if {[catch {$curlHandle perform} result]} {
           $curlHandle cleanup
           error $result
        }
        if {[info exists getInfo]} {
            foreach {option var} [array get getInfo] {
                upvar $var info
                set info [eval $curlHandle getinfo $option]
            }
        }
        if {[catch {$curlHandle cleanup} result]} {
            error $result
        }
    } else {
        # We create a multiHandle
        set multiHandle [curl::multiinit]

        # We add the easy handle to the multi handle.
        $multiHandle addhandle $curlHandle

        # So now we create the event source passing the multiHandle as a parameter.
        curl::createEventSource $multiHandle

        # And we return, it is non blocking after all.
    }
    return 0
}

}
