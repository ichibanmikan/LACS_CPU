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
	signal cmdcode, tempcmd: std_logic_vector(3 downto 0);
	signal r1code,r2code, tempr1, tempr2: std_logic_vector(1 downto 0);
	signal r1, r2: std_logic;
	begin
			r1 <= not (cmdar_code(4) and cmdar_code(5) and enable);
			r2 <= not (cmdar_code(6) and cmdar_code(7) and enable);
			cmdcode(0) <= cmdar_code(0);
			cmdcode(1) <= cmdar_code(1);
			cmdcode(2) <= cmdar_code(2);
			cmdcode(3) <= cmdar_code(3);
			r1code(0) <= cmdar_code(4);
			r1code(1) <= cmdar_code(5);
			r2code(0) <= cmdar_code(6);
			r2code(1) <= cmdar_code(7);
			tempcmd <= not cmdcode;
			tempr1 <= not r1code;
			tempr2 <= not r2code;
			mov1 <= cmdcode(0) and cmdcode(1) and cmdcode(2) and cmdcode(3) and tempr1(0) and r1 and r2 and enable;
			mov2 <= cmdcode(0) and cmdcode(1) and cmdcode(2) and cmdcode(3) and r1code(0) and r1code (1) and r2 and enable;
			mov3 <= cmdcode(0) and cmdcode(1) and cmdcode(2) and cmdcode(3) and r1 and r2code(0) and r2code(1) and enable;
			add <= cmdcode(0) and tempcmd(1) and tempcmd(2) and cmdcode(3) and r1 and r2 and enable;
			sub <= tempcmd(0) and cmdcode(1) and cmdcode(2) and tempcmd(3) and r1 and r2 and enable;
			or1 <= cmdcode(0) and tempcmd(1) and cmdcode(2) and cmdcode(3) and r1 and r2 and enable;
			not1 <= tempcmd(0) and cmdcode(1) and tempcmd(2) and cmdcode(3) and r1 and enable;
			rsr <= cmdcode(0) and tempcmd(1) and cmdcode(2) and tempcmd(3) and r1 and tempr2(0) and tempr2(1) and enable;
			rsl <= cmdcode(0) and tempcmd(1) and cmdcode(2) and tempcmd(3) and r1 and r2code(0) and r2code(1) and enable;
			jmp <= tempcmd(0) and tempcmd(1) and cmdcode(2) and cmdcode(3) and tempr1(0) and tempr1 (1) and tempr2(0) and tempr2(1) and enable;
			jz <= tempcmd(0) and tempcmd(1) and cmdcode(2) and cmdcode(3) and tempr1(0) and tempr1 (1) and tempr2(0) and r2code(1) and enable;
			jc <= tempcmd(0) and tempcmd(1) and cmdcode(2) and cmdcode(3) and tempr1(0) and tempr1 (1) and r2code(0) and tempr2(1) and enable;
			in1 <= tempcmd(0) and tempcmd(1) and cmdcode(2) and tempcmd(3) and r1 and enable;
			out1 <= tempcmd(0) and cmdcode(1) and tempcmd(2) and tempcmd(3) and r1 and enable;
			nop <= tempcmd(0) and cmdcode(1) and cmdcode(2) and cmdcode(3) and tempr1(0) and tempr1(1) and tempr2(0) and tempr2(1) and enable;
			halt <= cmdcode(0) and tempcmd(1) and tempcmd(2) and tempcmd(3) and tempr1(0) and tempr1(1) and tempr2(0) and tempr2(1) and enable;
end architecture cmddecoder;