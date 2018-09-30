----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:22:13 12/05/2016 
-- Design Name: 
-- Module Name:    main - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;

use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_arith.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity main is
port(dataIn:in std_logic_vector(7 downto 0);
    dataOut:out std_logic_vector(7 downto 0);
	 wr_rd,clk_rd,clk_wr:in std_logic;
	 full,empty:inout std_logic);
     
end main;

architecture structural of main is

component RAM
		Port( din : in std_logic_vector(7 downto 0) ;
		addr: in integer range 0 to 31 ;
     wr_rd, clk: in std_logic;
	  dout : out std_logic_vector (7 downto 0)); 
end component;

component controller
Port ( wr_rd : in  STD_LOGIC;
           clk_wr : in  STD_LOGIC;
           clk_rd : in  STD_LOGIC;
           addr : out  integer range 0 to 31;
           full : inout  STD_LOGIC;
           empty : inout  STD_LOGIC;
			  clk:out  STD_LOGIC);
end component;

signal  clkC: std_logic;
signal addrC :integer range 0 to 31;
begin
r: RAM 
port map(dataIn,addrC,wr_rd,clkC,dataOut);
c: controller
port map(wr_rd,clk_wr,clk_rd,addrC,full,empty,clkC);

end structural;

