--
-- VHDL Architecture ece411.ByteJoiner2.untitled
--
-- Created:
--          by - schen79.ews (linux-a2.ews.illinois.edu)
--          at - 10:48:00 09/20/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY ByteJoiner2 IS
   PORT( 
      Byte0 : IN     LC3b_byte;
      Byte1 : IN     LC3b_byte;
      Word  : OUT    LC3b_word
   );

-- Declarations

END ByteJoiner2 ;

--
ARCHITECTURE untitled OF ByteJoiner2 IS
BEGIN
	Word <= Byte1 & Byte0;
END ARCHITECTURE untitled;

