----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:48:29 05/01/2020 
-- Design Name: 
-- Module Name:    data_memory - Behavioral 
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity data_memory is
    Port ( at : in  STD_LOGIC_VECTOR (7 downto 0);
           data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           RW : in  STD_LOGIC;
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           data_out : out  STD_LOGIC_VECTOR (7 downto 0));
end data_memory;

architecture Behavioral of data_memory is

type array_of_data is array (0 to 255) of std_logic_vector (7 downto 0);
signal memory: array_of_data := (others => (others => '0'));

begin

	process
	begin
	
		wait until CLK'event and CLK = '1';
		
		if RST = '0'
		then
			memory <= (others => (others => '0'));
		elsif RW = '1' --lecture
		then
			data_out <= memory(to_integer(unsigned(at)));
		elsif RW = '0' --ecriture
		then
			memory(to_integer(unsigned(at))) <= data_in;
		end if;
		
	end process;

end Behavioral;

