--
-- VHDL Architecture ece411.WordSplitter2.untitled
--
-- Created:
--          by - schen79.ews (linux-a2.ews.illinois.edu)
--          at - 09:32:15 09/20/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY WordSplitter2 IS
   PORT( 
      A     : IN     LC3b_Word;
      Byte0 : OUT    LC3b_Byte;
      Byte1 : OUT    LC3b_Byte
   );

-- Declarations

END WordSplitter2 ;

--
ARCHITECTURE untitled OF WordSplitter2 IS
BEGIN
	Byte0 <= A(7 downto 0);
	Byte1 <= A(15 downto 8);
END ARCHITECTURE untitled;

