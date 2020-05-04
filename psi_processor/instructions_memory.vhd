----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:22:08 05/04/2020 
-- Design Name: 
-- Module Name:    instructions_memory - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity instructions_memory is
    Port ( at : in  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (31 downto 0));
end instructions_memory;

architecture Behavioral of instructions_memory is

--taille de 255 necessaire ????
type array_of_instructions is array (0 to 255) of std_logic_vector (31 downto 0);
signal memory: array_of_instructions := (others => (others => '0'));

begin

	process
	begin
	
		wait until CLK'event and CLK = '1';
		
		--lecture
		data_out <= memory(to_integer(unsigned(at)));
		
	end process;

end Behavioral;
