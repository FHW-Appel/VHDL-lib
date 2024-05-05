library ieee;
use ieee.std_logic_1164.all;

entity srg4 is 
	port(
		rst_b: in std_logic;
		left_load_b: in std_logic;
		right_load_b: in std_logic;
		clk: in std_logic;
		se_left: in std_logic; -- Schieberegistereingang links
		se_right: in std_logic; -- Schieberegistereingang rechts
		d: in std_logic_vector(3 downto 0);
		q: out std_logic_vector(3 downto 0)
	);
end srg4;

architecture arch_srg4 of srg4 is
	signal m: std_logic_vector(1 downto 0);
begin
	m <= (left_load_b, right_load_b);
	proc_clocked: process (clk)
	begin
		if rising_edge(clk) then
			if rst_b = '1' then
				case m is
					when "00" => -- Daten laden
						q <= d;
					when "01" => -- Rechts schieben
						q(3) <= se_right;
						q(2 downto 0) <= q(3 downto 1);
					when "10" => -- Links schieben
						q(0) <= se_left;
						q(3 downto 1) <= q(2 downto 0);
					when others => -- nichts machen
						q <= q; -- eigentlich nicht nötig da implezit
				end case;
			else
				q <= "0000";
			end if;
		end if;
	end process proc_clocked;
end arch_srg4; 