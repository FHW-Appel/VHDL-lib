library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ctrdiv16 is
	port(
		rst_n : in std_logic;
		mode : in  std_logic_vector(1 downto 0);
		gate : in std_logic;
		clk : in std_logic;
		max_val : out std_logic;
		d : in std_logic_vector(3 downto 0);
		q : out std_logic_vector(3 downto 0)
	);
end ctrdiv16; 

architecture arch_ctn of ctrdiv16 is
 signal q_temp: unsigned(3 downto 0);
begin
proc_clocked: process(clk, rst_n)

begin
	
	if rst_n = '0' then
		q_temp <= "0000";
	elsif rising_edge(clk) then
		-- Defaults
		max_val <= '0';
		case mode is
			when "01" => -- Zählen
				if gate = '1' then
					q_temp <= q_temp + 1;
					if q_temp = "1110" then
						max_val <= '1';		
					end if;
 				end if; 
			when "10" => -- Daten laden
				q_temp <= unsigned(d);
			when others =>
		end case;
	end if;

end process proc_clocked;

q <= std_logic_vector(q_temp);
end architecture arch_ctn;
