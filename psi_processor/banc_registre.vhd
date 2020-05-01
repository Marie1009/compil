----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:36:00 05/01/2020 
-- Design Name: 
-- Module Name:    banc_registre - Behavioral 
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

entity banc_registre is
    Port ( at_A : in  STD_LOGIC_VECTOR (3 downto 0); -- entre 0 et 15
           at_B : in  STD_LOGIC_VECTOR (3 downto 0); -- entre 0 et 15
           at_W : in  STD_LOGIC_VECTOR (3 downto 0); -- entre 0 et 15
           W : in  STD_LOGIC;
           DATA : in  STD_LOGIC_VECTOR (7 downto 0);
           RST : in  STD_LOGIC;
           CLK : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end banc_registre;

architecture Behavioral of banc_registre is

-- RST actif a 0 => initialise la valeur du registre a 0x00
-- synchrone

-- valeurs des registres at_ copiees dans les sorties Q
-- lecture en continu !!

-- si W=1 => ecriture de la valeur de DATA dans at_W
-- synchrone

type array_of_registers is array (0 to 15) of std_logic_vector (7 downto 0);
signal register_bench: array_of_registers := (others => (others => '0'));


begin

	process
	begin
	
		wait until CLK'event and CLK = '1';
		
		if RST = '0'
		then
			register_bench <= (others => (others => '0'));
		elsif W = '1'
		then
			register_bench(to_integer(unsigned(at_W))) <= DATA;
		end if;
	
	end process;
	
	QA <= DATA when at_A = at_W and W = '1'
		else register_bench(to_integer(unsigned(at_A)));
		
	QB <= DATA when at_B = at_W and W = '1'
		else register_bench(to_integer(unsigned(at_B)));
	
end Behavioral;

