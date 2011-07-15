Xilinx Serial Miner
-------------------
by Risto A. Paju, teknohog at iki.fi


This is a port of fpgaminer's

https://github.com/progranism/Open-Source-FPGA-Bitcoin-Miner

to Xilinx chips, using a serial port for communication with the computer.


Implementation details
----------------------

I use a Digilent Nexys2 board with a Spartan 3E 500K. This code should
probably work on most Xilinx chips. I have set the loop unrolling to
minimum (5) by default, decrease this number for bigger chips. In my
case the LUT utilization is about 60%.

The 7-segment display is used to indicate a golden nonce. (Raw bytes,
not legible numbers, but usable for a bitwise debug :)

The altpll part in the original code is replaced by the Xilinx
equivalent, DCM. It was generated in Xilinx ISE, and it may be
necessary to generate new ones for different devices. This was the
simplest DCM with only the minimum of controls and outputs.

The serial communication is a simple and direct replacement of the
original. Midstate and data2 are pushed onto the registers in a single
packet. The FPGA only sends data back when it finds a golden
nonce. The timeout for serial port reads is rather conveniently used
like 'askrate' in other miners, to signal when new work is needed.


Clock doubler
-------------

A DCM can easily multiply the clock rate for faster mining, but it may
be unstable. In my case, the base clock is 50 MHz and the synthesis
tools give a timing limit of about 70 MHz (13 ns). Nevertheless, it
seems to work fine so far. My error rate so far seems very low, so
even if the doubled clock is to blame, the net effect is positive.

Heat could be a serious issue on larger FPGAs. This Spartan 3E 500K is
slightly warm to touch with the doubled clock, compared to no
noticeable warming with the single clock.

The code to use this is already included and commented out, not
enabled by default. To enable it, you should have these lines
uncommented in fpgaminer_top.v:

`include "main_pll_2x.v"
(instead of main.pll.v)

main_pll pll_blk (.CLKIN_IN(osc_clk), .CLK2X_OUT(hash_clk));
(instead of the one with .CLK0_OUT)

Also, since hash_clk is used by everything including the serial port,
you need to change the frequency in async_*.v to the doubled value.


Usage
-----

1. Download the RS232 code from

http://www.fpga4fun.com/files/async.zip

and unzip it into sources/hdl to go with the other files. Change the
clock frequency definition in both files to suit your oscillator.

Note that this async code is not free software, and it cannot be
redistributed without a permission from fpga4fun.

(I have discussed this with the author of fpga4fun, and he has OK'd
this kind of linking. However, it might be more convenient in the
future to have our own serial code here.)


2. Build the design and program the FPGA. At the moment, the source is
treated as the single fpgaminer_top file, using includes.

Here are some ways I have used succesfully, you can of course use
Xilinx ISE or something else:

2a. boldport:

$ make -f scripts/Makefile TOP_PATH=`pwd` bit

This builds a bit file for a Spartan 3E 500K. To generate a suitable
Makefile for other FPGAs, see https://www.boldport.com/.

2b. Nexys2prog and its associated build script:

http://ixo-jtag.sourceforge.net/nexys2-linux-howto.html
 

3. Edit your details such as username and serial port in miner.py, and
start mining. It requires a few non-standard libraries, pyserial and
json-rpc.

http://pyserial.sourceforge.net/
(also generally available in Linux distributions)

http://json-rpc.org/wiki/python-json-rpc


Todo
----

* Some error checking and resetting features. For example, if we
  happen to send one extra byte into the FPGA, the registers will stay
  out of sync basically until it is reconfigured.

* Feedback on actual hashing rate. For example, a signal could be sent
  whenever the nonce hits certain milestones, and the script could
  figure out the rate.


Release notes
-------------

2011-07-14

* 7-segment display is now enabled by the nearest slide switch (SW0),
  to reduce the amount of unnecessary lighting.

2011-06-20

* Moved to Github
* Introduced boldport as an optional build system, thanks to Saar
  Drimer.

2011-06-08

* Threaded miner.py that should reduce the incidence of stale blocks,
  particularly with faster FPGAs.

2011-06-05

* Optional statistics in miner.py
* Clock doubler available but not enabled by default
* Removed LED indicators, 7-segment display remains

2011-06-04

This is the first release on 2011-06-04. I got my first FPGA board on
2011-05-13 and I have been learning these things between a day job and
other intense hobbies. So bear with my newbie bugs, and please send in
hints and corrections.
