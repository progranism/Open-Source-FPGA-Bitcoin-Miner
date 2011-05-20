Terasic DE2-115 FPGA Open-Source Bitcoin Miner
==============================================

--------------------------------------------------------------------------------
Copyright (C) 2011 fpgaminer@bitcoin-mining.com
See LICENSE.txt


Purpose
-------

To promote the free and open development of an FPGA based Bitcoin mining solution.
http://www.weusecoins.com/
http://bitcoin.org/


Project Status
--------------

Project is fully functional and allows mining of Bitcoins both in a Pool and Solo.
Can also support Namecoin mining with a minor modification (tested but not documented).

**Current Performance:** 80 MHash/s
*Note: The included default configuration file, and source files, are built for
50 MHash/s performance (downclocked). This is meant to prevent damage to your valuable
chip if you don't provide an appropriate cooling solution.*


Installation Instructions
-------------------------


### Required Equipment:
* DE2-115 Development Kit
* USB Cable
* Windows PC (Linux is also supported, but not documented)
* Altera's Quartus II (installed on PC)


###Instructions:

####Do These Once:

1) *IMPORTANT*: Please remove the clear acrylic cover on your DE2-115 board. This will restrict
air flow and may cause the chip to overheat.

2) Navigate to 'scripts/mine' and EDIT 'mine.tcl' (open in Notepad or other text editor)

3) Locate the following lines:

    set url "http://btcguild.com:8332"
    set userpass "youremailhere@example.com:yourpasswordhere"


Edit accordingly (N.B. the script has only been tested with btcguild and deepbit so far).

4) Save and close 'mine.tcl'

####Do these each time you want to run the miner:

1) Connect the DE2-115 Development Kit to your PC through USB, connect its power, and turn it on.

2) Ensure that the DE2-115's drivers have been installed successfully on your PC.
Consult the DE2-115 User Guide for more information on setting up the DE2-115.

3) Navigate to 'scripts/program' and run 'program-fpga-board.bat'.

4) Follow the instructions provided by the program-fpga-board script.
Select the correct cable and programming file.
Once programming has succeeded, the DE2-115 is now ready to mine!

*Note: This script sometimes fails immediately upon execution. Please try running it again.*

5) Run 'mine.bat'

6) If working correctly, 'mine.bat' will leave a console window open which will fill with diagnostic information as it runs.

7) Profit!


####Notes:
* You need to re-program the DE2-115 every time it is powered off and on again. Repeat steps 1 through 7 for subsequent uses.
* Your PC needs to stay on and connected to the internet. It is acting like a controller for the FPGA,
feeding it data and getting back valid hashes.


Thank You!
--------------------

--------------------



> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
> 
> fpgaminer@bitcoin-mining.com
> 
> Donations are most welcome! 1E1XgiJAzm1Wn7ZWuhkryzBoViBJ7CcRCQ
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.11 (MingW32)
> 
> iQIcBAEBAgAGBQJN1ckDAAoJEFFoGj2A5YKRTmQP/2S/97/LlsNIflOhV+DNF28U
> YlSQeAqFtQqlpJmwIcPp71sPa/WSpop0v00ciec+mQJoJVGaofWvkdP462gTGyES
> NTWbSDeAGR2ARp8DUHNhHFSef83JOS+YqXygvtDCNJjlyZXd7PDFhg4GWN4jhLhZ
> CWwTKVP8Q4QUg1tNLpqLyCKJYtmqgB45XXfXE8coepdfRjeETwqy8b4ODYHWNCQE
> X9Ej9sPFcBtPWB1B+h+NQq5aKPvL1LLahwJ/MB7GYiIkuFhMtcrKiXTMT8j9b3IK
> AGcrCTcMtbjMuADtf9GGkmtmO6/omaEfgojhOFm1l2k+nYPIYVO4HobAIuIJCImm
> KqlhYXqIayBf8DESzbfSWpD1f0lpS16cLval/Hnx5Hk7CP3FCdyTe9RGrn4BcAi1
> CDPIwoOHd0C2o4zqMmsj14MvfjtoUw+NI7BhY5WoVHm04zHN9nyIZmjAPFrp+qM4
> BBaFFJ6tn4mbpUWPG8Iqm3iJqMFPcwNZu9S7GUbKqjlz2rn4FcwNypZqndvdJFus
> G1YkLbI7e0rL3MTf89FCl+XvRfn5cUVAaRDjZVQJOnk/Xsm6D2kiibuwGN+O5Pqj
> IxYZOoxGimwKKzQf0Arr5B+dtNfiSVdupu5etluuiLSboAODECZt83f0L5t+FBhm
> 2vYNW7VNeLA2ZnfDhCHU
> =VdDC
> -----END PGP SIGNATURE-----


