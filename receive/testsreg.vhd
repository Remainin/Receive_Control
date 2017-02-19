--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:38:44 07/03/2014
-- Design Name:   
-- Module Name:   E:/xilink/5/receive/testsreg.vhd
-- Project Name:  receive
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sreg
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
 
ENTITY testsreg IS
END testsreg;
 
ARCHITECTURE behavior OF testsreg IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sreg
    PORT(
         clk : IN  std_logic;
         clrn : IN  std_logic;
         serial : IN  std_logic;
         q : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal clrn : std_logic := '0';
   signal serial : std_logic := '0';

 	--Outputs
   signal q : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sreg PORT MAP (
          clk => clk,
          clrn => clrn,
          serial => serial,
          q => q
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      clrn<='0';
		serial<='1';
		wait for 10 ns;
		clrn<='1';
      serial<='1';
		wait for 40 ns;
		clrn<='1';
      serial<='0';
		wait for 40 ns;
      -- insert stimulus here 

      wait;
   end process;

END;
