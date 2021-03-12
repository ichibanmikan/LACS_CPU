library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity generic_mux_8_1 is
    port(
        inputs: in std_logic_vector(7 downto 0);
        output: out std_logic;
        selects: in std_logic_vector(2 downto 0)
    );
end generic_mux_8_1;

architecture generic_mux_8_1 of generic_mux_8_1 is
    component generic1 is
        generic (n:integer:=3);
        port(
            genein: in std_logic_vector(2**n-1 downto 0);
            genesel: in std_logic_vector(n-1 downto 0);
            geneout: out std_logic
        );
    end component;
    begin
        g1:generic1 generic map(n=>3) port map(genein=>inputs, geneout=>output, genesel=>selects);
    end generic_mux_8_1;