library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

package pkg_system is

constant DATA_WIDTH : integer := 8;
constant ADDR_WIDTH : integer := 4;
type memory_array is array (0 to (2**ADDR_WIDTH)-1) of std_logic_vector(DATA_WIDTH-1 downto 0);
