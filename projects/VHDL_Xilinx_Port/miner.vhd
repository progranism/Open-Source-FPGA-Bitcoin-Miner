----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:17:26 05/29/2011 
-- Design Name: 
-- Module Name:    miner - Behavioral 
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

entity miner is
	 generic ( DEPTH : integer );
    Port ( clk : in  STD_LOGIC;
	        step : in  STD_LOGIC_VECTOR (5 downto 0);
           data : in  STD_LOGIC_VECTOR (95 downto 0);
           state : in  STD_LOGIC_VECTOR (255 downto 0);
           nonce : in  STD_LOGIC_VECTOR (31 downto 0);
           hit : out  STD_LOGIC);
end miner;

architecture Behavioral of miner is

	COMPONENT sha256_pipeline
	generic ( DEPTH : integer );
	PORT(
		clk : IN std_logic;
      step : in  STD_LOGIC_VECTOR (5 downto 0);
		state : IN std_logic_vector(255 downto 0);
		input : IN std_logic_vector(511 downto 0);          
		hash : OUT std_logic_vector(255 downto 0)
		);
	END COMPONENT;
	
	constant innerprefix : std_logic_vector(383 downto 0) := x"000002800000000000000000000000000000000000000000000000000000000000000000000000000000000080000000";
	constant outerprefix : std_logic_vector(255 downto 0) := x"0000010000000000000000000000000000000000000000000000000080000000";
	constant outerstate : std_logic_vector(255 downto 0) := x"5be0cd191f83d9ab9b05688c510e527fa54ff53a3c6ef372bb67ae856a09e667";
	
	signal innerdata : std_logic_vector(511 downto 0);
	signal outerdata : std_logic_vector(511 downto 0);
	signal innerhash : std_logic_vector(255 downto 0);
	signal outerhash : std_logic_vector(255 downto 0);

begin

	innerdata <= innerprefix & nonce & data;
   outerdata <= outerprefix & innerhash;
	hit <= '1' when outerhash(255 downto 224) = x"00000000" and step = "000000" else '0';
			
	inner: sha256_pipeline
	   generic map ( DEPTH => DEPTH )
		port map (
			clk => clk,
			step => step,
			state => state,
			input => innerdata,
			hash => innerhash
		);					 

	outer: sha256_pipeline
	   generic map ( DEPTH => DEPTH )
		port map (
			clk => clk,
			step => step,
			state => outerstate,
			input => outerdata,
			hash => outerhash
		);					 

end Behavioral;

