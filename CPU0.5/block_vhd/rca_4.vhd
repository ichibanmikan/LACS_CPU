library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;

entity rca_4 is
    port(
        x, y: in std_logic_vector(3 downto 0);
        cin: in std_logic;
        s: out std_logic_vector(3 downto 0);
        cout: out std_logic
    );
end rca_4;

architecture rca_4 of rca_4 is
    signal sum: std_logic_vector(4 downto 0);
    begin
        sum<=('0'&x)+('0'&y)+("0000"&cin);
        cout <= sum(4);
        s<=sum(3 downto 0);
    end rca_4;