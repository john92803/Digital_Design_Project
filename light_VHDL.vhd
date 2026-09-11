library ieee;
use ieee.std_logic_1164.all;

entity light_VHDL is
	port(
		A : in std_logic_vector(0 to 2);
		B : out std_logic_vector(0 to 6)
	);
end light_VHDL;

architecture arc of light_VHDL is
begin
	with A select
	B <= "1111110" when "000",
		  "0110000" when "001",
		  "1101101" when "010",
		  "1111001" when "011",
		  "0110011" when "100",
		  "1011011" when "101",
		  "1011111" when "110",
		  "1000111" when others;
end arc;