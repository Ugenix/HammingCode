----------------------------------------------------------------------------------
-- Company: Universitat Politècnica de València
-- Engineer: David de Andrés
-- 
-- Create Date: 01.10.2019 08:58:35
-- Design Name: RegisteredALU
-- Module Name: ArithmeticLogicUnit - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use IEEE.NUMERIC_STD.ALL;

entity ArithmeticLogicUnit is
    Port ( 
      a_i          : in  STD_LOGIC_VECTOR (7 downto 0);              -- first operand
      b_i          : in  STD_LOGIC_VECTOR (7 downto 0);              -- second operand
      ALUControl_i : in  STD_LOGIC_VECTOR (2 downto 0);     -- operation
      zero_o       : out  STD_LOGIC;                         -- zero flag
      ALUResult_o  : out  STD_LOGIC_VECTOR (7 downto 0));    -- result
end ArithmeticLogicUnit;

architecture Behavioral of ArithmeticLogicUnit is

   constant zero : std_logic_vector(7 downto 0) := "00000000";  -- zero
   signal add_result, sub_result, and_result, or_result, slt_result, aux_result : std_logic_vector(7 downto 0); -- result of operations

begin

   add_result <= a_i + b_i;                            -- add result
   sub_result <= a_i - b_i;                            -- sub result (Ca2)
   and_result <= a_i and b_i;                          -- and result
   or_result  <= a_i or b_i;                           -- or result
   
   slt_result(7 downto 1) <= "0000000";                -- slt result bits (7..1)
   slt_result(0) <= '1' when a_i < b_i else            -- slt result bit (0)
                    '0';
                    
   with ALUControl_i select                            -- result depends on ALUControl
   aux_result <= add_result when "010",
                 sub_result when "110",
                 and_result when "000",
                 or_result  when "001",
                 slt_result when "111",
                 "00000000" when others;
                  
   zero_o <= '1' when aux_result = zero else           -- zero flag active when result = x"00"
             '0';
             
   ALUResult_o <= aux_result;                         -- output

end Behavioral;