--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:15:16 07/08/2016
-- Design Name:   
-- Module Name:   D:/ISE/decode4/test.vhd
-- Project Name:  decode4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decode4
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
 
    COMPONENT decode4
    PORT(
         d : IN  std_logic_vector(3 downto 0);
         enable : IN  std_logic;
         q8 : OUT  std_logic;
         q9 : OUT  std_logic;
         q11 : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal d : std_logic_vector(3 downto 0) := (others => '0');
   signal enable : std_logic := '0';

 	--Outputs
   signal q8 : std_logic;
   signal q9 : std_logic;
   signal q11 : std_logic;
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decode4 PORT MAP (
          d => d,
          enable => enable,
          q8 => q8,
          q9 => q9,
          q11 => q11
        );

   -- Clock process definitions
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      enable <= '1';
		d <= "1000";
		wait for 10 ns;
		enable <= '1';
		d <= "1001";
		wait for 10 ns;
		enable <= '1';
		d <= "1011";
		wait for 10 ns;
		enable <= '0';
		wait for 10 ns;

 

      -- insert stimulus here 

      wait;
   end process;

END;
