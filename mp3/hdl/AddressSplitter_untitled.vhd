--
-- VHDL Architecture ece411.AddressSplitter.untitled
--
-- Created:
--          by - schen79.ews (linux-a1.ews.illinois.edu)
--          at - 22:12:51 09/18/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY AddressSplitter IS
   PORT( 
      ADDRESS            : IN     LC3B_WORD;
      ADDRESS_OFFSET     : OUT    LC3B_C_OFFSET;
      ADDRESS_OFFSET_3_1 : OUT    LC3B_8MUX_SEL;
      ADDRESS_OFFSET_0   : OUT    STD_LOGIC;
      ADDRESS_TAG        : OUT    LC3B_C_TAG;
      ADDRESS_INDEX      : OUT    LC3b_C_set
   );

-- Declarations

END AddressSplitter ;

--
ARCHITECTURE untitled OF AddressSplitter IS
BEGIN
	ADDRESS_OFFSET <= ADDRESS(3 DOWNTO 0);
	ADDRESS_OFFSET_3_1 <= ADDRESS(3 DOWNTO 1);
	ADDRESS_OFFSET_0 <= ADDRESS(0);
	ADDRESS_INDEX    <= ADDRESS(6 DOWNTO 4);
	ADDRESS_TAG    <= ADDRESS(15 DOWNTO 7);
END ARCHITECTURE untitled;

