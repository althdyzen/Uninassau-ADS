USE e_commerce;

DELIMITER //
-- Produtos mais vendidos
DROP PROCEDURE IF EXISTS MaisVendidos;
CREATE PROCEDURE MaisVendidos(IN quantidade INT)
BEGIN
    SELECT
        p.id_produto,
        p.nome,
        SUM(ip.quantidade) AS total_vendido
    FROM
        Itens_Pedido ip
        JOIN Produtos p ON ip.id_produto = p.id_produto
    WHERE
        (quantidade IS NULL OR ip.quantidade <= quantidade)
    GROUP BY
        p.id_produto,
        p.nome
    ORDER BY
        total_vendido DESC;
END //

-- Clientes que mais compraram no último mês:
DROP PROCEDURE IF EXISTS ClientesQueMaisCompraram;
CREATE PROCEDURE ClientesQueMaisCompraram()
BEGIN
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
END //

-- Estoque baixo
DROP PROCEDURE IF EXISTS EstoqueBaixo;
CREATE PROCEDURE EstoqueBaixo(IN num INT)
BEGIN
    SELECT
        nome,
        estoque
    FROM
        Produtos
    WHERE
        (num IS NULL OR estoque < num)
    ORDER BY
        estoque ASC;
END //

-- Faturamento por período
DROP PROCEDURE IF EXISTS FaturamentoPeriodo;
CREATE PROCEDURE FaturamentoPeriodo(IN inicio DATE, IN termino DATE)
BEGIN
    SELECT
        inicio AS Início, termino AS Término, SUM(pd.preco * ip.quantidade) AS Faturamento
    FROM
        Pedidos p
        JOIN Itens_Pedido ip ON p.id_pedido = ip.id_pedido
        JOIN Produtos pd ON ip.id_produto = pd.id_produto
    WHERE
        ((inicio IS NULL && termino IS NULL) OR p.data_pedido BETWEEN inicio AND termino);
END //

-- Média das avaliações por produto
DROP PROCEDURE IF EXISTS NotaMediaPedido;
CREATE PROCEDURE NotaMediaPedido(IN produto VARCHAR(100))
BEGIN
    SELECT
        a.id_produto,
        p.nome,
        FORMAT(AVG(a.nota), 1) AS "Média de avaliações"
    FROM
        Avaliacoes a
        JOIN Produtos p ON a.id_produto = p.id_produto
    WHERE
        (produto IS NULL OR p.nome = produto)
    GROUP BY
        a.id_produto;
END //
DELIMITER ;

-- Chama MaisVendidos()
-- Valores possíveis:
--     INT -> Retorna produtos vendidos até a quantidade especificada.
--     NULL -> Retorna todos os produtos, independentemente da quantidade vendida.
CALL MaisVendidos(1);

-- Chama ClientesQueMaisCompraram()
-- Valores possíveis: Nenhum
CALL ClientesQueMaisCompraram();

-- Chama EstoqueBaixo()
-- Valores possíveis:
--     INT -> Retorna produtos com estoque abaixo do limite especificado.
--     NULL -> Retorna todos os produtos com estoque baixo.
CALL EstoqueBaixo(NULL);

-- Chama FaturamentoPeriodo()
-- Valores possíveis:
--     (DATE, DATE) -> Retorna faturamento entre as datas especificadas.
--     (NULL, NULL) -> Retorna faturamento de todo o período.
CALL FaturamentoPeriodo("2025-03-15", "2025-03-20");

-- Chama NotaMediaPedido()
-- Valores de produtos possíveis:
--     VARCHAR(100) -> Retorna a média de avaliações para o produto especificado.
--         Notebook Dell
--         Smartphone Samsung
--         Teclado Mecânico
--         Mouse Logitech
--         Monitor LG
--         Cadeira Gamer
--         Impressora HP
--         Fone de Ouvido JBL
--         Smartwatch Xiaomi
--         HD Externo 1TB
--     NULL -> Retorna a média de avaliações de todos os produtos.
CALL NotaMediaPedido("Notebook Dell");