library ieee; 
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;


entity project is 
port(
   sen1 , sen2, sen3 ,clk :In std_logic;
	display : out std_logic_vector(6 downto 0);
	motor : out std_logic ;
	e:buffer integer range 0 to 9 :=0
);
end project;

architecture e1 of project is    
signal  tiks : integer := 0;
signal  sec : integer := 0;
signal Freq : integer := 100000000  ; 
begin 
process(clk)
begin
if rising_edge(clk) then 
if (tiks = Freq-1) then 
	tiks <=0;

	if sen1 = '0' then 
	e<=e+1;
	end if ;
	
	--if sen2 ='0' and e =0 then 
	--e<=0;
	--end if ;
	
	if sen2='0' then 
	e <= e-1 ;
	end if;
	
	if sen3 = '0' then 
	motor <='1' ;
	else 
	motor<= '0';
	end if;

else tiks <= tiks +1 ;
end if ;
end if;

end process;

process(e)
begin 
 case e is 
	 when 0 => display <= "1000000" ;
	 when 1 => display <= "1111001" ;
	 when 2 => display <= "0100100" ;
	 when 3 => display <= "0110000" ;
	 when 4 => display <= "0011001" ;
	 when 5 => display <= "0010010" ;
	 when 6 => display <= "0000010" ;
	 when 7 => display <= "1111000" ;
	 when 8 => display <= "0000000" ;
	 when 9 => display <= "0010000" ;
	 when others => display <= "1111111";
	end case ;
end process;
end e1 ;




 



