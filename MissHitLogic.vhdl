library ieee;
use ieee.std_logic_1164.all;


entity MissHitLogic is
  generic (one : std_logic_vector(3 downto 0) := "1111");
  generic (valid : integer := 4);

  port (
	tag : in std_logic_vector(3 downto 0),
	w0 : in std_logic_vector(4 downto 0),
	w1 : in std_logic_vector(4 downto 0),
	hit : out std_logic,
	w0_valid : out std_logic,
	w1_valid : out std_logic
  ) ;
end entity ; -- MissHitLogic

architecture arch of MissHitLogic is
	signal w0xnortag : std_logic_vector(3 downto 0);
	signal w0eqaltag : std_logic;

	signal w1xnortag : std_logic_vector(3 downto 0);
	signal w1eqaltag : std_logic;

begin
	
	w0xnortag <= tag xnor w0(3 downto 0);
	w0eqaltag <= w0xnortag and one;
	w0_valid <= w0(valid) and w0eqaltag;

	w1xnortag <= tag xnor w1(3 downto 0);
	w1eqaltag <= w1xnortag and one;
	w1_valid <= w1(valid) and w1eqaltag;

	hit <= w1_valid or w0_valid;

end architecture ; -- arch