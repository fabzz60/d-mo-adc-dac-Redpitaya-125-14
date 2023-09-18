library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity leds is
    Port ( 
          clk : in std_logic;
          leds_redpitaya : out STD_LOGIC_VECTOR (3 downto 0));
end leds;

architecture Behavioral of leds is
signal count1: INTEGER range 0 to 125000000 := 0;
SIGNAL clock_int1: STD_LOGIC :='0';
CONSTANT M1: INTEGER := 125000000; --1Hz
begin

--leds_redpitaya <="11111100";
PROCESS(clk)
BEGIN
IF rising_edge(clk) then
      IF count1 <= M1-1 THEN  --Divise par 50000  FOUT = 1000Hz synchro affichage
      count1 <= count1 + 1;
      ELSE
      count1 <= 0;
      END IF;
END IF;
END PROCESS;

--à la moitié du comptage on change la valeur de clock_1Hz_int (rapport cyclique = 1/2)
clock_int1 <= '1' WHEN count1 <= M1/2 ELSE '0';

process(clock_int1)
begin
if clock_int1 ='1' then
   leds_redpitaya <="1111";
else 
   leds_redpitaya <="0000";
end if;
end process;

end Behavioral;
