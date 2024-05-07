library ieee;                                               
use ieee.std_logic_1164.all;                                

entity mux_vhd_tst is
end mux_vhd_tst;
architecture mux_arch of mux_vhd_tst is
                                                 
signal a : std_logic;
signal b : std_logic;
signal en : std_logic;
signal s : std_logic;
signal y : std_logic;
component mux
	port (
	a : in std_logic;
	b : in std_logic;
	en : in std_logic;
	s : in std_logic;
	y : out std_logic
	);
end component;
begin
	i1 : mux
	port map (
	a => a,
	b => b,
	en => en,
	s => s,
	y => y
	);
init : process                                               
                                   
begin                                                        
                         
wait;                                                       
end process init;                                           
always : process                                              
                                   
begin                                                         
       
wait;                                                        
end process always;                                          
end mux_arch;
