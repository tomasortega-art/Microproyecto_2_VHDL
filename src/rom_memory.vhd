LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;
USE work.pkg_system.ALL; 

ENTITY rom_memory IS
    PORT (
        clk      : IN STD_LOGIC;
        read_en  : IN STD_LOGIC;
        addr     : IN STD_LOGIC_VECTOR(ADDR_WIDTH-1 DOWNTO 0);
        data_out : OUT STD_LOGIC_VECTOR(DATA_WIDTH-1 DOWNTO 0)
    );
END rom_memory;

ARCHITECTURE behavior OF rom_memory IS
   
    CONSTANT rom_data : memory_array := (
        x"A1", x"B2", x"C3", x"D4", x"E5", x"F6", x"17", x"28",
        x"39", x"4A", x"5B", x"6C", x"7D", x"8E", x"9F", x"00"
    );
BEGIN
    PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF read_en = '1' THEN
              
                data_out <= rom_data(to_integer(unsigned(addr)));
            END IF;
        END IF;
    END PROCESS;
END behavior;