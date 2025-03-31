USE e_commerce;

-- Produtos Mais Vendidos
SELECT p.id_produto, p.nome, SUM(ip.quantidade) AS total_vendido
FROM Itens_Pedido ip
JOIN Produtos p ON ip.id_produto = p.id_produto
GROUP BY p.id_produto, p.nome
ORDER BY total_vendido DESC;

-- Clientes que Mais Compraram no Último Mês:
SELECT u.nome, COUNT(p.id_pedido) AS total_pedidos
FROM Pedidos p
JOIN Usuarios u ON p.id_usuario = u.id_usuario
WHERE p.data_pedido BETWEEN DATE_SUB(CURDATE(), INTERVAL 1 MONTH) AND CURDATE()
GROUP BY u.nome
ORDER BY total_pedidos DESC;

-- Estoque Baixo
SELECT nome, estoque
FROM Produtos
WHERE estoque < 20;

-- Faturamento por Período
SELECT SUM(ip.preco_unitario * ip.quantidade) AS faturamento
FROM Pedidos p
JOIN Itens_Pedido ip ON p.id_pedido = ip.id_pedido
WHERE p.data_pedido BETWEEN '2025-01-01' AND '2025-06-31'


-- Média de Avaliações por Produto
SELECT a.id_produto, AVG(a.nota) AS media_avaliacoes
FROM Avaliacoes a
GROUP BY a.id_produto;
