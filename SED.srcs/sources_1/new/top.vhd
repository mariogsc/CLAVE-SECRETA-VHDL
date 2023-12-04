LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY top IS
 PORT ( 
   -- ENTRADAS
   num : IN std_logic_vector(3 DOWNTO 0);
   boton: IN std_logic;
   reset: IN std_logic;
   CLK_top: IN std_logic;
   
   -- SALIDAS LED
   led_b: out std_logic;
   led_s0: out std_logic;
   led_s1: out std_logic;
   led_s2: out std_logic;
   led_s3: out std_logic;
   led_s4: out std_logic;
   led_s5: out std_logic;
   check: out std_logic;
   
   -- SALIDAS DISPLAYS 7 SEGMENTOS
   display: OUT std_logic_vector(3 DOWNTO 0);
   display_izq: OUT std_logic_vector(3 DOWNTO 0);
   segment : OUT std_logic_vector(6 DOWNTO 0)
 );
END top;

ARCHITECTURE BEHAVIORAL of top is
type STATES is (s0,s1,s2,s3,s4,s5,s6);
type segments_value is array(3 downto 0) of std_logic_vector(3 downto 0);
  COMPONENT decoder
    PORT (
    entrada : IN std_logic_vector(3 DOWNTO 0);
    led : OUT std_logic_vector(6 DOWNTO 0)
    );
  END COMPONENT;
  component EDGEDCTR is
        Port ( CLK : in STD_LOGIC;
        SYNC_IN : in STD_LOGIC;
        EDGE : out STD_LOGIC);
    end component;
    component SYNCHRNZR is
    Port ( CLK : in STD_LOGIC;
    ASYNC_IN : in STD_LOGIC;
    SYNC_OUT : out STD_LOGIC);
    end component;
    
  signal current_state: STATES:= s0;
  signal next_state: STATES;
  signal Internal_CLK, syncin_edge, boton_sig: std_logic;
  signal contador: integer range 0 to 200000:=0; -- Para hacer multiplexación en el tiempo de 7 segmentos
  signal selector: integer:=0;
  signal num_sig:std_logic_vector(3 downto 0);
  signal contrasena_value: segments_value;
  signal contrasena_value_display: segments_value;
  signal contrasena_correcta: segments_value:=("1000","0000","0000","0000");
BEGIN
  
  Inst_decoder: decoder PORT MAP (
  entrada =>num_sig ,
  led =>segment
  );
  
  inst_edge: EDGEDCTR
    Port map (
     CLK => clk_top,
     SYNC_IN => syncin_edge,
     EDGE => boton_sig
    );
    
    inst_sync: SYNCHRNZR
    PORT MAP(
     CLK => clk_top,
     ASYNC_IN => boton,
     SYNC_OUT => syncin_edge
    );
    
    state_register: process (reset,CLK_top)
     begin
     if reset='1' then
     current_state<=s0;
     elsif rising_edge(CLK_top) then
        current_state<=next_state;
     end if;
     end process;
     
     nextstate_decod: process (boton_sig, current_state)
     begin
     next_state <= current_state;
     case current_state is
     when s0 =>
     if boton_sig = '1' then
     next_state <= s1;
     end if;
     when s1 =>
     if boton_sig= '1' then
     contrasena_value(0)<=num;
     next_state <= s2;
     end if;
     when s2 =>
     if boton_sig = '1' then
     contrasena_value(1)<=num;
     next_state <= s3;
     end if;
     when s3 =>
     if boton_sig = '1' then
     contrasena_value(2)<=num;
     next_state <= s4;
     end if;
     when s4 =>
     if boton_sig = '1' then
     contrasena_value(3)<=num;
     next_state <= s5;
     end if;
     when s5 =>
     if boton_sig = '1' then
     next_state <= s6;
     end if;
     when s6 =>
     if boton_sig = '1' then
     next_state <= s0;
     end if;
     when others =>
     next_state <= S0;
     end case;
    end process;
    
    output_decod: process (CLK_top)
    begin
        if rising_edge(CLK_top) then
            case current_state is
                when s0 =>
                    check<='0';
                    display <= "1111";
                    display_izq<="1111";
                    num_sig<=num;
                when s1 =>
                    display <= "1110";
                    display_izq<="1111";
                    num_sig<=num;
                when s2 =>
                    display <= "1101";
                    display_izq<="1111";
                    num_sig<=num;
                when s3 =>
                    display <= "1011";
                    display_izq<="1111";
                    num_sig<=num;
                when s4 =>
                    display <= "0111";
                    display_izq<="1111";
                    num_sig<=num;
                when s5 =>
                    -- Multiplexación en el tiempo de cada display (más veloz que ojo humano)
                    display_izq<="1111";
                    if selector = 0 then
                        display <= "1110";
                        num_sig<=contrasena_value_display(0);
                    elsif selector = 1 then
                        display <= "1101";
                        num_sig<=contrasena_value_display(1);
                    elsif selector = 2 then
                        display <= "1011";
                        num_sig<=contrasena_value_display(2);
                    elsif selector = 3 then
                        display <= "0111";
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
                        display <= "1110";
                        display_izq<="1111";
                        num_sig<=contrasena_value_display(0);
                    elsif selector = 1 then
                        display <= "1101";
                        num_sig<=contrasena_value_display(1);
                    elsif selector = 2 then
                        display <= "1011";
                        num_sig<=contrasena_value_display(2);
                    elsif selector = 3 then
                        display <= "0111";
                        num_sig<=contrasena_value_display(3);
                    elsif selector = 4 then
                        display_izq <= "1110";
                        display<="1111";
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
    
    contrasena_value_display<=contrasena_value;
    
    
    -- UTILIZACIÓN DE LEDS PARA VER EL FUNCIONAMIENTO DE LAS SEÑALES Y ESTADOS
    led_b<='1' when boton='1' else '0';
    led_s0<='1' when current_state=s0 else '0';
    led_s1<='1' when current_state=s1 else '0';
    led_s2<='1' when current_state=s2 else '0';
    led_s3<='1' when current_state=s3 else '0';
    led_s4<='1' when current_state=s4 else '0';
    led_s5<='1' when current_state=s5 else '0';
        
    
end BEHAVIORAL;
