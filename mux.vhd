library IEEE;
use IEEE.std_logic_1164.all;

entity abc is
  port(
	  a : in bit;
	  b : in bit;
	  en : in bit;
	  s : in bit;
	  y : out bit
  );
end abc;

architecture synth of abc is
begin
  process(a, b, s)
  begin
    if en = '1' then
      case s is
        when '0' => y <= a;
        when '1' => y <= b;
      end case;
    else
        y <= '0';
    end if;
  end process;
  
end;

