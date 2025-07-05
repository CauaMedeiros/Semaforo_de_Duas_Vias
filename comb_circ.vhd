library ieee;
use ieee.std_logic_1164.all;

entity comb_circ is
port(cm_c, s2_c, s1_c, s0_c : in bit;
	  n2_c, n1_c, n0_c, V1_R_c, V1_Y_c, V1_G_c, V2_R_c, V2_Y_c, V2_G_c, cont_ld_c, cont_rst_c :out bit);
end comb_circ;

architecture behav of comb_circ is
begin
	n2_c <= ((NOT s2_c) AND (s1_c) AND (s0_c) AND (NOT cm_c)) OR ((s2_c) AND (NOT s1_c)) OR ((s2_c) AND (s1_c) AND (NOT s0_c)) OR ((s2_c) AND (cm_c));
	n1_c <= ((NOT s1_c) AND (s0_c) AND (NOT cm_c)) OR ((s1_c) AND (NOT s0_c)) OR ((s1_c) AND (s0_c) AND (cm_c));
	n0_c <= ((NOT s0_c)) OR ((s0_c) AND (cm_c));
	V1_R_c <= ((NOT s2_c) AND (NOT s1_c)) OR ((NOT s2_c) AND (NOT s0_c)) OR ((s2_c) AND (s1_c) AND (s0_c));
	V1_Y_c <= ((s2_c) AND (NOT s1_c) AND (s0_c)) OR ((s2_c) AND (s1_c) AND (NOT s0_c));
	V1_G_c <= ((NOT s2_c) AND (s1_c) AND (s0_c)) OR ((s2_c) AND (NOT s1_c) AND (NOT s0_c));
	V2_R_c <= ((NOT s2_c) AND (s1_c) AND (s0_c)) OR ((s2_c) AND (NOT s1_c)) OR ((s2_c) AND (NOT s0_c));
	V2_Y_c <= ((NOT s2_c) AND (NOT s1_c) AND (s0_c)) OR ((NOT s2_c) AND (s1_c) AND (NOT s0_c));
	V2_G_c <= ((NOT s2_c) AND (NOT s1_c) AND (NOT s0_c)) OR ((s2_c) AND (s1_c) AND (s0_c));
	cont_ld_c <= ((NOT s2_c) AND (s0_c)) OR ((s2_c) AND (s0_c));
	cont_rst_c <= ((NOT s2_c) AND (NOT s0_c)) OR ((s2_c) AND (NOT s0_c));
end architecture behav;