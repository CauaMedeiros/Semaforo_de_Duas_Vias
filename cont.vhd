library ieee;
use ieee.std_logic_1164.all;

entity cont is
  port(
    clk_cont, cont_ld, cont_rst : in bit;
    res_cont : out bit_vector(3 downto 0)
  );
end cont;

architecture behav of cont is
  signal contador_interno : bit_vector(3 downto 0) := "0000";

begin
  process(clk_cont)
    variable temp : bit_vector(3 downto 0);
    variable c : bit;
  begin
    if (clk_cont'event) and clk_cont = '1' then
      if cont_rst = '1' then
        contador_interno <= "0000";
      elsif cont_ld = '1' then
       
        c := '1'; 
        for i in 0 to 3 loop
          temp(i) := contador_interno(i) xor c; 
          c := contador_interno(i) and c;      
        end loop;
        
        contador_interno <= temp;
      end if;
    end if;
  end process;

  res_cont <= contador_interno;

end architecture behav;