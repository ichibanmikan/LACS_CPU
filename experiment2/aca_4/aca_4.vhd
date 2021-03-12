library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity aca_4 is
    port(
        x, y: in std_logic_vector(3 downto 0);
        cin: in std_logic;
        sout: out std_logic_vector(4 downto 0)
    );
    end aca_4;

architecture aca_4 of aca_4 is
    signal cout: std_logic_vector(2 downto 0);
    begin
        cout(0)<=(x(0) and y(0))or(cin and (x(0) or y(0)));
        cout(1)<=(x(1) and y(1))or(cout(0) and (x(1) or y(1)));
        cout(2)<=(x(2) and y(2))or(cout(1) and (x(2) or y(2)));
        sout(4)<=(x(3) and y(3))or(cout(2) and (x(3) or y(3)));
        sout(0)<=x(0) xor y(0) xor cin;
        sout(1)<=x(1) xor y(1) xor cout(0);
        sout(2)<=x(2) xor y(2) xor cout(1);
        sout(3)<=x(3) xor y(3) xor cout(2);
    end aca_4;
    
