library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sha256_tb is
end entity sha256_tb;

architecture sha256_tb_behav of sha256_tb is
  
  alias slv is std_logic_vector;
  
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
  
  -- SHA256_SEL = 0 => sha256_pc, uses precalculated H + K + W technique
  -- SHA256_SEL = 1 => sha256_qp, uses quasi-pipelining technique
  constant SHA256_SEL           : natural := 0;
  constant tclk_125             : time := 8 ns;
  
  signal clk                    : std_logic := '0';
  signal reset                  : std_logic;
  signal msg_in                 : slv(511 downto 0) := (others => '0');
  signal digest                 : slv(255 downto 0);

begin
  
  reset                         <= '1','0' after 12.5 * tclk_125;
  
  sha256_pc_gen: if SHA256_SEL = 0 generate
    
    sha256: sha256_pc
    generic map (
      default_h                 => true
    )
    port map (
      clk                       => clk,
      reset                     => reset,
      msg_in                    => msg_in,
      digest                    => digest
    );
    
  end generate sha256_pc_gen;
  
  sha256_qp_gen: if SHA256_SEL = 1 generate
    
    sha256: sha256_qp
    generic map (
      default_h                 => true
    )
    port map (
      clk                       => clk,
      reset                     => reset,
      msg_in                    => msg_in,
      digest                    => digest
    );
    
  end generate sha256_qp_gen;
  
  msg_gen: process is
  begin
    wait until reset = '0';
    -- input message 'abc' after padding
    msg_in                      <=  X"00000018" & X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"00000000" &
                                    X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"61626380";
    wait for tclk_125;
    -- input message 'hello' after padding
    msg_in                      <=  X"00000028" & X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"00000000" &
                                    X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"6F800000" & X"68656C6C";
    wait for tclk_125;
    -- input message 'bitcoin' after padding
    msg_in                      <=  X"00000038" & X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"00000000" &
                                    X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"00000000" & X"6F696E80" & X"62697463";
  end process msg_gen;
  
  clk_gen: process is
  begin
      clk                       <= not clk;
      wait for tclk_125/2;
  end process clk_gen;

end architecture sha256_tb_behav;
  