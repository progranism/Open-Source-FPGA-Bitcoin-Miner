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
--  SHA256 core using H+K+W precalculation technique
--  Inspired by fpgaminer's sha256_transform.v
 
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity sha256_pc is
generic (
  default_h                     : boolean := true
);
port (
  clk                           : in std_logic;
  reset                         : in std_logic;
  msg_in                        : in std_logic_vector(511 downto 0);
  h_in                          : in std_logic_vector(255 downto 0) := (others => '0');
  digest                        : out std_logic_vector(255 downto 0)
);
end entity sha256_pc;

architecture sha256_pc_rtl of sha256_pc is
  
  alias slv is std_logic_vector;
  subtype msg is unsigned(511 downto 0);
  subtype word is unsigned(31 downto 0);

  function e0(x: unsigned(31 downto 0)) return unsigned is
  begin
    return (x(1 downto 0) & x(31 downto 2)) xor (x(12 downto 0) & x(31 downto 13)) xor (x(21 downto 0) & x(31 downto 22));
  end e0;
  
  function e1(x: unsigned(31 downto 0)) return unsigned is
  begin
    return (x(5 downto 0) & x(31 downto 6)) xor (x(10 downto 0) & x(31 downto 11)) xor (x(24 downto 0) & x(31 downto 25));
  end e1;
  
  function s0(x: unsigned(31 downto 0)) return unsigned is
    variable y : unsigned(31 downto 0);
  begin
    y(31 downto 29)             := x(6 downto 4) xor x(17 downto 15);
    y(28 downto 0)              := (x(3 downto 0) & x(31 downto 7)) xor (x(14 downto 0) & x(31 downto 18)) xor x(31 downto 3);
    return y;
  end s0;
  
  function s1(x: unsigned(31 downto 0)) return unsigned is
    variable y : unsigned(31 downto 0);
  begin
    y(31 downto 22)             := x(16 downto 7) xor x(18 downto 9);
    y(21 downto 0)              := (x(6 downto 0) & x(31 downto 17)) xor (x(8 downto 0) & x(31 downto 19)) xor x(31 downto 10);
    return y;
  end s1;
  
  function ch(x: unsigned(31 downto 0); y: unsigned(31 downto 0); z: unsigned(31 downto 0)) return unsigned is
  begin
    return (x and y) xor (not(x) and z);
  end ch;

  function maj(x: unsigned(31 downto 0); y: unsigned(31 downto 0); z: unsigned(31 downto 0)) return unsigned is
  begin
    return (x and y) xor (x and z) xor (y and z);
  end maj;
  
  type msg_array is array(0 to 63) of msg;
  type word_array is array(0 to 63) of word;
  type hash_array is array(0 to 7) of word;
  
  constant k                    : word_array  := (  X"428a2f98", X"71374491", X"b5c0fbcf", X"e9b5dba5", X"3956c25b", X"59f111f1", X"923f82a4", X"ab1c5ed5",
                                                    X"d807aa98", X"12835b01", X"243185be", X"550c7dc3", X"72be5d74", X"80deb1fe", X"9bdc06a7", X"c19bf174",
                                                    X"e49b69c1", X"efbe4786", X"0fc19dc6", X"240ca1cc", X"2de92c6f", X"4a7484aa", X"5cb0a9dc", X"76f988da",
                                                    X"983e5152", X"a831c66d", X"b00327c8", X"bf597fc7", X"c6e00bf3", X"d5a79147", X"06ca6351", X"14292967",
                                                    X"27b70a85", X"2e1b2138", X"4d2c6dfc", X"53380d13", X"650a7354", X"766a0abb", X"81c2c92e", X"92722c85",
                                                    X"a2bfe8a1", X"a81a664b", X"c24b8b70", X"c76c51a3", X"d192e819", X"d6990624", X"f40e3585", X"106aa070",
                                                    X"19a4c116", X"1e376c08", X"2748774c", X"34b0bcb5", X"391c0cb3", X"4ed8aa4a", X"5b9cca4f", X"682e6ff3",
                                                    X"748f82ee", X"78a5636f", X"84c87814", X"8cc70208", X"90befffa", X"a4506ceb", X"bef9a3f7", X"c67178f2" );

  constant h_default            : hash_array  := (  X"6a09e667", X"bb67ae85", X"3c6ef372", X"a54ff53a", X"510e527f", X"9b05688c", X"1f83d9ab", X"5be0cd19" );
  
  signal w                      : msg_array;
  signal new_w                  : word_array;
  signal t1                     : word_array;
  signal t2                     : word_array;
  signal a                      : word_array;
  signal b                      : word_array;
  signal c                      : word_array;
  signal d                      : word_array;
  signal e                      : word_array;
  signal f                      : word_array;
  signal g                      : word_array;
  signal h                      : word_array;
  signal hkw_precalc            : word_array;
  signal hash                   : hash_array;
  signal h_init                 : hash_array;
  
  signal q_w                    : msg_array;
  signal q_a                    : word_array;
  signal q_b                    : word_array;
  signal q_c                    : word_array;
  signal q_d                    : word_array;
  signal q_e                    : word_array;
  signal q_f                    : word_array;
  signal q_g                    : word_array;
  signal q_h                    : word_array;
  signal q_hkw_precalc          : word_array;
  signal q_hash                 : hash_array;
  signal q_msg                  : msg;
  
begin

  output_mapping: for i in 0 to 7 generate
    --digest((i+1)*32-1 downto i*32) <= slv(q_hash(7-i));
    digest((i+1)*32-1 downto i*32) <= slv(q_hash(i));
  end generate output_mapping;

  default_h_gen: if default_h = true generate
    h_init                      <= h_default;
  end generate default_h_gen;

  h_gen: if default_h = false generate
    h_array_gen: for i in 0 to 7 generate
      h_init(i)                 <= unsigned(h_in((i+1)*32-1 downto i*32));
    end generate h_array_gen;
  end generate h_gen;
  
  hkw_precalc(0)                <= h_init(7) + k(0) + unsigned(msg_in(31 downto 0));
  
  hash_pipeline: for i in 0 to 63 generate
  
    first_stage: if i = 0 generate
      
      t1_no_precalc_gen: if default_h = true generate
        -- no point precalculating when constants are used, so save a clock cycle
        t1(i)                   <= h_init(7) + e1(h_init(4)) + ch(h_init(4), h_init(5), h_init(6)) + k(i) + w(i)(31 downto 0);      
        w(i)                    <= unsigned(msg_in);
      end generate t1_no_precalc_gen;
      
      t1_precalc_gen: if default_h = false generate
        t1(i)                   <= e1(h_init(4)) + ch(h_init(4), h_init(5), h_init(6)) + q_hkw_precalc(i);
        w(i)                    <= q_msg;
      end generate t1_precalc_gen;
      
      t2(i)                     <= e0(h_init(0)) + maj(h_init(0), h_init(1), h_init(2));  
      a(i)                      <= t1(i) + t2(i);
      b(i)                      <= h_init(0);
      c(i)                      <= h_init(1);
      d(i)                      <= h_init(2);
      e(i)                      <= h_init(3) + t1(i);
      f(i)                      <= h_init(4);
      g(i)                      <= h_init(5);
      h(i)                      <= h_init(6);
      hkw_precalc(i+1)          <= h_init(6) + k(i+1) + w(i)(63 downto 32);
    end generate first_stage;
    
    other_stages: if i /= 0 generate

      t1(i)                     <= e1(q_e(i-1)) + ch(q_e(i-1), q_f(i-1), q_g(i-1)) + q_hkw_precalc(i);
      t2(i)                     <= e0(q_a(i-1)) + maj(q_a(i-1), q_b(i-1), q_c(i-1));
      new_w(i)                  <= s1(q_w(i-1)(479 downto 448)) + q_w(i-1)(319 downto 288) + s0(q_w(i-1)(63 downto 32)) + q_w(i-1)(31 downto 0);
      w(i)                      <= new_w(i) & q_w(i-1)(511 downto 32);
      a(i)                      <= t1(i) + t2(i);
      b(i)                      <= q_a(i-1);
      c(i)                      <= q_b(i-1);
      d(i)                      <= q_c(i-1);
      e(i)                      <= q_d(i-1) + t1(i);
      f(i)                      <= q_e(i-1);
      g(i)                      <= q_f(i-1);
      h(i)                      <= q_g(i-1);
      precalc: if i /= 63 generate
        hkw_precalc(i+1)        <= q_g(i-1) + k(i+1) + w(i)(63 downto 32);
      end generate precalc;
    
    end generate other_stages;

  end generate hash_pipeline;
  
  hash(0)                       <= q_a(63) + h_init(0);
  hash(1)                       <= q_b(63) + h_init(1);
  hash(2)                       <= q_c(63) + h_init(2);
  hash(3)                       <= q_d(63) + h_init(3);
  hash(4)                       <= q_e(63) + h_init(4);
  hash(5)                       <= q_f(63) + h_init(5);
  hash(6)                       <= q_g(63) + h_init(6);
  hash(7)                       <= q_h(63) + h_init(7);
  
  registers : process(clk, reset) is
  begin
    if reset = '1' then
      null;
    elsif rising_edge(clk) then
      q_msg                     <= unsigned(msg_in);
      q_w                       <= w;
      q_a                       <= a;
      q_b                       <= b;
      q_c                       <= c;
      q_d                       <= d;
      q_e                       <= e;
      q_f                       <= f;
      q_g                       <= g;
      q_h                       <= h;
      q_hkw_precalc             <= hkw_precalc;
      q_hash                    <= hash;
    end if;
  end process registers;
  
end architecture sha256_pc_rtl;
  