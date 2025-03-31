-- Apaga o banco de dados se existir
DROP DATABASE IF EXISTS e_commerce;

-- Cria o banco de dados
CREATE DATABASE e_commerce;

-- Seleciona o banco de dados
USE e_commerce;

-- Tabela 'Usuarios': Armazena dados dos usuários.
CREATE TABLE `Usuarios` (
  `id_usuario`   int PRIMARY KEY AUTO_INCREMENT,
  `nome`         varchar(100),
  `email`        varchar(100) UNIQUE,
  `senha`        varchar(100),
  `nivel_acesso` varchar(20)
);

-- Tabela 'Produtos': Armazena dados dos produtos.
CREATE TABLE `Produtos` (
  `id_produto`    int PRIMARY KEY AUTO_INCREMENT,
  `nome`          varchar(100),
  `descricao`     text,
  `categoria`     varchar(50),
  `preco`         decimal(10,2),
  `estoque`       int,
  `id_fornecedor` int
);

-- Tabela 'Pedidos': Registra informações dos pedidos realizados.
CREATE TABLE `Pedidos` (
  `id_pedido`   int PRIMARY KEY AUTO_INCREMENT,
  `id_usuario`  int,
  `data_pedido` date,
  `status`      varchar(50),
  FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`)
);

-- Tabela 'Itens_Pedido': Registra os itens que compõem cada pedido.
CREATE TABLE `Itens_Pedido` (
  `id_pedido`      int,
  `id_produto`     int,
  `quantidade`     int,
  `preco_unitario` decimal(10,2),
  PRIMARY KEY      (`id_pedido`, `id_produto`),
  FOREIGN KEY (`id_pedido`) REFERENCES `Pedidos` (`id_pedido`),
  FOREIGN KEY (`id_produto`) REFERENCES `Produtos` (`id_produto`)
);

-- Tabela 'Pagamentos': Registra os pagamentos realizados para os pedidos.
CREATE TABLE `Pagamentos` (
  `id_pagamento`    int PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `id_pedido`       int,
  `forma_pagamento` varchar(50),
  `valor`           decimal(10,2),
  `data_pagamento`  date,
  FOREIGN KEY (`id_pedido`) REFERENCES `Pedidos` (`id_pedido`)
);

-- Tabela 'Entregas': Armazena os dados de entrega dos pedidos.
CREATE TABLE `Entregas` (
  `id_entrega`   int PRIMARY KEY AUTO_INCREMENT,
  `id_pedido`    int,
  `endereco`     varchar(255),
  `status`       varchar(50),
  `data_envio`   date,
  `data_entrega` date,
  FOREIGN KEY (`id_pedido`) REFERENCES `Pedidos` (`id_pedido`)
);

-- Tabela 'Avaliacoes': Registra as avaliações dos produtos pelos usuários.
CREATE TABLE `Avaliacoes` (
  `id_avaliacao`   int PRIMARY KEY AUTO_INCREMENT,
  `id_usuario`     int,
  `id_produto`     int,
  `nota`           decimal(2,1),
  `comentario`     text,
  `data_avaliacao` date,
  FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`),
  FOREIGN KEY (`id_produto`) REFERENCES `Produtos` (`id_produto`)
);
