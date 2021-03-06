--------------------------------------------------------------------------------
-- Copyright (c) 1995-2003 Xilinx, Inc.
-- All Right Reserved.
--------------------------------------------------------------------------------
--   ____  ____ 
--  /   /\/   / 
-- /___/  \  /    Vendor: Xilinx 
-- \   \   \/     Version : 9.1i
--  \   \         Application : ISE
--  /   /         Filename : waveOfctrl.vhw
-- /___/   /\     Timestamp : Wed Oct 17 14:10:38 2012
-- \   \  /  \ 
--  \___\/\___\ 
--
--Command: 
--Design Name: waveOfctrl
--Device: Xilinx
--

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_TEXTIO.ALL;
USE STD.TEXTIO.ALL;

ENTITY waveOfctrl IS
END waveOfctrl;

ARCHITECTURE testbench_arch OF waveOfctrl IS
    COMPONENT ctrl
        PORT (
            d9 : In std_logic;
            d11 : In std_logic;
            sq7 : In std_logic;
            sq6 : In std_logic;
            rq : In std_logic_vector (7 DownTo 0);
            clrn : InOut std_logic;
            start : Out std_logic;
            serial : In std_logic;
            clk : In std_logic;
            csn : In std_logic;
            wrn : In std_logic;
            rdn : In std_logic;
            addr : In std_logic_vector (1 DownTo 0);
            data : InOut std_logic_vector (7 DownTo 0);
            intn : Out std_logic
        );
    END COMPONENT;

    SIGNAL d9 : std_logic := '0';
    SIGNAL d11 : std_logic := '1';
    SIGNAL sq7 : std_logic := '0';
    SIGNAL sq6 : std_logic := '0';
    SIGNAL rq : std_logic_vector (7 DownTo 0) := "11000000";
    SIGNAL clrn : std_logic := 'Z';
    SIGNAL start : std_logic := '0';
    SIGNAL serial : std_logic := '1';
    SIGNAL clk : std_logic := '0';
    SIGNAL csn : std_logic := '1';
    SIGNAL wrn : std_logic := '0';
    SIGNAL rdn : std_logic := '1';
    SIGNAL addr : std_logic_vector (1 DownTo 0) := "00";
    SIGNAL data : std_logic_vector (7 DownTo 0) := "ZZZZZZZZ";
    SIGNAL intn : std_logic := '0';

    constant PERIOD : time := 200 ns;
    constant DUTY_CYCLE : real := 0.5;
    constant OFFSET : time := 0 ns;

    BEGIN
        UUT : ctrl
        PORT MAP (
            d9 => d9,
            d11 => d11,
            sq7 => sq7,
            sq6 => sq6,
            rq => rq,
            clrn => clrn,
            start => start,
            serial => serial,
            clk => clk,
            csn => csn,
            wrn => wrn,
            rdn => rdn,
            addr => addr,
            data => data,
            intn => intn
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
                -- -------------  Current Time:  85ns
                WAIT FOR 85 ns;
                d9 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  285ns
                WAIT FOR 200 ns;
                csn <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  485ns
                WAIT FOR 200 ns;
                csn <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  685ns
                WAIT FOR 200 ns;
                csn <= '0';
                addr <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  885ns
                WAIT FOR 200 ns;
                csn <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  1085ns
                WAIT FOR 200 ns;
                csn <= '0';
                addr <= "10";
                -- -------------------------------------
                -- -------------  Current Time:  1285ns
                WAIT FOR 200 ns;
                csn <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  1485ns
                WAIT FOR 200 ns;
                csn <= '0';
                addr <= "11";
                -- -------------------------------------
                -- -------------  Current Time:  1685ns
                WAIT FOR 200 ns;
                csn <= '1';
                wrn <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  1885ns
                WAIT FOR 200 ns;
                serial <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  3285ns
                WAIT FOR 1400 ns;
                serial <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  3685ns
                WAIT FOR 400 ns;
                d9 <= '0';
                sq7 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  3885ns
                WAIT FOR 200 ns;
                d9 <= '1';
                sq7 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  4085ns
                WAIT FOR 200 ns;
                d11 <= '0';
                sq7 <= '1';
                sq6 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  4285ns
                WAIT FOR 200 ns;
                d11 <= '1';
                sq7 <= '0';
                sq6 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  4885ns
                WAIT FOR 600 ns;
                csn <= '0';
                rdn <= '0';
                addr <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  5085ns
                WAIT FOR 200 ns;
                csn <= '1';
                rdn <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  5485ns
                WAIT FOR 400 ns;
                csn <= '0';
                wrn <= '0';
                addr <= "10";
                -- -------------------------------------
                -- -------------  Current Time:  5685ns
                WAIT FOR 200 ns;
                csn <= '1';
                wrn <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  5885ns
                WAIT FOR 200 ns;
                csn <= '0';
                wrn <= '0';
                addr <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  6085ns
                WAIT FOR 200 ns;
                csn <= '1';
                wrn <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  6285ns
                WAIT FOR 200 ns;
                csn <= '0';
                rdn <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  6485ns
                WAIT FOR 200 ns;
                csn <= '1';
                rdn <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  7085ns
                WAIT FOR 600 ns;
                serial <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  8485ns
                WAIT FOR 1400 ns;
                serial <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  8885ns
                WAIT FOR 400 ns;
                d9 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  9085ns
                WAIT FOR 200 ns;
                d9 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  9285ns
                WAIT FOR 200 ns;
                d11 <= '0';
                sq7 <= '1';
                sq6 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  9485ns
                WAIT FOR 200 ns;
                d11 <= '1';
                sq7 <= '0';
                sq6 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  9685ns
                WAIT FOR 200 ns;
                csn <= '0';
                rdn <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  9885ns
                WAIT FOR 200 ns;
                csn <= '1';
                rdn <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  10085ns
                WAIT FOR 200 ns;
                csn <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  10285ns
                WAIT FOR 200 ns;
                csn <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  10485ns
                WAIT FOR 200 ns;
                csn <= '0';
                rdn <= '0';
                addr <= "00";
                -- -------------------------------------
                -- -------------  Current Time:  10685ns
                WAIT FOR 200 ns;
                csn <= '1';
                rdn <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  10885ns
                WAIT FOR 200 ns;
                csn <= '0';
                wrn <= '0';
                addr <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  11085ns
                WAIT FOR 200 ns;
                csn <= '1';
                wrn <= '1';
                addr <= "00";
                -- -------------------------------------
                -- -------------  Current Time:  11485ns
                WAIT FOR 400 ns;
                serial <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  12885ns
                WAIT FOR 1400 ns;
                serial <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  13285ns
                WAIT FOR 400 ns;
                d9 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  13485ns
                WAIT FOR 200 ns;
                d9 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  13685ns
                WAIT FOR 200 ns;
                d11 <= '0';
                sq7 <= '1';
                sq6 <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  13885ns
                WAIT FOR 200 ns;
                d11 <= '1';
                sq7 <= '0';
                sq6 <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  14085ns
                WAIT FOR 200 ns;
                addr <= "01";
                -- -------------------------------------
                -- -------------  Current Time:  14285ns
                WAIT FOR 200 ns;
                csn <= '0';
                rdn <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  14485ns
                WAIT FOR 200 ns;
                csn <= '1';
                rdn <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  14685ns
                WAIT FOR 200 ns;
                serial <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  14885ns
                WAIT FOR 200 ns;
                serial <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  15085ns
                WAIT FOR 200 ns;
                csn <= '0';
                rdn <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  15285ns
                WAIT FOR 200 ns;
                csn <= '1';
                rdn <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  15485ns
                WAIT FOR 200 ns;
                csn <= '0';
                wrn <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  15685ns
                WAIT FOR 200 ns;
                csn <= '1';
                wrn <= '1';
                -- -------------------------------------
                -- -------------  Current Time:  15885ns
                WAIT FOR 200 ns;
                csn <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  16085ns
                WAIT FOR 200 ns;
                csn <= '1';
                wrn <= '0';
                -- -------------------------------------
                -- -------------  Current Time:  16285ns
                WAIT FOR 200 ns;
                csn <= '0';
                wrn <= '1';
                addr <= "11";
                -- -------------------------------------
                -- -------------  Current Time:  16485ns
                WAIT FOR 200 ns;
                csn <= '1';
                -- -------------------------------------
                WAIT FOR 3715 ns;

            END PROCESS;

    END testbench_arch;

