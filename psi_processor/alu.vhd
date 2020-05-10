----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:29:35 04/30/2020 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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

entity alu is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           Ctrl_Alu : in  STD_LOGIC_VECTOR (2 downto 0);
           S : out  STD_LOGIC_VECTOR (7 downto 0);
           N : out  STD_LOGIC;
           O : out  STD_LOGIC;
           Z : out  STD_LOGIC;
           C : out  STD_LOGIC);
end alu;

architecture Behavioral of alu is

signal result_temp : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');

begin

	--process
	--begin
		
	--	if Ctrl_Alu = "001" --addition
	--	then
	--		result_temp <= ("00000000" & A) + ("00000000" & B);
	--	elsif Ctrl_Alu = "010" --multiplication
	--	then
	--		result_temp <= A * B;
	--	elsif Ctrl_Alu = "011" --soustraction
	--	then
	--		result_temp <= ("00000000" & A) - ("00000000" & B);
		--elsif Ctrl_Alu = "100" --division
		--then
		--else --erreur
	--	end if;
	--
	--end process;
	
	result_temp <= ("00000000" & A) + ("00000000" & B) when Ctrl_Alu = "001" --addition
				else  A * B when Ctrl_Alu = "010" --multiplication
				else  ("00000000" & A) - ("00000000" & B) when Ctrl_Alu = "011" --soustraction
				;
	
	S <= result_temp(7 downto 0);
	-->>flags
	--negative -- on sait pas si a et b sont signes => verification apres l'alu
	N <= result_temp(7);
	--overflow
	O <= '0' when result_temp(15 downto 8) = x"00" else '1';
	--null
	Z <= '1' when result_temp(15 downto 0) = x"0000" else '0';
	--retenue de l'addition et de la multiplication
	C <= '1' when Ctrl_Alu="001" and result_temp(8)='1' --changement 8 to 7 ???
	else '1' when Ctrl_Alu="010" and result_temp(15 downto 8)>x"00" 
	else '0';

end Behavioral;

