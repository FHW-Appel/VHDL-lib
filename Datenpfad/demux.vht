library ieee;                                               
use ieee.std_logic_1164.all;                                

entity demux_vhd_tst is
end demux_vhd_tst;
architecture demux_arch of demux_vhd_tst is                                               
signal a : std_logic;
signal en : std_logic;
signal s : std_logic;
signal y1 : std_logic;
signal y2 : std_logic;
component demux
	port (
	a : in std_logic;
	en : in std_logic;
	s : in std_logic;
	y1 : buffer std_logic;
	y2 : buffer std_logic
	);
end component;
begin
	i1 : demux
	port map (
	a => a,
	en => en,
	s => s,
	y1 => y1,
	y2 => y2
	);
init : process                                               
                           
begin                                                        
                   
wait;                                                       
end process init;                                           
always : process                                              
                                
begin                                                         

wait;                                                        
end process always;                                          
end demux_arch;
