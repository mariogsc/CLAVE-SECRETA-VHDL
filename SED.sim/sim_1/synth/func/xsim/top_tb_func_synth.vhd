-- Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
-- Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2023.1 (win64) Build 3865809 Sun May  7 15:05:29 MDT 2023
-- Date        : Mon Dec  4 19:37:54 2023
-- Host        : LAPTOP-EC3OLLEQ running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               C:/Users/alvar/OneDrive/Escritorio/CLAVE-SECRETA-VHDL/SED.sim/sim_1/synth/func/xsim/top_tb_func_synth.vhd
-- Design      : top
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity EDGEDCTR is
  port (
    E : out STD_LOGIC_VECTOR ( 0 to 0 );
    \FSM_sequential_current_state_reg[0]\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \sreg_reg[1]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \sreg_reg[1]_1\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \sreg_reg[0]_0\ : out STD_LOGIC_VECTOR ( 0 to 0 );
    \sreg_reg[0]_1\ : in STD_LOGIC;
    CLK : in STD_LOGIC;
    Q : in STD_LOGIC_VECTOR ( 2 downto 0 )
  );
end EDGEDCTR;

architecture STRUCTURE of EDGEDCTR is
  signal sreg : STD_LOGIC_VECTOR ( 2 downto 0 );
begin
\FSM_sequential_current_state[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => sreg(0),
      I1 => sreg(2),
      I2 => sreg(1),
      O => \sreg_reg[0]_0\(0)
    );
\contrasena_value_reg[0][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000040000"
    )
        port map (
      I0 => Q(1),
      I1 => Q(0),
      I2 => Q(2),
      I3 => sreg(1),
      I4 => sreg(2),
      I5 => sreg(0),
      O => E(0)
    );
\contrasena_value_reg[1][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000040000"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => Q(2),
      I3 => sreg(1),
      I4 => sreg(2),
      I5 => sreg(0),
      O => \FSM_sequential_current_state_reg[0]\(0)
    );
\contrasena_value_reg[2][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000004000000"
    )
        port map (
      I0 => sreg(1),
      I1 => sreg(2),
      I2 => sreg(0),
      I3 => Q(1),
      I4 => Q(0),
      I5 => Q(2),
      O => \sreg_reg[1]_0\(0)
    );
\contrasena_value_reg[3][3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400000000"
    )
        port map (
      I0 => sreg(1),
      I1 => sreg(2),
      I2 => sreg(0),
      I3 => Q(1),
      I4 => Q(0),
      I5 => Q(2),
      O => \sreg_reg[1]_1\(0)
    );
\sreg_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => \sreg_reg[0]_1\,
      Q => sreg(0),
      R => '0'
    );
\sreg_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => sreg(0),
      Q => sreg(1),
      R => '0'
    );
\sreg_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => sreg(1),
      Q => sreg(2),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity SYNCHRNZR is
  port (
    boton : out STD_LOGIC;
    led_b_OBUF : in STD_LOGIC;
    CLK : in STD_LOGIC
  );
end SYNCHRNZR;

architecture STRUCTURE of SYNCHRNZR is
  attribute srl_name : string;
  attribute srl_name of SYNC_OUT_reg_srl3 : label is "\inst_sync/SYNC_OUT_reg_srl3 ";
begin
SYNC_OUT_reg_srl3: unisim.vcomponents.SRL16E
    generic map(
      INIT => X"0000"
    )
        port map (
      A0 => '0',
      A1 => '1',
      A2 => '0',
      A3 => '0',
      CE => '1',
      CLK => CLK,
      D => led_b_OBUF,
      Q => boton
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity decoder is
  port (
    segment_OBUF : out STD_LOGIC_VECTOR ( 5 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 3 downto 0 )
  );
end decoder;

architecture STRUCTURE of decoder is
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \segment_OBUF[1]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \segment_OBUF[2]_inst_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \segment_OBUF[3]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \segment_OBUF[4]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \segment_OBUF[5]_inst_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \segment_OBUF[6]_inst_i_1\ : label is "soft_lutpair2";
begin
\segment_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FB98"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(1),
      O => segment_OBUF(0)
    );
\segment_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFB8"
    )
        port map (
      I0 => Q(3),
      I1 => Q(1),
      I2 => Q(2),
      I3 => Q(0),
      O => segment_OBUF(1)
    );
\segment_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EA9C"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(1),
      O => segment_OBUF(2)
    );
\segment_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AAB0"
    )
        port map (
      I0 => Q(3),
      I1 => Q(0),
      I2 => Q(1),
      I3 => Q(2),
      O => segment_OBUF(3)
    );
\segment_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AEC8"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(1),
      O => segment_OBUF(4)
    );
\segment_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"AA9C"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(0),
      I3 => Q(1),
      O => segment_OBUF(5)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity top is
  port (
    num : in STD_LOGIC_VECTOR ( 3 downto 0 );
    boton : in STD_LOGIC;
    reset : in STD_LOGIC;
    CLK_top : in STD_LOGIC;
    led_b : out STD_LOGIC;
    led_s0 : out STD_LOGIC;
    led_s1 : out STD_LOGIC;
    led_s2 : out STD_LOGIC;
    led_s3 : out STD_LOGIC;
    led_s4 : out STD_LOGIC;
    led_s5 : out STD_LOGIC;
    check : out STD_LOGIC;
    display : out STD_LOGIC_VECTOR ( 3 downto 0 );
    display_izq : out STD_LOGIC_VECTOR ( 3 downto 0 );
    segment : out STD_LOGIC_VECTOR ( 6 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of top : entity is true;
end top;

architecture STRUCTURE of top is
  signal CLK_top_IBUF : STD_LOGIC;
  signal CLK_top_IBUF_BUFG : STD_LOGIC;
  signal boton_sig : STD_LOGIC;
  signal check_OBUF : STD_LOGIC;
  signal check_i_1_n_0 : STD_LOGIC;
  signal check_i_2_n_0 : STD_LOGIC;
  signal check_i_3_n_0 : STD_LOGIC;
  signal check_i_4_n_0 : STD_LOGIC;
  signal check_i_5_n_0 : STD_LOGIC;
  signal contador : STD_LOGIC;
  signal \contador[0]_i_10_n_0\ : STD_LOGIC;
  signal \contador[0]_i_11_n_0\ : STD_LOGIC;
  signal \contador[0]_i_3_n_0\ : STD_LOGIC;
  signal \contador[0]_i_4_n_0\ : STD_LOGIC;
  signal \contador[0]_i_5_n_0\ : STD_LOGIC;
  signal \contador[0]_i_6_n_0\ : STD_LOGIC;
  signal \contador[0]_i_7_n_0\ : STD_LOGIC;
  signal \contador[0]_i_8_n_0\ : STD_LOGIC;
  signal \contador[0]_i_9_n_0\ : STD_LOGIC;
  signal \contador[12]_i_2_n_0\ : STD_LOGIC;
  signal \contador[12]_i_3_n_0\ : STD_LOGIC;
  signal \contador[12]_i_4_n_0\ : STD_LOGIC;
  signal \contador[12]_i_5_n_0\ : STD_LOGIC;
  signal \contador[16]_i_2_n_0\ : STD_LOGIC;
  signal \contador[16]_i_3_n_0\ : STD_LOGIC;
  signal \contador[4]_i_2_n_0\ : STD_LOGIC;
  signal \contador[4]_i_3_n_0\ : STD_LOGIC;
  signal \contador[4]_i_4_n_0\ : STD_LOGIC;
  signal \contador[4]_i_5_n_0\ : STD_LOGIC;
  signal \contador[8]_i_2_n_0\ : STD_LOGIC;
  signal \contador[8]_i_3_n_0\ : STD_LOGIC;
  signal \contador[8]_i_4_n_0\ : STD_LOGIC;
  signal \contador[8]_i_5_n_0\ : STD_LOGIC;
  signal contador_reg : STD_LOGIC_VECTOR ( 17 downto 0 );
  signal \contador_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \contador_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \contador_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \contador_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \contador_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \contador_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \contador_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \contador_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \contador_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \contador_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \contador_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \contador_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \contador_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \contador_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \contador_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \contador_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \contador_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \contador_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \contador_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \contador_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \contador_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \contador_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \contador_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \contador_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \contador_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \contador_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \contador_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \contador_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \contador_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \contador_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \contador_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \contador_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \contador_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \contador_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \contador_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \contrasena_value[0]\ : STD_LOGIC;
  signal \contrasena_value[1]\ : STD_LOGIC;
  signal \contrasena_value[2]\ : STD_LOGIC;
  signal \contrasena_value[3]\ : STD_LOGIC;
  signal \contrasena_value_reg_n_0_[0][0]\ : STD_LOGIC;
  signal \contrasena_value_reg_n_0_[0][1]\ : STD_LOGIC;
  signal \contrasena_value_reg_n_0_[0][2]\ : STD_LOGIC;
  signal \contrasena_value_reg_n_0_[0][3]\ : STD_LOGIC;
  signal \contrasena_value_reg_n_0_[1][0]\ : STD_LOGIC;
  signal \contrasena_value_reg_n_0_[1][1]\ : STD_LOGIC;
  signal \contrasena_value_reg_n_0_[1][2]\ : STD_LOGIC;
  signal \contrasena_value_reg_n_0_[1][3]\ : STD_LOGIC;
  signal \contrasena_value_reg_n_0_[2][0]\ : STD_LOGIC;
  signal \contrasena_value_reg_n_0_[2][1]\ : STD_LOGIC;
  signal \contrasena_value_reg_n_0_[2][2]\ : STD_LOGIC;
  signal \contrasena_value_reg_n_0_[2][3]\ : STD_LOGIC;
  signal \contrasena_value_reg_n_0_[3][0]\ : STD_LOGIC;
  signal \contrasena_value_reg_n_0_[3][1]\ : STD_LOGIC;
  signal \contrasena_value_reg_n_0_[3][2]\ : STD_LOGIC;
  signal \contrasena_value_reg_n_0_[3][3]\ : STD_LOGIC;
  signal current_state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \display[0]_i_1_n_0\ : STD_LOGIC;
  signal \display[1]_i_1_n_0\ : STD_LOGIC;
  signal \display[2]_i_1_n_0\ : STD_LOGIC;
  signal \display[3]_i_1_n_0\ : STD_LOGIC;
  signal \display[3]_i_2_n_0\ : STD_LOGIC;
  signal display_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \display_izq[0]_i_1_n_0\ : STD_LOGIC;
  signal \display_izq[1]_i_1_n_0\ : STD_LOGIC;
  signal \display_izq[2]_i_1_n_0\ : STD_LOGIC;
  signal \display_izq[3]_i_1_n_0\ : STD_LOGIC;
  signal \display_izq[3]_i_2_n_0\ : STD_LOGIC;
  signal display_izq_OBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal inst_sync_n_0 : STD_LOGIC;
  signal led_b_OBUF : STD_LOGIC;
  signal led_s0_OBUF : STD_LOGIC;
  signal led_s1_OBUF : STD_LOGIC;
  signal led_s2_OBUF : STD_LOGIC;
  signal led_s3_OBUF : STD_LOGIC;
  signal led_s4_OBUF : STD_LOGIC;
  signal led_s5_OBUF : STD_LOGIC;
  signal next_state : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal num_IBUF : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal num_sig : STD_LOGIC;
  signal \num_sig[0]_i_1_n_0\ : STD_LOGIC;
  signal \num_sig[0]_i_2_n_0\ : STD_LOGIC;
  signal \num_sig[0]_i_3_n_0\ : STD_LOGIC;
  signal \num_sig[1]_i_1_n_0\ : STD_LOGIC;
  signal \num_sig[1]_i_2_n_0\ : STD_LOGIC;
  signal \num_sig[1]_i_3_n_0\ : STD_LOGIC;
  signal \num_sig[2]_i_1_n_0\ : STD_LOGIC;
  signal \num_sig[2]_i_2_n_0\ : STD_LOGIC;
  signal \num_sig[2]_i_3_n_0\ : STD_LOGIC;
  signal \num_sig[2]_i_4_n_0\ : STD_LOGIC;
  signal \num_sig[3]_i_2_n_0\ : STD_LOGIC;
  signal \num_sig[3]_i_3_n_0\ : STD_LOGIC;
  signal \num_sig[3]_i_4_n_0\ : STD_LOGIC;
  signal \num_sig[3]_i_5_n_0\ : STD_LOGIC;
  signal \num_sig[3]_i_6_n_0\ : STD_LOGIC;
  signal \num_sig[3]_i_7_n_0\ : STD_LOGIC;
  signal \num_sig[3]_i_8_n_0\ : STD_LOGIC;
  signal \num_sig[3]_i_9_n_0\ : STD_LOGIC;
  signal \num_sig_reg_n_0_[0]\ : STD_LOGIC;
  signal \num_sig_reg_n_0_[1]\ : STD_LOGIC;
  signal \num_sig_reg_n_0_[2]\ : STD_LOGIC;
  signal \num_sig_reg_n_0_[3]\ : STD_LOGIC;
  signal p_0_out : STD_LOGIC;
  signal reset_IBUF : STD_LOGIC;
  signal segment_OBUF : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal \selector[0]_i_1_n_0\ : STD_LOGIC;
  signal \selector[0]_i_2_n_0\ : STD_LOGIC;
  signal \selector[0]_i_3_n_0\ : STD_LOGIC;
  signal \selector[0]_i_4_n_0\ : STD_LOGIC;
  signal \selector[1]_i_1_n_0\ : STD_LOGIC;
  signal \selector[2]_i_1_n_0\ : STD_LOGIC;
  signal \selector[2]_i_2_n_0\ : STD_LOGIC;
  signal \selector[2]_i_3_n_0\ : STD_LOGIC;
  signal \selector[2]_i_4_n_0\ : STD_LOGIC;
  signal \selector[2]_i_5_n_0\ : STD_LOGIC;
  signal \selector_reg_n_0_[0]\ : STD_LOGIC;
  signal \selector_reg_n_0_[1]\ : STD_LOGIC;
  signal \NLW_contador_reg[16]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal \NLW_contador_reg[16]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \FSM_sequential_current_state[0]_i_1\ : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of \FSM_sequential_current_state[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \FSM_sequential_current_state[2]_i_2\ : label is "soft_lutpair9";
  attribute FSM_ENCODED_STATES : string;
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_state_reg[0]\ : label is "s0:000,s1:001,s2:010,s3:011,s4:100,s5:101,s6:110,";
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_state_reg[1]\ : label is "s0:000,s1:001,s2:010,s3:011,s4:100,s5:101,s6:110,";
  attribute FSM_ENCODED_STATES of \FSM_sequential_current_state_reg[2]\ : label is "s0:000,s1:001,s2:010,s3:011,s4:100,s5:101,s6:110,";
  attribute SOFT_HLUTNM of \contador[0]_i_5\ : label is "soft_lutpair8";
  attribute ADDER_THRESHOLD : integer;
  attribute ADDER_THRESHOLD of \contador_reg[0]_i_2\ : label is 11;
  attribute ADDER_THRESHOLD of \contador_reg[12]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \contador_reg[16]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \contador_reg[4]_i_1\ : label is 11;
  attribute ADDER_THRESHOLD of \contador_reg[8]_i_1\ : label is 11;
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \contrasena_value_reg[0][0]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP : string;
  attribute XILINX_TRANSFORM_PINMAP of \contrasena_value_reg[0][0]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \contrasena_value_reg[0][1]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \contrasena_value_reg[0][1]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \contrasena_value_reg[0][2]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \contrasena_value_reg[0][2]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \contrasena_value_reg[0][3]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \contrasena_value_reg[0][3]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \contrasena_value_reg[1][0]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \contrasena_value_reg[1][0]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \contrasena_value_reg[1][1]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \contrasena_value_reg[1][1]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \contrasena_value_reg[1][2]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \contrasena_value_reg[1][2]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \contrasena_value_reg[1][3]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \contrasena_value_reg[1][3]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \contrasena_value_reg[2][0]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \contrasena_value_reg[2][0]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \contrasena_value_reg[2][1]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \contrasena_value_reg[2][1]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \contrasena_value_reg[2][2]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \contrasena_value_reg[2][2]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \contrasena_value_reg[2][3]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \contrasena_value_reg[2][3]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \contrasena_value_reg[3][0]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \contrasena_value_reg[3][0]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \contrasena_value_reg[3][1]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \contrasena_value_reg[3][1]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \contrasena_value_reg[3][2]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \contrasena_value_reg[3][2]\ : label is "VCC:GE GND:CLR";
  attribute XILINX_LEGACY_PRIM of \contrasena_value_reg[3][3]\ : label is "LD";
  attribute XILINX_TRANSFORM_PINMAP of \contrasena_value_reg[3][3]\ : label is "VCC:GE GND:CLR";
  attribute SOFT_HLUTNM of led_s0_OBUF_inst_i_1 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of led_s1_OBUF_inst_i_1 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of led_s2_OBUF_inst_i_1 : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of led_s3_OBUF_inst_i_1 : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of led_s4_OBUF_inst_i_1 : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of led_s5_OBUF_inst_i_1 : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \num_sig[0]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \num_sig[0]_i_3\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \num_sig[1]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \num_sig[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \num_sig[2]_i_4\ : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of \num_sig[3]_i_4\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \num_sig[3]_i_5\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \num_sig[3]_i_9\ : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of \selector[0]_i_3\ : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \selector[2]_i_5\ : label is "soft_lutpair6";
begin
CLK_top_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => CLK_top_IBUF,
      O => CLK_top_IBUF_BUFG
    );
CLK_top_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => CLK_top,
      O => CLK_top_IBUF
    );
\FSM_sequential_current_state[0]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"07"
    )
        port map (
      I0 => current_state(1),
      I1 => current_state(2),
      I2 => current_state(0),
      O => next_state(0)
    );
\FSM_sequential_current_state[1]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1C"
    )
        port map (
      I0 => current_state(2),
      I1 => current_state(0),
      I2 => current_state(1),
      O => next_state(1)
    );
\FSM_sequential_current_state[2]_i_2\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"38"
    )
        port map (
      I0 => current_state(0),
      I1 => current_state(1),
      I2 => current_state(2),
      O => next_state(2)
    );
\FSM_sequential_current_state_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => boton_sig,
      CLR => reset_IBUF,
      D => next_state(0),
      Q => current_state(0)
    );
\FSM_sequential_current_state_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => boton_sig,
      CLR => reset_IBUF,
      D => next_state(1),
      Q => current_state(1)
    );
\FSM_sequential_current_state_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => boton_sig,
      CLR => reset_IBUF,
      D => next_state(2),
      Q => current_state(2)
    );
Inst_decoder: entity work.decoder
     port map (
      Q(3) => \num_sig_reg_n_0_[3]\,
      Q(2) => \num_sig_reg_n_0_[2]\,
      Q(1) => \num_sig_reg_n_0_[1]\,
      Q(0) => \num_sig_reg_n_0_[0]\,
      segment_OBUF(5 downto 0) => segment_OBUF(6 downto 1)
    );
boton_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => boton,
      O => led_b_OBUF
    );
check_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => check_OBUF,
      O => check
    );
check_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"41"
    )
        port map (
      I0 => current_state(0),
      I1 => current_state(1),
      I2 => current_state(2),
      O => check_i_1_n_0
    );
check_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000002"
    )
        port map (
      I0 => check_i_3_n_0,
      I1 => check_i_4_n_0,
      I2 => \contrasena_value_reg_n_0_[3][2]\,
      I3 => \contrasena_value_reg_n_0_[2][3]\,
      I4 => \contrasena_value_reg_n_0_[3][0]\,
      I5 => \contrasena_value_reg_n_0_[0][3]\,
      O => check_i_2_n_0
    );
check_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000400000000"
    )
        port map (
      I0 => current_state(0),
      I1 => current_state(2),
      I2 => \contrasena_value_reg_n_0_[2][1]\,
      I3 => \contrasena_value_reg_n_0_[3][1]\,
      I4 => \contrasena_value_reg_n_0_[1][1]\,
      I5 => \contrasena_value_reg_n_0_[3][3]\,
      O => check_i_3_n_0
    );
check_i_4: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \contrasena_value_reg_n_0_[2][0]\,
      I1 => \contrasena_value_reg_n_0_[1][0]\,
      I2 => \contrasena_value_reg_n_0_[2][2]\,
      I3 => \contrasena_value_reg_n_0_[1][3]\,
      I4 => check_i_5_n_0,
      O => check_i_4_n_0
    );
check_i_5: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => \contrasena_value_reg_n_0_[0][2]\,
      I1 => \contrasena_value_reg_n_0_[0][1]\,
      I2 => \contrasena_value_reg_n_0_[0][0]\,
      I3 => \contrasena_value_reg_n_0_[1][2]\,
      O => check_i_5_n_0
    );
check_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => check_i_1_n_0,
      D => check_i_2_n_0,
      Q => check_OBUF,
      R => '0'
    );
\contador[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000004044444444"
    )
        port map (
      I0 => \num_sig[3]_i_5_n_0\,
      I1 => \num_sig[3]_i_4_n_0\,
      I2 => \contador[0]_i_3_n_0\,
      I3 => \contador[0]_i_4_n_0\,
      I4 => \contador[0]_i_5_n_0\,
      I5 => \selector[2]_i_2_n_0\,
      O => contador
    );
\contador[0]_i_10\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => contador_reg(0),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[0]_i_10_n_0\
    );
\contador[0]_i_11\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FB"
    )
        port map (
      I0 => contador_reg(3),
      I1 => contador_reg(6),
      I2 => contador_reg(4),
      O => \contador[0]_i_11_n_0\
    );
\contador[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004000000000000"
    )
        port map (
      I0 => contador_reg(9),
      I1 => contador_reg(8),
      I2 => contador_reg(7),
      I3 => \contador[0]_i_11_n_0\,
      I4 => contador_reg(16),
      I5 => contador_reg(17),
      O => \contador[0]_i_3_n_0\
    );
\contador[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFF7"
    )
        port map (
      I0 => contador_reg(11),
      I1 => contador_reg(10),
      I2 => contador_reg(0),
      I3 => contador_reg(1),
      I4 => contador_reg(2),
      I5 => contador_reg(5),
      O => \contador[0]_i_4_n_0\
    );
\contador[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFFE"
    )
        port map (
      I0 => contador_reg(15),
      I1 => contador_reg(12),
      I2 => contador_reg(13),
      I3 => contador_reg(14),
      O => \contador[0]_i_5_n_0\
    );
\contador[0]_i_6\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(0),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[0]_i_6_n_0\
    );
\contador[0]_i_7\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(3),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[0]_i_7_n_0\
    );
\contador[0]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(2),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[0]_i_8_n_0\
    );
\contador[0]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(1),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[0]_i_9_n_0\
    );
\contador[12]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(15),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[12]_i_2_n_0\
    );
\contador[12]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(14),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[12]_i_3_n_0\
    );
\contador[12]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(13),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[12]_i_4_n_0\
    );
\contador[12]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(12),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[12]_i_5_n_0\
    );
\contador[16]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(17),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[16]_i_2_n_0\
    );
\contador[16]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(16),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[16]_i_3_n_0\
    );
\contador[4]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(7),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[4]_i_2_n_0\
    );
\contador[4]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(6),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[4]_i_3_n_0\
    );
\contador[4]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(5),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[4]_i_4_n_0\
    );
\contador[4]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(4),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[4]_i_5_n_0\
    );
\contador[8]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(11),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[8]_i_2_n_0\
    );
\contador[8]_i_3\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(10),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[8]_i_3_n_0\
    );
\contador[8]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(9),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[8]_i_4_n_0\
    );
\contador[8]_i_5\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => contador_reg(8),
      I1 => \selector[2]_i_2_n_0\,
      O => \contador[8]_i_5_n_0\
    );
\contador_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[0]_i_2_n_7\,
      Q => contador_reg(0),
      R => '0'
    );
\contador_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \contador_reg[0]_i_2_n_0\,
      CO(2) => \contador_reg[0]_i_2_n_1\,
      CO(1) => \contador_reg[0]_i_2_n_2\,
      CO(0) => \contador_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3 downto 1) => B"000",
      DI(0) => \contador[0]_i_6_n_0\,
      O(3) => \contador_reg[0]_i_2_n_4\,
      O(2) => \contador_reg[0]_i_2_n_5\,
      O(1) => \contador_reg[0]_i_2_n_6\,
      O(0) => \contador_reg[0]_i_2_n_7\,
      S(3) => \contador[0]_i_7_n_0\,
      S(2) => \contador[0]_i_8_n_0\,
      S(1) => \contador[0]_i_9_n_0\,
      S(0) => \contador[0]_i_10_n_0\
    );
\contador_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[8]_i_1_n_5\,
      Q => contador_reg(10),
      R => '0'
    );
\contador_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[8]_i_1_n_4\,
      Q => contador_reg(11),
      R => '0'
    );
\contador_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[12]_i_1_n_7\,
      Q => contador_reg(12),
      R => '0'
    );
\contador_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \contador_reg[8]_i_1_n_0\,
      CO(3) => \contador_reg[12]_i_1_n_0\,
      CO(2) => \contador_reg[12]_i_1_n_1\,
      CO(1) => \contador_reg[12]_i_1_n_2\,
      CO(0) => \contador_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \contador_reg[12]_i_1_n_4\,
      O(2) => \contador_reg[12]_i_1_n_5\,
      O(1) => \contador_reg[12]_i_1_n_6\,
      O(0) => \contador_reg[12]_i_1_n_7\,
      S(3) => \contador[12]_i_2_n_0\,
      S(2) => \contador[12]_i_3_n_0\,
      S(1) => \contador[12]_i_4_n_0\,
      S(0) => \contador[12]_i_5_n_0\
    );
\contador_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[12]_i_1_n_6\,
      Q => contador_reg(13),
      R => '0'
    );
\contador_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[12]_i_1_n_5\,
      Q => contador_reg(14),
      R => '0'
    );
\contador_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[12]_i_1_n_4\,
      Q => contador_reg(15),
      R => '0'
    );
\contador_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[16]_i_1_n_7\,
      Q => contador_reg(16),
      R => '0'
    );
\contador_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \contador_reg[12]_i_1_n_0\,
      CO(3 downto 1) => \NLW_contador_reg[16]_i_1_CO_UNCONNECTED\(3 downto 1),
      CO(0) => \contador_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3 downto 2) => \NLW_contador_reg[16]_i_1_O_UNCONNECTED\(3 downto 2),
      O(1) => \contador_reg[16]_i_1_n_6\,
      O(0) => \contador_reg[16]_i_1_n_7\,
      S(3 downto 2) => B"00",
      S(1) => \contador[16]_i_2_n_0\,
      S(0) => \contador[16]_i_3_n_0\
    );
\contador_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[16]_i_1_n_6\,
      Q => contador_reg(17),
      R => '0'
    );
\contador_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[0]_i_2_n_6\,
      Q => contador_reg(1),
      R => '0'
    );
\contador_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[0]_i_2_n_5\,
      Q => contador_reg(2),
      R => '0'
    );
\contador_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[0]_i_2_n_4\,
      Q => contador_reg(3),
      R => '0'
    );
\contador_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[4]_i_1_n_7\,
      Q => contador_reg(4),
      R => '0'
    );
\contador_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \contador_reg[0]_i_2_n_0\,
      CO(3) => \contador_reg[4]_i_1_n_0\,
      CO(2) => \contador_reg[4]_i_1_n_1\,
      CO(1) => \contador_reg[4]_i_1_n_2\,
      CO(0) => \contador_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \contador_reg[4]_i_1_n_4\,
      O(2) => \contador_reg[4]_i_1_n_5\,
      O(1) => \contador_reg[4]_i_1_n_6\,
      O(0) => \contador_reg[4]_i_1_n_7\,
      S(3) => \contador[4]_i_2_n_0\,
      S(2) => \contador[4]_i_3_n_0\,
      S(1) => \contador[4]_i_4_n_0\,
      S(0) => \contador[4]_i_5_n_0\
    );
\contador_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[4]_i_1_n_6\,
      Q => contador_reg(5),
      R => '0'
    );
\contador_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[4]_i_1_n_5\,
      Q => contador_reg(6),
      R => '0'
    );
\contador_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[4]_i_1_n_4\,
      Q => contador_reg(7),
      R => '0'
    );
\contador_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[8]_i_1_n_7\,
      Q => contador_reg(8),
      R => '0'
    );
\contador_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \contador_reg[4]_i_1_n_0\,
      CO(3) => \contador_reg[8]_i_1_n_0\,
      CO(2) => \contador_reg[8]_i_1_n_1\,
      CO(1) => \contador_reg[8]_i_1_n_2\,
      CO(0) => \contador_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3 downto 0) => B"0000",
      O(3) => \contador_reg[8]_i_1_n_4\,
      O(2) => \contador_reg[8]_i_1_n_5\,
      O(1) => \contador_reg[8]_i_1_n_6\,
      O(0) => \contador_reg[8]_i_1_n_7\,
      S(3) => \contador[8]_i_2_n_0\,
      S(2) => \contador[8]_i_3_n_0\,
      S(1) => \contador[8]_i_4_n_0\,
      S(0) => \contador[8]_i_5_n_0\
    );
\contador_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => contador,
      D => \contador_reg[8]_i_1_n_6\,
      Q => contador_reg(9),
      R => '0'
    );
\contrasena_value_reg[0][0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => num_IBUF(0),
      G => \contrasena_value[0]\,
      GE => '1',
      Q => \contrasena_value_reg_n_0_[0][0]\
    );
\contrasena_value_reg[0][1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => num_IBUF(1),
      G => \contrasena_value[0]\,
      GE => '1',
      Q => \contrasena_value_reg_n_0_[0][1]\
    );
\contrasena_value_reg[0][2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => num_IBUF(2),
      G => \contrasena_value[0]\,
      GE => '1',
      Q => \contrasena_value_reg_n_0_[0][2]\
    );
\contrasena_value_reg[0][3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => num_IBUF(3),
      G => \contrasena_value[0]\,
      GE => '1',
      Q => \contrasena_value_reg_n_0_[0][3]\
    );
\contrasena_value_reg[1][0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => num_IBUF(0),
      G => \contrasena_value[1]\,
      GE => '1',
      Q => \contrasena_value_reg_n_0_[1][0]\
    );
\contrasena_value_reg[1][1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => num_IBUF(1),
      G => \contrasena_value[1]\,
      GE => '1',
      Q => \contrasena_value_reg_n_0_[1][1]\
    );
\contrasena_value_reg[1][2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => num_IBUF(2),
      G => \contrasena_value[1]\,
      GE => '1',
      Q => \contrasena_value_reg_n_0_[1][2]\
    );
\contrasena_value_reg[1][3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => num_IBUF(3),
      G => \contrasena_value[1]\,
      GE => '1',
      Q => \contrasena_value_reg_n_0_[1][3]\
    );
\contrasena_value_reg[2][0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => num_IBUF(0),
      G => \contrasena_value[2]\,
      GE => '1',
      Q => \contrasena_value_reg_n_0_[2][0]\
    );
\contrasena_value_reg[2][1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => num_IBUF(1),
      G => \contrasena_value[2]\,
      GE => '1',
      Q => \contrasena_value_reg_n_0_[2][1]\
    );
\contrasena_value_reg[2][2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => num_IBUF(2),
      G => \contrasena_value[2]\,
      GE => '1',
      Q => \contrasena_value_reg_n_0_[2][2]\
    );
\contrasena_value_reg[2][3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => num_IBUF(3),
      G => \contrasena_value[2]\,
      GE => '1',
      Q => \contrasena_value_reg_n_0_[2][3]\
    );
\contrasena_value_reg[3][0]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => num_IBUF(0),
      G => \contrasena_value[3]\,
      GE => '1',
      Q => \contrasena_value_reg_n_0_[3][0]\
    );
\contrasena_value_reg[3][1]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => num_IBUF(1),
      G => \contrasena_value[3]\,
      GE => '1',
      Q => \contrasena_value_reg_n_0_[3][1]\
    );
\contrasena_value_reg[3][2]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => num_IBUF(2),
      G => \contrasena_value[3]\,
      GE => '1',
      Q => \contrasena_value_reg_n_0_[3][2]\
    );
\contrasena_value_reg[3][3]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => num_IBUF(3),
      G => \contrasena_value[3]\,
      GE => '1',
      Q => \contrasena_value_reg_n_0_[3][3]\
    );
\display[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFFE00FEFFFFFF"
    )
        port map (
      I0 => \selector_reg_n_0_[0]\,
      I1 => \selector_reg_n_0_[1]\,
      I2 => p_0_out,
      I3 => current_state(2),
      I4 => current_state(1),
      I5 => current_state(0),
      O => \display[0]_i_1_n_0\
    );
\display[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FFFB00FBFFFFFF"
    )
        port map (
      I0 => p_0_out,
      I1 => \selector_reg_n_0_[0]\,
      I2 => \selector_reg_n_0_[1]\,
      I3 => current_state(2),
      I4 => current_state(0),
      I5 => current_state(1),
      O => \display[1]_i_1_n_0\
    );
\display[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00FBFBFF00FFFFFF"
    )
        port map (
      I0 => p_0_out,
      I1 => \selector_reg_n_0_[1]\,
      I2 => \selector_reg_n_0_[0]\,
      I3 => current_state(1),
      I4 => current_state(0),
      I5 => current_state(2),
      O => \display[2]_i_1_n_0\
    );
\display[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"1F7F1F7F1F7F5F7F"
    )
        port map (
      I0 => current_state(0),
      I1 => current_state(1),
      I2 => current_state(2),
      I3 => p_0_out,
      I4 => \selector_reg_n_0_[1]\,
      I5 => \selector_reg_n_0_[0]\,
      O => \display[3]_i_1_n_0\
    );
\display[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"20262626FFFFFFFF"
    )
        port map (
      I0 => current_state(1),
      I1 => current_state(0),
      I2 => p_0_out,
      I3 => \selector_reg_n_0_[0]\,
      I4 => \selector_reg_n_0_[1]\,
      I5 => current_state(2),
      O => \display[3]_i_2_n_0\
    );
\display_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => display_OBUF(0),
      O => display(0)
    );
\display_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => display_OBUF(1),
      O => display(1)
    );
\display_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => display_OBUF(2),
      O => display(2)
    );
\display_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => display_OBUF(3),
      O => display(3)
    );
\display_izq[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"77777777FFF7FFFF"
    )
        port map (
      I0 => current_state(1),
      I1 => current_state(2),
      I2 => \selector_reg_n_0_[0]\,
      I3 => \selector_reg_n_0_[1]\,
      I4 => p_0_out,
      I5 => current_state(0),
      O => \display_izq[0]_i_1_n_0\
    );
\display_izq[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"77777777FFFF7FFF"
    )
        port map (
      I0 => current_state(1),
      I1 => current_state(2),
      I2 => p_0_out,
      I3 => \selector_reg_n_0_[0]\,
      I4 => \selector_reg_n_0_[1]\,
      I5 => current_state(0),
      O => \display_izq[1]_i_1_n_0\
    );
\display_izq[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"77777777FFFF7FFF"
    )
        port map (
      I0 => current_state(1),
      I1 => current_state(2),
      I2 => p_0_out,
      I3 => \selector_reg_n_0_[1]\,
      I4 => \selector_reg_n_0_[0]\,
      I5 => current_state(0),
      O => \display_izq[2]_i_1_n_0\
    );
\display_izq[3]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"77777777F7F7F7FF"
    )
        port map (
      I0 => current_state(1),
      I1 => current_state(2),
      I2 => p_0_out,
      I3 => \selector_reg_n_0_[0]\,
      I4 => \selector_reg_n_0_[1]\,
      I5 => current_state(0),
      O => \display_izq[3]_i_1_n_0\
    );
\display_izq[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0FFF4FFF4FFF5FFF"
    )
        port map (
      I0 => current_state(0),
      I1 => p_0_out,
      I2 => current_state(2),
      I3 => current_state(1),
      I4 => \selector_reg_n_0_[1]\,
      I5 => \selector_reg_n_0_[0]\,
      O => \display_izq[3]_i_2_n_0\
    );
\display_izq_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => display_izq_OBUF(0),
      O => display_izq(0)
    );
\display_izq_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => display_izq_OBUF(1),
      O => display_izq(1)
    );
\display_izq_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => display_izq_OBUF(2),
      O => display_izq(2)
    );
\display_izq_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => display_izq_OBUF(3),
      O => display_izq(3)
    );
\display_izq_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => \display_izq[3]_i_1_n_0\,
      D => \display_izq[0]_i_1_n_0\,
      Q => display_izq_OBUF(0),
      R => '0'
    );
\display_izq_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => \display_izq[3]_i_1_n_0\,
      D => \display_izq[1]_i_1_n_0\,
      Q => display_izq_OBUF(1),
      R => '0'
    );
\display_izq_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => \display_izq[3]_i_1_n_0\,
      D => \display_izq[2]_i_1_n_0\,
      Q => display_izq_OBUF(2),
      R => '0'
    );
\display_izq_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => \display_izq[3]_i_1_n_0\,
      D => \display_izq[3]_i_2_n_0\,
      Q => display_izq_OBUF(3),
      R => '0'
    );
\display_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => \display[3]_i_1_n_0\,
      D => \display[0]_i_1_n_0\,
      Q => display_OBUF(0),
      R => '0'
    );
\display_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => \display[3]_i_1_n_0\,
      D => \display[1]_i_1_n_0\,
      Q => display_OBUF(1),
      R => '0'
    );
\display_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => \display[3]_i_1_n_0\,
      D => \display[2]_i_1_n_0\,
      Q => display_OBUF(2),
      R => '0'
    );
\display_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => \display[3]_i_1_n_0\,
      D => \display[3]_i_2_n_0\,
      Q => display_OBUF(3),
      R => '0'
    );
inst_edge: entity work.EDGEDCTR
     port map (
      CLK => CLK_top_IBUF_BUFG,
      E(0) => \contrasena_value[0]\,
      \FSM_sequential_current_state_reg[0]\(0) => \contrasena_value[1]\,
      Q(2 downto 0) => current_state(2 downto 0),
      \sreg_reg[0]_0\(0) => boton_sig,
      \sreg_reg[0]_1\ => inst_sync_n_0,
      \sreg_reg[1]_0\(0) => \contrasena_value[2]\,
      \sreg_reg[1]_1\(0) => \contrasena_value[3]\
    );
inst_sync: entity work.SYNCHRNZR
     port map (
      CLK => CLK_top_IBUF_BUFG,
      boton => inst_sync_n_0,
      led_b_OBUF => led_b_OBUF
    );
led_b_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => led_b_OBUF,
      O => led_b
    );
led_s0_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => led_s0_OBUF,
      O => led_s0
    );
led_s0_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"01"
    )
        port map (
      I0 => current_state(2),
      I1 => current_state(0),
      I2 => current_state(1),
      O => led_s0_OBUF
    );
led_s1_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => led_s1_OBUF,
      O => led_s1
    );
led_s1_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => current_state(2),
      I1 => current_state(0),
      I2 => current_state(1),
      O => led_s1_OBUF
    );
led_s2_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => led_s2_OBUF,
      O => led_s2
    );
led_s2_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"04"
    )
        port map (
      I0 => current_state(2),
      I1 => current_state(1),
      I2 => current_state(0),
      O => led_s2_OBUF
    );
led_s3_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => led_s3_OBUF,
      O => led_s3
    );
led_s3_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"40"
    )
        port map (
      I0 => current_state(2),
      I1 => current_state(0),
      I2 => current_state(1),
      O => led_s3_OBUF
    );
led_s4_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => led_s4_OBUF,
      O => led_s4
    );
led_s4_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => current_state(2),
      I1 => current_state(0),
      I2 => current_state(1),
      O => led_s4_OBUF
    );
led_s5_OBUF_inst: unisim.vcomponents.OBUF
     port map (
      I => led_s5_OBUF,
      O => led_s5
    );
led_s5_OBUF_inst_i_1: unisim.vcomponents.LUT3
    generic map(
      INIT => X"20"
    )
        port map (
      I0 => current_state(2),
      I1 => current_state(1),
      I2 => current_state(0),
      O => led_s5_OBUF
    );
\num_IBUF[0]_inst\: unisim.vcomponents.IBUF
     port map (
      I => num(0),
      O => num_IBUF(0)
    );
\num_IBUF[1]_inst\: unisim.vcomponents.IBUF
     port map (
      I => num(1),
      O => num_IBUF(1)
    );
\num_IBUF[2]_inst\: unisim.vcomponents.IBUF
     port map (
      I => num(2),
      O => num_IBUF(2)
    );
\num_IBUF[3]_inst\: unisim.vcomponents.IBUF
     port map (
      I => num(3),
      O => num_IBUF(3)
    );
\num_sig[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABFFAAAA"
    )
        port map (
      I0 => \num_sig[0]_i_2_n_0\,
      I1 => current_state(1),
      I2 => current_state(0),
      I3 => current_state(2),
      I4 => num_IBUF(0),
      O => \num_sig[0]_i_1_n_0\
    );
\num_sig[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFEA00AA"
    )
        port map (
      I0 => \num_sig[0]_i_3_n_0\,
      I1 => \selector_reg_n_0_[1]\,
      I2 => \selector_reg_n_0_[0]\,
      I3 => p_0_out,
      I4 => \contrasena_value_reg_n_0_[3][0]\,
      I5 => \num_sig[2]_i_4_n_0\,
      O => \num_sig[0]_i_2_n_0\
    );
\num_sig[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FCA00CA"
    )
        port map (
      I0 => \contrasena_value_reg_n_0_[0][0]\,
      I1 => \contrasena_value_reg_n_0_[2][0]\,
      I2 => \selector_reg_n_0_[1]\,
      I3 => \selector_reg_n_0_[0]\,
      I4 => \contrasena_value_reg_n_0_[1][0]\,
      O => \num_sig[0]_i_3_n_0\
    );
\num_sig[1]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABFFAAAA"
    )
        port map (
      I0 => \num_sig[1]_i_2_n_0\,
      I1 => current_state(1),
      I2 => current_state(0),
      I3 => current_state(2),
      I4 => num_IBUF(1),
      O => \num_sig[1]_i_1_n_0\
    );
\num_sig[1]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFEA00AA"
    )
        port map (
      I0 => \num_sig[1]_i_3_n_0\,
      I1 => \selector_reg_n_0_[1]\,
      I2 => \selector_reg_n_0_[0]\,
      I3 => p_0_out,
      I4 => \contrasena_value_reg_n_0_[3][1]\,
      I5 => \num_sig[2]_i_4_n_0\,
      O => \num_sig[1]_i_2_n_0\
    );
\num_sig[1]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FCA00CA"
    )
        port map (
      I0 => \contrasena_value_reg_n_0_[0][1]\,
      I1 => \contrasena_value_reg_n_0_[2][1]\,
      I2 => \selector_reg_n_0_[1]\,
      I3 => \selector_reg_n_0_[0]\,
      I4 => \contrasena_value_reg_n_0_[1][1]\,
      O => \num_sig[1]_i_3_n_0\
    );
\num_sig[2]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"ABFFAAAA"
    )
        port map (
      I0 => \num_sig[2]_i_2_n_0\,
      I1 => current_state(1),
      I2 => current_state(0),
      I3 => current_state(2),
      I4 => num_IBUF(2),
      O => \num_sig[2]_i_1_n_0\
    );
\num_sig[2]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"00000000FFEA00AA"
    )
        port map (
      I0 => \num_sig[2]_i_3_n_0\,
      I1 => \selector_reg_n_0_[1]\,
      I2 => \selector_reg_n_0_[0]\,
      I3 => p_0_out,
      I4 => \contrasena_value_reg_n_0_[3][2]\,
      I5 => \num_sig[2]_i_4_n_0\,
      O => \num_sig[2]_i_2_n_0\
    );
\num_sig[2]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0FCA00CA"
    )
        port map (
      I0 => \contrasena_value_reg_n_0_[0][2]\,
      I1 => \contrasena_value_reg_n_0_[2][2]\,
      I2 => \selector_reg_n_0_[1]\,
      I3 => \selector_reg_n_0_[0]\,
      I4 => \contrasena_value_reg_n_0_[1][2]\,
      O => \num_sig[2]_i_3_n_0\
    );
\num_sig[2]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"DF9F"
    )
        port map (
      I0 => current_state(0),
      I1 => current_state(1),
      I2 => current_state(2),
      I3 => p_0_out,
      O => \num_sig[2]_i_4_n_0\
    );
\num_sig[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"777F"
    )
        port map (
      I0 => current_state(0),
      I1 => current_state(2),
      I2 => current_state(1),
      I3 => p_0_out,
      O => num_sig
    );
\num_sig[3]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFF404"
    )
        port map (
      I0 => \num_sig[3]_i_3_n_0\,
      I1 => \num_sig[3]_i_4_n_0\,
      I2 => \num_sig[3]_i_5_n_0\,
      I3 => num_IBUF(3),
      I4 => \num_sig[3]_i_6_n_0\,
      I5 => \num_sig[3]_i_7_n_0\,
      O => \num_sig[3]_i_2_n_0\
    );
\num_sig[3]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFF305FFFFF3F5"
    )
        port map (
      I0 => \contrasena_value_reg_n_0_[0][3]\,
      I1 => \contrasena_value_reg_n_0_[1][3]\,
      I2 => \selector_reg_n_0_[1]\,
      I3 => \selector_reg_n_0_[0]\,
      I4 => p_0_out,
      I5 => \contrasena_value_reg_n_0_[2][3]\,
      O => \num_sig[3]_i_3_n_0\
    );
\num_sig[3]_i_4\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => current_state(1),
      I1 => current_state(0),
      O => \num_sig[3]_i_4_n_0\
    );
\num_sig[3]_i_5\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"1F"
    )
        port map (
      I0 => current_state(1),
      I1 => current_state(0),
      I2 => current_state(2),
      O => \num_sig[3]_i_5_n_0\
    );
\num_sig[3]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"000000000000E000"
    )
        port map (
      I0 => p_0_out,
      I1 => \contrasena_value_reg_n_0_[3][3]\,
      I2 => \selector_reg_n_0_[1]\,
      I3 => \selector_reg_n_0_[0]\,
      I4 => \num_sig[3]_i_8_n_0\,
      I5 => current_state(0),
      O => \num_sig[3]_i_6_n_0\
    );
\num_sig[3]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"2000200020000000"
    )
        port map (
      I0 => current_state(0),
      I1 => current_state(1),
      I2 => current_state(2),
      I3 => \contrasena_value_reg_n_0_[3][3]\,
      I4 => \num_sig[3]_i_9_n_0\,
      I5 => p_0_out,
      O => \num_sig[3]_i_7_n_0\
    );
\num_sig[3]_i_8\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => current_state(2),
      I1 => current_state(1),
      O => \num_sig[3]_i_8_n_0\
    );
\num_sig[3]_i_9\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"8"
    )
        port map (
      I0 => \selector_reg_n_0_[1]\,
      I1 => \selector_reg_n_0_[0]\,
      O => \num_sig[3]_i_9_n_0\
    );
\num_sig_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => num_sig,
      D => \num_sig[0]_i_1_n_0\,
      Q => \num_sig_reg_n_0_[0]\,
      R => '0'
    );
\num_sig_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => num_sig,
      D => \num_sig[1]_i_1_n_0\,
      Q => \num_sig_reg_n_0_[1]\,
      R => '0'
    );
\num_sig_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => num_sig,
      D => \num_sig[2]_i_1_n_0\,
      Q => \num_sig_reg_n_0_[2]\,
      R => '0'
    );
\num_sig_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => num_sig,
      D => \num_sig[3]_i_2_n_0\,
      Q => \num_sig_reg_n_0_[3]\,
      R => '0'
    );
reset_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => reset,
      O => reset_IBUF
    );
\segment_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segment_OBUF(0),
      O => segment(0)
    );
\segment_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0091"
    )
        port map (
      I0 => \num_sig_reg_n_0_[1]\,
      I1 => \num_sig_reg_n_0_[2]\,
      I2 => \num_sig_reg_n_0_[0]\,
      I3 => \num_sig_reg_n_0_[3]\,
      O => segment_OBUF(0)
    );
\segment_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segment_OBUF(1),
      O => segment(1)
    );
\segment_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segment_OBUF(2),
      O => segment(2)
    );
\segment_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segment_OBUF(3),
      O => segment(3)
    );
\segment_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segment_OBUF(4),
      O => segment(4)
    );
\segment_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segment_OBUF(5),
      O => segment(5)
    );
\segment_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => segment_OBUF(6),
      O => segment(6)
    );
\selector[0]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFF300000008"
    )
        port map (
      I0 => \num_sig[3]_i_4_n_0\,
      I1 => \selector[2]_i_2_n_0\,
      I2 => \selector[0]_i_2_n_0\,
      I3 => \selector[0]_i_3_n_0\,
      I4 => \selector[0]_i_4_n_0\,
      I5 => \selector_reg_n_0_[0]\,
      O => \selector[0]_i_1_n_0\
    );
\selector[0]_i_2\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFEBFFFF"
    )
        port map (
      I0 => \contador[0]_i_4_n_0\,
      I1 => current_state(1),
      I2 => current_state(0),
      I3 => contador_reg(5),
      I4 => current_state(2),
      I5 => contador_reg(15),
      O => \selector[0]_i_2_n_0\
    );
\selector[0]_i_3\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => contador_reg(14),
      I1 => contador_reg(13),
      I2 => contador_reg(12),
      O => \selector[0]_i_3_n_0\
    );
\selector[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFBFFFF"
    )
        port map (
      I0 => contador_reg(4),
      I1 => contador_reg(6),
      I2 => contador_reg(3),
      I3 => contador_reg(9),
      I4 => contador_reg(8),
      I5 => contador_reg(7),
      O => \selector[0]_i_4_n_0\
    );
\selector[1]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF07FF00007000"
    )
        port map (
      I0 => current_state(1),
      I1 => current_state(0),
      I2 => \selector_reg_n_0_[0]\,
      I3 => \selector[2]_i_2_n_0\,
      I4 => \selector[2]_i_3_n_0\,
      I5 => \selector_reg_n_0_[1]\,
      O => \selector[1]_i_1_n_0\
    );
\selector[2]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFF15FF00004000"
    )
        port map (
      I0 => current_state(0),
      I1 => \selector_reg_n_0_[1]\,
      I2 => \selector_reg_n_0_[0]\,
      I3 => \selector[2]_i_2_n_0\,
      I4 => \selector[2]_i_3_n_0\,
      I5 => p_0_out,
      O => \selector[2]_i_1_n_0\
    );
\selector[2]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"E000"
    )
        port map (
      I0 => \selector[2]_i_4_n_0\,
      I1 => \contador[0]_i_5_n_0\,
      I2 => contador_reg(17),
      I3 => contador_reg(16),
      O => \selector[2]_i_2_n_0\
    );
\selector[2]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFFFFFE"
    )
        port map (
      I0 => \selector[0]_i_4_n_0\,
      I1 => contador_reg(14),
      I2 => contador_reg(13),
      I3 => contador_reg(12),
      I4 => \selector[2]_i_5_n_0\,
      I5 => \contador[0]_i_4_n_0\,
      O => \selector[2]_i_3_n_0\
    );
\selector[2]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFA8000000000000"
    )
        port map (
      I0 => contador_reg(8),
      I1 => contador_reg(7),
      I2 => contador_reg(6),
      I3 => contador_reg(9),
      I4 => contador_reg(11),
      I5 => contador_reg(10),
      O => \selector[2]_i_4_n_0\
    );
\selector[2]_i_5\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFBFBFF"
    )
        port map (
      I0 => contador_reg(15),
      I1 => current_state(2),
      I2 => contador_reg(5),
      I3 => current_state(0),
      I4 => current_state(1),
      O => \selector[2]_i_5_n_0\
    );
\selector_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => '1',
      D => \selector[0]_i_1_n_0\,
      Q => \selector_reg_n_0_[0]\,
      R => '0'
    );
\selector_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => '1',
      D => \selector[1]_i_1_n_0\,
      Q => \selector_reg_n_0_[1]\,
      R => '0'
    );
\selector_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_top_IBUF_BUFG,
      CE => '1',
      D => \selector[2]_i_1_n_0\,
      Q => p_0_out,
      R => '0'
    );
end STRUCTURE;
