library ieee;                                               
use ieee.std_logic_1164.all;                                

entity srg4_vhd_tst is
end srg4_vhd_tst;
architecture srg4_arch of srg4_vhd_tst is                                                   
	signal clk : std_logic;
	signal d : std_logic_vector(3 downto 0);
	signal left_load_b : std_logic;
	signal q : std_logic_vector(3 downto 0);
	signal right_load_b : std_logic;
	signal rst_b : std_logic;
	signal se_left : std_logic;
	signal se_right : std_logic;
component srg4
	port (
		clk : in std_logic;
		d : in std_logic_vector(3 downto 0);
		left_load_b : in std_logic;
		q : out std_logic_vector(3 downto 0);
		right_load_b : in std_logic;
		rst_b : in std_logic;
		se_left : in std_logic;
		se_right : in std_logic
	);
end component;
begin
	i1 : srg4 port map (
		clk => clk,
		d => d,
		left_load_b => left_load_b,
		q => q,
		right_load_b => right_load_b,
		rst_b => rst_b,
		se_left => se_left,
		se_right => se_right
	);
	
init : process                                                                                   
begin                                                        
	 rst_b <= '0';
	 wait for 50 ns;
	 rst_b <= '1';
	 se_left <= '0';
	 se_right <= '1';
	 wait for 50 ns; 
	 
	 d <= "1010";
    left_load_b <= '0';
	 right_load_b <= '0';
	 wait for 25 ns;
    assert(q="1010") report "data not loaded" severity error;
   
  
    assert false report "test done." severity note;
    wait;                                                     
end process init;                                           
always : process                                                                                  
begin                                                         
	clk <= '0';
	wait for 10 ns;
	clk <= '1';
	wait for 10 ns	                                                        
end process always;                                          
end srg4_arch;
