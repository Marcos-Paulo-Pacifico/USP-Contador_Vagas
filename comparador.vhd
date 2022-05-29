-- comparador.vhd

library IEEE;							--implementacao das bibliotecas
use IEEE.std_logic_1164.all;

entity comparador is					--criacao da entidade
	port (
			A,B: in std_logic_vector (3 downto 0);  	--entradas vetores de dois bits
			igual: out STD_LOGIC								--saida de 1 bit
	);
end comparador;

architecture comportamental of comparador is  --criacao da arquitetura
begin

	igual <= '1' when A=B else '0';				--funcionamento do comparador
	
end comportamental;