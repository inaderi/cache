library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity DataArray is
  generic (size : integer := 64);
  port (
	clk : in std_logic,
	address : in std_logic_vector(5 downto 0),
	wren : in std_logic,
	wrdata : in std_logic_vector(15 downto 0),
	data : out std_logic_vector(15 downto 0)
  ) ;
end entity ; -- DataArray

architecture arch of DataArray is

	type mem is array ( 0 to size - 1 ) of std_logic_vector(15 downto 0);

begin
	identifier : process( clk )

	variable arr : mem := (others => (others => '0'));
	variable idx : integer;

	begin
		if clk'event and clk = '1' then
			idx := to_integr(unsigned(address));
			if wren = '1' then
				arr(idx) := wrdata;
			else
				data <= arr(idx);				
			end if ;
		end if ;
		
	end process ; -- identifier


end architecture ; -- arch