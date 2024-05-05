LIBRARY ieee;                                               
USE ieee.std_logic_1164.all;                                

ENTITY srg4_vhd_tst IS
END srg4_vhd_tst;
ARCHITECTURE srg4_arch OF srg4_vhd_tst IS                                                   
SIGNAL clk : STD_LOGIC;
SIGNAL d : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL left_load_b : STD_LOGIC;
SIGNAL q : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL right_load_b : STD_LOGIC;
SIGNAL rst_b : STD_LOGIC;
SIGNAL se_left : STD_LOGIC;
SIGNAL se_right : STD_LOGIC;
COMPONENT srg4
	PORT (
	clk : IN STD_LOGIC;
	d : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
	left_load_b : IN STD_LOGIC;
	q : OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
	right_load_b : IN STD_LOGIC;
	rst_b : IN STD_LOGIC;
	se_left : IN STD_LOGIC;
	se_right : IN STD_LOGIC
	);
END COMPONENT;
BEGIN
	i1 : srg4
	PORT MAP (
	clk => clk,
	d => d,
	left_load_b => left_load_b,
	q => q,
	right_load_b => right_load_b,
	rst_b => rst_b,
	se_left => se_left,
	se_right => se_right
	);
init : PROCESS                                                                                   
BEGIN                                                        
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
    assert(q="1010") report "Data not loaded" severity error;
   
  
    assert false report "Test done." severity note;
    wait;                                                     
END PROCESS init;                                           
always : PROCESS                                                                                  
BEGIN                                                         
   clk <= '0';
	wait for 10 ns;
	clk <= '1';
	wait for 10 ns	                                                        
END PROCESS always;                                          
END srg4_arch;
