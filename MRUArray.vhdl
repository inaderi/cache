library ieee;
use ieee.std_logic_1164.all;

entity MRUArray is
  port (
	clk : in std_logic,
	address : in std_logic_vector(5 downto 0),
	replacedWay : in std_logic,
	useType : in std_logic_vector(2 downto 0),
	way : out std_logic :='0'
  ) ;
end entity ; -- MRUArray

architecture arch of MRUArray is
	
	type mem is array ( 0 to size - 1 ) of std_logic;


begin
	identifier : process( clk )

	variable recentWay : mem := (others => '0');
	variable idx : integer;

	begin
		if clk'event and clk = '1' then
			idx := to_integr(unsigned(address));
			if useType = '1' then
				recentWay (idx) := replacedWay;
			end if ;
			way <= recentWay(idx); 
		end if ;
		
	end process ; -- identifier



end architecture ; -- arch