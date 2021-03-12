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
        process(clk, Sm_en)
        begin
            if(clk'event and clk='0') then
                if(Sm_en='1') then
                    z<=not sm;
                    sm<=not sm;
                else
                    z<=sm;
                end if;
            else
                sm<=sm;
            end if;
        end process;
    end architecture sm;

