LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;

ENTITY top IS
 PORT ( 
   num : IN std_logic_vector(3 DOWNTO 0);
   boton: IN std_logic;
   reset: IN std_logic;
   CLK_top: IN std_logic;
   led_p: out std_logic; -- AÑADIR UN LED PARA CADA ESTADO (MIRAR FPGA PARA VER EL ORDEN)
   
   contrasena: OUT std_logic_vector(3 DOWNTO 0);
   segment : OUT std_logic_vector(6 DOWNTO 0)
 );
END top;

ARCHITECTURE BEHAVIORAL of top is
type STATES is (s0,s1,s2,s3,s4,s5);
type segments_value is array(3 downto 0) of std_logic_vector(6 downto 0);
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
  signal segment_sig: std_logic_vector(6 downto 0);
  signal value: segments_value; -- Para guardar el valor de cada 7 segmentos
  signal aux: positive:=1; -- Para hacer multiplexación en el tiempo de 7 segmentos
BEGIN
  
  Inst_decoder: decoder PORT MAP (
  entrada =>num ,
  led =>segment_sig -- Se ha cambiado la salida segment por segment_sig (signal)
  );
  
  segment<=segment_sig; -- Se asigna el valor de la señal al display 7 segs ( se puede hacer mediante otra instancición mirar)
  
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
     next_state <= s2;
     value(0)<=segment_sig;
     end if;
     when s2 =>
     if boton_sig = '1' then
     next_state <= s3;
     value(1)<=segment_sig;
     end if;
     when s3 =>
     if boton_sig = '1' then
     next_state <= s4;
     value(2)<=segment_sig;
     end if;
     when s4 =>
     if boton_sig = '1' then
     next_state <= s0;
     value(3)<=segment_sig;
     end if;
     when s5 =>
     if boton_sig = '1' then
     next_state <= s0;
     end if;
     when others =>
     next_state <= S0;
     end case;
    end process;
    
     output_decod: process (current_state,CLK_top)
     begin
     case current_state is
     when S0 =>
     contrasena <= "1111";
     when S1 =>
     contrasena <= "1110";
     led_p<='1';
     when S2 =>
     contrasena <= "1101";
     when S3 =>
     contrasena <= "1011";
     when S4 =>
     contrasena <= "0111";
     when S5 =>
     -- Multiplexación en el tiempo de cada display (más veloz que ojo humano)
        if rising_edge(CLK_top) then
            if(aux=1) then
                contrasena <= "1110";
                segment_sig<=value(0);
            elsif(aux=2) then
                 contrasena <= "1101";
                 segment_sig<=value(1);
            elsif(aux=3) then
                 contrasena <= "1011";
                 segment_sig<=value(2);
            elsif(aux=4) then
                 contrasena <= "0111";
                 segment_sig<=value(3);
                aux<=0;
            end if;
            aux<=aux+1;
        end if;
     when others =>
     contrasena <= (OTHERS => '1');
     end case;
    end process;
    

end BEHAVIORAL;