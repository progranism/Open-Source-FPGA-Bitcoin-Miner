----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:21:05 05/28/2011 
-- Design Name: 
-- Module Name:    sha256_transform - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sha256_transform is
    Port ( clk : in  STD_LOGIC;
           w_in : in  STD_LOGIC_VECTOR (511 downto 0);
           w_out : out  STD_LOGIC_VECTOR (511 downto 0);
           s_in : in  STD_LOGIC_VECTOR (255 downto 0);
           s_out : out  STD_LOGIC_VECTOR (255 downto 0);
			  k : std_logic_vector(31 downto 0));
end sha256_transform;

architecture Behavioral of sha256_transform is

	COMPONENT sha256_e0
	PORT(
		d : IN std_logic_vector(31 downto 0);          
		q : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT sha256_e1
	PORT(
		d : IN std_logic_vector(31 downto 0);          
		q : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	COMPONENT sha256_ch
	PORT(
		x : IN std_logic_vector(31 downto 0);
		y : IN std_logic_vector(31 downto 0);
		z : IN std_logic_vector(31 downto 0);          
		q : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT sha256_maj
	PORT(
		x : IN std_logic_vector(31 downto 0);
		y : IN std_logic_vector(31 downto 0);
		z : IN std_logic_vector(31 downto 0);          
		q : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT sha256_s0
	PORT(
		d : IN std_logic_vector(31 downto 0);          
		q : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	COMPONENT sha256_s1
	PORT(
		d : IN std_logic_vector(31 downto 0);          
		q : OUT std_logic_vector(31 downto 0)
		);
	END COMPONENT;

	signal e0 : std_logic_vector(31 downto 0);
	signal e1 : std_logic_vector(31 downto 0);
	signal ch : std_logic_vector(31 downto 0);
	signal maj : std_logic_vector(31 downto 0);
	signal s0 : std_logic_vector(31 downto 0);
	signal s1 : std_logic_vector(31 downto 0);
	signal t : std_logic_vector(31 downto 0);

begin

	calc_e0: sha256_e0
		port map (
			d => s_in(31 downto 0),
			q => e0
		);

	calc_e1: sha256_e1
		port map (
			d => s_in(159 downto 128),
			q => e1
		);

	calc_ch: sha256_ch
		port map (
			x => s_in(159 downto 128),
			y => s_in(191 downto 160),
			z => s_in(223 downto 192),
			q => ch
		);

	calc_maj: sha256_maj
		port map (
			x => s_in(31 downto 0),
			y => s_in(63 downto 32),
			z => s_in(95 downto 64),
			q => maj
		);

	calc_s0: sha256_s0
		port map (
			d => w_in(63 downto 32),
			q => s0
		);

	calc_s1: sha256_s1
		port map (
			d => w_in(479 downto 448),
			q => s1
		);

   t <= s_in(255 downto 224) + e1 + ch + w_in(31 downto 0) + k;
	
	process(clk)
	begin
		if rising_edge(clk) then
			w_out(511 downto 480) <= s1 + w_in(319 downto 288) + s0 + w_in(31 downto 0);
			w_out(479 downto 0) <= w_in(511 downto 32);
			s_out(255 downto 160) <= s_in(223 downto 128);
			s_out(159 downto 128) <= s_in(127 downto 96) + t;
			s_out(127 downto 32) <= s_in(95 downto 0);
			s_out(31 downto 0) <= t + e0 + maj;
		end if;
	end process;	

end Behavioral;

