-- Apaga o banco de dados se existir
DROP DATABASE IF EXISTS e_commerce;

-- Cria o banco de dados
CREATE DATABASE e_commerce;

-- Seleciona o banco de dados para uso
USE e_commerce;

-- Tabela 'Usuarios': Armazena dados dos usuários.
-- Cada atributo depende do 'id_usuario' (chave primária).
CREATE TABLE `Usuarios` (
  `id_usuario` int PRIMARY KEY AUTO_INCREMENT,  -- Chave primária: identifica unicamente cada usuário
  `nome` varchar(100),                           -- Nome do usuário
  `email` varchar(100) UNIQUE,                   -- Email único, evitando duplicidade
  `senha` varchar(100),                          -- Senha para acesso
  `nivel_acesso` varchar(20)                     -- Nível de acesso (ex.: admin, cliente)
);

-- Tabela 'Produtos': Armazena dados dos produtos.
-- Todos os atributos dependem do 'id_produto', mantendo a integridade.
CREATE TABLE `Produtos` (
  `id_produto` int PRIMARY KEY AUTO_INCREMENT,  -- Chave primária: identifica cada produto
  `nome` varchar(100),                           -- Nome do produto
  `descricao` text,                              -- Descrição detalhada do produto
  `categoria` varchar(50),                       -- Categoria do produto (poderia ser normalizada em outra tabela se houver mais atributos)
  `preco` decimal(10,2),                         -- Preço do produto
  `estoque` int,                                 -- Quantidade em estoque
  `id_fornecedor` int                            -- Referência ao fornecedor (idealmente, haveria uma tabela 'Fornecedores')
);

-- Tabela 'Pedidos': Registra informações dos pedidos realizados.
-- Os atributos são dependentes do 'id_pedido'.
CREATE TABLE `Pedidos` (
  `id_pedido` int PRIMARY KEY AUTO_INCREMENT,   -- Chave primária: identifica cada pedido
  `id_usuario` int,                              -- Chave estrangeira que referencia o usuário que fez o pedido
  `data_pedido` date,                            -- Data de realização do pedido
  `status` varchar(50)                           -- Status do pedido (ex.: pendente, concluído, cancelado)
);

-- Tabela 'Itens_Pedido': Registra os itens que compõem cada pedido.
-- Utiliza uma chave composta (id_pedido, id_produto).
CREATE TABLE `Itens_Pedido` (
  `id_pedido` int,                               -- Chave estrangeira que referencia o pedido
  `id_produto` int,                              -- Chave estrangeira que referencia o produto
  `quantidade` int,                              -- Quantidade do produto neste pedido
  `preco_unitario` decimal(10,2),                -- Preço unitário do produto no momento do pedido
  PRIMARY KEY (`id_pedido`, `id_produto`)         -- Chave composta para evitar duplicidade e manter a 3FN
);

-- Tabela 'Pagamentos': Registra os pagamentos realizados para os pedidos.
-- Os atributos dependem unicamente do 'id_pagamento'.
CREATE TABLE `Pagamentos` (
  `id_pagamento` int PRIMARY KEY AUTO_INCREMENT, -- Chave primária: identifica cada pagamento
  `id_pedido` int,                               -- Chave estrangeira que referencia o pedido pago
  `forma_pagamento` varchar(50),                 -- Método de pagamento (ex.: cartão, boleto)
  `valor` decimal(10,2),                         -- Valor pago
  `data_pagamento` date                          -- Data em que o pagamento foi efetuado
);

-- Tabela 'Entregas': Armazena os dados de entrega dos pedidos.
-- Cada atributo é dependente do 'id_entrega'.
CREATE TABLE `Entregas` (
  `id_entrega` int PRIMARY KEY AUTO_INCREMENT,   -- Chave primária: identifica cada entrega
  `id_pedido` int,                               -- Chave estrangeira que referencia o pedido a ser entregue
  `endereco` varchar(255),                       -- Endereço de entrega
  `status` varchar(50),                          -- Status da entrega (ex.: em trânsito, entregue)
  `data_envio` date,                             -- Data de envio do pedido
  `data_entrega` date                            -- Data prevista ou efetiva de entrega
);

-- Tabela 'Avaliacoes': Registra as avaliações dos produtos pelos usuários.
-- Cada atributo depende do 'id_avaliacao' (chave primária).
CREATE TABLE `Avaliacoes` (
  `id_avaliacao` int PRIMARY KEY AUTO_INCREMENT, -- Chave primária: identifica cada avaliação
  `id_usuario` int,                              -- Chave estrangeira que referencia o usuário que avaliou
  `id_produto` int,                              -- Chave estrangeira que referencia o produto avaliado
  `nota` decimal(2, 1),                          -- Nota dada ao produto (ex.: 4.5)
  `comentario` text,                             -- Comentário sobre o produto
  `data_avaliacao` date                          -- Data em que a avaliação foi realizada
);

-- Definindo as chaves estrangeiras
ALTER TABLE `Pedidos` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`);

ALTER TABLE `Itens_Pedido` ADD FOREIGN KEY (`id_pedido`) REFERENCES `Pedidos` (`id_pedido`);
ALTER TABLE `Itens_Pedido` ADD FOREIGN KEY (`id_produto`) REFERENCES `Produtos` (`id_produto`);

ALTER TABLE `Pagamentos` ADD FOREIGN KEY (`id_pedido`) REFERENCES `Pedidos` (`id_pedido`);

ALTER TABLE `Entregas` ADD FOREIGN KEY (`id_pedido`) REFERENCES `Pedidos` (`id_pedido`);

ALTER TABLE `Avaliacoes` ADD FOREIGN KEY (`id_usuario`) REFERENCES `Usuarios` (`id_usuario`);
ALTER TABLE `Avaliacoes` ADD FOREIGN KEY (`id_produto`) REFERENCES `Produtos` (`id_produto`);