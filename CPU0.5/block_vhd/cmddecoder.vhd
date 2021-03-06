library ieee;
use ieee.std_logic_1164.all;

entity cmddecoder is
	port(
		cmdar_code: in std_logic_vector(7 downto 0);
		enable: in std_logic;
		mov1, mov2, mov3, add, sub, or1, not1, rsr, rsl, jmp, jz, jc, in1, out1, nop, halt: out std_logic
	);
end entity cmddecoder;

architecture cmddecoder of cmddecoder is
	signal IR_2:std_logic_vector(7 downto 0);
	signal R1, R2:std_logic;
	begin
		IR_2 <= not cmdar_code;
		R1 <= not (cmdar_code(3) and cmdar_code(2) and enable);
        R2 <= not (cmdar_code(1) and cmdar_code(0) and enable);
		mov1<=cmdar_code(7) and cmdar_code(6) and cmdar_code(5) and cmdar_code(4) and R1 and R2 and enable;
		mov2<=cmdar_code(7) and cmdar_code(6) and cmdar_code(5) and cmdar_code(4) and cmdar_code(3) and cmdar_code(2) and R2 and enable;
		mov3<=cmdar_code(7) and cmdar_code(6) and cmdar_code(5) and cmdar_code(4) and R1 and cmdar_code(1) and cmdar_code(0) and enable;
		add<=cmdar_code(7) and IR_2(6) and IR_2(5) and cmdar_code(4) and R1 and R2 and enable;
		sub<=IR_2(7) and cmdar_code(6) and cmdar_code(5) and IR_2(4) and R1 and R2 and enable;
		or1<=cmdar_code(7) and IR_2(6) and cmdar_code(5) and cmdar_code(4) and R1 and R2 and enable;
		not1<=IR_2(7) and cmdar_code(6) and IR_2(5) and cmdar_code(4) and R1 and enable;
		rsr<=cmdar_code(7) and IR_2(6) and cmdar_code(5) and IR_2(4) and R1 and IR_2(1) and IR_2(0) and enable;
		rsl<=cmdar_code(7) and IR_2(6) and cmdar_code(5) and IR_2(4) and R1 and cmdar_code(1) and cmdar_code(0) and enable;
		jmp<=IR_2(7) and IR_2(6) and cmdar_code(5) and cmdar_code(4) and IR_2(3) and IR_2(2) and IR_2(1) and IR_2(0) and enable;
		jz<=IR_2(7) and IR_2(6) and cmdar_code(5) and cmdar_code(4) and IR_2(3) and IR_2(2) and IR_2(1) and cmdar_code(0) and enable; 
		jc<=IR_2(7) and IR_2(6) and cmdar_code(5) and cmdar_code(4) and IR_2(3) and IR_2(2) and cmdar_code(1) and IR_2(0) and enable;
		in1<=IR_2(7) and IR_2(6) and cmdar_code(5) and IR_2(4) and R1 and enable;
		out1<=IR_2(7) and cmdar_code(6) and IR_2(5) and IR_2(4) and R1 and enable;
		nop<=IR_2(7) and cmdar_code(6) and cmdar_code(5) and cmdar_code(4) and IR_2(3) and IR_2(2) and IR_2(1) and IR_2(0) and enable;
		halt<= cmdar_code(7) and IR_2(6) and IR_2(5) and IR_2(4) and IR_2(3) and IR_2(2) and IR_2(1) and IR_2(0) and enable; 
end architecture cmddecoder;