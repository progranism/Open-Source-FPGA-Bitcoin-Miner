Changes to the makomk branch by teknohog:

* serial communications -> can run without Altera software

The FPGA can also be programmed using alternative software, probably
even in non-x86 systems. The associated program.sh uses UrJTAG, and it
is noticeably slower than quartus_pgm, but works on many more systems.

* display the golden nonce in hex on the 8x7-seg display

These bright LEDs can be annoying in the long run, so this is enabled
by the leftmost slide switch (SW17). For debugging, miner.py shows the golden
nonce in hex as well.


Quick start:
------------

This project runs at 50 MHz by default. Files for programming the FPGA
at this frequency are already provided. Either use the .sof in the
usual way with Altera tools, for example

quartus_pgm -c USB-Blaster -m JTAG -o "P;quartus_output/fpgaminer.sof"

or open the fpgaminer.qsf project in Quartus II and program from
there,

or try the more experimental way with program.sh in Linux, using
UrJTAG and the .svf file.

Edit your username etc. in miner.py before running it, unless you want
to donate some extra shares :)


Custom build:
-------------

The makomk code is stable at 109 MHz, at which point a heatsink is
needed. To get this frequency, a new altpll (main_pll.v) is needed.

To build the code, download and unzip

http://www.fpga4fun.com/files/async.zip

Change the clock frequency in both async_* files to match the hash
clock. Proceed building the project fpgaminer as usual.

