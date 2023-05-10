


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity errorCorrector is
  Port ( 
    data           : in std_logic_vector (7 downto 0);
    syndrome       : in std_logic_vector (3 downto 0);
    corrected_data : out std_logic_vector (7 downto 0)
  );
end errorCorrector;

architecture Behavioral of errorCorrector is
  
  signal correction : std_logic_vector(7 downto 0);

  begin

  corrected_data <= not(data(7))&data(6 downto 0)                  when syndrome = "0011" else
                    data(7)&not(data(6))&data(5 downto 0)          when syndrome = "0101" else
                    data(7 downto 6)&not(data(5))&data(4 downto 0) when syndrome = "0110" else 
                    data(7 downto 5)&not(data(4))&data(3 downto 0) when syndrome = "0111" else 
                    data(7 downto 4)&not(data(3))&data(2 downto 0) when syndrome = "1001" else 
                    data(7 downto 3)&not(data(2))&data(1 downto 0) when syndrome = "1010" else 
                    data(7 downto 2)&not(data(1))&data(0)          when syndrome = "1011" else 
                    data(7 downto 1)&not(data(0))                  when syndrome = "1100" else 
                    data;

end Behavioral;