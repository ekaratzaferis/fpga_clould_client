
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity ColorPalette is
    Port ( ColorIndex : in  unsigned (5 downto 0);
           Red : out  STD_LOGIC_VECTOR (7 downto 0);
           Green : out  STD_LOGIC_VECTOR (7 downto 0);
           Blue : out  STD_LOGIC_VECTOR (7 downto 0));
end ColorPalette;

architecture Behavioral of ColorPalette is

	signal Entry : std_logic_vector(23 downto 0);
begin
-- Palettes taken from http://nesdev.parodius.com/nespalette.zip

	Red <= Entry(23 downto 16);
	Green <= Entry(15 downto 8);
	Blue <= Entry(7 downto 0);
	

	with to_integer(ColorIndex) select
		Entry <=
			X"727272" when 0,
			X"000080" when 1,
			X"08008A" when 2,
			X"2C007E" when 3,
			X"4A004E" when 4,
			X"500006" when 5,
			X"440000" when 6,
			X"260800" when 7,
			X"0A2000" when 8,
			X"002E00" when 9,
			X"003200" when 10,
			X"00260A" when 11,
			X"001C48" when 12,
			X"000000" when 13,
			X"000000" when 14,
			X"000000" when 15,
			X"A4A4A4" when 16,
			X"0038CE" when 17,
			X"3416EC" when 18,
			X"5E04DC" when 19,
			X"8C00B0" when 20,
			X"9A004C" when 21,
			X"901800" when 22,
			X"703600" when 23,
			X"4C5400" when 24,
			X"0E6C00" when 25,
			X"007400" when 26,
			X"006C2C" when 27,
			X"005E84" when 28,
			X"000000" when 29,
			X"000000" when 30,
			X"000000" when 31,
			X"FFFFFF" when 32,
			X"4C9CFF" when 33,
			X"7C78FF" when 34,
			X"A664FF" when 35,
			X"DA5AFF" when 36,
			X"F054C0" when 37,
			X"F06A56" when 38,
			X"D68610" when 39,
			X"BAA400" when 40,
			X"76C000" when 41,
			X"46CC1A" when 42,
			X"2EC866" when 43,
			X"34C2BE" when 44,
			X"3A3A3A" when 45,
			X"000000" when 46,
			X"000000" when 47,
			X"FFFFFF" when 48,
			X"B6DAFF" when 49,
			X"C8CAFF" when 50,
			X"DAC2FF" when 51,
			X"F0BEFF" when 52,
			X"FCBCEE" when 53,
			X"FAC2C0" when 54,
			X"F2CCA2" when 55,
			X"E6DA92" when 56,
			X"CCE68E" when 57,
			X"B8EEA2" when 58,
			X"AEEABE" when 59,
			X"AEE8E2" when 60,
			X"B0B0B0" when 61,
			X"000000" when 62,
			X"000000" when 63,
			X"000000" when others;


end Behavioral;

