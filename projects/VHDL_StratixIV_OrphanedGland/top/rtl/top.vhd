--  
--  Copyright (c) 2011 OrphanedGland (wilhelm.klink@gmail.com)
--  Send donations to : 1PioyqqFWXbKryxysGqoq5XAu9MTRANCEP
--
--  This program is free software: you can redistribute it and/or modify
--  it under the terms of the GNU General Public License as published by
--  the Free Software Foundation, either version 3 of the License, or
--  (at your option) any later version.
-- 
--  This program is distributed in the hope that it will be useful,
--  but WITHOUT ANY WARRANTY; without even the implied warranty of
--  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
--  GNU General Public License for more details.
-- 
--  You should have received a copy of the GNU General Public License
--  along with this program.  If not, see <http://www.gnu.org/licenses/>.
-- 
--  Top level file for bitcoin FPGA miner
--
--  The number of parallel SHA256 pairs is set via the NUM_CORES constant
--
--  Two different types of SHA256 cores can be selected by setting
--  the constant SHA256_SEL
--  SHA256_SEL = 0 => Pre-calculation of H+K+W used
--  SHA256_SEL = 1 => Quasi-pipelining used
--  
--  This is largely a port of fpgaminer's fpgaminer_top.v (cb24cc3)

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top is
port (
  OSC_CLK                       : in std_logic
);
end entity top;

architecture top_rtl of top is
  
  alias slv is std_logic_vector;
  subtype slv512 is slv(511 downto 0);
  subtype slv256 is slv(255 downto 0);
  subtype slv32 is slv(31 downto 0);
  subtype word is unsigned(31 downto 0);
  
  component pll is
	port (
		inclk0                    : in std_logic  := '0';
		c0                        : out std_logic 
	);
  end component pll;
  
  component altsource_probe is
  generic (
    enable_metastability        : string := "NO";
    instance_id                 : string := "UNUSED";
    lpm_hint                    : string := "altsource_probe";
    lpm_type                    : string := "altsource_probe";
    probe_width                 : natural := 1;
    sld_auto_instance_index     : string := "YES";
    sld_instance_index          : natural := 0;
    source_initial_value        : string := "0";
    source_width                : natural := 1
  );
  port (
    probe                       : in std_logic_vector(PROBE_WIDTH-1 downto 0) := (others => '0');
    source                      : out std_logic_vector(SOURCE_WIDTH-1 downto 0);
    source_clk                  : in std_logic := '0';
    source_ena                  : in std_logic := '1'
  );
  end component altsource_probe;
  
  component sha256_pc is
  generic (
    default_h                   : boolean := true
  );
  port (
    clk                         : in std_logic;
    reset                       : in std_logic;
    msg_in                      : in std_logic_vector(511 downto 0);
    h_in                        : in std_logic_vector(255 downto 0) := (others => '0');
    digest                      : out std_logic_vector(255 downto 0)
  );
  end component sha256_pc;
  
  component sha256_qp is
  generic (
    default_h                   : boolean := true
  );
  port (
    clk                         : in std_logic;
    reset                       : in std_logic;
    msg_in                      : in std_logic_vector(511 downto 0);
    h_in                        : in std_logic_vector(255 downto 0) := (others => '0');
    digest                      : out std_logic_vector(255 downto 0)
  );
  end component sha256_qp;
  
  constant NUM_CORES            : natural := 4;
  -- SHA256_SEL = 0 => sha256_pc, uses precalculated H + K + W technique
  -- SHA256_SEL = 1 => sha256_qp, uses quasi-pipelining technique
  constant SHA256_SEL           : natural := 0;
  
  type data_array is array(NUM_CORES-1 downto 0) of slv512;
  type digest_array is array(NUM_CORES-1 downto 0) of slv256;
  type nonce_array is array(NUM_CORES-1 downto 0) of word;
  
  signal clk                    : std_logic;
  signal reset                  : std_logic := '0';
  signal data_1                 : data_array;
  signal digest_1               : digest_array;
  signal data_2                 : data_array;
  signal digest_2               : digest_array;
  signal data_in                : slv256;
  signal h_in                   : slv256;
  
  signal q_data_in              : slv256 := (others => '0');
  signal q_h_in                 : slv256 := (others => '0');
  signal q_nonce                : nonce_array;
  signal q_golden_nonce         : slv32 := (others => '0');
  
begin
  
  pll_inst: pll
	port map (
    inclk0                      => OSC_CLK,
    c0                          => clk
	);
  
  -- in-system debugging I/O
  data_source: altsource_probe
  generic map (
    instance_id                 => "DAT2",
    probe_width                 => 0,
    source_width                => 256
  )
  port map (
    source                      => data_in
  );
  
  h_source: altsource_probe
  generic map (
    instance_id                 => "STAT",
    probe_width                 => 0,
    source_width                => 256
  )
  port map (
    source                      => h_in
  );
  
  gnon_probe: altsource_probe
  generic map (
    instance_id                 => "GNON",
    probe_width                 => 32,
    source_width                => 0
  )
  port map (
    probe                       => q_golden_nonce
  );
  
  sha256_gen: for i in NUM_CORES-1 downto 0 generate
  
    data_1(i)                   <= X"000002800000000000000000000000000000000000000000000000000000000000000000000000000000000080000000" & slv(q_nonce(i)) & q_data_in(95 downto 0);
    data_2(i)                   <= X"0000010000000000000000000000000000000000000000000000000080000000" & digest_1(i);
  
    sha256_pc_gen: if SHA256_SEL = 0 generate
      
      sha256_1: sha256_pc
      generic map (
        default_h               => false
      )
      port map (
        clk                     => clk,
        reset                   => reset,
        msg_in                  => data_1(i),
        h_in                    => q_h_in,
        digest                  => digest_1(i)
      );
    
      sha256_2: sha256_pc
      generic map (
        default_h               => true
      )
      port map (
        clk                     => clk,
        reset                   => reset,
        msg_in                  => data_2(i),
        digest                  => digest_2(i)
      );
    
    end generate sha256_pc_gen;
    
    sha256_qp_gen: if SHA256_SEL = 1 generate
    
      sha256_1: sha256_qp
      generic map (
        default_h               => false
      )
      port map (
        clk                     => clk,
        reset                   => reset,
        msg_in                  => data_1(i),
        h_in                    => q_h_in,
        digest                  => digest_1(i)
      );
    
      sha256_2: sha256_qp
      generic map (
        default_h               => true
      )
      port map (
        clk                     => clk,
        reset                   => reset,
        msg_in                  => data_2(i),
        digest                  => digest_2(i)
      );
    
    end generate sha256_qp_gen;

  end generate sha256_gen;
    
  registers: process(clk, reset)
  begin
    if reset = '1' then
      q_data_in                 <= (others => '0');
      q_h_in                    <= (others => '0');
      q_nonce(0)                <= (others => '0');
      for i in NUM_CORES-1 downto 1 loop
        q_nonce(i)              <= to_unsigned(i,q_nonce(i)'length);
      end loop;
      q_golden_nonce            <= (others => '0');
    elsif rising_edge(clk) then
      q_data_in                 <= data_in;
      q_h_in                    <= h_in;
      for i in NUM_CORES-1 downto 0 loop
        q_nonce(i)              <= q_nonce(0) + i + NUM_CORES;
        if digest_2(i)(255 downto 224) = X"00000000" then
          if SHA256_SEL = 0 then
            q_golden_nonce      <= slv(q_nonce(i) - NUM_CORES*131);
          else
            q_golden_nonce      <= slv(q_nonce(i) - NUM_CORES*134);
          end if;
        end if;
      end loop;
    end if;
  end process registers;

end architecture top_rtl;
  