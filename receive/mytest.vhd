--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   21:44:53 07/02/2014
-- Design Name:   
-- Module Name:   E:/xilink/5/receive/mytest.vhd
-- Project Name:  receive
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: receive
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
 
ENTITY mytest IS
END mytest;
 
ARCHITECTURE behavior OF mytest IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT receive
    PORT(
         serialdata : IN  std_logic;
         clk : IN  std_logic;
         csn : IN  std_logic;
         wrn : IN  std_logic;
         rdn : IN  std_logic;
         addr : IN  std_logic_vector(1 downto 0);
         data : INOUT  std_logic_vector(7 downto 0);
         intn : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal serialdata : std_logic := '0';
   signal clk : std_logic := '0';
   signal csn : std_logic := '0';
   signal wrn : std_logic := '0';
   signal rdn : std_logic := '0';
   signal addr : std_logic_vector(1 downto 0) := (others => '0');

	--BiDirs
   signal data : std_logic_vector(7 downto 0);

 	--Outputs
   signal intn : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: receive PORT MAP (
          serialdata => serialdata,
          clk => clk,
          csn => csn,
          wrn => wrn,
          rdn => rdn,
          addr => addr,
          data => data,
          intn => intn
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
		serialdata<='1';
           csn <='0';
           wrn <='1';
           rdn <='0';
           addr<="01";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='0';
           wrn <='0';
           rdn <='1';
           addr<="01";
			  wait for 10 ns; 
			  serialdata<='1';
           csn <='1';
           wrn <='0';
           rdn <='1';
           addr<="10";
			  wait for 10 ns; 
			  serialdata<='1';
           csn <='0';
           wrn <='0';
           rdn <='1';
           addr<="10";
			  wait for 10 ns; 
			  serialdata<='1';
           csn <='1';
           wrn <='0';
           rdn <='1';
           addr<="11";
			  wait for 10 ns; 
			  serialdata<='1';
           csn <='0';
           wrn <='0';
           rdn <='1';
           addr<="11";
			  wait for 10 ns; --复位初始
           serialdata<='0';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='0';
           csn <='0';
           wrn <='1';
           rdn <='0';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='0';
           wrn <='1';
           rdn <='0';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='0';
           wrn <='1';
           rdn <='0';
           addr<="01";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='0';
           wrn <='0';
           rdn <='1';
           addr<="01";
			  wait for 10 ns; 
			  serialdata<='1';
           csn <='1';
           wrn <='0';
           rdn <='1';
           addr<="10";
			  wait for 10 ns; 
			  serialdata<='1';
           csn <='0';
           wrn <='0';
           rdn <='1';
           addr<="10";
			  wait for 10 ns; 
			  serialdata<='1';
           csn <='1';
           wrn <='0';
           rdn <='1';
           addr<="11";
			  wait for 10 ns; 
			  serialdata<='1';
           csn <='0';
           wrn <='0';
           rdn <='1';
           addr<="11";
			  wait for 10 ns; --正常结束
			  serialdata<='0';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='0';
           wrn <='1';
           rdn <='0';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='0';
           wrn <='1';
           rdn <='0';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='0';
           wrn <='1';
           rdn <='0';
           addr<="01";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='0';
           wrn <='0';
           rdn <='1';
           addr<="01";
			  wait for 10 ns; 
			  serialdata<='1';
           csn <='1';
           wrn <='0';
           rdn <='1';
           addr<="10";
			  wait for 10 ns; 
			  serialdata<='1';
           csn <='0';
           wrn <='0';
           rdn <='1';
           addr<="10";
			  wait for 10 ns; 
			  serialdata<='1';
           csn <='1';
           wrn <='0';
           rdn <='1';
           addr<="11";
			  wait for 10 ns; 
			  serialdata<='1';
           csn <='0';
           wrn <='0';
           rdn <='1';
           addr<="11";
			  wait for 10 ns;--奇偶检验
			  serialdata<='0';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='0';
           csn <='0';
           wrn <='1';
           rdn <='0';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='0';
           wrn <='1';
           rdn <='0';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='1';
           wrn <='1';
           rdn <='1';
           addr<="00";
			  wait for 10 ns;
			  serialdata<='0';
			  wait for 10 ns;
			  serialdata<='1';
           csn <='0';
           wrn <='1';
           rdn <='0';
           addr<="01";
			  wait for 10 ns;
			  serialdata<='1';
           csn <='0';
           wrn <='0';
           rdn <='1';
           addr<="01";
			  wait for 10 ns; 
			  serialdata<='1';
           csn <='1';
           wrn <='0';
           rdn <='1';
           addr<="10";
			  wait for 10 ns; 
			  serialdata<='1';
           csn <='0';
           wrn <='0';
           rdn <='1';
           addr<="10";
			  wait for 10 ns; 
			  serialdata<='1';
           csn <='1';
           wrn <='0';
           rdn <='1';
           addr<="11";
			  wait for 10 ns; 
			  serialdata<='1';
           csn <='0';
           wrn <='0';
           rdn <='1';
           addr<="11";
			  wait for 10 ns;--溢出
      -- insert stimulus here 
      wait;
   end process;

END;
