----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    01:54:56 06/02/2011 
-- Design Name: 
-- Module Name:    sha256_s1 - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sha256_s1 is
    Port ( d : in  STD_LOGIC_VECTOR (31 downto 0);
           q : out  STD_LOGIC_VECTOR (31 downto 0));
end sha256_s1;

architecture Behavioral of sha256_s1 is

begin

	q(31 downto 22) <= d(16 downto 7) xor d(18 downto 9);
	q(21 downto 0) <= (d(6 downto 0) & d(31 downto 17)) xor (d(8 downto 0) & d(31 downto 19)) xor d(31 downto 10);

end Behavioral;

