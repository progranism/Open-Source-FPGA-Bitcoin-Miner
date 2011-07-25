Based on the Verilog code port to Xilinx devices by teknohog (http://forum.bitcoin.org/index.php?action=profile;u=575).
SHA-256 code and optimizations for Xilinx are based on makomk's code.

Experimenting with it on an LX150T device.

Status:
Tested and working on my Spartan-6 LX150T Development Kit, with LOOP_LOG2=0 or 
LOOP_LOG2=1 in fpgaminer_top.v.

Usage:
scripts/mine.bat can be used to control the board; communicating with a pool 
server and giving work to the FPGA. However, it's very hacky and won't work on 
your system out of the box.

1) Configure the board with the design.
2) Edit scripts/config.example.tcl with your pool server's information, and save to config.tcl.
3) Edit scripts/mine.bat with the correct path to your ISE installation.

NOTE: So, when Xilinx's ISE is installed, it doesn't seem to set any 
environment variables that indicate where it is installed. So mine.bat can't 
just automatically get up and go. That's why it has to be editted for your
specific system. It's an issue that I have not found a work-around for. I could 
probably have it check the obvious places, and that might be good enough. Also 
note that it must run a different Xilinx batch file depending on whether your 
system is 32-bit or 64-bit. That may be detectable from within mine.bat, but I 
haven't checked or coded it up yet.