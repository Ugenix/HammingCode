library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_std.all;

entity test_bench_pract1 is
--  Port ( );
end test_bench_pract1;

architecture Behavioral of test_bench_pract1 is
  component EDAC is
    Port ( 
      data_in  : in STD_LOGIC_VECTOR (7 downto 0);
      clk_i    : in std_logic;
      reset    : in std_logic;
      enable   : in std_logic;  
      data_out : out STD_LOGIC_VECTOR (7 downto 0)
    );
  end component;
  
  signal data_in, data_out : std_logic_vector (7 downto 0);
  signal clock             : std_logic; 

begin

  Sistema : EDAC 
    port map (
      data_in  => data_in,
      clk_i    => clock,
      reset    => '0',
      enable   => '1',
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
    data_in  <= "11111111";
    wait until rising_edge(clock);

    -- write to all addresses
    while a < 256 loop
      wait until rising_edge(clock);
      data_in  <= std_logic_vector(unsigned(data_in) + 1);
      --datain  <= datain sll 1;
      a := a +1;
    end loop;

    -- stop writing
    data_in  <= "11111111";
    wait;
  end process;

      
end Behavioral;