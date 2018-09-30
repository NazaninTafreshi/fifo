--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   
-- Design Name:   
-- Module Name:   G:/fpgaWorkSpace/fifo_scnd/test.vhd
-- Project Name:  
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: main
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test IS
END test;
 
ARCHITECTURE behavior OF test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT main
    PORT(dataIn:in std_logic_vector(7 downto 0);
    dataOut:out std_logic_vector(7 downto 0);
	 wr_rd,clk_rd,clk_wr:in std_logic;
	 full,empty:inout std_logic);
    END COMPONENT;
    

   --Inputs
   signal clk_rd : std_logic := '0';
   signal clk_wr : std_logic := '0';
   signal wr_rd : std_logic := '0';
	signal full: std_logic:='0';
	signal empty:std_logic:='0';
   signal dataIn : std_logic_vector(7 downto 0) := (others => '0');

 	--Outputs
   signal dataOut : std_logic_vector(7 downto 0);

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: main PORT MAP (
          dataIn => dataIn,
          dataOut => dataOut,
          wr_rd => wr_rd,
			 clk_rd=>clk_rd,
			 clk_wr=>clk_wr,
          full => full,
          empty => empty
        );


clk_wr<=not clk_wr after 20 ns;
  clk_rd<=not clk_rd after 50 ns;
  dataIn<="00000101" after 20ns,"10000000" after 50ns,"11111000" after 100 ns,"10011000" after 140 ns,"10001000" after 180 ns;
  wr_rd<='1' after 20ns,'0' after 50 ns,'1' after 60ns,'0' after 80 ns,'1' after 100 ns,'0' after 120 ns,'1' after 140 ns,'0' after 200 ns;
  end;