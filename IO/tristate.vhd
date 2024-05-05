library ieee;
use ieee.std_logic_1164.all;

entity tristate is
	port(
		internal: in  std_logic;
		en		  : in  std_logic;
		external: out std_logic);
end entity tristate;

architecture arch_tristate of tristate is
begin
	proc_ts: process(internal, en)
	begin
		if en ='1' then
			external <= internal;
		else
			external <= 'Z';
		end if;
	end process proc_ts;
end architecture arch_tristate;