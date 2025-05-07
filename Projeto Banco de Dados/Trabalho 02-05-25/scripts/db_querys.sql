USE populacao;

SELECT * FROM pessoas;

SELECT COUNT(*) FROM pessoas;

-- Qual é a distribuição de indivíduos por faixa de escolaridade?
SELECT 
    escolaridade, 
    COUNT(*) as quantidade,
    CONCAT(ROUND((COUNT(*) / (SELECT COUNT(*) FROM pessoas) * 100), 2), '%') AS percentual
FROM 
    pessoas
GROUP BY 
    escolaridade
ORDER BY
    FIELD(escolaridade, "Fundamental Incompleto", "Fundamental Completo", "Médio Incompleto", "Médio Completo", "Superior Incompleto", "Superior Completo", "Pós-graduação");



-- Existe correlação entre escolaridade e renda mensal?
SELECT
    escolaridade,
    renda,
    COUNT(*) as quantidade,
    CONCAT(ROUND((COUNT(*) / (SELECT COUNT(*) FROM pessoas) * 100), 2), '%') AS percentual
FROM 
    pessoas
GROUP BY
    escolaridade, renda
ORDER BY
    FIELD(escolaridade, "Fundamental Incompleto", "Fundamental Completo", "Médio Incompleto", "Médio Completo", "Superior Incompleto", "Superior Completo", "Pós-graduação"),
    FIELD(renda, "< 1 SM", "1 a 2 SM", "2 a 3 SM", "3 a 5 SM", "5 a 10 SM", "> 10 SM");


-- Qual a média de idade por ocupação?
SELECT 
    ocupacao, 
    ROUND(AVG(idade)) as media
FROM
    pessoas
GROUP BY
    ocupacao;


-- Qual a proporção de gêneros por estado civil?
SELECT
    estado_civil,
    genero,
    COUNT(*),
    CONCAT(ROUND((COUNT(*) / (SELECT COUNT(*) FROM pessoas) * 100), 2), '%') AS percentual
FROM
    pessoas
GROUP BY
    estado_civil, genero
ORDER BY
    1;


-- Quais são as cinco cidades com maior número de indivíduos com renda acima de 5 salários mínimos?
SELECT 
    cidade, estado, renda, COUNT(*) as quantidade
FROM 
    pessoas
WHERE 
    renda IN ('5 a 10 SM', '> 10 SM')
GROUP BY 
    cidade, estado, renda
ORDER BY 
    quantidade DESC
LIMIT 5;


-- Quais estados possuem maior concentração de indivíduos com nível superior completo?
SELECT 
    estado, COUNT(*) as indivíduos
FROM 
    pessoas
WHERE
    escolaridade = "Superior Completo"
GROUP BY
    estado
ORDER BY
    indivíduos DESC;


-- Qual a ocupação mais comum entre os indivíduos com ensino médio completo?
SELECT
    ocupacao, COUNT(*) as indivíduos
FROM 
    pessoas
WHERE
    escolaridade = "Médio Completo"
GROUP BY
    ocupacao
ORDER BY
    indivíduos DESC
LIMIT 1;


-- Há mais indivíduos solteiros ou casados entre os desempregados?
SELECT
    estado_civil, COUNT(*) as indivíduos
FROM
    pessoas
WHERE
    ocupacao = "Desempregado" AND estado_civil IN ("Casado", "Solteiro")
GROUP BY 
    estado_civil;


-- Qual é a média de idade dos indivíduos aposentados e casados em cada estado?
SELECT
    estado, ROUND(AVG(idade))
FROM
    pessoas
WHERE
    ocupacao = "Aposentado" AND estado_civil = "Casado"
GROUP BY
    estado;


-- Desenhe um perfil médio do “cidadão brasileiro” com base nessa amostra.
-- nome, idade, genero, escolaridade, ocupacao, renda, estado_civil, estado, cidade

-- Nome comum
SELECT 
    nome, COUNT(*) as quantidade
FROM
    pessoas
GROUP BY 
    nome
ORDER BY
    quantidade DESC
LIMIT 1;


-- Idade comum
SELECT 
    idade, COUNT(*) as quantidade
FROM
    pessoas
GROUP BY 
    idade
ORDER BY
    quantidade DESC
LIMIT 1;

-- Gênero comum
SELECT 
    genero, COUNT(*) as quantidade
FROM
    pessoas
GROUP BY 
    genero
ORDER BY
    quantidade DESC
LIMIT 1;

-- Escolaridade comum
SELECT 
    escolaridade, COUNT(*) as quantidade
FROM
    pessoas
GROUP BY 
    escolaridade
ORDER BY
    quantidade DESC
LIMIT 1;

-- Ocupação comum
SELECT 
    ocupacao, COUNT(*) as quantidade
FROM
    pessoas
GROUP BY 
    ocupacao
ORDER BY
    quantidade DESC
LIMIT 1;

-- Renda mensal comum
SELECT 
    renda, COUNT(*) as quantidade
FROM
    pessoas
GROUP BY 
    renda
ORDER BY
    quantidade DESC
LIMIT 1;

-- Estado civil comum
SELECT 
    estado_civil, COUNT(*) as quantidade
FROM
    pessoas
GROUP BY 
    estado_civil
ORDER BY
    quantidade DESC
LIMIT 1;

-- Estado comum
SELECT 
    estado, COUNT(*) as quantidade
FROM
    pessoas
GROUP BY 
    estado
ORDER BY
    quantidade DESC
LIMIT 1;

-- Cidade comum
SELECT 
    cidade, COUNT(*) as quantidade
FROM
    pessoas
GROUP BY 
    cidade
ORDER BY
    quantidade DESC
LIMIT 1;

-- Variáveis comuns
SET @nome_comum = (SELECT nome FROM pessoas GROUP BY nome ORDER BY COUNT(*) DESC LIMIT 1);
SET @idade_comum = (SELECT idade FROM pessoas GROUP BY idade ORDER BY COUNT(*) DESC LIMIT 1);
SET @genero_comum = (SELECT genero FROM pessoas GROUP BY genero ORDER BY COUNT(*) DESC LIMIT 1);
SET @escolaridade_comum = (SELECT escolaridade FROM pessoas GROUP BY escolaridade ORDER BY COUNT(*) DESC LIMIT 1);
SET @ocupacao_comum = (SELECT ocupacao FROM pessoas GROUP BY ocupacao ORDER BY COUNT(*) DESC LIMIT 1);
SET @renda_comum = (SELECT renda FROM pessoas GROUP BY renda ORDER BY COUNT(*) DESC LIMIT 1);
SET @estado_civil_comum = (SELECT estado_civil FROM pessoas GROUP BY estado_civil ORDER BY COUNT(*) DESC LIMIT 1);
SET @estado_comum = (SELECT estado FROM pessoas GROUP BY estado ORDER BY COUNT(*) DESC LIMIT 1);
SET @cidade_comum = (SELECT cidade FROM pessoas GROUP BY cidade ORDER BY COUNT(*) DESC LIMIT 1);

-- Cidadão médio
SELECT 
    @nome_comum AS nome,
    @idade_comum AS idade,
    @genero_comum AS genero,
    @escolaridade_comum AS escolaridade,
    @ocupacao_comum AS ocupacao,
    @renda_comum AS renda,
    @estado_civil_comum AS estado_civil,
    @estado_comum AS estado,
    @cidade_comum AS cidade;
