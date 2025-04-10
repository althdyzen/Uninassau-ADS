USE e_commerce;

-- Usuários
INSERT INTO Usuarios (nome, email, senha, nivel_acesso) VALUES
('João Silva',      'joao@email.com',     'senha123', 'cliente'),
('Maria Santos',    'maria@email.com',    'senha456', 'cliente'),
('Carlos Oliveira', 'carlos@email.com',   'senha789', 'cliente'),
('Ana Souza',       'ana@email.com',      'senha101', 'cliente'),
('Pedro Mendes',    'pedro@email.com',    'senha202', 'cliente'),
('Beatriz Lima',    'beatriz@email.com',  'senha303', 'cliente'),
('Ricardo Alves',   'ricardo@email.com',  'senha404', 'cliente'),
('Fernanda Costa',  'fernanda@email.com', 'senha505', 'cliente'),
('Gustavo Martins', 'gustavo@email.com',  'senha606', 'cliente'),
('Camila Rocha',    'camila@email.com',   'senha707', 'cliente');

-- Produtos
INSERT INTO Produtos (nome, descricao, categoria, preco, estoque, id_fornecedor) VALUES
('Notebook Dell',      'Notebook Inspiron 15',                     'Eletrônicos',  3500.00, 15, 1),
('Smartphone Samsung', 'Galaxy S21',                               'Eletrônicos',  2800.00, 30, 2),
('Teclado Mecânico',   'Teclado RGB para gamers',                  'Periféricos', 250.00,  50, 3),
('Mouse Logitech',     'Mouse sem fio',                            'Periféricos', 150.00,  40, 3),
('Monitor LG',         'Monitor 24 polegadas Full HD',             'Eletrônicos', 900.00,  25, 2),
('Cadeira Gamer',      'Cadeira ergonômica para jogos',            'Móveis',      1200.00, 20, 2),
('Impressora HP',      'Impressora multifuncional',                'Eletrônicos', 600.00,  10, 1),
('Fone de Ouvido JBL', 'Fone bluetooth com cancelamento de ruído', 'Áudio',       400.00,  35, 2),
('Smartwatch Xiaomi',  'Relógio inteligente Mi Band',              'Wearables',   300.00,  50, 3),
('HD Externo 1TB',     'Armazenamento portátil',                   'Acessórios',  350.00,  15, 3);

-- Pedidos
INSERT INTO Pedidos (id_usuario, data_pedido, status) VALUES
(1,  '2025-03-25', 'Em andamento'),
(2,  '2025-03-20', 'Concluído'),
(3,  '2025-03-15', 'Cancelado'),
(4,  '2025-03-22', 'Enviado'),
(5,  '2025-03-28', 'Em processamento'),
(6,  '2025-03-19', 'Concluído'),
(7,  '2025-03-18', 'Em andamento'),
(8,  '2025-03-16', 'Enviado'),
(9,  '2025-03-27', 'Em processamento'),
(10, '2025-03-23', 'Cancelado');

-- Itens_Pedido
INSERT INTO Itens_Pedido (id_pedido, id_produto, quantidade) VALUES
(1,  1,  1),
(2,  2,  2),
(3,  3,  1),
(4,  4,  1),
(5,  5,  2),
(6,  6,  1),
(7,  7,  1),
(8,  8,  2),
(9,  9,  1),
(10, 10, 1);

-- Pagamentos
INSERT INTO Pagamentos (id_pedido, forma_pagamento, valor, data_pagamento) VALUES
(1,  'Cartão de Crédito', 3500.00, '2025-03-25'),
(2,  'Boleto',            5600.00, '2025-03-20'),
(3,  'Pix',               250.00,  '2025-03-15'),
(4,  'Cartão de Débito',  150.00,  '2025-03-22'),
(5,  'Cartão de Crédito', 1800.00, '2025-03-28'),
(6,  'Pix',               1200.00, '2025-03-19'),
(7,  'Boleto',            600.00,  '2025-03-18'),
(8,  'Cartão de Débito',  800.00,  '2025-03-16'),
(9,  'Pix',               300.00,  '2025-03-27'),
(10, 'Cartão de Crédito', 350.00,  '2025-03-23');

-- Entregas
INSERT INTO Entregas (id_pedido, endereco, status, data_envio, data_entrega) VALUES
(1,  'Rua A, 123', 'A caminho',        '2025-03-26', NULL),
(2,  'Rua B, 456', 'Entregue',         '2025-03-21', '2025-03-22'),
(3,  'Rua C, 789', 'Cancelado',        NULL,         NULL),
(4,  'Rua D, 101', 'Entregue',         '2025-03-23', '2025-03-24'),
(5,  'Rua E, 202', 'Em processamento', NULL,         NULL),
(6,  'Rua F, 303', 'Entregue',         '2025-03-20', '2025-03-21'),
(7,  'Rua G, 404', 'A caminho',        '2025-03-19', NULL),
(8,  'Rua H, 505', 'Entregue',         '2025-03-17', '2025-03-18'),
(9,  'Rua I, 606', 'Em processamento', NULL,         NULL),
(10, 'Rua J, 707', 'Cancelado',        NULL,         NULL);

-- Avaliações
INSERT INTO Avaliacoes (id_usuario, id_produto, nota, comentario) VALUES
(1,  1,  4.5,   'Ótimo notebook, desempenho excelente!'),
(2,  2,  4.0,   'Smartphone rápido e câmera boa.'),
(3,  3,  5.0,   'Teclado incrível, muito confortável.'),
(4,  4,  4.2,   'Mouse confortável, mas poderia ter mais botões.'),
(5,  5,  4.8,   'Monitor de alta qualidade, adorei!'),
(6,  6,  4.6,   'Cadeira muito confortável!'),
(7,  7,  4.1,   'Boa impressora, mas um pouco lenta.'),
(8,  8,  5.0,   'Som excelente, cancelamento de ruído perfeito!'),
(9,  9,  4.0,   'Relógio inteligente muito funcional.'),
(10, 10, 4.3,   'Bom HD externo, armazenamento ótimo.');

-- Fornecedores
INSERT INTO `Fornecedores` (nome, contato) VALUES
('Terabyte', 'terabyte@email.com'),
('Kabum', 'kabum@email.com'),
('Pichau', 'pichau@email.com');