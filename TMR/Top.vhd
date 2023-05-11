

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

use IEEE.NUMERIC_STD.ALL;

entity EDAC is
    Port ( 
      op_i               : in  STD_LOGIC_VECTOR (2 downto 0);  -- Operation
      data_in1, data_in2 : in STD_LOGIC_VECTOR (7 downto 0);
      zero_o             : out std_logic;
      data_out           : out STD_LOGIC_VECTOR (7 downto 0)
    );
end EDAC;

architecture Behavioral of EDAC is

  signal o_alu1, o_alu2, o_alu3                : std_logic_vector (7 downto 0);
  signal zero_o_alu1, zero_o_alu2, zero_o_alu3 : std_logic;
  signal zero_out : std_logic;
  signal data_out_aux : std_logic_vector (7 downto 0);

  component ArithmeticLogicUnit is
    port(
      a_i          : in  STD_LOGIC_VECTOR (7 downto 0); -- first operand
      b_i          : in  STD_LOGIC_VECTOR (7 downto 0); -- second operand
      ALUControl_i : in  STD_LOGIC_VECTOR (2 downto 0); -- operation
      zero_o       : out  STD_LOGIC;                    -- zero flag
      ALUResult_o  : out  STD_LOGIC_VECTOR (7 downto 0) -- result
    );
  end component; 

  component votador is
    port(
      d1, d2, d3 : in STD_LOGIC_VECTOR (7 downto 0);  -- Data in
      z1, z2, z3 : in std_logic;                      -- Zero in
      data_out   : out STD_LOGIC_VECTOR (7 downto 0); -- Data out
      zero_out   : out std_logic
    );
  end component; 

begin

  M1 : ArithmeticLogicUnit port map(data_in1, data_in2, op_i, zero_o_alu1, o_alu1);
  M2 : ArithmeticLogicUnit port map(data_in1, data_in2, op_i, zero_o_alu2, o_alu2);
  M3 : ArithmeticLogicUnit port map(data_in1, data_in2, op_i, zero_o_alu3, o_alu3);

  v  : votador port map(o_alu1, o_alu2, o_alu3, zero_o_alu1, zero_o_alu2, zero_o_alu3, data_out_aux, zero_out);
   
  data_out <= data_out_aux;                       

end Behavioral; 