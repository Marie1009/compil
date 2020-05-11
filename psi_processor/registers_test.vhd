--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:20:21 05/11/2020
-- Design Name:   
-- Module Name:   /home/peraire/PSI/psi_processor/registers_test.vhd
-- Project Name:  psi_processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: banc_registre
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY registers_test IS
END registers_test;
 
ARCHITECTURE behavior OF registers_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT banc_registre
    PORT(
         at_A : IN  std_logic_vector(3 downto 0);
         at_B : IN  std_logic_vector(3 downto 0);
         at_W : IN  std_logic_vector(3 downto 0);
         W : IN  std_logic;
         DATA : IN  std_logic_vector(7 downto 0);
         RST : IN  std_logic;
         CLK : IN  std_logic;
         QA : OUT  std_logic_vector(7 downto 0);
         QB : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal at_A : std_logic_vector(3 downto 0) := (others => '0');
   signal at_B : std_logic_vector(3 downto 0) := (others => '0');
   signal at_W : std_logic_vector(3 downto 0) := (others => '0');
   signal W : std_logic := '0';
   signal DATA : std_logic_vector(7 downto 0) := (others => '0');
   signal RST : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal QA : std_logic_vector(7 downto 0);
   signal QB : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: banc_registre PORT MAP (
          at_A => at_A,
          at_B => at_B,
          at_W => at_W,
          W => W,
          DATA => DATA,
          RST => RST,
          CLK => CLK,
          QA => QA,
          QB => QB
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for 100 ns;
		
		-- test lecture
		at_A <= x"A";
		at_B <= x"C";
		W <= '0';
		RST <= '1';
		
		wait for 100 ns;

      -- test ecriture 1/2
		at_W <= x"A";
		W <= '1';
		DATA <= x"22";
		RST <= '1';
		
		wait for 100 ns;
		
		-- test ecriture 2/2
		at_W <= x"C";
		W <= '1';
		DATA <= x"33";
		RST <= '1';
		
		wait for 100 ns;
		
		-- test lecture
		at_A <= x"A";
		at_B <= x"C";
		W <= '0';
		RST <= '1';
		
		wait for 100 ns;
		
		-- test reset
		RST <= '0';
		
		wait for 100 ns;
		
		-- test lecture result reset
		at_A <= x"A";
		at_B <= x"C";
		W <= '0';
		RST <= '1';

      wait;
   end process;

END;
