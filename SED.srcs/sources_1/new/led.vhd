LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity led is
    port(
        CLK: in std_logic;
        entrada: in std_logic;
        salida: out std_logic
    );
end entity;

architecture Behavioral of led is
begin
    process(CLK)
    begin
        if(rising_edge(CLK)) then
            salida<=entrada;
        end if;
    end process;
end Behavioral;
