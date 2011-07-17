#!/bin/bash

# Program an Altera FPGA using free software, by teknohog

# Requires:

# * UrJTAG with ftdi support

# * output file in .svf format, can be generated from .sof in Quartus
# II Tools->Programmer->File->Create...

# * BSDL file for the FPGA

# More BSDL files for Altera chips:
# http://www.altera.com/download/board-layout-test/bsdl/11491/bsd-11491.html

BSDL_PATH="."
SVF=fpgaminer.svf

cat <<EOF | jtag
bsdl path $BSDL_PATH
cable usbblaster
detect
part 0
svf $SVF
quit
EOF
