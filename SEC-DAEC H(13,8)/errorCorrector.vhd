


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity errorCorrector is
  Port ( 
    data           : in std_logic_vector (7 downto 0);
    syndrome       : in std_logic_vector (4 downto 0);
    corrected_data : out std_logic_vector (7 downto 0)
  );
end errorCorrector;

architecture Behavioral of errorCorrector is

  begin

  corrected_data <= data(7 downto 1)&not(data(0))                  when syndrome(3 downto 0) = "0011" else
                    data(7 downto 2)&not(data(1))&data(0)          when syndrome(3 downto 0) = "0101" else
                    data(7 downto 3)&not(data(2))&data(1 downto 0) when syndrome(3 downto 0) = "0110" else 
                    data(7 downto 4)&not(data(3))&data(2 downto 0) when syndrome(3 downto 0) = "0111" else 
                    data(7 downto 5)&not(data(4))&data(3 downto 0) when syndrome(3 downto 0) = "1001" else 
                    data(7 downto 6)&not(data(5))&data(4 downto 0) when syndrome(3 downto 0) = "1010" else 
                    data(7)&not(data(6))&data(5 downto 0)          when syndrome(3 downto 0) = "1011" else 
                    not(data(7))&data(6 downto 0)                  when syndrome(3 downto 0) = "1100" else
                    
                    data(7 downto 2)&not(data(1))&not(data(0))                        when syndrome="01111" else
                    data(7 downto 5)&not(data(4))&not(data(3))&data(2 downto 0)       when syndrome="10011" else
                    data(7 downto 4)&not(data(3))&not(data(2))&data(1 downto 0)       when syndrome="10110" else
                    data(7 downto 3)&not(data(2))&not(data(1))&data(0)                when syndrome="11011" else
                    data(7)&not(data(6))&not(data(5))&data(4 downto 0)                when syndrome="11001" else
                    not(data(7))&not(data(6))&data(5 downto 0)                        when syndrome="01110" else
                    data(7 downto 6)&not(data(5))&not(data(4))&data(3 downto 0)       when syndrome="11111" else
 
                    data;

end Behavioral;