----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    16:14:30 07/08/2016 
-- Design Name: 
-- Module Name:    decode4 - Behavioral 
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
library ieee;
use ieee.std_logic_1164.all;

entity decode4 is
port(
	d : in std_logic_vector(3 downto 0);
	enable : in std_logic;
	q8, q9, q11 : out std_logic
	);
end decode4 ;

architecture main of decode4 is
begin
	process( enable, d )
	begin
		if enable = '1' then
			case d is
				when "1000" =>  q8 <= '0'; q9 <= '1'; q11 <= '1';
				when "1001" =>  q8 <= '1'; q9 <= '0'; q11 <= '1';
				when "1011" =>  q8 <= '1'; q9 <= '1'; q11 <= '0';
				when others =>	q8 <= '1'; q9 <= '1'; q11 <= '1';
			end case;
		else
			q8 <= '1'; q9 <= '1'; q11 <= '1';
		end if;
	end process;
end main;

