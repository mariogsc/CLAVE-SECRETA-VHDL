LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.std_logic_arith.ALL;
USE ieee.std_logic_unsigned.ALL;



ENTITY top IS
 PORT ( 
   boton: IN std_logic;
   num : IN std_logic_vector(3 DOWNTO 0);
   reset: IN std_logic;
   CLK_top: IN std_logic;
   
   -- SALIDAS LEDs INTERNOS 
   led_b: out std_logic;
   led_s0: out std_logic;
   led_s1: out std_logic;
   led_s2: out std_logic;
   led_s3: out std_logic;
   led_s4: out std_logic;
   led_s5: out std_logic;
   led_s6:out std_logic;
   led_check: out std_logic;
   
   -- SALIDAS DISPLAYS 7 SEGMENTOS
   display: OUT std_logic_vector(3 DOWNTO 0);
   display_izq: OUT std_logic_vector(3 DOWNTO 0);
   segment : OUT std_logic_vector(6 DOWNTO 0);
   
   -- SALIDAS A ELEMENTOS EXTERNOS
   pwm: OUT std_logic;
   pin_led_verde: OUT std_logic;
   pin_led_rojo: OUT std_logic
 );
END top;

ARCHITECTURE BEHAVIORAL of top is
type STATES is (s0,s1,s2,s3,s4,s5,s6);
type segments_value is array(3 downto 0) of std_logic_vector(3 downto 0);

signal estado_fsm:integer range 0 to 6; -- señal para saber el estado actual
signal num_sig:std_logic_vector(3 downto 0); -- señal para utilizar los switchs
signal check: std_logic; -- señal para indicar que la contraseña introducida es correcta
signal check_rojo: std_logic; -- señal para indicar que la contraseña introducida no es correcta
signal syncin_edge, boton_sig: std_logic;

-- COMPONENTES
  COMPONENT FSM IS
    PORT(
    CLK_FSM: IN std_logic;
    boton: IN std_logic;
    reset: IN std_logic;
    num : IN std_logic_vector(3 DOWNTO 0);
    num_out: OUT std_logic_vector(3 DOWNTO 0);
    display_izq: OUT std_logic_vector(3 DOWNTO 0);
    display_der: OUT std_logic_vector(3 DOWNTO 0);
    check: OUT std_logic;
    estado_actual: OUT integer range 0 to 6
    );
  END COMPONENT;

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
    
    component servomotor is
    Port ( 
        CLK: in std_logic;
        entrada : in std_logic;
        pwm: out std_logic);
    end component;
    
    component led is
    Port ( 
        CLK: in std_logic;
        entrada : in std_logic;
        salida: out std_logic);
    end component;
      
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
    
    inst_servomotor: servomotor
    PORT MAP(
        CLK=>clk_top,
        entrada=>check,
        pwm=>pwm
    );
    
    inst_led_verde: led
    PORT MAP(
        CLK=>clk_top,
        entrada=>check,
        salida=>pin_led_verde
    );
    
     inst_led_rojo: led
    PORT MAP(
        CLK=>clk_top,
        entrada=>check_rojo,
        salida=>pin_led_rojo
    );
    
    inst_fsm: FSM
    PORT MAP(
        CLK_FSM=>clk_top,
        boton=> boton_sig,
        reset=>reset,
        num=>num,
        num_out=>num_sig,
        display_izq=>display_izq,
        display_der=>display,
        check=>check,
        estado_actual=>estado_fsm
    );
   
    -- UTILIZACION DE LEDS PARA VER EL FUNCIONAMIENTO DE LAS SENALES Y ESTADOS
    led_b<='1' when boton='1' else '0';
    led_s0<='1' when estado_fsm=0 else '0';
    led_s1<='1' when estado_fsm=1  else '0';
    led_s2<='1' when estado_fsm=2  else '0';
    led_s3<='1' when estado_fsm=3  else '0';
    led_s4<='1' when estado_fsm=4  else '0';
    led_s5<='1' when estado_fsm=5  else '0';
    led_s6<='1' when estado_fsm=6  else '0';
    
    -- ELEMENTOS EXTERNOS
    led_check<='1' when check='1' else '0';
    check_rojo<='1' when (check = '0' and estado_fsm=6) else '0';
    
end BEHAVIORAL;
