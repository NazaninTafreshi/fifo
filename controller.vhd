----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:21:59 12/05/2016 
-- Design Name: 
-- Module Name:    controller - Behavioral 
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

entity controller is
  Port ( wr_rd : in  STD_LOGIC;
           clk_wr : in  STD_LOGIC;
           clk_rd : in  STD_LOGIC;
           addr : out  integer range 0 to 31;
           full : inout  STD_LOGIC;
           empty : inout  STD_LOGIC;
			  clk:out  STD_LOGIC);
end controller;

architecture Behavioral of controller is
signal wr_address:integer range 0 to 31:=0;
signal rd_address:integer range 0 to 31:=0;
begin
process(clk_wr,clk_rd)

variable full_s:std_logic:='0';
variable empty_s:std_logic:='1';
variable count:integer range 0 to 32:=0;


begin

if(count=0) then empty_s:='1';
else empty_s:='0';
end if;  

if(count=32) then full_s:='1';
else full_s:='0';
end if; 

if(clk_wr' event and clk_wr='1') then
  if(wr_rd='1' and full_s='0') then 
  wr_address<=wr_address+1;
  count:=count+1;
  end if;
  
end if; 
 
if(clk_rd' event and clk_rd='1') then
  if(wr_rd='0' and empty_s='0') then 
  rd_address<=rd_address+1; 
  count:=count-1;  
  end if;
 
end if;
full<=full_s;
empty<=empty_s;
end process;


clk<=clk_wr when wr_rd='1' else clk_rd when wr_rd<='0' ; 
addr<=(wr_address rem 32) when (wr_rd<='1' and full='0') else
(rd_address rem 32) when (wr_rd<='0' and empty='0');
end Behavioral;

