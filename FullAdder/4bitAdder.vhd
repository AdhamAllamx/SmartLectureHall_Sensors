Library ieee;
use ieee.std_logic_1164.all;

entity fulladd is
	port(Cin, x, y: IN std_logic;
			s, Cout: OUT std_logic);
end fulladd;

architecture arch of fulladd is
begin
	s<= x xOR y xOR Cin;
	
	Cout <= (x and y) or (Cin and x) or (y and Cin);
	
end arch;

	
Library ieee;
use ieee.std_logic_1164.all;

entity seg is
Port(X: IN std_logic_vector(4 downto 0);
		Y, Z: OUT std_logic_vector(6 downto 0));
end seg;

architecture behavior1 of seg is
begin
	process(X)
	begin
		
		case X is
		when "00000" => 
			Y <= "1000000";
			Z <= "1000000";
		when "00001" => 
			Y <= "1111001";
			Z <= "1000000";
		when "00010" => 
			Y <= "0100100";
			Z <= "1000000";
		when "00011" => 
			Y <= "0110000";
			Z <= "1000000";
		when "00100" => 
			Y <= "0011001";
			Z <= "1000000";
		when "00101" => 
			Y <= "0010010";
			Z <= "1000000";
		when "00110" => 
			Y <= "0000010";
			Z <= "1000000";
		when "00111" => 
			Y <= "1111000";
			Z <= "1000000";
		when "01000" => 
			Y <= "0000000";
			Z <= "1000000";
		when "01001" => 
			Y <= "0010000";
			Z <= "1000000";
		when "01010" => 
			Y <="1000000";
			Z <= "1111001";
		when "01011" => 
			Y <="1111001";
			Z <= "1111001";
		when "01100" => 
			Y <="0100100";
			Z <= "1111001";
		when "01101" => 
			Y <="0110000";
			Z <= "1111001";
		when "01110" => 
			Y <="0011001";
			Z <= "1111001";
		when "01111" => 
			Y <="0010010";
			Z <= "1111001";
		when "10000" => 
			Y <="0000010";
			Z <= "1111001";
		when "10001" => 
			Y <="1111000";
			Z <= "1111001";
		when "10010" => 
			Y <="0000000";
			Z <= "1111001";
		when "10011" => 
			Y <="0010000";
			Z <= "1111001";
		when "10100" => 
			Y <="1000000";
			Z <= "0100100";
		when "10101" => 
			Y <="1111001";
			Z <= "0100100";
		when "10110" => 
			Y <="0100100";
			Z <= "0100100";
		when "10111" => 
			Y <="0110000";
			Z <= "0100100";
		when "11000" => 
			Y <="0011001";
			Z <= "0100100";
		when "11001" => 
			Y <="0010010";
			Z <= "0100100";
		when "11010" => 
			Y <="0000010";
			Z <= "0100100";
		when "11011" => 
			Y <="1111000";
			Z <= "0100100";
		when "11100" => 
			Y <="0000000";
			Z <= "0100100";
		when "11101" => 
			Y <="0010000";
			Z <= "0100100";
		when "11110" => 
			Y <="1000000";
			Z <= "0110000";
		when "11111" => 
			Y <="1111001";
			Z <= "0100100";
		
			
			
		end case;
		
	end process;
	
end behavior1;


Library ieee;
use ieee.std_logic_1164.all;

Entity adder4 is
	port(Cin: IN std_logic;
			a, b: IN std_logic_vector(3 downto 0);
			sum: buffer std_logic_vector(3 downto 0);
			Cout: buffer std_logic;
			Z: out std_logic_vector(6 downto 0);
			Yseg: buffer std_logic_vector(6 downto 0));
end adder4;

architecture behavior of adder4 is
	signal full: std_logic_vector(4 downto 0);
	
	component fulladd is
		port(Cin, x, y: IN std_logic;
				s, Cout: OUT std_logic);
	end component;
	
	Component seg is
		Port(X: IN std_logic_vector(4 downto 0);
			Y, Z: OUT std_logic_vector(6 downto 0));
	end component;
	Signal Count: Std_logic_vector(1 to 3);
	
	begin
		stage0: fulladd port map(Cin, a(0), b(0), sum(0), Count(1));
		stage1: fulladd port map(Count(1), a(1), b(1), sum(1), Count(2));
		stage2: fulladd port map(Count(2), a(2), b(2), sum(2), Count(3));
		stage3: fulladd port map(Count(3), a(3), b(3), sum(3), Cout);
		
		full(4) <= Cout;
		full(3 downto 0) <= sum;
		
		seg0: seg port map(full, Yseg, Z);
		
end behavior;

	
	
	
	
	
		