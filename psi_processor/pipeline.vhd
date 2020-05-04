----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:09:59 05/04/2020 
-- Design Name: 
-- Module Name:    pipeline - Behavioral 
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

entity pipeline is
    Port ( OP : in  STD_LOGIC_VECTOR (7 downto 0);
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           OP_out : out  STD_LOGIC_VECTOR (7 downto 0);
           A_out : out  STD_LOGIC_VECTOR (7 downto 0);
           B_out : out  STD_LOGIC_VECTOR (7 downto 0);
           C_out : out  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC);
end pipeline;

architecture Behavioral of pipeline is

begin

	process
	begin
	
		wait until CLK'event and CLK = '1';
		
		OP_out <= OP;
		A_out <= A;
		B_out <= B;
		C_out <= C;
	
	end process;

end Behavioral;

