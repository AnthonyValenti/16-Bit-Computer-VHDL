library ieee;
use ieee.std_logic_1164.all;
entity fsmOG is
	port
	(
	clk		: in std_logic;
	data_in	: in std_logic;
	reset		: in std_logic;
	student_id	: out std_logic_vector(0 to 3);
	current_state	: out std_logic_vector(0 to 3));
	
end entity;
architecture fsmOG of fsmOG is

type state_type is (s0,s1,s2,s3,s4,s5,s6,s7,s8);

signal yfsm1 : state_type;
begin
	process(clk,reset)
	begin
		if reset = '1' then
			yfsm1<=s0;
		elsif (clk'EVENT AND clk='1') then
			case yfsm1 is
				when s0=> --d1=5
					if data_in = '0' 
					THEN yfsm1<=s0;
					else yfsm1<=s1;
					end if;
				when s1=> --d2=0
					if data_in = '0' 
					THEN yfsm1<=s1;
					else yfsm1<=s2;
					end if;
				when s2=> --d3=0
					if data_in = '0' 
					THEN yfsm1<=s2;
					else yfsm1<=s3;
					end if;
				when s3=> --d4=9
					if data_in = '0' 
					THEN yfsm1<=s3;
					else yfsm1<=s4;
					end if;
				when s4=> --d5=4
					if data_in = '0' 
					THEN yfsm1<=s4;
					else yfsm1<=s5;
					end if;
				when s5=> --d6=8
					if data_in = '0' 
					THEN yfsm1<=s5;			
					else yfsm1<=s6;
					end if;
				when s6=> --d6=8
					if data_in = '0' 
					THEN yfsm1<=s6;
					else yfsm1<=s7;
					end if;
				when s7=> --d8=6
					if data_in = '0' 
					THEN yfsm1<=s7;				
					else yfsm1<=s8;
					end if;
				when s8=> --d9=0
					if data_in = '0' 
					THEN yfsm1<=s8;
					else yfsm1<=s0;
					end if;
				
				
					
			end case;
		end if;
	end process;
	
process(yfsm1,data_in)
begin
		case yfsm1 is
			when s0=>
				current_state<="0000";
				student_id<="0101";
			when s1=>
				current_state<="0001";
				student_id<="0000";
			when s2=>
				current_state<="0010";
				student_id<="0000";
			when s3=>
				current_state<="0011";
				student_id<="1001";
			when s4=>
				current_state<="0100";
				student_id<="0100";
			when s5=>
				current_state<="0101";
				student_id<="1000";
			when s6=>
				current_state<="0110";
				student_id<="0010";
			when s7=>
				current_state<="0111";
				student_id<="0110";
			when s8=>
				current_state<="1000";
				student_id<="0000";
			
end case; 
end process;
end fsmOG;
