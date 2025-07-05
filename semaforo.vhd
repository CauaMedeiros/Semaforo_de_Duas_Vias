library ieee;
use ieee.std_logic_1164.all;

entity semaforo is
port(clk : in bit;
	  atual2, atual1, atual0, V1_R, V1_Y, V1_G, V2_R, V2_Y, V2_G, res0, res1, res2, res3 :out bit);
end semaforo;
 
architecture behavior of semaforo is
	signal n2, n1, n0 : bit;
	signal s2, s1,s0 : bit;
	signal tm_res : bit;
	signal cont_ld_res, cont_rst_res : bit;
	signal cont_debug : bit_vector(3 downto 0);
	
	component reg3 is
		port(clk_r, i2, i1, i0 : in bit;
			  q2, q1, q0 :out bit);
	end component;
	
	component comb_circ is
		port(cm_c, s2_c, s1_c, s0_c : in bit;
			  n2_c, n1_c, n0_c, V1_R_c, V1_Y_c, V1_G_c, V2_R_c, V2_Y_c, V2_G_c, cont_ld_c, cont_rst_c :out bit);
	end component;
	
	component cont is
		port(clk_cont, cont_ld, cont_rst : in bit;
			  res_cont :out bit_vector(3 downto 0));
	end component;
	
	component comp is
		port(res_comp : in bit_vector(3 downto 0);
			  tm :out bit);
	end component;
begin
	u1:reg3 port map(clk_r=>clk,i2=>n2,i1=>n1,i0=>n0,q2=>s2,q1=>s1,q0=>s0);
	u2:comb_circ port map(cm_c=>tm_res, s2_c=>s2, s1_c=>s1, s0_c=>s0,n2_c=>n2, n1_c=>n1, n0_c=>n0, V1_R_c=>V1_R, V1_Y_c=>V1_Y, V1_G_c=>V1_G, V2_R_c=>V2_R, V2_Y_c=>V2_Y, V2_G_c=>V2_G, cont_ld_c=>cont_ld_res, cont_rst_c=>cont_rst_res);
	u3:cont port map(clk_cont=>clk,cont_ld=>cont_ld_res,cont_rst=>cont_rst_res,res_cont=>cont_debug);
	u4:comp port map(res_comp=>cont_debug,tm=>tm_res);
	
	
	res0 <= cont_debug(0);
	res1 <= cont_debug(1);
	res2 <= cont_debug(2);
	res3 <= cont_debug(3);
	
	atual2 <= s2;
	atual1 <= s1;
	atual0 <= s0;
end architecture behavior;