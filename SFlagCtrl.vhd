library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

entity SFlagCtrl is
port(pulse: in std_logic;
	  player: in std_logic;
	  targetFlag: in std_logic_vector(0 to 2);
	  flagOut: out std_logic_vector(0 to 2);
	  nextStage: out std_logic);
end SFlagCtrl;

architecture arc of SFlagCtrl is
signal flag : std_logic_vector(0 to 2);
signal resetted : std_logic := '0';
begin
	process(pulse)
	begin 
		if pulse'event and pulse = '1' then
			if flag(0) = '0' then
				flag(0) <= '1';
				nextStage <= '0';
			elsif flag(1) = '0' then
				flag(1) <= '1';
				nextStage <= '0';
			elsif flag(2) = '0' then
				flag(2) <= '1';
				nextStage <= '0';
			else
				if resetted = '0' and targetFlag /= "000" then
					flag <= not targetFlag;
					resetted <= '1';
					nextStage <= '0';
				else
					nextStage <= '1';
					if(player= '1') then
						nextStage <= '0';
					end if;
				end if;
			end if;
		end if;
	flagOut <= flag;
	end process;
end arc;