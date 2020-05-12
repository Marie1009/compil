----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:57:35 05/12/2020 
-- Design Name: 
-- Module Name:    processor - Behavioral 
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

entity processor is
    Port ( CLK : in  STD_LOGIC;
           RESET : in  STD_LOGIC;
           QA : out  STD_LOGIC_VECTOR (7 downto 0);
           QB : out  STD_LOGIC_VECTOR (7 downto 0));
end processor;

architecture Behavioral of processor is

	 COMPONENT instructions_memory
    PORT(
         at : IN  std_logic_vector(7 downto 0);
         CLK : IN  std_logic;
         data_out : OUT  std_logic_vector(31 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT pipeline
    Port ( OP : in  STD_LOGIC_VECTOR (7 downto 0);
           A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           C : in  STD_LOGIC_VECTOR (7 downto 0);
           OP_out : out  STD_LOGIC_VECTOR (7 downto 0);
           A_out : out  STD_LOGIC_VECTOR (7 downto 0);
           B_out : out  STD_LOGIC_VECTOR (7 downto 0);
           C_out : out  STD_LOGIC_VECTOR (7 downto 0);
           CLK : in  STD_LOGIC);
	 END COMPONENT;
	  
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
	 
	 COMPONENT data_memory
    PORT(
         at : IN  std_logic_vector(7 downto 0);
         data_in : IN  std_logic_vector(7 downto 0);
         RW : IN  std_logic;
         RST : IN  std_logic;
         CLK : IN  std_logic;
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;

--instructions_memory
signal at_inst : STD_LOGIC_VECTOR (7 downto 0); --IP parcourt tous les numeros d'instruction
	--divise en A OP B et C dans lidi
signal data_out_inst : STD_LOGIC_VECTOR (31 downto 0); 

--pipeline LI/DI (num1)
	--entree A OP B et C => data_out_inst
signal OP_lidi : out  STD_LOGIC_VECTOR (7 downto 0);
signal A_lidi : out  STD_LOGIC_VECTOR (7 downto 0);
signal B_lidi : out  STD_LOGIC_VECTOR (7 downto 0);
signal C_lidi : out  STD_LOGIC_VECTOR (7 downto 0);

begin

	inst_mem: instructions_memory PORT MAP (
          at => at_inst,
          CLK => CLK,
          data_out => data_out_inst
        );
	
	lidi: pipeline PORT MAP (
			 OP => data_out_inst(31 downto 24), --verifier la fleche
			 A => data_out_inst(23 downto 16),
			 B => data_out_inst(15 downto 8),
			 C => data_out_inst(7 downto 0),
			 
			 OP_out => OP_lidi,
			 A_out => A_lidi,
			 B_out => B_lidi,
			 C_out => C_lidi,
			 
			 CLK => CLK
		  );
		
	
	
	alu_p: alu PORT MAP (
          A => A,
          B => B,
          Ctrl_Alu => Ctrl_Alu,
          S => S,
          N => N,
          O => O,
          Z => Z,
          C => C
        );
		  

	process
	begin
		
		--synchro clock
		
		--incrementation de IP : compteur qui lit les instructions
		
		--chaque attributions des signaux
		--MUX et LC => si op == ... then ...
		
	
	end process;

end Behavioral;

