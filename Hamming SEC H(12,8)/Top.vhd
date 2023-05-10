-- Lab1 - Fiabilidad
-- Redundancia en la informacion:
-- Codigos de Correccion de errores


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity EDAC is
  Port ( 
    reset    : in std_logic;
    clk_i    : in std_logic;
    enable   : in std_logic;
    data_in  : in std_logic_vector (7 downto 0);
    data_out : out std_logic_vector (7 downto 0)
  );
end EDAC;

architecture Behavioral of EDAC is
  
  -- Señales internas
  signal mem_in           : std_logic_vector (11 downto 0);
  signal mem_out          : std_logic_vector (11 downto 0);
  signal datos            : std_logic_vector (7 downto 0);
  signal codigo1          : std_logic_vector (3 downto 0);
  signal codigo2          : std_logic_vector (3 downto 0);
  signal sindrome         : std_logic_vector (3 downto 0);
  signal datos_corregidos : std_logic_vector (7 downto 0);

  -- Componentes
  component RegisterNbits is
    port(
      rst_i : in  std_logic;
      clk_i : in  std_logic;
      en_i  : in  std_logic;
      d_i   : in  std_logic_vector (11 downto 0);
      q_o   : out std_logic_vector (11 downto 0)
    );
  end component;

  component codeGenerator is
    port(
      data : in  std_logic_vector (7 downto 0);
      code : out std_logic_vector (3 downto 0)
    );
  end component;

  component syndromeGenerator is
    port(
      code1    : in  std_logic_vector (3 downto 0);
      code2    : in  std_logic_vector (3 downto 0);  
      syndrome : out std_logic_vector (3 downto 0)
    );
  end component;

  component errorCorrector is
    port (
      data           : in  std_logic_vector (7 downto 0);
      syndrome       : in  std_logic_vector (3 downto 0);
      corrected_data : out std_logic_vector (7 downto 0)     
    );
  end component;

  begin
    
    hamming1 : codeGenerator     port map (data_in, codigo1);
  
    memoria  : RegisterNbits     port map (reset, clk_i, enable, mem_in, mem_out);

    hamming2 : codeGenerator     port map (mem_out(7 downto 0), codigo2);

    genSyn   : syndromeGenerator port map (mem_out(11 downto 8), codigo2, sindrome);

    corrErr  : errorCorrector    port map (mem_out(7 downto 0), sindrome, datos_corregidos);

    datos <= data_in;
 
    mem_in   <= (codigo1&datos);
    data_out <=  datos_corregidos;

end Behavioral;