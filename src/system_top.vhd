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

BEGIN


    U_PIR: ENTITY work.pir_controller
        PORT MAP (
            clk      => clk,
            rst      => rst,
            pir_in   => pir_in,
            pir_tick => sig_pir_tick
        );


    U_FSM: ENTITY work.control_unit
        PORT MAP (
            clk         => clk,
            rst         => rst,
            pir_event   => sig_pir_tick,
            rom_read    => sig_rom_read,
            ram_we      => sig_ram_we,
            addr_out    => sig_addr_bus
        );


    U_ROM: ENTITY work.rom_memory
        PORT MAP (
            clk      => clk,
            read_en  => sig_rom_read,
            addr     => sig_addr_bus,
            data_out => sig_rom_data
        );


    U_RAM: ENTITY work.ram_memory
        PORT MAP (
            clk      => clk,
            we       => sig_ram_we,
            addr     => sig_addr_bus,
            data_in  => sig_rom_data,
            data_out => data_out -- Va directo a la salida de la FPGA (displays)
        );

END structural;