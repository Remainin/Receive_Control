----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:14:36 10/10/2012 
-- Design Name: 
-- Module Name:    reg8 - Behavioral 
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity reg8 is
port(
	clrn, clk : in std_logic;
	d : in std_logic_vector(7 downto 0);
	q : out std_logic_vector(7 downto 0)
	);

end reg8;

architecture Behavioral of reg8 is

begin
process(clk, clrn)
	begin
		if clrn = '0' then
			q <= "00000000";
		elsif clk = '1' and clk'event then 
			q <= d;
		end if;
	end process;


end Behavioral;

