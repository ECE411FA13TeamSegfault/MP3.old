-- VHDL Entity ece411.Datapath.interface
--
-- Created:
--          by - chng2.ews (linux-a3.ews.illinois.edu)
--          at - 23:47:03 09/26/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;

ENTITY Datapath IS
   PORT( 
      ADDR2MuxSel   : IN     std_logic;
      ALUMuxSel     : IN     std_logic;
      ALUop         : IN     LC3b_aluop;
      DATAIN        : IN     LC3b_word;
      DRMuxSel      : IN     std_logic;
      GenCCMuxSel   : IN     std_logic;
      LoadIR        : IN     std_logic;
      LoadMAR       : IN     std_logic;
      LoadMDR       : IN     std_logic;
      LoadNZP       : IN     std_logic;
      LoadPC        : IN     std_logic;
      MARMuxSel     : IN     LC3b_4Mux_Sel;
      MDRMux2Sel    : IN     LC3b_4mux_sel;
      MDRMuxSel     : IN     std_logic;
      PCMuxSel      : IN     LC3b_4Mux_Sel;
      RESET_L       : IN     std_logic;
      RFMux2Sel     : IN     LC3b_4mux_sel;
      RFMuxSel      : IN     LC3b_4Mux_Sel;
      RegWrite      : IN     std_logic;
      StoreSR       : IN     std_logic;
      clk           : IN     std_logic;
      offset6MuxSel : IN     std_logic;
      ADDRESS       : OUT    LC3b_word;
      ADDRESS_0     : OUT    std_logic;
      CheckN        : OUT    std_logic;
      CheckP        : OUT    std_logic;
      CheckZ        : OUT    std_logic;
      DATAOUT       : OUT    LC3b_word;
      Opcode        : OUT    LC3b_opcode;
      bit11         : OUT    std_logic;
      n             : OUT    std_logic;
      p             : OUT    std_logic;
      shftop        : OUT    LC3b_shftop;
      z             : OUT    std_logic
   );

-- Declarations

END Datapath ;

--
-- VHDL Architecture ece411.Datapath.struct
--
-- Created:
--          by - chng2.ews (linux-a3.ews.illinois.edu)
--          at - 23:47:04 09/26/13
--
-- Generated by Mentor Graphics' HDL Designer(TM) 2012.1 (Build 6)
--
LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.NUMERIC_STD.all;

LIBRARY ece411;
USE ece411.LC3b_types.all;


ARCHITECTURE struct OF Datapath IS

   -- Architecture declarations

   -- Internal signal declarations
   SIGNAL ADDR2Muxout   : LC3b_word;
   SIGNAL ADJ11out      : LC3b_word;
   SIGNAL ADJ6out       : LC3b_word;
   SIGNAL ADJ8out       : LC3b_word;
   SIGNAL ADJ9out       : LC3b_word;
   SIGNAL ALUMuxout     : LC3b_word;
   SIGNAL ALUout        : LC3b_word;
   SIGNAL BRAddout      : LC3b_word;
   SIGNAL ClrHByteout   : LC3b_word;
   SIGNAL ClrLByteout   : LC3b_word;
   SIGNAL D2            : LC3b_word;
   SIGNAL D3            : LC3b_word;
   SIGNAL DRMuxout      : LC3b_reg;
   SIGNAL GenCCMuxout   : LC3b_word;
   SIGNAL GenCCout      : LC3b_cc;
   SIGNAL IMMMuxout     : LC3b_word;
   SIGNAL Imm5out       : LC3b_word;
   SIGNAL MARMuxout     : LC3b_word;
   SIGNAL MDRMux2out    : LC3b_word;
   SIGNAL MDRMuxout     : LC3b_word;
   SIGNAL MDRout        : LC3b_word;
   SIGNAL PCMuxout      : LC3b_word;
   SIGNAL PCPlus2out    : LC3b_word;
   SIGNAL PCout         : LC3b_word;
   SIGNAL R7_sig        : LC3b_reg;
   SIGNAL RFAout        : LC3b_word;
   SIGNAL RFBout        : LC3b_word;
   SIGNAL RFMux2out     : LC3b_word;
   SIGNAL RFMuxout      : LC3b_word;
   SIGNAL SEXT6out      : LC3b_word;
   SIGNAL SEXT8out      : LC3b_word;
   SIGNAL SelHByteout   : LC3b_word;
   SIGNAL SelLByteout   : LC3b_word;
   SIGNAL SrcA          : LC3b_reg;
   SIGNAL SrcB          : LC3b_reg;
   SIGNAL StoreMuxout   : LC3b_reg;
   SIGNAL bit5          : std_logic;
   SIGNAL dest          : LC3b_reg;
   SIGNAL imm5          : LC3b_imm5;
   SIGNAL index6        : LC3b_index6;
   SIGNAL offset11      : LC3b_offset11;
   SIGNAL offset6Muxout : LC3b_word;
   SIGNAL offset9       : LC3b_offset9;
   SIGNAL trapvect8     : LC3b_trapvect8;

   -- Implicit buffer signal declarations
   SIGNAL ADDRESS_internal : LC3b_word;


   -- Component Declarations
   COMPONENT ADDR0
   PORT (
      ADDRESS   : IN     LC3b_word;
      clk       : IN     std_logic;
      ADDRESS_0 : OUT    std_logic
   );
   END COMPONENT;
   COMPONENT ADJ11
   PORT (
      clk      : IN     std_logic ;
      offset11 : IN     LC3b_offset11 ;
      ADJ11out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ADJ6
   PORT (
      clk     : IN     std_logic ;
      index6  : IN     LC3b_index6 ;
      ADJ6out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ADJ8
   PORT (
      clk       : IN     std_logic ;
      trapvect8 : IN     LC3b_trapvect8 ;
      ADJ8out   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ADJ9
   PORT (
      clk     : IN     std_logic ;
      offset9 : IN     LC3b_offset9 ;
      ADJ9out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ALU
   PORT (
      ALUMuxout : IN     LC3b_word ;
      ALUop     : IN     LC3b_aluop ;
      RFAout    : IN     LC3b_word ;
      clk       : IN     std_logic ;
      ALUout    : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT BRadd
   PORT (
      ADDR2Muxout : IN     LC3b_word ;
      PCout       : IN     LC3b_word ;
      clk         : IN     std_logic ;
      BRAddout    : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ClrHByte
   PORT (
      RFMuxout    : IN     LC3b_word ;
      clk         : IN     std_logic ;
      ClrHByteout : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT ClrLByte
   PORT (
      RFMuxout    : IN     LC3b_word ;
      clk         : IN     std_logic ;
      ClrLByteout : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT GenCC
   PORT (
      clk         : IN     std_logic ;
      GenCCout    : OUT    LC3b_cc ;
      GenCCMuxout : IN     LC3b_word 
   );
   END COMPONENT;
   COMPONENT IR
   PORT (
      LoadIR    : IN     std_logic ;
      MDRout    : IN     LC3b_word ;
      clk       : IN     std_logic ;
      Opcode    : OUT    LC3b_opcode ;
      SrcA      : OUT    LC3b_reg ;
      SrcB      : OUT    LC3b_reg ;
      index6    : OUT    LC3b_index6 ;
      imm5      : OUT    LC3b_imm5 ;
      bit5      : OUT    std_logic ;
      bit11     : OUT    std_logic ;
      offset9   : OUT    LC3b_offset9 ;
      shftop    : OUT    LC3b_shftop ;
      dest      : OUT    LC3b_reg ;
      offset11  : OUT    LC3b_offset11 ;
      trapvect8 : OUT    LC3b_trapvect8 
   );
   END COMPONENT;
   COMPONENT NZP
   PORT (
      GenCCout : IN     LC3b_cc ;
      LoadNZP  : IN     std_logic ;
      clk      : IN     std_logic ;
      n        : OUT    std_logic ;
      p        : OUT    std_logic ;
      z        : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT NZPsplit
   PORT (
      clk    : IN     std_logic ;
      dest   : IN     LC3b_reg ;
      CheckN : OUT    std_logic ;
      CheckP : OUT    std_logic ;
      CheckZ : OUT    std_logic 
   );
   END COMPONENT;
   COMPONENT Plus2
   PORT (
      PCout      : IN     LC3b_word ;
      clk        : IN     std_logic ;
      PCPlus2out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT R7
   PORT (
      clk    : IN     std_logic ;
      R7_sig : OUT    LC3b_reg 
   );
   END COMPONENT;
   COMPONENT Reg16
   PORT (
      Input  : IN     LC3b_word ;
      RESET  : IN     std_logic ;
      clk    : IN     std_logic ;
      load   : IN     std_logic ;
      Output : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT RegFile
   PORT (
      RESET_L     : IN     std_logic ;
      RegWrite    : IN     std_logic ;
      SrcB        : IN     LC3b_reg ;
      StoreMuxout : IN     LC3b_reg ;
      clk         : IN     std_logic ;
      RFBout      : OUT    LC3b_word ;
      RFMux2out   : IN     LC3b_word ;
      RFAout      : OUT    LC3b_word ;
      DRMuxout    : IN     LC3b_reg 
   );
   END COMPONENT;
   COMPONENT RegMux2
   PORT (
      R7_sig   : IN     LC3b_reg ;
      DRMuxSel : IN     std_logic ;
      DRMuxout : OUT    LC3b_reg ;
      clk      : IN     std_logic ;
      dest     : IN     LC3b_reg 
   );
   END COMPONENT;
   COMPONENT SEXT5
   PORT (
      Imm5    : IN     LC3b_imm5 ;
      clk     : IN     std_logic ;
      Imm5out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT SEXT6
   PORT (
      index6   : IN     LC3b_index6 ;
      clk      : IN     std_logic ;
      SEXT6out : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT SEXT8
   PORT (
      RFMux2out : IN     LC3b_word ;
      clk       : IN     std_logic ;
      SEXT8out  : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT SelHByte
   PORT (
      ALUout      : IN     LC3b_word ;
      clk         : IN     std_logic ;
      SelHByteout : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT SelLByte
   PORT (
      ALUout      : IN     LC3b_word ;
      clk         : IN     std_logic ;
      SelLByteout : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT StoreMux
   PORT (
      SrcA        : IN     LC3b_reg ;
      StoreSR     : IN     std_logic ;
      clk         : IN     std_logic ;
      dest        : IN     LC3b_reg ;
      StoreMuxout : OUT    LC3b_reg 
   );
   END COMPONENT;
   COMPONENT WordMux2
   PORT (
      A   : IN     LC3b_word ;
      B   : IN     LC3b_word ;
      Sel : IN     std_logic ;
      F   : OUT    LC3b_word 
   );
   END COMPONENT;
   COMPONENT WordMux4
   PORT (
      A   : IN     LC3b_word ;
      B   : IN     LC3b_word ;
      C   : IN     LC3b_word ;
      D   : IN     LC3b_word ;
      Sel : IN     LC3b_4mux_sel ;
      F   : OUT    LC3b_word 
   );
   END COMPONENT;

   -- Optional embedded configurations
   -- pragma synthesis_off
   FOR ALL : ADDR0 USE ENTITY ece411.ADDR0;
   FOR ALL : ADJ11 USE ENTITY ece411.ADJ11;
   FOR ALL : ADJ6 USE ENTITY ece411.ADJ6;
   FOR ALL : ADJ8 USE ENTITY ece411.ADJ8;
   FOR ALL : ADJ9 USE ENTITY ece411.ADJ9;
   FOR ALL : ALU USE ENTITY ece411.ALU;
   FOR ALL : BRadd USE ENTITY ece411.BRadd;
   FOR ALL : ClrHByte USE ENTITY ece411.ClrHByte;
   FOR ALL : ClrLByte USE ENTITY ece411.ClrLByte;
   FOR ALL : GenCC USE ENTITY ece411.GenCC;
   FOR ALL : IR USE ENTITY ece411.IR;
   FOR ALL : NZP USE ENTITY ece411.NZP;
   FOR ALL : NZPsplit USE ENTITY ece411.NZPsplit;
   FOR ALL : Plus2 USE ENTITY ece411.Plus2;
   FOR ALL : R7 USE ENTITY ece411.R7;
   FOR ALL : Reg16 USE ENTITY ece411.Reg16;
   FOR ALL : RegFile USE ENTITY ece411.RegFile;
   FOR ALL : RegMux2 USE ENTITY ece411.RegMux2;
   FOR ALL : SEXT5 USE ENTITY ece411.SEXT5;
   FOR ALL : SEXT6 USE ENTITY ece411.SEXT6;
   FOR ALL : SEXT8 USE ENTITY ece411.SEXT8;
   FOR ALL : SelHByte USE ENTITY ece411.SelHByte;
   FOR ALL : SelLByte USE ENTITY ece411.SelLByte;
   FOR ALL : StoreMux USE ENTITY ece411.StoreMux;
   FOR ALL : WordMux2 USE ENTITY ece411.WordMux2;
   FOR ALL : WordMux4 USE ENTITY ece411.WordMux4;
   -- pragma synthesis_on


BEGIN
   -- Architecture concurrent statements
   -- HDL Embedded Text Block 1 eb1
   -- Dataout = MDRout
   DATAOUT <= MDRout;                                       


   -- Instance port mappings.
   aADDR0 : ADDR0
      PORT MAP (
         ADDRESS   => ADDRESS_internal,
         clk       => clk,
         ADDRESS_0 => ADDRESS_0
      );
   aADJ11 : ADJ11
      PORT MAP (
         clk      => clk,
         offset11 => offset11,
         ADJ11out => ADJ11out
      );
   aADJ6 : ADJ6
      PORT MAP (
         clk     => clk,
         index6  => index6,
         ADJ6out => ADJ6out
      );
   aADJ8 : ADJ8
      PORT MAP (
         clk       => clk,
         trapvect8 => trapvect8,
         ADJ8out   => ADJ8out
      );
   aADJ9 : ADJ9
      PORT MAP (
         clk     => clk,
         offset9 => offset9,
         ADJ9out => ADJ9out
      );
   aALU : ALU
      PORT MAP (
         ALUMuxout => ALUMuxout,
         ALUop     => ALUop,
         RFAout    => RFAout,
         clk       => clk,
         ALUout    => ALUout
      );
   aBRadd : BRadd
      PORT MAP (
         ADDR2Muxout => ADDR2Muxout,
         PCout       => PCout,
         clk         => clk,
         BRAddout    => BRAddout
      );
   aClrHByte : ClrHByte
      PORT MAP (
         RFMuxout    => RFMuxout,
         clk         => clk,
         ClrHByteout => ClrHByteout
      );
   aClrLByte : ClrLByte
      PORT MAP (
         RFMuxout    => RFMuxout,
         clk         => clk,
         ClrLByteout => ClrLByteout
      );
   aGenCC : GenCC
      PORT MAP (
         clk         => clk,
         GenCCout    => GenCCout,
         GenCCMuxout => GenCCMuxout
      );
   aIR : IR
      PORT MAP (
         LoadIR    => LoadIR,
         MDRout    => MDRout,
         clk       => clk,
         Opcode    => Opcode,
         SrcA      => SrcA,
         SrcB      => SrcB,
         index6    => index6,
         imm5      => imm5,
         bit5      => bit5,
         bit11     => bit11,
         offset9   => offset9,
         shftop    => shftop,
         dest      => dest,
         offset11  => offset11,
         trapvect8 => trapvect8
      );
   aNZP : NZP
      PORT MAP (
         GenCCout => GenCCout,
         LoadNZP  => LoadNZP,
         clk      => clk,
         n        => n,
         p        => p,
         z        => z
      );
   aNZPsplit : NZPsplit
      PORT MAP (
         clk    => clk,
         dest   => dest,
         CheckN => CheckN,
         CheckP => CheckP,
         CheckZ => CheckZ
      );
   aPlus2 : Plus2
      PORT MAP (
         PCout      => PCout,
         clk        => clk,
         PCPlus2out => PCPlus2out
      );
   aR7 : R7
      PORT MAP (
         clk    => clk,
         R7_sig => R7_sig
      );
   MAR : Reg16
      PORT MAP (
         Input  => MARMuxout,
         RESET  => RESET_L,
         clk    => clk,
         load   => LoadMAR,
         Output => ADDRESS_internal
      );
   MDR : Reg16
      PORT MAP (
         Input  => MDRMuxout,
         RESET  => RESET_L,
         clk    => clk,
         load   => LoadMDR,
         Output => MDRout
      );
   PC : Reg16
      PORT MAP (
         Input  => PCMuxout,
         RESET  => RESET_L,
         clk    => clk,
         load   => LoadPC,
         Output => PCout
      );
   aRegFile : RegFile
      PORT MAP (
         RESET_L     => RESET_L,
         RegWrite    => RegWrite,
         SrcB        => SrcB,
         StoreMuxout => StoreMuxout,
         clk         => clk,
         RFBout      => RFBout,
         RFMux2out   => RFMux2out,
         RFAout      => RFAout,
         DRMuxout    => DRMuxout
      );
   DRMux : RegMux2
      PORT MAP (
         R7_sig   => R7_sig,
         DRMuxSel => DRMuxSel,
         DRMuxout => DRMuxout,
         clk      => clk,
         dest     => dest
      );
   aSEXT5 : SEXT5
      PORT MAP (
         Imm5    => imm5,
         clk     => clk,
         Imm5out => Imm5out
      );
   aSEXT6 : SEXT6
      PORT MAP (
         index6   => index6,
         clk      => clk,
         SEXT6out => SEXT6out
      );
   aSEXT8 : SEXT8
      PORT MAP (
         RFMux2out => RFMux2out,
         clk       => clk,
         SEXT8out  => SEXT8out
      );
   aSelHByte : SelHByte
      PORT MAP (
         ALUout      => ALUout,
         clk         => clk,
         SelHByteout => SelHByteout
      );
   aSelLByte : SelLByte
      PORT MAP (
         ALUout      => ALUout,
         clk         => clk,
         SelLByteout => SelLByteout
      );
   aStoreMux : StoreMux
      PORT MAP (
         SrcA        => SrcA,
         StoreSR     => StoreSR,
         clk         => clk,
         dest        => dest,
         StoreMuxout => StoreMuxout
      );
   ADDR2Mux : WordMux2
      PORT MAP (
         A   => ADJ9out,
         B   => ADJ11out,
         Sel => ADDR2MuxSel,
         F   => ADDR2Muxout
      );
   ALUMux : WordMux2
      PORT MAP (
         A   => IMMMuxout,
         B   => offset6Muxout,
         Sel => ALUMuxSel,
         F   => ALUMuxout
      );
   GenCCMux : WordMux2
      PORT MAP (
         A   => RFMux2out,
         B   => SEXT8out,
         Sel => GenCCMuxSel,
         F   => GenCCMuxout
      );
   IMMMux : WordMux2
      PORT MAP (
         A   => RFBout,
         B   => Imm5out,
         Sel => bit5,
         F   => IMMMuxout
      );
   MDRMux : WordMux2
      PORT MAP (
         A   => DATAIN,
         B   => MDRMux2out,
         Sel => MDRMuxSel,
         F   => MDRMuxout
      );
   offset6Mux : WordMux2
      PORT MAP (
         A   => ADJ6out,
         B   => SEXT6out,
         Sel => offset6MuxSel,
         F   => offset6Muxout
      );
   MDRMux2 : WordMux4
      PORT MAP (
         A   => ALUout,
         B   => SelLByteout,
         C   => SelHByteout,
         D   => D3,
         Sel => MDRMux2Sel,
         F   => MDRMux2out
      );
   MarMux : WordMux4
      PORT MAP (
         A   => PCout,
         B   => ALUout,
         C   => MDRout,
         D   => ADJ8out,
         Sel => MARMuxSel,
         F   => MARMuxout
      );
   PCMux : WordMux4
      PORT MAP (
         A   => PCPlus2out,
         B   => BRAddout,
         C   => RFAout,
         D   => MDRout,
         Sel => PCMuxSel,
         F   => PCMuxout
      );
   RFMux : WordMux4
      PORT MAP (
         A   => MDRout,
         B   => ALUout,
         C   => BRAddout,
         D   => PCout,
         Sel => RFMuxSel,
         F   => RFMuxout
      );
   RFMux2 : WordMux4
      PORT MAP (
         A   => RFMuxout,
         B   => ClrLByteout,
         C   => ClrHByteout,
         D   => D2,
         Sel => RFMux2Sel,
         F   => RFMux2out
      );

   -- Implicit buffered output assignments
   ADDRESS <= ADDRESS_internal;

END struct;
