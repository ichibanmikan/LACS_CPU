library ieee;
use ieee.std_logic_1164.all;

entity mux_8_3_1 is
    port(
        inputs0: in std_logic_vector(7 downto 0);
        inputs1: in std_logic_vector(7 downto 0);
        inputs2: in std_logic_vector(7 downto 0);
        selinputs: in std_logic_vector(1 downto 0);
        outputs: out std_logic_vector(7 downto 0)
    );
end mux_8_3_1;

architecture mux_8_3_1 of mux_8_3_1 is
    begin
        outputs<=inputs0 when selinputs="00" else
        inputs1 when selinputs="01" else
        inputs2 when selinputs="10"else
        "00000000";
end mux_8_3_1;