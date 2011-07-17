Stratix IV FPGA Open-Source Bitcoin Miner
=========================================

OrphanedGland (wilhelm.klink@gmail.com)  
Send donations to : 1PioyqqFWXbKryxysGqoq5XAu9MTRANCEP

In this fork I have added two new SHA256 core implementations written in
VHDL, along with the option to vary the number of parallel SHA256 pairs.   
The top level file is projects/VHDL_StratixIV_OrphanedGland/top/rtl/top.vhd.  
The number of parallel SHA256 pairs is set via the NUM_CORES constant.

Two different types of SHA256 cores can be selected by setting
the constant SHA256_SEL:

* SHA256_SEL = 0 => Pre-calculation of H+K+W used  
* SHA256_SEL = 1 => Quasi-pipelining used  

I have compiled the project with NUM_CORES = 4 and SHA256_SEL = 0 for the 
Stratix IV EP4SE530.  Logic utilization is 68% and clock rate is 195MHz
(Slow 900mV 85C Model).  Total hash rate is given by the clock rate multiplied
by the number of cores.  The PLL should be adjusted to match the clock rate that
can be achieved.

Note that this design has been simulated but not tested on hardware.