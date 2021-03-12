library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity program_counter is
    port(
        ldpc, inpc, clk:in std_logic;
        a:in std_logic_vector(7 downto 0);
        c:out std_logic_vector(7 downto 0)
    );
end program_counter;

architecture program_counter of program_counter is
    signal adress: std_logic_vector(7 downto 0):="00000000";
    begin
        process(ldpc, inpc, clk, a)
        begin
            if((clk'event and clk='0') and inpc='1' and ldpc='0') then
                adress<=adress+"00000001";
		    elsif((clk'event and clk='0') and inpc='0' and ldpc='1') then
                adress<=a;
            else
            end if;
        end process;
        c<=adress;
    end architecture program_counter;