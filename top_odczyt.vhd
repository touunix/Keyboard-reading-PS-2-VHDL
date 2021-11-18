-- Mateusz Gabryel 181329 EiT 3
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.NUMERIC_STD.ALL;
use STD.STANDARD.ALL;

ENTITY top_odczyt IS
    PORT ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           ps2_clk_i : in STD_LOGIC;
           ps2_data_i : in STD_LOGIC;
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0));
END top_odczyt;

ARCHITECTURE Behavioral OF top_odczyt IS

COMPONENT top_display IS
    PORT ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           digit_i : in STD_LOGIC_VECTOR(31 downto 0);
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0)
	      );
END COMPONENT top_display;

signal ps2_key_code : STD_LOGIC_VECTOR (7 downto 0) := (others => '0');
signal ps2_clk_i_s: STD_LOGIC;
signal digit_o: STD_LOGIC_VECTOR(31 downto 0) := (others => '1');
signal a: INTEGER := 0; -- licznik
signal start: STD_LOGIC := '0';
signal bits: INTEGER := 0;
signal b: INTEGER := 0; -- licznik zegara

BEGIN

PROCESS(clk_i)
    BEGIN
    if rising_edge(clk_i) then ps2_clk_i_s <= ps2_clk_i; -- synchronizacja
    END if;
END PROCESS;

PROCESS(clk_i, rst_i, ps2_key_code)
BEGIN
    if (rst_i = '1') then 
        digit_o <= "11111111111111111111111111111111";
        ps2_key_code <= "11111111";  -- wygaszenie wyswietlacza podczas resetu
    elsif falling_edge(clk_i) then
        b <= b + 1;
            
        if (ps2_clk_i_s = '1') then
            a <= a + 1;
        END if;
            
        if (a >= 10000 and ps2_data_i = '0' and ps2_clk_i_s = '0') then -- poczatek
            start <= '1';
            a <= 0;
            bits <= 0;
        END if;
            
        if ((start = '1') and (b = 300)) then -- odczytywanie danych, bit startu
            a <= 0;
            if (ps2_clk_i_s = '0') then 
                if (bits > 0 and bits < 9) then
                    ps2_key_code(8-bits) <= ps2_data_i;
                END if;
                bits <= bits + 1;
            END if;
            if (bits = 10) then 
                bits <= 0;
                start <= '0';
            END if;
        END if;
            
        if (b > 3330 and ps2_clk_i_s = '0') then 
            b <= 0; 
        END if; 
    END if;
        
CASE ps2_key_code IS
    WHEN "10100010" => digit_o(7 downto 1) <= ("0000001"); -- 0 - "x45"
    WHEN "01101000" => digit_o(7 downto 1) <= ("1001111"); -- 1 - "x16"
    WHEN "01111000" => digit_o(7 downto 1) <= ("0010010"); -- 2 - "x1E"
    WHEN "01100100" => digit_o(7 downto 1) <= ("0000110"); -- 3 - "x26"
    WHEN "10100100" => digit_o(7 downto 1) <= ("1001100"); -- 4 - "x25"
    WHEN "01110100" => digit_o(7 downto 1) <= ("0100100"); -- 5 - "x2E"
    WHEN "01101100" => digit_o(7 downto 1) <= ("0100000"); -- 6 - "x36"
    WHEN "10111100" => digit_o(7 downto 1) <= ("0001111"); -- 7 - "x3D"
    WHEN "01111100" => digit_o(7 downto 1) <= ("0000000"); -- 8 - "x3E"
    WHEN "01100010" => digit_o(7 downto 1) <= ("0000100"); -- 9 - "x46"
    WHEN "00111000" => digit_o(7 downto 1) <= ("0001000"); -- a - "x1C"
    WHEN "01001100" => digit_o(7 downto 1) <= ("1100000"); -- b - "x32"
    WHEN "10000100" => digit_o(7 downto 1) <= ("0110001"); -- c - "x21"
    WHEN "11000100" => digit_o(7 downto 1) <= ("1000010"); -- d - "x23"
    WHEN "00100100" => digit_o(7 downto 1) <= ("0110000"); -- e - "x24"
    WHEN "11010100" => digit_o(7 downto 1) <= ("0111000"); -- f - "x2B"
        WHEN OTHERS => digit_o(7 downto 1) <= ("1111111"); -- ? - "nieokreslone"
END CASE;
END PROCESS;

uut: top_display
    PORT MAP ( clk_i => clk_i, 
               digit_i => digit_o, 
               led7_an_o => led7_an_o , 
               led7_seg_o => led7_seg_o, 
               rst_i => '0'
              );
END Behavioral;