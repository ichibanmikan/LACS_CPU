library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity alu is
    port(
        S: in std_logic_vector(3 downto 0);
        M: in std_logic;
        inx, iny: in std_logic_vector(7 downto 0);
        Zf: out std_logic:='0';
        Cf: out std_logic:='0'; 
        outbus: out std_logic_vector(7 downto 0):="00000000");
end alu;

architecture alu of alu is
    --signal result:std_logic_vector(8 downto 0):="000000000";
    signal result:std_logic_vector(8 downto 0);
    signal sa, sb:std_logic_vector(8 downto 0);
    begin
        sa<='0'&inx;
        sb<='0'&iny;
        process(S, M, inx, iny, sa, sb, result)
        begin
			result<="000000000";
			if (M='0' and S="1001") then
				outbus<=inx+iny;
				result<=sa+sb;
				Cf<=result(8);
				if (result="000000000") then
					Zf<='1';
				else Zf<='0';
				end if;
			elsif(M='0' and S="0110") then
				outbus<=iny-inx;
				result<=sb-sa;
				Cf<=result(8);
				if (result="000000000") then
					Zf<='1';
				else Zf<='0';
				end if;
			elsif(M='0' and S="1010") then
				Cf<='0';
				Zf<='0';
				outbus<=iny;
			elsif(M='0' and S="0100") then
				Cf<='0';
				Zf<='0';
				outbus<=iny;
			elsif(M='1' and S="1011") then
				outbus<= inx or iny;
				Cf<='0';
				Zf<='0';
			elsif(M='1' and S="0101") then
				outbus<=not iny;
				Cf<='0';
				Zf<='0';
			elsif(M='1' and S="1010") then
				Cf<='0';
				Zf<='0';
				outbus<=iny;
			else
				outbus<=inx;
				Cf<='0';
				Zf<='0';
			end if;
        end process;
    end architecture alu; --