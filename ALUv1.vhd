library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALUv1 is
port ( 
		 A,B :in unsigned (0 to 7); --8bit input from latches
		 student_id: in unsigned(0 to 3); --4bit student id from FSM
		 OP :in unsigned(0 to 15); --16bit selector for operation decoder 
		 Neg: out std_logic; --sets negative bit
		 ALU_OUT:out unsigned(0 to 7);
		 R1: out unsigned(0 to 3); --first 4 bits of 8bit Result
		 R2: out unsigned(0 to 3)); --last 4 bits for 8bit Result
		 
end ALUv1;

architecture calculation of ALUv1 is
signal Reg1,Reg2,Result :unsigned (0 to 7):=(others=>'0');
signal Reg4: unsigned(0 to 7);
begin
Reg1<=A;
Reg2<=B;
process(OP)
begin
Neg<='0';
		case OP is
		 When "0000000000000001"=>
			Result<=Reg1+Reg2;
		 When "0000000000000010"=>
			Reg4<=(Reg1-Reg2);
			IF(Reg4(0))='1' THEN
				Result<=(NOT(Reg1-Reg2))+1;
				Neg<='1';
			ELSE
				Result<=Reg1-Reg2;
				Neg<='0';
			END IF;
		 When "0000000000000100"=>
			Result<=NOT(Reg1);
		 When "0000000000001000"=>
			Result<=NOT(Reg1 AND Reg2);
		 When "0000000000010000"=>
			Result<=NOT(Reg1 OR Reg2);
		 When "0000000000100000"=>
			Result<=(Reg1 AND Reg2);
		 When "0000000001000000"=>
			Result<=(Reg1 XOR Reg2);
		 When "0000000010000000"=>
			Result<= Reg1 OR Reg2;
		 When "0000000100000000"=>
			Result<= Reg1 XNOR Reg2;
		 When OTHERS=>
			Result<="00000000";
		 
		end case;
end process;
ALU_OUT<=Result;
R1<=Result(0 to 3);
R2<=Result(4 to 7);
end calculation;








