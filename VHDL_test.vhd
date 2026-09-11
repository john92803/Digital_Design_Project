Library ieee;
Use ieee.std_logic_1164.all;

entity VHDL_test is
port (
		cont : in std_logic_vector(0 to 2);
		light : out std_logic_vector (0 to 3)
	);
end VHDL_test;
architecture test of VHDL_test is
begin
	with cont select
	light <= "0000" when "000",
			   "0001" when "001",
				"0010" when "010",
				"0011" when "011",
				"0000" when others;
end test;