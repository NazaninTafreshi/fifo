----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:21:34 12/05/2016 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
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

entity RAM is
Port( din : in std_logic_vector(7 downto 0) ;
		addr: in  integer range 0 to 31 ;
     wr_rd, clk: in std_logic;
	  dout : out std_logic_vector (7 downto 0)); 
end RAM;
architecture behavioral  of RAM  is
type memory is array (0 to 31) of std_logic_vector (7 downto 0) ;
signal RAM: memory;
Begin 
process(clk) 
begin 
if(clk 'event and clk='1')  then
 --if en ='1' then 
   if wr_rd='1' then RAM(addr)<=din ;
   else   dout<=RAM(addr);
   end if; 
 --end if ; 
end if ;
end process;
end behavioral;

