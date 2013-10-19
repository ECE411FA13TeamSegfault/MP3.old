--
-- VHDL Architecture ece411.TagComparator.untitled
--
-- Created:
--          by - schen79.ews (linux-a3.ews.illinois.edu)
--          at - 12:52:31 09/18/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY TagComparator IS
   PORT( 
      AddressTag : IN     LC3b_C_Tag;
      CacheTag   : IN     LC3b_C_Tag;
      Equals     : OUT    std_logic
   );

-- Declarations

END TagComparator ;

--
ARCHITECTURE untitled OF TagComparator IS
BEGIN
	process (AddressTag, CacheTag)
	variable compare : std_logic;
	begin
		if (AddressTag = CacheTag) then
			compare := '1';
		else
			compare := '0';
		end if;
		
		Equals <= compare after DELAY_COMPARE8;
	end process;
END ARCHITECTURE untitled;

