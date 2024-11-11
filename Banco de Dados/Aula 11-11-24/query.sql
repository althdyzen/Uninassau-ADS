DROP DATABASE IF EXISTS livraria;

CREATE DATABASE livraria;

USE livraria;

CREATE TABLE
    clientes (
        id INT AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(40) NOT NULL,
        email VARCHAR(100) NOT NULL
    );

CREATE TABLE
    livros (
        id INT AUTO_INCREMENT PRIMARY KEY,
        titulo VARCHAR(40) NOT NULL,
        autor VARCHAR(40) NOT NULL,
        preco INT NOT NULL,
        categoria VARCHAR(20) NOT NULL
    );

CREATE TABLE
    pedidos (
        id INT AUTO_INCREMENT PRIMARY KEY,
        id_cliente INT NOT NULL,
        id_livro INT NOT NULL,
        quantidade INT NOT NULL,
        data_pedido DATE NOT NULL,
        FOREIGN KEY (id_cliente) REFERENCES Clientes (id),
        FOREIGN KEY (id_livro) REFERENCES Livros (id)
    );

INSERT INTO
    clientes (id, nome, email)
VALUES
    (DEFAULT, 'Caio', 'caio@email.com'),
    (DEFAULT, 'João', 'joao@email.com'),
    (DEFAULT, 'Pedro', 'pedro@email.com'),
    (DEFAULT, 'Arthur', 'arthur@email.com');

INSERT INTO
    livros (id, titulo, autor, preco, categoria)
VALUES
    (DEFAULT, 'Banco de Dados', 'João', 20, 'Computação'),
    (DEFAULT, 'Aquele Verão', 'Elisa', 15, 'Romance'),
    (DEFAULT, 'A Vida', 'Vinicius', 10, 'Filosofia'),
    (DEFAULT, 'Aquele Dia', 'Arthur', 5, 'Romance');

INSERT INTO
    pedidos (id, id_cliente, id_livro, quantidade, data_pedido)
VALUES
    (DEFAULT, 1, 1, 1, '2023-01-21'),
    (DEFAULT, 2, 2, 2, '2023-01-22'),
    (DEFAULT, 3, 3, 3, '2023-01-23'),
    (DEFAULT, 4, 4, 4, '2023-01-24');

-- SELECT * FROM pedido;
SELECT
    c.nome AS cliente,
    SUM(p.quantidade * l.preco) AS total_pedidos
FROM
    clientes c
    JOIN pedidos p ON c.id = p.id_cliente
    JOIN livros l ON p.id_livro = l.id
GROUP BY
    c.id,
    c.nome;
