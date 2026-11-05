LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.pkg_system.ALL;

ENTITY tb_system_top IS
END tb_system_top;

ARCHITECTURE behavior OF tb_system_top IS
    SIGNAL clk      : STD_LOGIC := '0';
    SIGNAL rst      : STD_LOGIC := '0';
    SIGNAL pir_in   : STD_LOGIC := '0';
    SIGNAL data_out : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
BEGIN