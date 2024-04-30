library IEEE;
use IEEE.std_logic_1164.all;

entity mux is
  port(
	  a : in std_logic;
	  b : in std_logic;
	  en : in std_logic;
	  s : in std_logic;
	  y : out std_logic
  );
end mux;

architecture arch_mux of mux is
signal y_s: std_logic;
begin
	proc_mux: process(a, b, s)
	begin
		case s is
			when '0' => y_s <= a;
			when '1' => y_s <= b;
      end case;
  end process proc_mux; 
  y <= y_s and en;
end arch_mux;

