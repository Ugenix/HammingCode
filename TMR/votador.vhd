
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use IEEE.NUMERIC_STD.ALL;

entity votador is
    Port ( 
      d1, d2, d3 : in STD_LOGIC_VECTOR (7 downto 0);  --Data in
      z1, z2, z3 : out std_logic;                     --Zero in
      data_out   : out STD_LOGIC_VECTOR (7 downto 0); -- Data out
      zero_out   : out std_logic
    );
end votador;

architecture Behavioral of votador is

  

begin

  data_out(7) <= '1' when ( (d1(7) and d2(7)) or (d2(7) and d3(7)) or (d1(7) and d3(7)) ) = '1' else '0';
  data_out(6) <= '1' when ( (d1(6) and d2(6)) or (d2(6) and d3(6)) or (d1(6) and d3(6)) ) = '1' else '0';
  data_out(5) <= '1' when ( (d1(5) and d2(5)) or (d2(5) and d3(5)) or (d1(5) and d3(5)) ) = '1' else '0';
  data_out(4) <= '1' when ( (d1(4) and d2(4)) or (d2(4) and d3(4)) or (d1(4) and d3(4)) ) = '1' else '0';
  data_out(3) <= '1' when ( (d1(3) and d2(3)) or (d2(3) and d3(3)) or (d1(3) and d3(3)) ) = '1' else '0';
  data_out(2) <= '1' when ( (d1(2) and d2(2)) or (d2(2) and d3(2)) or (d1(2) and d3(2)) ) = '1' else '0';
  data_out(1) <= '1' when ( (d1(1) and d2(1)) or (d2(1) and d3(1)) or (d1(1) and d3(1)) ) = '1' else '0';
  data_out(0) <= '1' when ( (d1(0) and d2(0)) or (d2(0) and d3(0)) or (d1(0) and d3(0)) ) = '1' else '0';

  zero_out <= '1' when ( (z1 and z2 or (z2 and z3) or (z1 and z3) ); 
  end behavioral; 
