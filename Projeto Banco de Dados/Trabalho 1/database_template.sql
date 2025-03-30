DROP DATABASE IF EXISTS e_commerce;

CREATE DATABASE e_commerce;

USE e_commerce;

CREATE TABLE `Usuarios` (
  `id_usuario` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100),
  `email` varchar(100) UNIQUE,
  `senha` varchar(100),
  `nivel_acesso` varchar(20)  
);

CREATE TABLE `Produtos` (
  `id_produto` int PRIMARY KEY AUTO_INCREMENT,
  `nome` varchar(100),
  `descricao` text,
  `categoria` varchar(50),
  `preco` decimal(10,2),
  `estoque` int,
  `id_fornecedor` int
);

CREATE TABLE `Pedidos` (
  `id_pedido` int PRIMARY KEY AUTO_INCREMENT,
  `id_usuario` int,
  `data_pedido` date,
  `status` varchar(50)
);

CREATE TABLE `Itens_Pedido` (
  `id_pedido` int,
  `id_produto` int,
  `quantidade` int,
  `preco_unitario` decimal(10,2),
  PRIMARY KEY (`id_pedido`, `id_produto`)
);

CREATE TABLE `Pagamentos` (
  `id_pagamento` int PRIMARY KEY AUTO_INCREMENT,
  `id_pedido` int,
  `forma_pagamento` varchar(50),
  `valor` decimal(10,2),
  `data_pagamento` date
);

CREATE TABLE `Entregas` (
  `id_entrega` int PRIMARY KEY AUTO_INCREMENT,
  `id_pedido` int,
  `endereco` varchar(255),
  `status` varchar(50),
  `data_envio` date,
  `data_entrega` date
);

CREATE TABLE `Avaliacoes` (
  `id_avaliacao` int PRIMARY KEY AUTO_INCREMENT,
  `id_usuario` int,
  `id_produto` int,
  `nota` decimal(2, 1),
  `comentario` text,
  `data_avaliacao` date
);

ALTER TABLE `Pedidos` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`);

ALTER TABLE `Itens_Pedido` ADD FOREIGN KEY (`id_pedido`) REFERENCES `Pedidos` (`id_pedido`);

ALTER TABLE `Itens_Pedido` ADD FOREIGN KEY (`id_produto`) REFERENCES `Produtos` (`id_produto`);

ALTER TABLE `Pagamentos` ADD FOREIGN KEY (`id_pedido`) REFERENCES `Pedidos` (`id_pedido`);

ALTER TABLE `Entregas` ADD FOREIGN KEY (`id_pedido`) REFERENCES `Pedidos` (`id_pedido`);

ALTER TABLE `Avaliacoes` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`);

ALTER TABLE `Avaliacoes` ADD FOREIGN KEY (`id_produto`) REFERENCES `Produtos` (`id_produto`);
