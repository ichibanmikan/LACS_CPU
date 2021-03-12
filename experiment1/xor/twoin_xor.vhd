library ieee;

use ieee.std_logic_1164.all;

entity twoin_xor is
	port(
		a,b: in std_logic;
		c: out std_logic
	);
end entity twoin_xor;

architecture twoin_xor of twoin_xor is
	begin
		c <= a xor b;
end architecture twoin_xor;
