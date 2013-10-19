--
-- VHDL Architecture ece411.Decoder8.untitled
--
-- Created:
--          by - schen79.ews (linux-a2.ews.illinois.edu)
--          at - 10:00:07 09/20/13
--
-- using Mentor Graphics HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Decoder8 IS
   PORT( 
      A    : IN     LC3b_8Mux_sel;
      Out0 : OUT    std_logic;
      Out1 : OUT    std_logic;
      Out2 : OUT    std_logic;
      Out3 : OUT    std_logic;
      Out4 : OUT    std_logic;
      Out5 : OUT    std_logic;
      Out6 : OUT    std_logic;
      Out7 : OUT    std_logic
   );

-- Declarations

END Decoder8 ;

--
ARCHITECTURE untitled OF Decoder8 IS
BEGIN
	PROCESS (A)
	VARIABLE InternalOut0 : std_logic;
	VARIABLE InternalOut1 : std_logic;
	VARIABLE InternalOut2 : std_logic;
	VARIABLE InternalOut3 : std_logic;
	VARIABLE InternalOut4 : std_logic;
	VARIABLE InternalOut5 : std_logic;
	VARIABLE InternalOut6 : std_logic;
	VARIABLE InternalOut7 : std_logic;
	BEGIN
		CASE A IS
			WHEN "000" =>
				InternalOut0 := '1';
				InternalOut1 := '0';
				InternalOut2 := '0';
				InternalOut3 := '0';
				InternalOut4 := '0';
				InternalOut5 := '0';
				InternalOut6 := '0';
				InternalOut7 := '0';
			WHEN "001" =>
				InternalOut0 := '0';
				InternalOut1 := '1';
				InternalOut2 := '0';
				InternalOut3 := '0';
				InternalOut4 := '0';
				InternalOut5 := '0';
				InternalOut6 := '0';
				InternalOut7 := '0';
			WHEN "010" =>
				InternalOut0 := '0';
				InternalOut1 := '0';
				InternalOut2 := '1';
				InternalOut3 := '0';
				InternalOut4 := '0';
				InternalOut5 := '0';
				InternalOut6 := '0';
				InternalOut7 := '0';
			WHEN "011" =>
				InternalOut0 := '0';
				InternalOut1 := '0';
				InternalOut2 := '0';
				InternalOut3 := '1';
				InternalOut4 := '0';
				InternalOut5 := '0';
				InternalOut6 := '0';
				InternalOut7 := '0';
			WHEN "100" =>
				InternalOut0 := '0';
				InternalOut1 := '0';
				InternalOut2 := '0';
				InternalOut3 := '0';
				InternalOut4 := '1';
				InternalOut5 := '0';
				InternalOut6 := '0';
				InternalOut7 := '0';
			WHEN "101" =>
				InternalOut0 := '0';
				InternalOut1 := '0';
				InternalOut2 := '0';
				InternalOut3 := '0';
				InternalOut4 := '0';
				InternalOut5 := '1';
				InternalOut6 := '0';
				InternalOut7 := '0';
			WHEN "110" =>
				InternalOut0 := '0';
				InternalOut1 := '0';
				InternalOut2 := '0';
				InternalOut3 := '0';
				InternalOut4 := '0';
				InternalOut5 := '0';
				InternalOut6 := '1';
				InternalOut7 := '0';
			WHEN "111" =>
				InternalOut0 := '0';
				InternalOut1 := '0';
				InternalOut2 := '0';
				InternalOut3 := '0';
				InternalOut4 := '0';
				InternalOut5 := '0';
				InternalOut6 := '0';
				InternalOut7 := '1';
			WHEN OTHERS =>
				InternalOut0 := 'X';
				InternalOut1 := 'X';
				InternalOut2 := 'X';
				InternalOut3 := 'X';
				InternalOut4 := 'X';
				InternalOut5 := 'X';
				InternalOut6 := 'X';
				InternalOut7 := 'X';		
		END CASE;
		
		Out0 <= InternalOut0 AFTER DELAY_DECODE3;
		Out1 <= InternalOut1 AFTER DELAY_DECODE3;
		Out2 <= InternalOut2 AFTER DELAY_DECODE3;
		Out3 <= InternalOut3 AFTER DELAY_DECODE3;
		Out4 <= InternalOut4 AFTER DELAY_DECODE3;
		Out5 <= InternalOut5 AFTER DELAY_DECODE3;
		Out6 <= InternalOut6 AFTER DELAY_DECODE3;
		Out7 <= InternalOut7 AFTER DELAY_DECODE3;
	
	END PROCESS;			
END ARCHITECTURE untitled;

