LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.pkg_system.ALL; -- Importamos nuestras constantes del Paso 1

ENTITY control_unit IS
    PORT (
        clk         : IN STD_LOGIC;
        rst         : IN STD_LOGIC;
        pir_event   : IN STD_LOGIC; 
        rom_read    : OUT STD_LOGIC;
        ram_we      : OUT STD_LOGIC;
        addr_out    : OUT STD_LOGIC_VECTOR(ADDR_WIDTH-1 DOWNTO 0)
    );
END control_unit;

