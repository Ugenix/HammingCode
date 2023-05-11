
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_std.all;

entity test_bench_pract2 is
--  Port ( );
end test_bench_pract2;

architecture Behavioral of test_bench_pract2 is
  component EDAC is
    Port ( 
      op_i  : in  STD_LOGIC_VECTOR (2 downto 0);       -- Operation
      data_in1, data_in2 : in STD_LOGIC_VECTOR (7 downto 0);
      zero_o : out std_logic;
      data_out : out STD_LOGIC_VECTOR (7 downto 0)
    );
  end component;
  
  signal data_in1, data_in2, data_out : std_logic_vector (7 downto 0);
  signal op_i : STD_LOGIC_VECTOR (2 downto 0);       -- Operation
  signal clock, zero : std_logic; 

begin

  Sistema : EDAC port map (
        op_i => op_i,
        data_in1 => data_in1,
		data_in2 => data_in2,
		zero_o => zero,
        data_out => data_out
            );
            
   process
   begin
     clock <= '0';
     wait for 5 ns;
     clock <= '1';
     wait for 5 ns;
   end process;
    
  Stim: process 
     variable a : integer := 0;
  begin
    -- Initialise input signals
    data_in1  <= "00000001";
    data_in2  <= "00000011";
    op_i      <= "000";
    wait until rising_edge(clock);

    -- write to all addresses
    while a < 256 loop
      wait until rising_edge(clock);
      data_in1  <= std_logic_vector(unsigned(data_in1) + 1);
      data_in2  <= std_logic_vector(unsigned(data_in2) + 1);
      op_i      <= std_logic_vector(unsigned(op_i) + 1);
      a := a +1;
    end loop;
  
    --if (a mod 10) = 0 then op_i <= std_logic_vector(unsigned(op_i) + 1);
	--end if;
    
    -- stop writing
    data_in1  <= "11111111";
	data_in2  <= "11111111";
    wait;
  end process;

      
end Behavioral;


