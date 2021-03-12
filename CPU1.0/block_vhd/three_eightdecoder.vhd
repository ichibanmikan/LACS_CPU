library ieee;
use ieee.std_logic_1164.all;

entity three_eightdecoder is	
    port(
		inputs: in std_logic_vector(2 downto 0);
		enable: in std_logic;
		x: out std_logic_vector(7 downto 0)
	);	
end entity three_eightdecoder;

architecture three_eightdecoder of three_eightdecoder is
	signal temps: std_logic_vector (2 downto 0);
	begin
		temps(0) <= not inputs(0);
		temps(1) <= not inputs(1);
		temps(2) <= not inputs(2);
		x(7) <= inputs(2) and inputs(1) and inputs(0) and enable;
		x(6) <= inputs(2) and inputs(1) and temps(0) and enable;
		x(5) <= inputs(2) and temps(1) and inputs(0) and enable;
		x(4) <= inputs(2) and temps(1) and temps(0) and enable;
		x(3) <= temps(2) and inputs(1) and inputs(0) and enable;
		x(2) <= temps(2) and inputs(1) and temps(0) and enable;
		x(1) <= temps(2) and temps(1) and inputs(0) and enable;
		x(0) <= temps(2) and temps(1) and temps(0) and enable;
end architecture three_eightdecoder;