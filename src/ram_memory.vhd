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

ARCHITECTURE behavior OF ram_memory IS
  
    SIGNAL ram_block : memory_array := (OTHERS => (OTHERS => '0'));
BEGIN
 
    PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF we = '1' THEN
                ram_block(to_integer(unsigned(addr))) <= data_in;
            END IF;
        END IF;
    END PROCESS;


    data_out <= ram_block(to_integer(unsigned(addr)));
END behavior;