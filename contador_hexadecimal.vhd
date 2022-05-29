--contador hexadecimal de 4 bits

library IEEE;
use IEEE.std_logic_1164.all;										-- implementação das bibliotecas padrao
use ieee.numeric_std.all;

entity contador_hexadecimal is									--criacao da entidade
	port(clock, zera, conta, carrega, decresce: in std_logic;	--entradas de 1 bit
		  entrada: in std_logic_vector (3 downto 0);			--entrada de 4 bits
		  contagem : out std_logic_vector(3 downto 0);		--saida de 4 bits
		  fim: out std_logic);										--saida 1 bit
end contador_hexadecimal;

architecture comportamental of contador_hexadecimal is	--criacao da arquitetura
	signal IQ: integer range 0 to 15;							--sinal intermediario
begin

	process (clock,zera,conta, carrega, entrada, IQ)		--inicio do process
	begin
	if zera='1' then IQ <= 0;										--condicao de clear
	elsif clock'event and clock = '1' then
		if carrega='1' then											--opcao de carregamento previo
			IQ<= to_integer (unsigned (entrada) ) ;
		elsif conta='1' then 										--verificacao de contagem
			if IQ= 15 then IQ <= 15;
			else IQ <= IQ + 1;										--acrescimo de contagem
			end if;
		elsif decresce='1' then										--decrecimo de contagem
			if IQ = 0 then IQ <= 0;
			else IQ <= IQ - 1;
			end if;
		else IQ <= IQ;
		end if;
	end if;
end process;

contagem <= std_logic_vector(to_unsigned(IQ, contagem'length)); --atualizacao da contagem

fim<='1' when IQ=15 else '0';										--sinaliza o fim de um ciclo

end comportamental;