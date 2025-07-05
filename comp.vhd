library ieee;
use ieee.std_logic_1164.all;

entity comp is
 port(res_comp : in bit_vector(3 downto 0);
		tm :out bit);
 end comp;
 
 architecture behav of comp is
	signal r0,r1,r2,r3 : bit;
	signal c0,c1,c2,c3 : bit;
 begin
	r0 <= res_comp(0);
	r1 <= res_comp(1);
	r2 <= res_comp(2);
	r3 <= res_comp(3);
	c0 <= '0';
	c1 <= '0';
	c2 <= '1';
	c3 <= '0';
	tm <= ((NOT r3) AND c3) 
	       OR ((r3 XNOR c3) AND ((NOT r2) AND c2)) 
			 OR ((r3 XNOR c3) AND (r2 XNOR c2) AND ((NOT r1) AND c1)) 
			 OR ((r3 XNOR c3) AND (r2 XNOR c2) AND (r1 XNOR c1) AND ((NOT r0) AND c0));
end architecture behav;