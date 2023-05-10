

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity syndromeGenerator is
  Port ( 
    code1    : in std_logic_vector (3 downto 0);
    code2    : in std_logic_vector (3 downto 0);
    syndrome : out std_logic_vector(3 downto 0)
  );
end syndromeGenerator;

architecture Behavioral of syndromeGenerator is
  
  signal s : std_logic_vector(3 downto 0);

  begin

    s(0) <= code1(0) xor code2(0);
    s(1) <= code1(1) xor code2(1);
    s(2) <= code1(2) xor code2(2);
    s(3) <= code1(3) xor code2(3);

   syndrome <= s;

end Behavioral;