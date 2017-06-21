library ieee;
use ieee.std_logic_1164.all;


entity TagValidArray is
  generic (size : integer := 64);
  generic (valid : integer := 4);
  --generic (size : integer := 64);
  
  port (
	clk : in std_logic,
	reset_n : in std_logic,
	address : in std_logic_vector(5 downto 0),
	wren : in std_logic,
	invalidate : in std_logic,
	wrdata : in std_logic_vector(3 downto 0),
	output : out std_logic_vector(4 downto 0)
  ) ;
end entity ; -- TagValidArray

architecture arch of TagValidArray is

	type mem is array ( 0 to size - 1 ) of std_logic_vector(4 downto 0);


begin

	identifier : process( clk )

	variable arr : mem := (others => (others => '0'));
	variable idx : integer;

	begin
		if clk'event and clk = '1' then
			idx := to_integr(unsigned(address));
			if invalidate = '1' then
				arr(idx) (valid) := '0';
			elsif wren ='1' then
				arr(idx) := wrdata;
			elsif reset_n = '1' then
				arr := (others => (others => '0'));
			else
				output <= arr(idx);	
			end if ;
		end if ;
		
	end process ; -- identifier

end architecture ; -- arch