-- Mateusz Gabryel 181329 EiT 3
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

ENTITY tb IS
END tb;

ARCHITECTURE Behavioral OF tb IS

COMPONENT top_odczyt is
    PORT ( clk_i : in STD_LOGIC;
           rst_i : in STD_LOGIC;
           ps2_clk_i : in STD_LOGIC;
           ps2_data_i : in STD_LOGIC;
           led7_an_o : out STD_LOGIC_VECTOR (3 downto 0);
           led7_seg_o : out STD_LOGIC_VECTOR (7 downto 0)
          );
END COMPONENT top_odczyt;

signal clk_i : STD_LOGIC := '0';
signal rst_i : STD_LOGIC := '1';
signal ps2_clk_i : STD_LOGIC := '1';
signal ps2_data_i : STD_LOGIC := '1';
signal led7_an_o : STD_LOGIC_VECTOR (3 downto 0);
signal led7_seg_o : STD_LOGIC_VECTOR (7 downto 0);
constant PERIOD : TIME := 10 ns; -- 100 MHz

BEGIN

uut: top_odczyt 
    PORT MAP ( clk_i => clk_i,
               ps2_clk_i => ps2_clk_i,
               ps2_data_i => ps2_data_i,
               rst_i => rst_i,
               led7_an_o => led7_an_o,
               led7_seg_o => led7_seg_o
              );
              
clk_i <= NOT clk_i AFTER PERIOD/2; -- realizacja prostego zegara

tb:PROCESS
   BEGIN
        rst_i <= '0';
        WAIT FOR 100 us;
--------------------------------------- 1 ---------------------------------------
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- bit startu (zawsze 0)
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 0 bit danych "1" x16 -> 01101000
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 1 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 2 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 3 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 4 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 5 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 6 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 7 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- bit parzystosci
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1';  -- bit stopu (zawsze 1)
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 1000 us;
--------------------------------------- 8 ---------------------------------------
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- bit startu (zawsze 0)
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 0 bit danych  "8" x3E -> 01111100
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 1 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 2 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 3 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 4 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 5 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 6 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 7 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- bit parzystosci
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- bit stopu (zawsze 1)
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 1000 us;
--------------------------------------- 1 ---------------------------------------
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- bit startu (zawsze 0)
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 0 bit danych "1" x16 -> 01101000
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 1 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 2 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 3 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 4 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 5 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 6 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 7 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- bit parzystosci
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1';  -- bit stopu (zawsze 1)
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 1000 us;    
--------------------------------------- 3 ---------------------------------------
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- bit startu (zawsze 0)
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 0 bit danych "3" x26 -> 01100100
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 1 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 2 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 3 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 4 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 5 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 6 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 7 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- bit parzystosci
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- bit stopu (zawsze 1)
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 1000 us;
--------------------------------------- 2 ---------------------------------------
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- bit startu (zawsze 0)
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 0 bit danych "2" x1E -> 01111000
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 1 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 2 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 3 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 4 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 5 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 6 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 7 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- bit parzystosci
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- bit stopu (zawsze 1)
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 1000 us;   
--------------------------------------- 9 ---------------------------------------
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- bit startu (zawsze 0)
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 0 bit danych "9" x46 -> 01100010
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 1 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 2 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 3 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 4 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 5 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- 6 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- 7 bit danych
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '0'; -- bit parzystosci
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 33.333333333333333333333 us;
        ps2_clk_i <= '0';
        WAIT FOR 13.33333333333333333333 us;
            ps2_data_i <= '1'; -- bit stopu (zawsze 1)
        WAIT FOR 20 us;
        ps2_clk_i <= '1';
        WAIT FOR 1000 us;   

        rst_i <= '1'; -- reset
        WAIT FOR 100 ns;
        rst_i <= '0';
        WAIT;
        
   END PROCESS;
END Behavioral;