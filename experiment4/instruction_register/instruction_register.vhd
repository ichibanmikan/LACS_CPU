library ieee;
use ieee.std_logic_1164.all;

entity instruction_register is
    port(
        inputs: in std_logic_vector(7 downto 0);
        clk, ld:in std_logic;
        outputs:out std_logic_vector(7 downto 0)
    );
end instruction_register;

architecture instruction_register of instruction_register is
    signal i:std_logic_vector(7 downto 0):="00000000";
    begin
        process(clk, inputs, ld)
        begin
        if(clk'event and clk='0') then
            if(ld='1') then
                i<=inputs;
            end if;
        end if;
        end process;
    outputs<=i;
    end instruction_register;