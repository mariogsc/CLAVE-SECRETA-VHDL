LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity EDGEDCTR is
Port ( CLK : in STD_LOGIC;
SYNC_IN : in STD_LOGIC;
EDGE : out STD_LOGIC);
end EDGEDCTR;
architecture Behavioral of EDGEDCTR is
signal sreg : std_logic_vector(2 downto 0);
begin
process (CLK)
begin
if rising_edge(CLK) then
sreg <= sreg(1 downto 0) & SYNC_IN;
end if;
end process;
with sreg select
EDGE <= '1' when "100",
'0' when others;
end Behavioral;

