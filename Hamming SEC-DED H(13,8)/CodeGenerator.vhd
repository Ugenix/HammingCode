-- Lab1 - Fiabilidad
-- Redundancia en la informacion:
-- Codigos de Correccion de errores


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity codeGenerator is
  Port ( 
    data : in  std_logic_vector (7 downto 0);
    code : out std_logic_vector (4 downto 0)
  );
end codeGenerator;

architecture Behavioral of codeGenerator is
  
  signal p : std_logic_vector(4 downto 0);

  begin

    p(0) <= (data(0) xor data(1) xor data(3) xor data(4) xor data(6));  
    p(1) <= (data(0) xor data(2) xor data(3) xor data(5) xor data(6));
    p(2) <= (data(1) xor data(2) xor data(3) xor data(7));
    p(3) <= (data(4) xor data(5) xor data(6) xor data(7));
    p(4) <= (data(0) xor data(1) xor data(2) xor data(3) xor data(4)
             xor data(5) xor data(6) xor data(7));

    code <= p;

end Behavioral;
