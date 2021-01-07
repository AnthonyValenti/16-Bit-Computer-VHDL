LIBRARY ieee;
USE ieee.std_logic_1164.all ;
ENTITY dec4to16OG IS
PORT ( w : IN STD_LOGIC_VECTOR(0 to 3) ;
En : IN STD_LOGIC ;
y : OUT STD_LOGIC_VECTOR(0 to 15) ) ;
END dec4to16OG ;
ARCHITECTURE Behavior OF dec4to16OG IS
begin
process(w,En)
begin
if(En='0') then
y<="0000000000000000";
else
	case w is
		when "0000" =>
			y <= "0000000000000001";
		when "0001" =>
			y <= "0000000000000010";
		when "0010" =>
			y <= "0000000000000100";
		when "0011" =>
			y <= "0000000000001000";
		when "0100" =>
			y <= "0000000000010000";
		when "0101" =>
			y <= "0000000000100000";
		when "0110" =>
			y <= "0000000001000000";
		when "0111" =>
			y <= "0000000010000000";
		when "1000" =>
			y <= "0000000100000000";
		when others =>
			y <= "0000000000000000";
 end case;
 end if;
end process;
END Behavior;