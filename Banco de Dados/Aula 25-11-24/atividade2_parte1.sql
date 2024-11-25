-- Usando o banco de dados BANCOTIMES
-- Mostre todos os times
SELECT
    *
FROM
    times;

-- Mostre todos os jogadores
SELECT
    *
FROM
    jogadores;

-- Mostrar nome e ano de fundação dos times, ordenados pelo nome
SELECT
    nome,
    anodefundacao
FROM
    times
ORDER BY
    nome;

-- Mostre o valor médio dos times
SELECT
    COUNT(*) AS qnt_total_times,
    AVG(valor) AS valor_medio
FROM
    times;

USE bancotimes;

-- Mostre o nome, salario, data de nascimento de jogadores, do mais velho para o mais novo
SELECT
    nome,
    salario,
    datanascimento
FROM
    jogadores
ORDER BY
    datanascimento;

-- Mostre o nome e salario e jogadores que ganham mais de 2000
SELECT
    nome,
    salario
FROM
    jogadores
WHERE
    salario >= 2000;

-- Mostre o valor total dos times
SELECT
    SUM(valor) AS valor_total_times
FROM
    times;

-- Mostre o nome dos jogadores ordenados por nome decrescente
SELECT
    nome
FROM
    jogadores
ORDER BY
    nome DESC;

-- Mostre o valor mais baixo de um time
SELECT
    MIN(valor) AS valor
FROM
    times;

-- Mostre nome e data de nascimento para jogadores a partir do ano 2000
SELECT
    nome,
    datanascimento
FROM
    jogadores
WHERE
    YEAR (datanascimento) >= 2000;

-- Mostre o nome do jogador e o nome do time que ele joga em ordem alfabetica por nome do jogador
SELECT
    j.nome,
    t.nome AS TIME
FROM
    jogadores j
    INNER JOIN times t ON j.idtimes = t.idtimes;
