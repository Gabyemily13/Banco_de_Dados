-- Tabela Produtos
CREATE TABLE tb_produtos (
    produto_id INTEGER PRIMARY KEY,
    nome TEXT,
    tipo TEXT,
    preco DECIMAL(10, 2)
);

-- Inserir registros fictícios em tb_produtos
INSERT INTO tb_produtos (nome, tipo, preco)
VALUES
    ('Pizza Margherita', 'Pizza', 15.99),
    ('Hambúrguer Cheese', 'Hambúrguer', 9.99),
    ('Salada Caesar', 'Salada', 7.49),
    ('Sushi Sashimi', 'Sushi', 19.99),
    ('Lasanha Bolonhesa', 'Massa', 12.99),
    ('Refrigerante Cola', 'Bebida', 2.99),
    ('Tiramisu', 'Sobremesa', 6.99),
    ('Café Espresso', 'Bebida', 1.99);

-- Tabela Mesas
CREATE TABLE Mesas (
    mesa_id INTEGER PRIMARY KEY,
    numero_mesa INTEGER,
    capacidade INTEGER
);

-- Inserir registros fictícios em Mesas
INSERT INTO Mesas (numero_mesa, capacidade)
VALUES
    (1, 4),
    (2, 6),
    (3, 2),
    (4, 8),
    (5, 4),
    (6, 6),
    (7, 2),
    (8, 4);

-- Tabela Pedidos
CREATE TABLE tb_pedidos (
    pedido_id INTEGER PRIMARY KEY,
    mesa_id INTEGER,
    produto_id INTEGER,
    quantidade INTEGER NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (mesa_id) REFERENCES Mesas(mesa_id),
    FOREIGN KEY (produto_id) REFERENCES tb_produtos(produto_id)
);

-- Inserir registros fictícios em tb_pedidos
INSERT INTO tb_pedidos (mesa_id, produto_id, quantidade, total)
VALUES
    (1, 1, 2, 31.98),
    (2, 3, 1, 7.49),
    (3, 6, 3, 8.97),
    (4, 2, 2, 19.98),
    (5, 4, 4, 79.96),
    (6, 5, 1, 12.99),
    (7, 7, 2, 13.98),
    (8, 8, 4, 7.96),
    (1, 3, 2, 14.98),
    (2, 1, 3, 47.97);
