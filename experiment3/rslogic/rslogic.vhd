library ieee;
use ieee.std_logic_1164.all;

entity rslogic is
    port(
        fbus, frlbus, frrbus:in std_logic;
        inbus:in std_logic_vector(7 downto 0);
        outbus2: out std_logic_vector(7 downto 0);
        Cf:out std_logic:='0'
    );
end rslogic;

architecture rslogic of rslogic is
    begin
        process(fbus, frlbus, frrbus)
            begin
            if(fbus='1') then
				outbus2<=inbus;
				Cf<='0';
            else
                if (frlbus='1') then
                    outbus2<=inbus(6 downto 0)&inbus(7);
                    Cf<=inbus(7);
                elsif(frrbus='1') then
                    outbus2<=inbus(0)&inbus(7 downto 1);
                    Cf<=inbus(0);
                else
					outbus2<="ZZZZZZZZ";
					Cf<='0';
                end if;
            end if;
            end process;
    end architecture rslogic;
