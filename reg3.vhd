library ieee;
use ieee.std_logic_1164.all;

entity reg3 is
 port(clk_r, i2, i1, i0 : in bit;
		q2, q1, q0 :out bit);
 end reg3;
 
 architecture behav of reg3 is
 begin
	process(clk_r)
		begin
		if(clk_r'event AND clk_r='1')then
			q2<=i2;
			q1<=i1;
			q0<=i0;
		end if;
	end process;
end architecture behav;