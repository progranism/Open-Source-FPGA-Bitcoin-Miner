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
It also supports Namecoins.

**Current Performance:** 80 MHash/s

*Note: The included default configuration file, and source files, are built for
50 MHash/s performance (downclocked). This is meant to prevent damage to your valuable
chip if you don't provide an appropriate cooling solution.*


Installation Instructions
-------------------------


### Required Equipment:
* DE2-115 Development Kit (this is *not* a DE2. It has a Cyclone IV EP4CE115.)
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



```
-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

fpgaminer@bitcoin-mining.com
Donation Address: 1E1XgiJAzm1Wn7ZWuhkryzBoViBJ7CcRCQ

Donations are most welcome! They will be used to buy more equipment. I'm currently trying to get
an ethernet module up and running so the miner can run all on its own.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (MingW32)

iQIcBAEBAgAGBQJN1dAzAAoJEFFoGj2A5YKRt/IP/3LaZlEWvdUpAxcs5ANS3fcA
NdKFiIycfnBKtmXjXiHQk4DZY+tbvuPPggzFHBA7k+3wV3WBOF2rjQiorODZff6q
xb6gSVINUXucv/+SDzqx8CtjMa17wzSayiczC03t+IICYs2/atdLAFvbr0LwdbqZ
oBQRgYK4hD39fQzD8v/L26glh3va72ZibuO043uH/WMFgcQseTFHF7QPLJm0k0A/
nx5p0cTtqqSf4g9MQICnNU8MGVrXXOGZU4DeItbJjNcvsomzmibha+9jQ2K8XD8F
KzbdTK+YzvdzcDMaeOgs70SnVEFfUS1ykbdDC850M6qkRP79HBqH7Neq1Rld5ktj
Mrd2hHC4NC0fgMD3hUbTjfIcCZOPwKYvp5oCLYYO1CqzV64Ag0o9qZDr8FS+9Npv
PEbWQpQuZqqtkhppVcCmOv4bl8XWTuQJEoxP8rWkJdfhkDUt5hwQsFrMQB7goXDc
pJZu1wnWdzpgcDyNjkNDp6sqnJGzCgft7o3hPiZO79BZZRLtdRSMHa0RdJJK5zLv
8JqOJCJUFhVZHSKsHyGdJHppjKk/yZbBGLuJUTAfrMk5I/X5b/V9TGiWKoPN3zce
Hdd5LQF5Z881wCgrnPz2dwR5oXMUcWqd//ZAs7Jcnvp6Bz5HWrFH5FBgpfg0K3c6
qBmd3GhQgxnFsBW62dAJ
=Lvja
-----END PGP SIGNATURE-----
```


