--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:03:15 05/11/2020
-- Design Name:   
-- Module Name:   /home/peraire/PSI/psi_processor/instructions_memory_test.vhd
-- Project Name:  psi_processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: instructions_memory
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
 
ENTITY instructions_memory_test IS
END instructions_memory_test;
 
ARCHITECTURE behavior OF instructions_memory_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT instructions_memory
    PORT(
         at : IN  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         data_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal at : std_logic_vector(7 downto 0) := (others => '0');
   signal CLK : std_logic := '0';

 	--Outputs
   signal data_out : std_logic_vector(31 downto 0);

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: instructions_memory PORT MAP (
          at => at,
          CLK => CLK,
          data_out => data_out
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for CLK_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
