library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Select_in_data is
Generic (data_width : integer := 16);
    Port ( 
           clk : in STD_LOGIC;
           resetn : in STD_LOGIC;
           adc_data_1_tdata : in STD_LOGIC_VECTOR(data_width - 1 downto 0);
           adc_data_2_tdata : in STD_LOGIC_VECTOR(data_width - 1 downto 0);
           select_1 : in STD_LOGIC;
           select_2 : in STD_LOGIC;
           freq_125KHz_tdata : in STD_LOGIC_VECTOR(data_width - 1 downto 0);
           freq_DDS_tdata : in STD_LOGIC_VECTOR(data_width - 1 downto 0);
           data1_o_tdata : out STD_LOGIC_VECTOR(data_width - 1 downto 0);
           data2_o_tdata : out STD_LOGIC_VECTOR(data_width - 1 downto 0);
           adc_data_1_tvalid : in  std_logic;
           adc_data_2_tvalid : in std_logic;
           freq_125KHz_tvalid : in  std_logic;
           freq_DDS_tvalid : in std_logic;
           data1_o_tvalid : out std_logic;
           data2_o_tvalid : out std_logic);
           
end Select_in_data;

architecture Behavioral of Select_in_data is
signal valid : std_logic := '0';

begin

process(clk)
begin
  --to check the rising edge of the clock signal
if(rising_edge(clk)) then  
   if resetn = '0' then  
      data1_o_tdata <= (others => '0'); 
      data2_o_tdata <= (others => '0'); 
      valid <= '0';      
   else
      if adc_data_1_tvalid ='1' then
         if select_1 = '1' then
         data1_o_tdata <= adc_data_1_tdata;
         valid <= '1';
         end if;
      end if;
      
      if adc_data_2_tvalid ='1' then
         if select_2 = '1' then
         data2_o_tdata <= adc_data_2_tdata;
         valid <= '1';
         end if;
      end if;
      
      if freq_125KHz_tvalid ='1' then
         if select_1 = '0' then
         data1_o_tdata <= freq_125KHz_tdata;
         valid <= '1';
         end if;
      end if;
      
      if freq_DDS_tvalid ='1' then  
         if select_2 = '0' then
         data2_o_tdata <= freq_DDS_tdata;
         valid <= '1';
         end if;
      end if;
  end if;
end if;
end process;

data1_o_tvalid <= valid;
data2_o_tvalid <= valid;
        

end Behavioral;
