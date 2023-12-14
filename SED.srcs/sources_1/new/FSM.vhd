LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY FSM IS
PORT(
CLK_FSM: IN std_logic;
boton: IN std_logic;
reset: IN std_logic;
num : IN std_logic_vector(3 DOWNTO 0);
num_out: OUT std_logic_vector(3 DOWNTO 0);
display_izq: OUT std_logic_vector(3 DOWNTO 0);
display_der: OUT std_logic_vector(3 DOWNTO 0);
check: OUT std_logic;
estado_actual: OUT Integer range 0 to 6
);
END ENTITY FSM;

ARCHITECTURE BEHAVIORAL of FSM IS
type STATES is (s0,s1,s2,s3,s4,s5,s6);
type segments_value is array(3 downto 0) of std_logic_vector(3 downto 0);

signal current_state: STATES:= s0;
  signal next_state: STATES;
signal contador: integer range 0 to 200000:=0; -- Para hacer multiplexación en el tiempo de 7 segmentos
  signal selector: integer:=0;
  signal num_sig:std_logic_vector(3 downto 0);
  signal contrasena_value: segments_value;
  signal contrasena_value_display: segments_value;
  signal contrasena_correcta: segments_value:=("1000","0000","0000","0000");
  signal check_sig: std_logic;
begin

 state_register: process (reset,CLK_FSM)
     begin
     if reset='1' then
     current_state<=s0;
     elsif rising_edge(CLK_FSM) then
        current_state<=next_state;
     end if;
     end process;
     
     nextstate_decod: process (boton, current_state)
     begin
     next_state <= current_state;
     case current_state is
     when s0 =>
     if boton = '1' then
     next_state <= s1;
     end if;
     when s1 =>
     if boton= '1' then
     contrasena_value(0)<=num;
     next_state <= s2;
     end if;
     when s2 =>
     if boton = '1' then
     contrasena_value(1)<=num;
     next_state <= s3;
     end if;
     when s3 =>
     if boton = '1' then
     contrasena_value(2)<=num;
     next_state <= s4;
     end if;
     when s4 =>
     if boton = '1' then
     contrasena_value(3)<=num;
     next_state <= s5;
     end if;
     when s5 =>
     if boton = '1' then
     next_state <= s6;
     end if;
     when s6 =>
     if boton = '1' then
     next_state <= s0;
     end if;
     when others =>
     next_state <= S0;
     end case;
    end process;
    
    output_decod: process (CLK_FSM)
    begin
        if rising_edge(CLK_FSM) then
            case current_state is
                when s0 =>
                    check<='0';
                    display_der <= "1111";
                    display_izq<="1111";
                    num_sig<=num;
                when s1 =>
                    display_der <= "1110";
                    display_izq<="1111";
                    num_sig<=num;
                when s2 =>
                    display_der <= "1101";
                    display_izq<="1111";
                    num_sig<=num;
                when s3 =>
                    display_der <= "1011";
                    display_izq<="1111";
                    num_sig<=num;
                when s4 =>
                    display_der <= "0111";
                    display_izq<="1111";
                    num_sig<=num;
                when s5 =>
                    -- Multiplexación en el tiempo de cada display (más veloz que ojo humano)
                    display_izq<="1111";
                    if selector = 0 then
                        display_der <= "1110";
                        num_sig<=contrasena_value_display(0);
                    elsif selector = 1 then
                        display_der <= "1101";
                        num_sig<=contrasena_value_display(1);
                    elsif selector = 2 then
                        display_der <= "1011";
                        num_sig<=contrasena_value_display(2);
                    elsif selector = 3 then
                        display_der <= "0111";
                        num_sig<=contrasena_value_display(3);
                    end if;
                    if(contador<200000) then
                        contador <= (contador + 1);
                    elsif (contador=200000) then
                        contador<=0;
                        selector<=(selector+1) mod 4;
                    end if;
               when s6 =>
                    -- Multiplexación en el tiempo de cada display (más veloz que ojo humano)
                    if selector = 0 then
                        display_der <= "1110";
                        display_izq<="1111";
                        num_sig<=contrasena_value_display(0);
                    elsif selector = 1 then
                        display_der <= "1101";
                        num_sig<=contrasena_value_display(1);
                    elsif selector = 2 then
                        display_der <= "1011";
                        num_sig<=contrasena_value_display(2);
                    elsif selector = 3 then
                        display_der <= "0111";
                        num_sig<=contrasena_value_display(3);
                    elsif selector = 4 then
                        display_izq <= "1110";
                        display_der<="1111";
                        num_sig<=contrasena_correcta(0);
                    elsif selector = 5 then
                        display_izq <= "1101";
                        num_sig<=contrasena_correcta(1);
                    elsif selector = 6 then
                        display_izq <= "1011";
                        num_sig<=contrasena_correcta(2);
                    elsif selector = 7 then
                        display_izq <= "0111";
                        num_sig<=contrasena_correcta(3);
                    end if;
                    if(contador<200000) then
                        contador <= (contador + 1);
                    elsif (contador=200000) then
                        contador<=0;
                        selector<=(selector+1) mod 8;
                    end if;
                    if(contrasena_value_display=contrasena_correcta) then
                        check<='1';
                    else 
                        check<='0';
                    end if;
            end case;
        end if;
    end process;
    num_out<=num_sig;
    WITH current_state SELECT
    estado_actual <= 0 WHEN s0,
    1 WHEN s1,
    2 WHEN s2,
    3 WHEN s3,
    4 WHEN s4,
    5 WHEN s5,
    6 WHEN s6,
    0 WHEN others;
    
contrasena_value_display<=contrasena_value;

END BEHAVIORAL;

