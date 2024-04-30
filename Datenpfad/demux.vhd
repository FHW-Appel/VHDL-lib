library IEEE;
use IEEE.std_logic_1164.all;

entity demux is
  port(
	  a : in std_logic;
	  en : in std_logic;
	  s : in std_logic;
	  y1 : out std_logic;
	  y2 : out std_logic
  );
end demux;

architecture arch_mux of demux is

begin
	proc_mux: process(a, s, en)
	begin
	-- Defaults
		y1 <= 'Z';
		y2 <= 'Z';
		if en ='1' then
			case s is
				when '0' => y1 <= a;
				when '1' => y2 <= a;
			end case;
		end if;
  end process proc_mux; 

end arch_mux;

