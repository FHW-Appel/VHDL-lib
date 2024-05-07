library IEEE;
use IEEE.std_logic_1164.all;

entity FF is
  port(
	  d : in std_logic;
	  c : in std_logic;
	  r : in std_logic;
	  en : in std_logic;
	  q : out std_logic;
	  q_b : out std_logic
  );
end FF;

architecture synth of FF is
begin
  proc_clocked: process(c)
  begin
	 if r = '1' then
		q <= '0';
    elsif falling_edge(c) then
        if en = '0' then
            q <= d;
        end if;
    end if;
  end process proc_clocked;
  q_b <= not q;
end;

