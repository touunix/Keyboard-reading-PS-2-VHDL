-- Mateusz Gabryel 181329 EiT 3
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.STANDARD.ALL;

ENTITY top_display IS
    PORT ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC := '0';
           digit_i : in STD_LOGIC_VECTOR(31 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0) := "1110";
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0) 
	      );
END top_display;

ARCHITECTURE Behavioral OF top_display IS

signal a : INTEGER := 1; --licznik
signal b : STD_LOGIC := '0'; --zegar po dzieleniu
constant N: INTEGER := 2500;
signal counter_display: INTEGER := 1;

BEGIN
WITH counter_display SELECT --realizacja przypisania selektywnego do realizacji rejestru przesuwnego
    led7_an_o <= "0111" WHEN 1, -- AN3
                 "1011" WHEN 2, -- AN2
                 "1101" WHEN 3, -- AN1
                 "1110" WHEN 4, -- AN0
                 "0000" WHEN OTHERS;
    WITH counter_display SELECT
    led7_seg_o <= digit_i(31 downto 24) WHEN 1, -- AN3
                  digit_i(23 downto 16) WHEN 2, -- AN2
                  digit_i(15 downto 8) WHEN 3,  -- AN1
                  digit_i(7 downto 0) WHEN 4,   -- AN0
                  "00000000" WHEN OTHERS;

divider: PROCESS(clk_i, rst_i)
BEGIN
    if (rst_i = '1') then
        a <= 1;
        b <= '0';
    elsif (rising_edge(clk_i)) then
        a <= a + 1;
        if (a=N) then
            b <= NOT b;
            a <= 1;
        END if;
    END if;
END PROCESS divider;

display: PROCESS(b, rst_i)
BEGIN
    if(rst_i = '1') then -- reset
        counter_display <= 0;
    elsif(rising_edge(b)) then
            if(counter_display=4) then  -- zmiana z AN0 na AN3 (symulacja)
                counter_display <= 1;   -- AN3
            else
                counter_display <= counter_display+1; -- dalsze kroki rejestru przesuwnego
            END if;
        END if;
END PROCESS display;
END Behavioral;