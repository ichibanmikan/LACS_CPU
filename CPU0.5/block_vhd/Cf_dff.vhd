library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity Cf_dff is
	port(
		X,EN,clk:in std_logic;
		Cf:out std_logic
	);
end entity;

architecture bhv of Cf_dff is
begin
	process(CLK,EN)
	begin
		if(EN='1' and (CLK'event and CLK='0')) then
			Cf<=X;
		else
		end if;
	end process;
end architecture;