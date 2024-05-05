library ieee;
use ieee.std_logic_1164.all;

entity opendrain is
	port(
		internal: in  std_logic;
		external: out std_logic);
end entity opendrain;

architecture arch_opendrain of opendrain is
begin
	proc_od: process(internal)
	begin
		external <= internal;
		if internal = '1' then
			external <= 'H';
		end if;
	end process proc_od;
end architecture arch_opendrain;