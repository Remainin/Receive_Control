--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : ISE
--  /   /         Filename : waveOfcount4.vhw
-- /___/   /\     Timestamp : Fri Oct 12 18:43:02 2012
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: waveOfcount4
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY waveOfcount4 IS
END waveOfcount4;

ARCHITECTURE testbench_arch OF waveOfcount4 IS
    COMPONENT count4
        PORT (
            clk : In std_logic;
            clrn : In std_logic;
            q : Out std_logic_vector (3 DownTo 0)
        );
    END COMPONENT;

    SIGNAL clk : std_logic := '0';
    SIGNAL clrn : std_logic := '0';
    SIGNAL q : std_logic_vector (3 DownTo 0) := "0000";

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : count4
        PORT MAP (
            clk => clk,
            clrn => clrn,
            q => q
        );

        PROCESS    -- clock process for clk
        BEGIN
            WAIT for OFFSET;
            CLOCK_LOOP : LOOP
                clk <= '0';
                WAIT FOR (PERIOD - (PERIOD * DUTY_CYCLE));
                clk <= '1';
                WAIT FOR (PERIOD * DUTY_CYCLE);
            END LOOP CLOCK_LOOP;
        END PROCESS;

        PROCESS
            BEGIN
                -- -------------  Current Time:  385ns
                WAIT FOR 385 ns;
                clrn <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  985ns
                WAIT FOR 600 ns;
                clrn <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  1785ns
                WAIT FOR 800 ns;
                clrn <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  6185ns
                WAIT FOR 4400 ns;
                clrn <= '0';
                -- -------------------------------------
                WAIT FOR 4015 ns;

            END PROCESS;

    END testbench_arch;

