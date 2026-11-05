LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE work.pkg_system.ALL;

ENTITY system_top IS
    PORT (
        clk      : IN STD_LOGIC;
        rst      : IN STD_LOGIC;
        pir_in   : IN STD_LOGIC;
        data_out : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0)
    );
END system_top;

ARCHITECTURE structural OF system_top IS

    -- Señales internas ("cables") para interconectar los submódulos
    SIGNAL sig_pir_tick : STD_LOGIC;
    SIGNAL sig_rom_read : STD_LOGIC;
    SIGNAL sig_ram_we   : STD_LOGIC;
    SIGNAL sig_addr_bus : STD_LOGIC_VECTOR(ADDR_WIDTH-1 DOWNTO 0);
    SIGNAL sig_rom_data : STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0);
