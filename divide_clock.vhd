

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity divide_clock is
    Port ( clk_125M : in STD_LOGIC;
           clk_250M : in STD_LOGIC;
           divider_1 : out STD_LOGIC;
           divider_2 : out STD_LOGIC);
end divide_clock;

architecture Behavioral of divide_clock is
signal count1: INTEGER range 0 to 125000000 := 0;
SIGNAL clock_int1: STD_LOGIC :='0';
CONSTANT M1: INTEGER := 125000000; --1Hz
signal count2: INTEGER range 0 to 250000000 := 0;
SIGNAL clock_int2: STD_LOGIC :='0';
CONSTANT M2: INTEGER := 250000000; --1Hz

begin

PROCESS(clk_125M)
BEGIN
IF rising_edge(clk_125M) then
      IF count1 <= M1-1 THEN  --Divise par 50000  FOUT = 1000Hz synchro affichage
      count1 <= count1 + 1;
      ELSE
      count1 <= 0;
      END IF;
END IF;
END PROCESS;

PROCESS(clk_250M)
BEGIN
IF rising_edge(clk_250M) then
      IF count2 <= M2-1 THEN  --Divise par 50000  FOUT = 1000Hz synchro affichage
      count2 <= count2 + 1;
      ELSE
      count2 <= 0;
      END IF;
END IF;
END PROCESS;

--à la moitié du comptage on change la valeur de clock_1Hz_int (rapport cyclique = 1/2)
clock_int1 <= '1' WHEN count1 <= M1/2 ELSE '0';
divider_1 <= clock_int1; 
clock_int2 <= '1' WHEN count2 <= M2/2 ELSE '0';
divider_2 <= clock_int2; 

end Behavioral;
