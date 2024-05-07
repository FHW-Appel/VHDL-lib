library ieee;                                               
use ieee.std_logic_1164.all;                                

entity ctrdiv16_vhd_tst is
end ctrdiv16_vhd_tst;
architecture ctrdiv16_arch of ctrdiv16_vhd_tst is                                                  
signal clk : std_logic;
signal d : std_logic_vector(3 downto 0);
signal gate : std_logic;
signal mode : std_logic_vector(1 downto 0);
signal max_val : std_logic;
signal q : std_logic_vector(3 downto 0);
signal rst_n : std_logic;
component ctrdiv16
	port (
	clk : in std_logic;
	d : in std_logic_vector(3 downto 0);
	gate : in std_logic;
	mode : in std_logic_vector(1 downto 0);
	max_val : out std_logic;
	q : out std_logic_vector(3 downto 0);
	rst_n : in std_logic
	);
end component;
begin
	i1 : ctrdiv16
	port map (

	clk => clk,
	d => d,
	gate => gate,
	mode => mode,
	max_val => max_val,
	q => q,
	rst_n => rst_n
	);                                             
                                 
init : process                                                                                   
begin                                                        
	 rst_n <= '0';
	 wait for 50 ns;
	 rst_n <= '1';
	 mode <= "01";
	 gate <= '1';
	 wait for 200 ns; 
	 gate <= '1';
	 wait for 100 ns;

    assert(q="0101") report "zaehlerstand nicht korrekt" severity error;
   
  
    assert false report "test done." severity note;
    wait;                                                     
end process init;    
                                         
always : process                                                                                  
begin                                                         
	clk <= '0';
	wait for 10 ns;
	clk <= '1';
	wait for 10 ns;                                                        
end process always;                                          
                                         
end ctrdiv16_arch;
