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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

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
	--entrees A OP B et C => data_out_inst
	--sorties:
signal OP_lidi : STD_LOGIC_VECTOR (7 downto 0);
signal A_lidi : STD_LOGIC_VECTOR (7 downto 0);
signal B_lidi : STD_LOGIC_VECTOR (7 downto 0);
signal C_lidi : STD_LOGIC_VECTOR (7 downto 0);

--banc de registre
signal RST_BR : std_logic; --in
signal QA_BR : STD_LOGIC_VECTOR (7 downto 0); --out
signal QB_BR : STD_LOGIC_VECTOR (7 downto 0); --out

--MUX 1
signal mux1_out : STD_LOGIC_VECTOR (7 downto 0); --in du B_diex

--pipeline DI/EX (num2)
	--entrees A OP B et C => deja avant
	--sorties:
signal OP_diex : STD_LOGIC_VECTOR (7 downto 0);
signal A_diex : STD_LOGIC_VECTOR (7 downto 0);
signal B_diex : STD_LOGIC_VECTOR (7 downto 0);
signal C_diex : STD_LOGIC_VECTOR (7 downto 0);

--LC 1
signal lc1_out : STD_LOGIC_VECTOR (2 downto 0);

--ual
--entrees A B et ctrl_alu => deja avant
--sorties N O Z C open
signal S_ual : STD_LOGIC_VECTOR (7 downto 0);

--MUX 2
signal mux2_out: STD_LOGIC_VECTOR (7 downto 0); --in B exmem

--pipeline EX/Mem (num3)
	--entrees A OP B => deja avant ; et C (bidon) 
	--C_out open
	--sorties:
signal OP_exmem : STD_LOGIC_VECTOR (7 downto 0);
signal A_exmem : STD_LOGIC_VECTOR (7 downto 0);
signal B_exmem : STD_LOGIC_VECTOR (7 downto 0);

--MUX 3
signal mux3_out : STD_LOGIC_VECTOR (7 downto 0); --in add memoire des donnees

--LC 2
signal lc2_out : std_logic; --in RW memoire des donnees

--memoire des donnees
-- IN deja avec B_exmem
signal RST_dm : std_logic; --in
signal OUT_dm : STD_LOGIC_VECTOR (7 downto 0);

--MUX 4
signal mux4_out : STD_LOGIC_VECTOR (7 downto 0);

--pipeline Mem/RE (num4)
--entrees A OP B => deja avant ; et C (bidon) 
	--C_out open
	--sorties:
signal OP_memre : STD_LOGIC_VECTOR (7 downto 0);
signal A_memre : STD_LOGIC_VECTOR (7 downto 0);
signal B_memre : STD_LOGIC_VECTOR (7 downto 0);

--LC 3
signal lc3_out : std_logic; --in W banc de reg

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
		
	register_bench : banc_registre PORT MAP (
          at_A => B_lidi(3 downto 0),
          at_B => C_lidi(3 downto 0),
          at_W => A_memre(3 downto 0),
          W => lc3_out,
          DATA => B_memre,
          RST => RST_BR,
          CLK => CLK,
          QA => QA_BR,
          QB => QB_BR
        );
		  
	diex: pipeline PORT MAP (
			 OP => OP_lidi,
			 A => A_lidi,
			 B => mux1_out,
			 C => QB_BR,
			 
			 OP_out => OP_diex,
			 A_out => A_diex,
			 B_out => B_diex,
			 C_out => C_diex,
			 
			 CLK => CLK
		  );
	
	ual : alu PORT MAP (
          A => B_diex,
          B => C_diex,
          Ctrl_Alu => lc1_out,
          S => S_ual,
          N => Open,
          O => Open,
          Z => Open,
          C => Open
        );
	
	exmem : pipeline PORT MAP (
			 OP => OP_diex,
			 A => A_diex,
			 B => mux2_out,
			 C => x"00",
			 
			 OP_out => OP_exmem,
			 A_out => A_exmem,
			 B_out => B_exmem,
			 C_out => Open,
			 
			 CLK => CLK
		  );
		  
	memory : data_memory PORT MAP (
          at => mux3_out,
          data_in => B_exmem,
          RW => lc2_out,
          RST => RST_dm,
          CLK => CLK,
          data_out => OUT_dm
        );
		  
	memre: pipeline PORT MAP (
			 OP => OP_exmem,
			 A => A_exmem,
			 B => mux4_out,
			 C => x"00",
			 
			 OP_out => OP_memre,
			 A_out => A_memre,
			 B_out => B_memre, 
			 C_out => Open,
			 
			 CLK => CLK
		  );
		  

	process
	begin
		
		--synchro clock
		wait until CLK'event and CLK = '1';
		
		if RESET = '0'
		then
			RST_BR <= '0';
			RST_dm <= '0';
			
			at_inst <= x"01";
		else
			RST_BR <= '1';
			RST_dm <= '1';
			
			--incrementation de IP : compteur qui lit les instructions
			if at_inst = x"08"
			then
				at_inst <= x"01";
			elsif at_inst = x"02"
			then
				at_inst <= x"04";
			else
				at_inst <= at_inst + 1;
			end if;
			
			--chaque attributions des signaux
			--MUX et LC => si op == ... then ...
			
			--MUX 1: banc de registre/pipeline 2
			if OP_lidi = x"06" or OP_lidi = x"07" --afc -- load
			then
				mux1_out <= B_lidi;
			else --copie --store --add mul sou
				mux1_out <= QA_BR;
			end if;
			
			--LC 1: pipeline diex/ual
			if OP_diex = x"01" --add
			then
				lc1_out <= "001";
			elsif OP_diex = x"02" --mul
			then
				lc1_out <= "010";
			elsif OP_diex = x"03" --sou
			then
				lc1_out <= "011";
			else --pas de div
				lc1_out <= "000";
			end if;
			
			--MUX 2: ual/pipeline exmem
			if OP_diex = x"01" or OP_diex = x"02" or OP_diex = x"03"
			then
				mux2_out <= S_ual;
			else
				mux2_out <= B_diex;
			end if;
			
			--MUX 3: pipeline exmem/memoire de donnees
			if OP_exmem = x"07" --load
			then
				mux3_out <= B_exmem;
			elsif OP_exmem = x"08" --store
			then
				mux3_out <= A_exmem;
			else
				mux3_out <= x"00";
				--lecture dans lc2
			end if;
			
			--LC 2: pipeline exmem/memoire de donnees
			if OP_exmem = x"07" --load
			then
				lc2_out <= '1'; --lire
			elsif OP_exmem = x"08" --store
			then
				lc2_out <= '0'; --ecrire
			else
				lc2_out <= '1'; --lire
			end if;
			
			
			--MUX 4: memoire de donnees/pipeline memre
			if OP_exmem = x"07" --load
			then
				mux4_out <= OUT_dm; --lire
			else
				mux4_out <= B_exmem; --autre
			end if;
			
			
			--LC 3: pipeline 4/banc de registre
			if OP_memre = x"08" --store
			then
				lc3_out <= '0';
			else -- tout le reste
				lc3_out <= '1';
			end if;
			
		end if;
	
	end process;

end Behavioral;

