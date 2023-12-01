LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY top IS
 PORT ( 
   code : IN std_logic_vector(3 DOWNTO 0);
   digsel : IN std_logic_vector(3 DOWNTO 0);
   digctrl : OUT std_logic_vector(3 DOWNTO 0);
   segment : OUT std_logic_vector(6 DOWNTO 0)
 );
END top;

ARCHITECTURE BEHAVIORAL of top is
  COMPONENT decoder
    PORT (
    code : IN std_logic_vector(3 DOWNTO 0);
    led : OUT std_logic_vector(6 DOWNTO 0)
    );
  END COMPONENT;
BEGIN

  Inst_decoder: decoder PORT MAP (
  code =>code ,
  led =>segment
  );
  
  digctrl<= "0111" when digsel="1---" else -- el - signifca X
  			"1011" when digsel="01--" else 
            "1101" when digsel="001-" else 
            "1110" when digsel="0001" else 
            "1111";
end BEHAVIORAL;