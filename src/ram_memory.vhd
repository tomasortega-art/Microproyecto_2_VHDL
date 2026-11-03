LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.pkg_system.ALL;

ENTITY ram_memory IS
    PORT (
        clk      : IN STD_LOGIC;
        we       : IN STD_LOGIC; -- Write Enable
        addr     : IN STD_LOGIC_VECTOR(ADDR_WIDTH-1 DOWNTO 0);
        data_in  : IN STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
        data_out : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0)
    );
END ram_memory;
