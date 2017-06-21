library ieee;
use ieee.std_logic_1164.all;

entity Cache is
  port (
	clk  : in std_logic,
	Address : in std_logic_vector(9 downto 0),
	Data: out std_logic_vector(31 downto 0),
	hit : out std_logic
  ) ;
end entity ; -- Cache

architecture arch of Cache is



begin



end architecture ; -- arch