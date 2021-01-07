LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY latchOG IS
	PORT( A: IN STD_LOGIC_VECTOR(0 TO 7); --8bit input
			Enable: IN STD_LOGIC; --1bit input
			Q: OUT STD_LOGIC_VECTOR(0 to 7));
END latchOG;

ARCHITECTURE Behavior OF latchOG IS
BEGIN
	PROCESS(Enable)
	BEGIN
	IF Enable='0' THEN
		Q<="00000000";
	ELSE
		Q<=A;
	END IF;
END PROCESS;
END Behavior;