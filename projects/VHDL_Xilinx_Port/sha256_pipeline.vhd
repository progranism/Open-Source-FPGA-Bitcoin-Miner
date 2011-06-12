----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:22:06 05/28/2011 
-- Design Name: 
-- Module Name:    sha256_pipeline - Behavioral 
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

entity sha256_pipeline is
	 generic ( DEPTH : integer );
    Port ( clk : in  STD_LOGIC;
	        step : in  STD_LOGIC_VECTOR (5 downto 0);
           state : in  STD_LOGIC_VECTOR (255 downto 0);
           input : in  STD_LOGIC_VECTOR (511 downto 0);
           hash : out  STD_LOGIC_VECTOR (255 downto 0));
end sha256_pipeline;

architecture Behavioral of sha256_pipeline is

	COMPONENT sha256_transform
	PORT(
		clk : IN std_logic;
		w_in : IN std_logic_vector(511 downto 0);
		s_in : IN std_logic_vector(255 downto 0);          
		w_out : OUT std_logic_vector(511 downto 0);
		s_out : OUT std_logic_vector(255 downto 0);
		k : IN std_logic_vector(31 downto 0)
		);
	END COMPONENT;
	
	type k_array is array(integer range 0 to 63) of std_logic_vector(31 downto 0);
	constant K : k_array := (
		x"428a2f98", x"71374491", x"b5c0fbcf", x"e9b5dba5", x"3956c25b", x"59f111f1", x"923f82a4", x"ab1c5ed5",
		x"d807aa98", x"12835b01", x"243185be", x"550c7dc3", x"72be5d74", x"80deb1fe", x"9bdc06a7", x"c19bf174",
		x"e49b69c1", x"efbe4786", x"0fc19dc6", x"240ca1cc", x"2de92c6f", x"4a7484aa", x"5cb0a9dc", x"76f988da",
		x"983e5152", x"a831c66d", x"b00327c8", x"bf597fc7", x"c6e00bf3", x"d5a79147", x"06ca6351", x"14292967",
		x"27b70a85", x"2e1b2138", x"4d2c6dfc", x"53380d13", x"650a7354", x"766a0abb", x"81c2c92e", x"92722c85",
		x"a2bfe8a1", x"a81a664b", x"c24b8b70", x"c76c51a3", x"d192e819", x"d6990624", x"f40e3585", x"106aa070",
		x"19a4c116", x"1e376c08", x"2748774c", x"34b0bcb5", x"391c0cb3", x"4ed8aa4a", x"5b9cca4f", x"682e6ff3",
		x"748f82ee", x"78a5636f", x"84c87814", x"8cc70208", x"90befffa", x"a4506ceb", x"bef9a3f7", x"c67178f2"
	);
	
	type w_array is array(integer range 0 to 64) of std_logic_vector(511 downto 0);
	signal w : w_array;
	type s_array is array(integer range 0 to 64) of std_logic_vector(255 downto 0);
	signal s : s_array;
	
begin

	w(0) <= input;
	s(0) <= state;
	hash(255 downto 224) <= state(255 downto 224) + s(2 ** DEPTH)(255 downto 224);
	hash(223 downto 192) <= state(223 downto 192) + s(2 ** DEPTH)(223 downto 192);
	hash(191 downto 160) <= state(191 downto 160) + s(2 ** DEPTH)(191 downto 160);
	hash(159 downto 128) <= state(159 downto 128) + s(2 ** DEPTH)(159 downto 128);
	hash(127 downto 96) <= state(127 downto 96) + s(2 ** DEPTH)(127 downto 96);
	hash(95 downto 64) <= state(95 downto 64) + s(2 ** DEPTH)(95 downto 64);
	hash(63 downto 32) <= state(63 downto 32) + s(2 ** DEPTH)(63 downto 32);
	hash(31 downto 0) <= state(31 downto 0) + s(2 ** DEPTH)(31 downto 0);

	rounds: for i in 0 to 2 ** DEPTH - 1 generate
	   signal round_k : std_logic_vector(31 downto 0);
	   signal round_w : std_logic_vector(511 downto 0);
	   signal round_s : std_logic_vector(255 downto 0);
	begin
		round_k <= K(i * 2 ** (6 - DEPTH) + conv_integer(step));
		round_w <= w(i) when step = "000000" else w(i + 1);
		round_s <= s(i) when step = "000000" else s(i + 1);
		
		transform: sha256_transform
			port map (
				clk => clk,
				w_in => round_w,
				w_out => w(i + 1),
				s_in => round_s,
				s_out => s(i + 1),
				k => round_k
			);
	end generate;
	
end Behavioral;

