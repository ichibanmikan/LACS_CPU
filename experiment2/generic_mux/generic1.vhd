library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity generic1 is
    --generic (n:integer:=3);
    generic (n:integer);
    port(
        genein: in std_logic_vector(2**n-1 downto 0);
        genesel: in std_logic_vector(n-1 downto 0);
        geneout: out std_logic
    );
    end generic1;

architecture generic1 of generic1 is
    begin
        geneout<=genein(conv_integer(genesel));
    end generic1;
