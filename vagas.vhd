--vagas

library IEEE;
use IEEE.std_logic_1164.all;										
use ieee.numeric_std.all;

entity fluxo_idosos is
	port(clock1, zera1, entra, entra_idos, load, sai, sai_idos: in std_logic;	--entradas de 1 bit
		  entrada1, entrada2: in std_logic_vector (3 downto 0);			--entrada de 4 bits
		  carros,idosos: out std_logic_vector(3 downto 0);		--saida de 4 bits
		  cheio: out std_logic);										--saida 1 bit
end fluxo_idosos;

architecture funcionamento of fluxo_idosos is
	
	component contador_hexadecimal is									
	port(clock, zera, conta, carrega, decresce: in std_logic;	--instanciacao do component contador
		  entrada: in std_logic_vector (3 downto 0);			
		  contagem : out std_logic_vector(3 downto 0);		
		  fim: out std_logic);										
end component;
	
	component comparador is									--instanciacao dp component entidade
	port (
			A,B: in std_logic_vector (3 downto 0);  	
			igual: out STD_LOGIC
	);
end component;

	
	signal carros_out: std_logic_vector(3 downto 0);    --criacao de um sinal intermediario
	
begin
		
		cont_vagas: contador_hexadecimal port map (clock1, zera1, entra or entra_idos, load, sai or sai_idos,entrada1,carros_out,OPEN); --ligacao dos fios 
		cont_idos: contador_hexadecimal port map (clock1, zera1, entra_idos, load, sai_idos,entrada2,idosos,OPEN); 
		sinalizador: comparador port map (carros_out, "1111", cheio);
		carros<=carros_out;
end funcionamento;

	