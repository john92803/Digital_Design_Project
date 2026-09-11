library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity project_test is
port(clk : in std_logic;
		  flag : in std_logic;
        q : out std_logic_vector(0 to 2):="001");
end project_test;

architecture arc of project_test is
signal qn : std_logic_vector(0 to 2):="001";
begin
    process(clk)
        begin
		  if clk'event and clk = '1' and flag = '0' then
					qn <= qn + 1;
				  if qn > 5 then
						qn <= "001";
				  end if;
			     q <= qn;
		  end if;
    end process;
end arc;