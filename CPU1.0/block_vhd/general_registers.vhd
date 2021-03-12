library ieee;
use ieee.std_logic_1164.all;

entity general_registers is
    port(
        we, clk:in std_logic;
        raa, rwba:in std_logic_vector(1 downto 0);
        i:in std_logic_vector(7 downto 0);
        s, d:out std_logic_vector(7 downto 0);
        aa, bb, cc:out std_logic_vector(7 downto 0)
    );
end general_registers;

architecture general_registers of general_registers is
    signal a:std_logic_vector(7 downto 0):="10000000";
    signal b:std_logic_vector(7 downto 0):="01000000";
    signal c:std_logic_vector(7 downto 0):="00100000";
    begin
        process(we, clk, raa, rwba, i, a, b, c)
        begin
			if(we='0' and (clk'event and clk='0') and rwba="00") then
				a<=i;
			elsif(we='0' and (clk'event and clk='0') and rwba="01") then
				b<=i;
			elsif(we='0' and (clk'event and clk='0') and (rwba="10" or rwba="11")) then
				c<=i;
			else
			end if;
            if(raa="00") then
                s<=a;
            elsif(raa="01") then
                s<=b;
            elsif(raa="10") then
                s<=c;
            else
                s<=c;
            end if;
            if(rwba="00") then
                d<=a;
            elsif (rwba="01") then
                d<=b;
            elsif (rwba="10") then
                d<=c;
            else
                d<=c;
            end if;
            aa<=a;
            bb<=b;
            cc<=c;
        end process;
    end general_registers;