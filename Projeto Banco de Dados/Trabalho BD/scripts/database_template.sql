-- Regras normalização:
--   1FN: 
--     1. Todos os atributos devem conter valores atômicos
--     2. Cada linha da tabela deve ser única
--   2FN: 
--     1. Estar na 1FN
--     2. Todos os atributos não-chave devem depender da chave primária inteira, e não apenas de parte dela.
--   3FN: 
--     1. Estar na 2FN
--     2. Um atributo não-chave não deve depender de outro atributo não-chave

-- Apaga o banco de dados se existir
DROP DATABASE IF EXISTS e_commerce;

-- Cria o banco de dados
CREATE DATABASE e_commerce;

-- Seleciona o banco de dados
USE e_commerce;

-- Tabela 'Usuarios': Armazena dados dos usuários.
CREATE TABLE `Usuarios` (
  `id_usuario`   INT PRIMARY KEY AUTO_INCREMENT,
  `nome`         VARCHAR(100) NOT NULL,
  `email`        VARCHAR(100) UNIQUE NOT NULL,
  `senha`        VARCHAR(100) NOT NULL,
  `nivel_acesso` VARCHAR(20) NOT NULL
);

-- Tabela 'Produtos': Armazena dados dos produtos.
CREATE TABLE `Produtos` (
  `id_produto`    INT PRIMARY KEY AUTO_INCREMENT,
  `nome`          VARCHAR(100) NOT NULL,
  `descricao`     TEXT NOT NULL,
  `categoria`     VARCHAR(50) NOT NULL,
  `preco`         DECIMAL(10,2) NOT NULL,
  `estoque`       INT NOT NULL,
  `id_fornecedor` INT NOT NULL
);

-- Tabela 'Pedidos': Registra informações dos pedidos realizados.
CREATE TABLE `Pedidos` (
  `id_pedido`   INT PRIMARY KEY AUTO_INCREMENT,
  `id_usuario`  INT NOT NULL,
  `data_pedido` DATE NOT NULL,
  `status`      VARCHAR(50) NOT NULL,
  FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`)
);

-- Tabela 'Itens_Pedido': Registra os itens que compõem cada pedido.
CREATE TABLE `Itens_Pedido` (
  `id_pedido`      int NOT NULL,
  `id_produto`     int NOT NULL,
  `quantidade`     int NOT NULL,
  PRIMARY KEY      (`id_pedido`, `id_produto`),
  FOREIGN KEY (`id_pedido`) REFERENCES `Pedidos` (`id_pedido`),
  FOREIGN KEY (`id_produto`) REFERENCES `Produtos` (`id_produto`)
);

-- Tabela 'Pagamentos': Registra os pagamentos realizados para os pedidos.
CREATE TABLE `Pagamentos` (
  `id_pagamento`    INT PRIMARY KEY AUTO_INCREMENT,
  `id_pedido`       INT NOT NULL,
  `forma_pagamento` VARCHAR(50) NOT NULL,
  `valor`           DECIMAL(10,2) NOT NULL,
  `data_pagamento`  TIMESTAMP DEFAULT CURRENT_TIMESTAMP() ,
  FOREIGN KEY (`id_pedido`) REFERENCES `Pedidos` (`id_pedido`)
);

-- Tabela 'Entregas': Armazena os dados de entrega dos pedidos.
CREATE TABLE `Entregas` (
  `id_entrega`   INT PRIMARY KEY AUTO_INCREMENT,
  `id_pedido`    INT NOT NULL,
  `endereco`     VARCHAR(255) NOT NULL,
  `status`       VARCHAR(50) NOT NULL,
  `data_envio`   DATE,
  `data_entrega` DATE,
  FOREIGN KEY (`id_pedido`) REFERENCES `Pedidos` (`id_pedido`)
);

-- Tabela 'Avaliacoes': Registra as avaliações dos produtos pelos usuários.
CREATE TABLE `Avaliacoes` (
  `id_avaliacao`   INT PRIMARY KEY AUTO_INCREMENT,
  `id_usuario`     INT NOT NULL,
  `id_produto`     INT NOT NULL,
  `nota`           DECIMAL(2,1) CHECK (nota >= 0 AND nota <= 5) NOT NULL,
  `comentario`     TEXT,
  `data_avaliacao` TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`),
  FOREIGN KEY (`id_produto`) REFERENCES `Produtos` (`id_produto`)
);

-- Tabela 'Fornecedores': Armazena dados dos fornecedores.
CREATE TABLE `Fornecedores` (
  `id_fornecedor` INT PRIMARY KEY AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `contato` VARCHAR(100) NOT NULL
);