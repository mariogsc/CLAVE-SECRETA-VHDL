----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04.12.2023 15:58:15
-- Design Name: 
-- Module Name: top_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


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

entity top_tb is
--  Port ( );
end top_tb;

architecture Behavioral of top_tb is

    component top
        PORT ( 
            num : IN std_logic_vector(3 DOWNTO 0);
            boton: IN std_logic;
            reset: IN std_logic;
            CLK_top: IN std_logic;
            led_p: out std_logic; -- AÑADIR UN LED PARA CADA ESTADO (MIRAR FPGA PARA VER EL ORDEN)
   
            contrasena: OUT std_logic_vector(3 DOWNTO 0);
            segment : OUT std_logic_vector(6 DOWNTO 0)
            );
        END component;

    COMPONENT decoder
        PORT (
            entrada : std_logic_vector(3 DOWNTO 0);
            led : std_logic_vector(6 DOWNTO 0)
            );
    END COMPONENT decoder;
    
--señales de entrada top
signal num_tb : std_logic_vector(3 DOWNTO 0);
signal boton_tb : std_logic;
signal reset_tb : std_logic;
signal CLK_top_tb : std_logic;
signal led_p_tb : std_logic; -- AÑADIR UN LED PARA CADA ESTADO (MIRAR FPGA PARA VER EL ORDEN)

--señales de salida top
signal contrasena_tb : std_logic_vector(3 DOWNTO 0);
signal segment_tb : std_logic_vector(6 DOWNTO 0);

--constantes
constant CLK_period: time := 10ns;

--señales de entrada decoder
signal entrada_tb : std_logic_vector(3 DOWNTO 0):="0000";
--señales salida decoder 
signal led_tb : std_logic_vector(6 DOWNTO 0);
            
begin

uut: top port map(
                 num=>num_tb,
                 boton=>boton_tb,
                 reset=>reset_tb,
                 CLK_top=>CLK_top_tb,
                 led_p=>led_p_tb,
                 contrasena=>contrasena_tb,
                 segment=>segment_tb);

dut: decoder port map(
                 entrada=>entrada_tb,
                 led=>led_tb);
                 
--generar el reloj
gen_CLK_top: process
    begin
        CLK_top_tb<='0';
        wait for 0.5*CLK_period;
        CLK_top_tb<='1';
        wait for 0.5*CLK_period;
    end process;
        
Prueba_decoder:
       process begin
                report "Verificando decoder"
                        severity note;
                        
                entrada_tb<="0000";
                wait for CLK_period;
                assert led_tb<="00111111"
                        report "Error en 0"
                        severity failure;
                        
                entrada_tb<="0001";
                wait for CLK_period;
                assert led_tb<="00000110"
                        report "Error en 1"
                        severity failure;
                        
                entrada_tb<="0010";
                wait for CLK_period;
                assert led_tb<="01011011"
                        report "Error en 2"
                        severity failure;
                
                entrada_tb<="0011";
                wait for CLK_period;
                assert led_tb<="01001111"
                        report "Error en 3"
                        severity failure;
                        
                entrada_tb<="0100";
                wait for CLK_period;
                assert led_tb<="01100110"
                        report "Error en 4"
                        severity failure;
                        
                entrada_tb<="0101";
                wait for CLK_period;
                assert led_tb<="01101101"
                        report "Error en 5"
                        severity failure;
                        
                entrada_tb<="0110";
                wait for CLK_period;
                assert led_tb<="01111101"
                        report "Error en 6"
                        severity failure;
                           
                entrada_tb<="0111";
                wait for CLK_period;
                assert led_tb<="00000111"
                        report "Error en 7"
                        severity failure;
                        
                entrada_tb<="1000";
                wait for CLK_period;
                assert led_tb<="01111111"
                        report "Error en 8"
                        severity failure;
                        
                report "Verificacion exitosa"
                severity note;
                wait;
       end process Prueba_decoder;
               
  
end Behavioral;
