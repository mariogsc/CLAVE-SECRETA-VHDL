library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity servomotor is 
    Port ( 
        CLK     : in std_logic;
        entrada : in std_logic;
        pwm     : out std_logic
    );
end servomotor;

architecture Behavioral of servomotor is
    signal divisor_frecuencia: integer range 0 to 100000000; -- Frecuencia de reloj: 100 MHz
    signal duty_limit: integer;
    
    constant PWM_PERIOD: integer := 2000000; -- Período de 20 ms (100 MHz / 50 Hz)
    constant DUTY_1_MS : integer := 100000;  -- Ciclo de trabajo para 1 ms 
    constant DUTY_2_MS : integer := 200000;  -- Ciclo de trabajo para 2 ms 
begin
    
    -- GENERACIÓN DE PWM
    generacion_pwm : process(CLK)
    begin
        if rising_edge(CLK) then
            if divisor_frecuencia = PWM_PERIOD then
                divisor_frecuencia <= 0;
            else
                divisor_frecuencia <= divisor_frecuencia + 1;
            end if;

            if divisor_frecuencia < duty_limit then
                pwm <= '1';
            else
                pwm <= '0';
            end if;
        end if;
    end process;

    -- Proceso para la actualización del ciclo de trabajo según la entrada
    update_duty_cycle : process(entrada)
    begin
        if entrada = '1' then
            duty_limit <= DUTY_2_MS; -- Establecer el ciclo de trabajo para posición 1 (2 ms)
        else
            duty_limit <= DUTY_1_MS; -- Establecer el ciclo de trabajo para posición 0 (1 ms)
        end if;
    end process update_duty_cycle;
end Behavioral;

