----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    17:55:53 10/12/2012 
-- Design Name: 
-- Module Name:    receive - Behavioral 
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

entity receive is
    Port ( serialdata : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           csn : in  STD_LOGIC;
           wrn : in  STD_LOGIC;
           rdn : in  STD_LOGIC;
           addr : in  STD_LOGIC_VECTOR (1 downto 0);
           data : inout  STD_LOGIC_VECTOR (7 downto 0);
           intn : out  STD_LOGIC);
end receive;

architecture Behavioral of receive is
	component ctrl is
	port(d9,d11 : in std_logic;
		  sq7,sq6: in std_logic;
		  rq		: in std_logic_vector(7 downto 0);  
		  clrn   : inout std_logic;
		  start  : out std_logic;
		  serial,clk: in std_logic;
		  csn,wrn,rdn : in std_logic;
		  addr   : in std_logic_vector(1 downto 0);
		  data   : inout std_logic_vector(7 downto 0);
		  intn   : out std_logic
		  );
	end component;
	component decode4 is
	port(d: in std_logic_vector(3 downto 0);
		  enable: in std_logic;
		  q8,q9,q11 : out std_logic
		  );
	end component;
	component reg8 is 
	port(clrn,clk: in std_logic;
		  d		: in std_logic_vector(7 downto 0);
		  q: out std_logic_vector(7 downto 0)
		  );
	end component;
	component sreg is
	port(
			clk,clrn,serial:in std_logic;
			q: out std_logic_vector(7 downto 0)
			);
	end component;
	component count4 is
	port(
			clk: in std_logic;
			clrn: in std_logic;
			q : out std_logic_vector(3 downto 0)
			);
	end component;
	signal c : std_logic_vector(3 downto 0);
	signal start,t8,t9,t11,clrn: std_logic;
	signal tdata,treg: std_logic_vector(7 downto 0);
begin
	u1: count4 port map(clk=>clk,clrn=>start,q=>c);
	u2: sreg port map(clk=>clk,clrn=>start,serial=>serialdata,q=>treg);
	u3: reg8 port map(clrn=>clrn,clk=>t8,d=>treg,q=>tdata);
	u4: decode4 port map(d=>c,enable=>start,q8=>t8,q9=>t9,q11=>t11);
	u5: ctrl port map(d9=>t9,d11=>t11,sq6=>treg(6),sq7=>treg(7),rq=>tdata,clrn=>clrn,
					start=>start,serial=>serialdata,clk=>clk,csn=>csn,wrn=>wrn,rdn=>rdn,
					addr=>addr,data=>data,intn=>intn);

end Behavioral;

