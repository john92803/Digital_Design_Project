Library ieee;
use ieee.STD_LOGIC_1164.all;
use ieee.STD_LOGIC_ARITH.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY score is
PORT(x1, x2, x3 :IN std_logic_vector(2 downto 0);
		flag: in std_logic;
		player1 :out std_logic_vector(4 downto 0);
		player2 :out std_logic_vector(4 downto 0);
		outFlag: out std_logic;
		endFlag :out std_logic);
END score;

ARCHITECTURE a of score is
BEGIN
process (x1, x2, x3)
	variable tmp_x1, tmp_x2, tmp_x3:INTEGER := 0;
	BEGIN
	if flag = '1' then
			tmp_x1 := CONV_INTEGER(x1);
			tmp_x2 := CONV_INTEGER(x2);
			tmp_x3 := CONV_INTEGER(x3);
			outFlag <= '1'; 
		if x1 = x2 and x1 = x3 then
			player1 <= "10100";
		else
			player1 <= CONV_STD_LOGIC_VECTOR(tmp_x1+tmp_x2+tmp_x3, 5);
			
		END if;
	END if;
	if  flag = '0' then
		tmp_x1 := CONV_INTEGER(x1);
		tmp_x2 := CONV_INTEGER(x2);
		tmp_x3 := CONV_INTEGER(x3);
		endFlag <= '1'; 
		if x1 = x2 and x1 = x3 then
			player2 <= "10100";
		else
			player2 <= CONV_STD_LOGIC_VECTOR(tmp_x1+tmp_x2+tmp_x3, 5);
		END if;
	END if;
end PROCESS;
end a;