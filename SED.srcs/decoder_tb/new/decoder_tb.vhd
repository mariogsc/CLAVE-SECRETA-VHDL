
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.Numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder_tb is
--  Port ( );
end decoder_tb;

architecture Behavioral of decoder_tb is


    COMPONENT decoder
        PORT (
            entrada : in std_logic_vector(3 DOWNTO 0);
            led : out std_logic_vector(6 DOWNTO 0)
            );
    END COMPONENT decoder;
    

--señales de entrada decoder
signal entrada_tb : std_logic_vector(3 DOWNTO 0):="0000"; 
--señales salida decoder 
signal led_tb : std_logic_vector(6 DOWNTO 0);
            
begin

dut: decoder port map(
                 entrada=>entrada_tb,
                 led=>led_tb
                 );
                 
Prueba_decoder: process begin
               
                entrada_tb<="0000";
                wait for 100ns;
                        
                entrada_tb<="0001";
                wait for 100ns;
                        
                entrada_tb<="0010";
                wait for 100ns;
                               
                entrada_tb<="0011";
                wait for 100ns;
                        
                entrada_tb<="0100";
                wait for 100ns;
                        
                entrada_tb<="0101";
                wait for 100ns;
                
                wait;
       end process Prueba_decoder;
               
  
end Behavioral;