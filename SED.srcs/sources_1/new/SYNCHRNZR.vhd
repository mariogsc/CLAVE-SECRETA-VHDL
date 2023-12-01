LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

entity SYNCHRNZR is
Port ( CLK : in STD_LOGIC;
ASYNC_IN : in STD_LOGIC;
SYNC_OUT : out STD_LOGIC);
end SYNCHRNZR;
architecture Behavioral of SYNCHRNZR is
signal sreg : std_logic_vector(1 downto 0);
begin
process (CLK)
begin
if rising_edge(CLK) then
sync_out <= sreg(1);
sreg <= sreg(0) & async_in;
end if;
end process;
end Behavioral;