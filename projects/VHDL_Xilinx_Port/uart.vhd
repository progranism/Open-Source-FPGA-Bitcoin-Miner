----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:16:44 05/29/2011 
-- Design Name: 
-- Module Name:    uart - Behavioral 
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
use IEEE.std_logic_misc.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity uart is
    Port ( clk : in  STD_LOGIC;
           tx : out  STD_LOGIC;
           rx : in  STD_LOGIC;
           txdata : in  STD_LOGIC_VECTOR (48 downto 0);
           txwidth : in  STD_LOGIC_VECTOR (5 downto 0);
           txstrobe : in  STD_LOGIC;
           txbusy : out  STD_LOGIC;
           rxdata : out  STD_LOGIC_VECTOR (7 downto 0);
           rxstrobe : out  STD_LOGIC);
end uart;

architecture Behavioral of uart is

	signal txclk : std_logic := '0';
	signal rxclk : std_logic := '0';
	signal txclkdiv : std_logic_vector(10 downto 0);
	signal rxclkdiv : std_logic_vector(10 downto 0);
	signal txclksync : std_logic := '0';
	signal rxclksync : std_logic := '0';
	signal txdatabuf : std_logic_vector(48 downto 0) := "0000000000000000000000000000000000000000000000000";
	signal txdataleft : std_logic_vector(5 downto 0) := "000000";
	signal txbusy_src : std_logic := '0';
	signal rxdata_src : std_logic_vector(7 downto 0);
	signal rxbits : std_logic_vector(3 downto 0);
	signal rxbusy : std_logic := '0';
	signal rx1 : std_logic;
	signal rx2 : std_logic;

begin

	tx <= txdatabuf(0);
	txclk <= '1' when txclkdiv = "00000000000" and txclksync = '0' else '0';
	rxclk <= '1' when rxclkdiv = "00000000000" and rxclksync = '0' else '0';
	txbusy_src <= '0' when txdataleft = "000000" else '1';
	txbusy <= txbusy_src;
	rxdata <= rxdata_src;

	process(clk)
	begin
		if rising_edge(clk) then
			rx1 <= rx;
			rx2 <= rx1;
		end if;
	end process;
	
	process(clk)
	begin
		if rising_edge(clk) then
			if txclksync = '1' or txclkdiv = "00000000000" then
				txclkdiv <= "10000010001";
			else
				txclkdiv <= txclkdiv - 1;
			end if;
		end if;
	end process;
	
	process(clk)
	begin
		if rising_edge(clk) then
			if rxclksync = '1' then
				rxclkdiv <= "11000011001";
			elsif rxclkdiv = "00000000000000" then
				rxclkdiv <= "10000010001";
			else
				rxclkdiv <= rxclkdiv - 1;
			end if;
		end if;
	end process;	

	process(clk)
	begin
		if rising_edge(clk) then
			if txstrobe = '1' and txbusy_src = '0' then
				txdatabuf <= txdata;
				txdataleft <= txwidth;
				txclksync <= '1';
			else
				if txclk = '1' then
					txdatabuf(47 downto 0) <= txdatabuf(48 downto 1);
					txdatabuf(48) <= '1';
					if txbusy_src = '1' then 
						txdataleft <= txdataleft - 1;
					end if;
				end if;
				txclksync <= '0';
			end if;
		end if;
	end process;
	
	process(clk)
	begin
		if rising_edge(clk) then
			if rxbusy = '1' then
				if rxclk = '1' then
					if rxbits = "1000" then
						rxbusy <= '0';
						rxstrobe <= '1';
					else
						rxdata_src(6 downto 0) <= rxdata_src(7 downto 1);
						rxdata_src(7) <= rx2;
						rxbits <= rxbits + 1;
						rxbusy <= '1';
						rxstrobe <= '0';
					end if;
				end if;
				rxclksync <= '0';
			elsif rx2 = '0' then
				rxbits <= "0000";
				rxbusy <= '1';
				rxclksync <= '1';
				rxstrobe <= '0';
			else
				rxbusy <= '0';
				rxclksync <= '0';
				rxstrobe <= '0';
			end if;
		end if;
	end process;	

end Behavioral;

