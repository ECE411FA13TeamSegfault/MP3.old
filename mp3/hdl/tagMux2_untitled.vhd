--
-- VHDL Architecture ece411.tagMux2.untitled
--
-- Created:
--          by - chng2.ews (linux-a2.ews.illinois.edu)
--          at - 22:13:20 10/02/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY tagMux2 IS
   PORT( 
      A   : IN     lc3b_C_Tag;
      B   : IN     lc3b_C_Tag;
      Sel : IN     std_logic;
      F   : OUT    lc3b_C_Tag
   );

-- Declarations

END tagMux2 ;

--
ARCHITECTURE untitled OF tagMux2 IS
BEGIN
	PROCESS (A, B, SEL)
	VARIABLE STATE : LC3B_C_TAG;
	BEGIN
		CASE SEL IS
			WHEN '0' =>
				STATE := A;
			WHEN '1' =>
				STATE := B;
			WHEN OTHERS =>
				STATE := (OTHERS => 'X');
		END CASE;
	F <= STATE AFTER DELAY_MUX2;
	END PROCESS;
END ARCHITECTURE untitled;

