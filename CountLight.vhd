library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

 port(clk : in std_logic;
		  L1 : in std_logic_vector(0 to 2);
		  L2 : in std_logic_vector(0 to 2);
		  L3 : in std_logic_vector(0 to 2);
		  LO : out std_logic_vector(0 to 2);
        q : out std_logic_vector(0 to 2));
end CountLight;

architecture arc of CountLight is
signal qn : std_logic_vector(0 to 2);
begin
    process(clk)
        begin
		  if clk'event and clk = '1' then
					qn <= qn + 1;
				  if qn > 1 then
						qn <= "000";
				  end if;
			     q <= qn;
				  if qn = "000" then
						LO <= L1;
					elsif qn = "001" then
						LO <= L2;
					else LO <= L3;
					end if;
		  end if;
    end process;
end arc;