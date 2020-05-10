--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:25:21 05/04/2020
-- Design Name:   
-- Module Name:   /home/peraire/PSI/psi_processor/alu_test.vhd
-- Project Name:  psi_processor
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: alu
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY alu_test IS
END alu_test;
 
ARCHITECTURE behavior OF alu_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT alu
    PORT(
         A : IN  std_logic_vector(7 downto 0);
         B : IN  std_logic_vector(7 downto 0);
         Ctrl_Alu : IN  std_logic_vector(2 downto 0);
         S : OUT  std_logic_vector(7 downto 0);
         N : OUT  std_logic;
         O : OUT  std_logic;
         Z : OUT  std_logic;
         C : OUT  std_logic
        );
    END COMPONENT;
	
   --Inputs
   signal A : std_logic_vector(7 downto 0) := (others => '0');
   signal B : std_logic_vector(7 downto 0) := (others => '0');
   signal Ctrl_Alu : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal S : std_logic_vector(7 downto 0);
   signal N : std_logic;
   signal O : std_logic;
   signal Z : std_logic;
   signal C : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: alu PORT MAP (
          A => A,
          B => B,
          Ctrl_Alu => Ctrl_Alu,
          S => S,
          N => N,
          O => O,
          Z => Z,
          C => C
        );
 
 --systeme jeanne et gabrielle
	Ctrl_Alu <= "000";
	A <= X"01";
	B <= X"01";
	
	--wait for 100 ns;
	
	Ctrl_Alu <= "001";
	A <= X"FF";
	B <= X"FF";
	
	--wait for 100 ns;
	
	Ctrl_Alu <= "010";
	A <= X"0F";
	B <= X"0F";
	
	--wait for 100 ns;
	
	Ctrl_Alu <= "011";
	A <= X"01";
	B <= X"01";
	
 
 --emma et patrick
Ctrl_Alu <= "000", "001" after 100 ns, "010" after 200 ns, "011" after 300 ns, "100" after 400 ns, "101" after 450 ns, "110" after 500 ns, "111" after 550 ns;
A <= X"01", X"FF" after 25 ns, X"0F" after 50 ns, X"01" after 100 ns, X"02" after 150 ns, X"FF" after 225 ns, X"00" after 450 ns, X"FF" after 475 ns, X"00" after 525 ns;
B <= X"01", X"FF" after 25 ns, X"0F" after 75 ns, X"01" after 100 ns, X"02" after 125 ns, X"F0" after 150 ns, X"03" after 200 ns, X"FF" after 425 ns; 
 
END;
