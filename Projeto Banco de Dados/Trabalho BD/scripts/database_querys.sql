USE e_commerce;

-- Produtos mais vendidos
SELECT
    p.id_produto,
    p.nome,
    SUM(ip.quantidade) AS total_vendido
FROM
    Itens_Pedido ip
    JOIN Produtos p ON ip.id_produto = p.id_produto
GROUP BY
    p.id_produto,
    p.nome
ORDER BY
    total_vendido DESC;


-- Clientes que mais compraram no último mês:
SELECT
    u.nome,
    COUNT(p.id_pedido) AS total_pedidos
FROM
    Pedidos p
    JOIN Usuarios u ON p.id_usuario = u.id_usuario
WHERE
    p.data_pedido BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
    AND CURDATE()
GROUP BY
    u.nome
ORDER BY
    total_pedidos DESC;


-- Estoque baixo
SELECT
    nome,
    estoque
FROM
    Produtos
WHERE
    estoque < 20;

-- Estoque crescente
SELECT
    estoque,
    nome
FROM
    Produtos
ORDER BY
    estoque ASC;


-- Faturamento por período
SET @inicio =  "2025-03-15";
SET @termino =  "2025-03-30";
SELECT
    @inicio AS Início, @termino AS Término, SUM(pd.preco * ip.quantidade) AS Faturamento
FROM
    Pedidos p
    JOIN Itens_Pedido ip ON p.id_pedido = ip.id_pedido
    JOIN Produtos pd ON ip.id_produto = pd.id_produto
WHERE
    p.data_pedido BETWEEN @inicio AND @termino;


-- Média das avaliações por produto
SELECT
    a.id_produto,
    p.nome,
    FORMAT(AVG(a.nota), 1) AS "média"
FROM
    Avaliacoes a
    JOIN Produtos p ON a.id_produto = p.id_produto
GROUP BY
    a.id_produto;