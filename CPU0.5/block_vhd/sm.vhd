library ieee;
use ieee.std_logic_1164.all;

entity sm is
    port(
        clk, Sm_en: in std_logic;
        z: out std_logic
    );
end sm;

architecture sm of sm is
    signal sm:std_logic:='0';
    begin
        process(clk, Sm_en, sm)
        begin
            if(clk'event and clk='0' and sm_en='1') then
                    sm<=not sm;
			else
				sm<=sm;
            end if;
        end process;
        z<=sm;
    end architecture sm;

