LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY pir_controller IS
    PORT (
        clk      : IN STD_LOGIC;
        rst      : IN STD_LOGIC;
        pir_in   : IN STD_LOGIC;
        pir_tick : OUT STD_LOGIC
    );
END pir_controller;

ARCHITECTURE behavior OF pir_controller IS
    SIGNAL sync_1, sync_2, sync_3 : STD_LOGIC;
BEGIN
    PROCESS(clk)
    BEGIN
        IF rising_edge(clk) THEN
        IF rst = '1' THEN
                -- Reset seguro
                sync_1 <= '0';
                sync_2 <= '0';
                sync_3 <= '0';
                ELSE
                -- Sincronizador de 2 etapas para evitar metaestabilidad
                sync_1 <= pir_in;
                sync_2 <= sync_1;
        
        ELSE
                -- Sincronizador de 2 etapas para evitar metaestabilidad
                sync_1 <= pir_in;
                sync_2 <= sync_1