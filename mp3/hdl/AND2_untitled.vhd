--
-- VHDL Architecture ece411.AND2.untitled
--
-- Created:
--          by - schen79.ews (linux-a2.ews.illinois.edu)
--          at - 13:10:09 09/20/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AND2 IS
   PORT( 
      A : IN     std_logic;
      B : IN     std_logic;
      F : OUT    std_logic
   );

-- Declarations

END AND2 ;

--
ARCHITECTURE untitled OF AND2 IS
BEGIN
	PROCESS(A, B)
		VARIABLE ANDInternal : std_logic;
		BEGIN
			ANDInternal := A AND B;
			F <= ANDInternal after DELAY_LOGIC2;
		END PROCESS;
END ARCHITECTURE untitled;

