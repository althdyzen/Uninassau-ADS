-- criar database
CREATE DATABASE campeonato_2mb;
-- usar database
USE campeonato_2mb;

-- criar tabela equipe
CREATE TABLE equipe (
	codigo CHAR(5) NOT NULL,
	nome VARCHAR(80) NOT NULL,
	pais VARCHAR(40) NOT NULL,
    fundacao DATE NOT NULL,
	PRIMARY KEY (codigo)
);
-- mostrar a tabela equipe
DESCRIBE equipe;

-- criar tabela jogador
CREATE TABLE jogador (
	codigo INT UNSIGNED NOT NULL AUTO_INCREMENT,
	nome VARCHAR(80) NOT NULL,
	dt_nasc DATE NOT NULL,
    posicao VARCHAR(40) NOT NULL,
    equipe CHAR(5) NOT NULL,
	PRIMARY KEY (codigo),
    FOREIGN KEY(equipe) REFERENCES equipe(codigo)
);

-- inserir valores na tabela equipe
INSERT INTO equipe(codigo, nome, pais, fundacao)
VALUES
('SPT01', 'SPORT CLUB DO RECIFE', 'BRASIL', '1917-02-01'),
('SPT02', 'NAUTICO', 'BRASIL', '1917-02-01'),
('SPT03', 'SANTA CRUZ', 'BRASIL', '1917-02-01'),
('SPT04', 'CENTRAL', 'BRASIL', '1917-02-01'),
('SPT05', 'PETROLINA', 'BRASIL', '1917-02-01'),
('SPT06', 'FC BARCELONA', 'ESPANHA', '1899-11-29'),
('SPT07', 'REAL MADRID', 'ESPANHA', '1902-03-06'),
('SPT08', 'MANCHESTER UNITED', 'INGLATERRA', '1878-03-05'),
('SPT09', 'BAYERN DE MUNIQUE', 'ALEMANHA', '1900-02-27'),
('SPT10', 'JUVENTUS', 'ITÁLIA', '1897-11-01'),
('SPT11', 'PARIS SAINT-GERMAIN', 'FRANÇA', '1970-08-12'),
('SPT12', 'INTER DE MILÃO', 'ITÁLIA', '1908-03-09'),
('SPT13', 'LIVERPOOL', 'INGLATERRA', '1892-06-03'),
('SPT14', 'AJAX', 'PAÍSES BAIXOS', '1900-03-18'),
('SPT15', 'SANTOS FC', 'BRASIL', '1912-04-14');

-- exibir todas linhas da tabela equipe
SELECT * FROM equipe;

-- atualizar valor da coluna fundação que tem o codigo "SPT02"
UPDATE equipe SET fundacao='1945-03-01' WHERE codigo='SPT02';

-- inserir valores na tabela equipe
INSERT INTO jogador(codigo, nome, dt_nasc, posicao, equipe)
VALUES
(DEFAULT, 'CARLINHOS BALA', '1980-09-30', 'ATACANTE', 'SPT01'),
(DEFAULT, 'RONALDO', '1976-09-22', 'ATACANTE', 'SPT02'),
(DEFAULT, 'ZICO', '1953-03-03', 'MEIA', 'SPT03'),
(DEFAULT, 'RONALDINHO', '1980-03-21', 'MEIA', 'SPT04'),
(DEFAULT, 'PELE', '1940-10-23', 'ATACANTE', 'SPT05'),
(DEFAULT, 'NEYMAR', '1992-02-05', 'ATACANTE', 'SPT06'),
(DEFAULT, 'KAKÁ', '1982-04-22', 'MEIA', 'SPT07'),
(DEFAULT, 'RIVALDO', '1972-04-19', 'ATACANTE', 'SPT08'),
(DEFAULT, 'CAFÚ', '1970-07-07', 'LATERAL', 'SPT09'),
(DEFAULT, 'DIDA', '1973-10-07', 'GOLIEIRO', 'SPT10');

-- exibe todas linhas da tabela jogador
SELECT * FROM jogador;

-- exibe as colunas "nome e dt_nasc" da tabela jogador que tem a coluna com valor "ATACANTE" ordenada pela coluna nome descendente
SELECT nome, dt_nasc 
FROM jogador 
WHERE posicao='ATACANTE'
ORDER BY nome DESC;

-- exibe as colunas "nome, dt_nasc e idade(calculando o ano atual - a dt_nasc)" da tabela jogador
SELECT nome, dt_nasc, YEAR(CURDATE()) - YEAR(dt_nasc) AS idade
FROM jogador;

-- exibe nome da equipe, nome e posição do jogador da tabela equipe com interseção na tabela jogador, que tem a equipe seja o NAUTICO e o jogador seja LATERAL
SELECT equipe.nome, jogador.nome, jogador.posicao
FROM equipe
LEFT JOIN jogador
ON equipe.codigo = jogador.equipe
WHERE equipe.nome='NAUTICO' AND posicao='LATERAL'

-- exibe todos as linhas da tabela jogadores onde tem a idade menor que 40 anos
SELECT *, YEAR(CURDATE()) - YEAR(dt_nasc) AS idade
FROM jogador
WHERE YEAR(CURDATE()) - YEAR(dt_nasc) < 40
