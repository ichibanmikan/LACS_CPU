library ieee;
use ieee.std_logic_1164.all;

entity signal_generate is
    port(
        sm, mov1, mov2, mov3, add, sub, or1, not1, rsr, rsl, jmp, jz, jc, in1, out1, Zf, Cf, nop, halt: in std_logic;
        ir:in std_logic_vector(7 downto 0);
        raa, rwba, madd:out std_logic_vector(1 downto 0);
        s: out std_logic_vector(3 downto 0);
        in_en, out_en, ldpc, inpc, we, xl, dl, m, fbus, frbus, flbus, ldir, Cf_en, Zf_en, Sm_en: out std_logic:='1' 
    );
end signal_generate;

architecture signal_generate of signal_generate is
    signal in0: std_logic:='1';
    begin
        process(sm, mov1, mov2, mov3, add, or1, sub, not1, rsr, rsl, in0, jmp, jz, jc, in1, out1, Zf, Cf, nop, halt, ir)
        begin
            ldir<=not sm;
            ldpc<=(jc and Cf) or (jz and Zf) or jmp;
            inpc <= (jz and (not Zf)) or (jc and (not Cf)) or (not sm);
            if (ir(7 downto 4)="0010") then
                in0<='1';
            else
                in0<='0';
            end if;
            we <= (not(mov1 or mov3 or add or sub or or1 or not1 or rsr or rsl or in0)) or (not sm);
            raa <= ir(1 downto 0);
            rwba <= ir(3 downto 2);
            if (sm='1' and mov3='1') then
                madd<="01";
            elsif (sm='1' and mov2='1') then
                madd<="10";
            else
                madd<="00";
            end if;
            s<=ir(7 downto 4);
            xl<=mov2;
            dl<=mov3 or jmp or (Zf and jz) or (Zf and jc) or (not sm);
            if ((ir(7 downto 4)="1001") or (ir(7 downto 4)="0110") or (ir(7 downto 4)="1010") or (ir(7 downto 4)="1111") or (ir(7 downto 4)="0100")) then
                m<='0';
            else
                m<='1';
            end if;
            flbus<=rsl;
            frbus<=rsr;
            fbus<= mov1 or mov2 or add or sub or or1 or not1 or out1;
            Cf_en<=add or sub or or1 or rsr or rsl;
            Zf_en<=add or sub or or1 ;
            Sm_en<=(not halt);
            in_en<=in1;
            out_en<=out1;
        end process;
    end architecture signal_generate;