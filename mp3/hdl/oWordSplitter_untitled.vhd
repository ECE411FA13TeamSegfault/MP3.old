--
-- VHDL Architecture ece411.oWordSplitter.untitled
--
-- Created:
--          by - schen79.ews (linux-a1.ews.illinois.edu)
--          at - 22:56:08 09/18/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY oWordSplitter8 IS
-- Declarations
	Port(
		DataoutMuxout : IN LC3B_oWord;
		Word0         : OUT LC3B_Word;
		Word1         : OUT LC3B_Word;
		Word2         : OUT LC3B_Word;
		Word3         : OUT LC3B_Word;
		Word4         : OUT LC3B_Word;
		Word5         : OUT LC3B_Word;
		Word6         : OUT LC3B_Word;
		Word7         : OUT LC3B_Word
	);
			
END oWordSplitter8 ;

--
ARCHITECTURE untitled OF oWordSplitter8 IS
BEGIN
	Word0  <= DataoutMuxout(15 DOWNTO 0);
	Word1  <= DataoutMuxout(31 DOWNTO 16);
	Word2  <= DataoutMuxout(47 DOWNTO 32);
	Word3  <= DataoutMuxout(63 DOWNTO 48);
	Word4  <= DataoutMuxout(79 DOWNTO 64);
	Word5  <= DataoutMuxout(95 DOWNTO 80);
	Word6  <= DataoutMuxout(111 DOWNTO 96);
	Word7  <= DataoutMuxout(127 DOWNTO 112);
END ARCHITECTURE untitled;

