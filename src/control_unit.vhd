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

ARCHITECTURE behavior OF control_unit IS
   
    TYPE STATES IS (IDLE, READ_ROM, WRITE_RAM, INC_ADDR);
    SIGNAL state_reg, state_next : STATES;
    
  
    SIGNAL addr_reg, addr_next : UNSIGNED(ADDR_WIDTH-1 DOWNTO 0);
BEGIN

    PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
            IF rst = '1' THEN
               
                state_reg <= IDLE;
                addr_reg <= (OTHERS => '0');
            ELSE
                state_reg <= state_next;
                addr_reg <= addr_next;
            END IF;
        END IF;
    END PROCESS;

   
    PROCESS(state_reg, addr_reg, pir_event)
    BEGIN

        state_next <= state_reg;
        addr_next <= addr_reg;
        rom_read <= '0';
        ram_we <= '0';

        CASE state_reg IS
            WHEN IDLE =>
                IF pir_event = '1' THEN
                    state_next <= READ_ROM;
                END IF;
            
            WHEN READ_ROM =>
                rom_read <= '1'; 
                state_next <= WRITE_RAM;
                
            WHEN WRITE_RAM =>
                rom_read <= '1'; 
                ram_we <= '1';   
                state_next <= INC_ADDR;
                
            WHEN INC_ADDR =>
                addr_next <= addr_reg + 1; 
                state_next <= IDLE;
        END CASE;
    END PROCESS;
    
   
    addr_out <= STD_LOGIC_VECTOR(addr_reg);
END behavior;