library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity top_tb_pc is
end entity top_tb_pc;

architecture top_tb_pc_behav of top_tb_pc is
  
  alias slv is std_logic_vector;
  subtype slv512 is slv(511 downto 0);
  subtype slv256 is slv(255 downto 0);
  subtype slv32 is slv(31 downto 0);
  subtype word is unsigned(31 downto 0);
  
  component pll is
	port (
		inclk0		                  : in std_logic  := '0';
		c0		                      : out std_logic 
	);
  end component pll;
    
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
  constant tclk_40              : time := 25 ns;
  
  type data_array is array(NUM_CORES-1 downto 0) of slv512;
  type digest_array is array(NUM_CORES-1 downto 0) of slv256;
  type nonce_array is array(NUM_CORES-1 downto 0) of word;
  
  signal OSC_CLK                : std_logic := '0';
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
  
  reset                         <= '1','0' after 2.5 * tclk_40;
  
  data_in                       <= X"00000000000000000000000080000000000000002194261a9395e64dbed17115";
  h_in                          <= X"228ea4732a3c9ba860c009cda7252b9161a5e75ec8c582a5f106abb3af41f790";
  
  clk_gen: process is
  begin
      OSC_CLK                   <= not OSC_CLK;
      wait for tclk_40/2;
  end process clk_gen;
  
  pll_inst: pll
	port map (
		inclk0		                  => OSC_CLK,
		c0		                      => clk
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
      q_nonce(0)                <= X"0e33337a" - 256;
      for i in NUM_CORES-1 downto 1 loop
        q_nonce(i)              <= q_nonce(0) + i;
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

end architecture top_tb_pc_behav;
  