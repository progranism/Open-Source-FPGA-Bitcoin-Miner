----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:18:21 05/28/2011 
-- Design Name: 
-- Module Name:    top - Behavioral 
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

library UNISIM;
use UNISIM.VComponents.all;

entity top is
   port (
		clk_in : in  STD_LOGIC;
		tx     : out STD_LOGIC;
		rx     : in  STD_LOGIC
	);
end top;

architecture Behavioral of top is

	COMPONENT miner
	generic ( DEPTH : integer );
	PORT(
		clk : IN std_logic;
		step : IN std_logic_vector(5 downto 0);
		data : IN std_logic_vector(95 downto 0);
		state : IN  STD_LOGIC_VECTOR (255 downto 0);
		nonce : IN std_logic_vector(31 downto 0);          
		hit : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT uart
	PORT(
		clk : IN std_logic;
		rx : IN std_logic;
		txdata : IN std_logic_vector(48 downto 0);
		txwidth : IN std_logic_vector(5 downto 0);
		txstrobe : IN std_logic;
		txbusy : OUT std_logic;          
		tx : OUT std_logic;
		rxdata : OUT std_logic_vector(7 downto 0);
		rxstrobe : OUT std_logic
		);
	END COMPONENT;
	
	constant DEPTH : integer := 6;

	signal clk : std_logic;
	signal clk_dcmin : std_logic;
	signal clk_dcmout : std_logic;
	signal data : std_logic_vector(95 downto 0);
	signal state : std_logic_vector(255 downto 0);
	signal nonce : std_logic_vector(31 downto 0);
	signal currnonce : std_logic_vector(31 downto 0);
	signal load : std_logic_vector(343 downto 0);
	signal loadctr : std_logic_vector(5 downto 0);
	signal loading : std_logic := '0';
	signal hit : std_logic;
	signal txdata : std_logic_vector(48 downto 0);
	signal txwidth : std_logic_vector(5 downto 0);
	signal txstrobe : std_logic;
	signal rxdata : std_logic_vector(7 downto 0);
	signal rxstrobe : std_logic;
	signal step : std_logic_vector(5 downto 0) := "000000";
	
begin

					 
	currnonce <= nonce - 2 * 2 ** DEPTH;

  clk_buf : BUFG
      port map (I=>clk_dcmout,
                O=>clk);
					 
  clk_in_buf : IBUFG
      port map (I=>clk_in,
                O=>clk_dcmin);
					 
	dcm : DCM_BASE
		generic map (
			CLKDV_DIVIDE => 2.0, -- Divide by: 1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5,6.0,6.5
			-- 7.0,7.5,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0 or 16.0
			CLKFX_DIVIDE => 10, -- Can be any interger from 1 to 32
			CLKFX_MULTIPLY => 12, -- Can be any integer from 2 to 32
			CLKIN_DIVIDE_BY_2 => FALSE, -- TRUE/FALSE to enable CLKIN divide by two feature
			CLKIN_PERIOD => 10.0, -- Specify period of input clock in ns from 1.25 to 1000.00
			CLKOUT_PHASE_SHIFT => "NONE", -- Specify phase shift mode of NONE or FIXED
			CLK_FEEDBACK => "NONE", -- Specify clock feedback of NONE or 1X
			DCM_AUTOCALIBRATION => TRUE,
			DCM_PERFORMANCE_MODE => "MAX_SPEED", -- Can be MAX_SPEED or MAX_RANGE
			DESKEW_ADJUST => "SYSTEM_SYNCHRONOUS", -- SOURCE_SYNCHRONOUS, SYSTEM_SYNCHRONOUS or
			-- an integer from 0 to 15
			DFS_FREQUENCY_MODE => "LOW", -- LOW or HIGH frequency mode for frequency synthesis
			DLL_FREQUENCY_MODE => "LOW", -- LOW, HIGH, or HIGH_SER frequency mode for DLL
			DUTY_CYCLE_CORRECTION => TRUE, -- Duty cycle correction, TRUE or FALSE
			FACTORY_JF => X"F0F0", -- FACTORY JF Values Suggested to be set to X"F0F0"
			PHASE_SHIFT => 0, -- Amount of fixed phase shift from -255 to 1023
			STARTUP_WAIT => TRUE
		) -- Delay configuration DONE until DCM LOCK, TRUE/FALSE
		port map (
			CLK0 => open, -- 0 degree DCM CLK ouptput
			CLK180 => open, -- 180 degree DCM CLK output
			CLK270 => open, -- 270 degree DCM CLK output
			CLK2X => open, -- 2X DCM CLK output
			CLK2X180 => open, -- 2X, 180 degree DCM CLK out
			CLK90 => open, -- 90 degree DCM CLK output
			CLKDV => open, -- Divided DCM CLK out (CLKDV_DIVIDE)
			CLKFX => clk_dcmout, -- DCM CLK synthesis out (M/D)
			CLKFX180 => open, -- 180 degree CLK synthesis out
			LOCKED => open, -- DCM LOCK status output
			CLKFB => '0', -- DCM clock feedback
			CLKIN => clk_dcmin, -- Clock input (from IBUFG, BUFG or DCM)
			RST => '0' -- DCM asynchronous reset input
		);

	miner0: miner
	   generic map ( DEPTH => DEPTH )
		port map (
			clk => clk,
			step => step,
			data => data,
			state => state,
			nonce => nonce,
			hit => hit
		);

	serial: uart
		port map (
			clk => clk,
			tx => tx,
			rx => rx,
			txdata => txdata,
			txwidth => txwidth,
			txstrobe => txstrobe,
			txbusy => open,
			rxdata => rxdata,
			rxstrobe => rxstrobe 
		);
		
	process(clk)
	begin
		if rising_edge(clk) then
			step <= step + 1;
			if conv_integer(step) = 2 ** (6 - DEPTH) - 1 then
				step <= "000000";
				nonce <= nonce + 1;
			end if;
			txdata <= "-------------------------------------------------";
			txwidth <= "------";
			txstrobe <= '0';
			if rxstrobe = '1' then
				if loading = '1' then
					if loadctr = "101011" then
						state <= load(343 downto 88);
						data <= load(87 downto 0) & rxdata;
						nonce <= x"00000000";
						txdata <= "1111111111111111111111111111111111111111000000010";
						txwidth <= "001010";
						txstrobe <= '1';
						loading <= '0';
					else
						load(343 downto 8) <= load(335 downto 0);
						load(7 downto 0) <= rxdata;
						loadctr <= loadctr + 1;
					end if;
				else
					if rxdata = "00000000" then
						txdata <= "1111111111111111111111111111111111111111000000000";
						txwidth <= "001010";
						txstrobe <= '1';
					elsif rxdata = "00000001" then
					   loadctr <= "000000";
						loading <= '1';
					end if;
				end if;
			elsif hit = '1' then
				txdata <= currnonce(7 downto 0) & "01" & currnonce(15 downto 8) & "01" & currnonce(23 downto 16) & "01" & currnonce(31 downto 24) & "01000000100";
				txwidth <= "110010";
				txstrobe <= '1';
			elsif nonce = x"ffffffff" and step = "000000" then
				txdata <= "1111111111111111111111111111111111111111000000110";
				txwidth <= "110010";
				txstrobe <= '1';
			end if;
		end if;
	end process;	
	

end Behavioral;

