----------------------------------------------------------------------------------
-- Company: Universitat Politècnica de València
-- Engineer: David de Andrés
-- 
-- Create Date: 01.10.2019 08:58:35
-- Design Name: RegisteredALU
-- Module Name: RegisterNbits - Behavioral
-- Project Name: SSC Lab2
-- Target Devices: Xilinx Artix-7
-- Tool Versions: Vivado 2019.1
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision: 2.0
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RegisterNbits is
    Generic ( SIZE : natural := 13);
    Port ( rst_i : in  STD_LOGIC;                           -- rst
           clk_i : in  STD_LOGIC;                           -- clock
           en_i  : in  STD_LOGIC;                           -- enable
           d_i   : in  STD_LOGIC_VECTOR (SIZE-1 downto 0);  -- data
           q_o   : out STD_LOGIC_VECTOR (SIZE-1 downto 0)); -- output
end RegisterNbits;

architecture Behavioral of RegisterNbits is

   signal aux : std_logic_vector(SIZE-1 downto 0) := (others => '0');   -- internal storage

begin

   process(rst_i, clk_i)
   begin
      if rst_i = '1' then                      -- asynchronous reset
         aux <= (others => '0');
      elsif clk_i'event and clk_i = '1' then   -- synchronous part
         if en_i = '1' then                     -- store data when enabled
            aux <= d_i;
         end if;
      end if;
   end process;
   
   q_o <= aux;

end Behavioral;
