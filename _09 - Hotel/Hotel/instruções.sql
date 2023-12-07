-- Tabela Hospede
CREATE TABLE tb_hospede (
    hospede_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    documento TEXT,
    telefone TEXT
);

-- Tabela Quarto
CREATE TABLE tb_quarto (
    quarto_id INTEGER PRIMARY KEY AUTOINCREMENT,
    tipo TEXT NOT NULL,
    preco_diaria REAL NOT NULL,
    status TEXT NOT NULL
);

-- Tabela Reserva
CREATE TABLE tb_reserva (
    reserva_id INTEGER PRIMARY KEY AUTOINCREMENT,
    hospede_id INTEGER,
    quarto_id INTEGER,
    data_entrada DATE NOT NULL,
    data_saida DATE NOT NULL,
    FOREIGN KEY (hospede_id) REFERENCES tb_hospede(hospede_id),
    FOREIGN KEY (quarto_id) REFERENCES tb_quarto(quarto_id)
);

-- Inserção de registros na tabela tb_hospede
INSERT INTO tb_hospede (nome, documento, telefone) VALUES
    ('Fulano Silva', '123456789', '999-9999'),
    ('Ciclano Oliveira', '987654321', '888-8888'),
    -- Adicione mais registros conforme necessário;

-- Inserção de registros na tabela tb_quarto
INSERT INTO tb_quarto (tipo, preco_diaria, status) VALUES
    ('Simples', 100.00, 'disponível'),
    ('Duplo', 150.00, 'ocupado'),
    -- Adicione mais registros conforme necessário;

-- Inserção de registros na tabela tb_reserva
INSERT INTO tb_reserva (hospede_id, quarto_id, data_entrada, data_saida) VALUES
    (1, 1, '2023-01-01', '2023-01-05'),
    (2, 2, '2023-02-01', '2023-02-10'),
    -- Adicione mais registros conforme necessário;

-- Consulta procurando o hospede pelo documento
SELECT * FROM tb_hospede WHERE documento = '123456789';

-- Consulta procurando o hospede pelo id
SELECT nome, documento, telefone FROM tb_hospede WHERE hospede_id = 1;

-- Consulta procurando quartos por tipo
SELECT * FROM tb_quarto WHERE tipo = 'Simples';

-- Consulta procurando quartos onde o preço da diária é maior que X
SELECT * FROM tb_quarto WHERE preco_diaria > 120.00;

-- Consulta e contagem de quartos disponíveis
SELECT COUNT(*) FROM tb_quarto WHERE status = 'disponível';

-- Exibir todas as informações da tabela Reserva
SELECT tb_hospede.nome, tb_hospede.documento, tb_quarto.tipo, tb_quarto.preco_diaria, tb_quarto.status, tb_reserva.reserva_id, tb_reserva.data_entrada, tb_reserva.data_saida
FROM tb_reserva
INNER JOIN tb_hospede ON tb_reserva.hospede_id = tb_hospede.hospede_id
INNER JOIN tb_quarto ON tb_reserva.quarto_id = tb_quarto.quarto_id;

-- Exibir informações da tabela Reserva para quartos ocupados
SELECT tb_hospede.nome, tb_hospede.documento, tb_quarto.tipo, tb_quarto.preco_diaria, tb_quarto.status, tb_reserva.reserva_id, tb_reserva.data_entrada, tb_reserva.data_saida
FROM tb_reserva
INNER JOIN tb_hospede ON tb_reserva.hospede_id = tb_hospede.hospede_id
INNER JOIN tb_quarto ON tb_reserva.quarto_id = tb_quarto.quarto_id
WHERE tb_quarto.status = 'ocupado';

-- Alterações em registros na tabela Hospede
UPDATE tb_hospede SET telefone = '777-7777' WHERE hospede_id = 1;
-- Repita o comando conforme necessário para alterar outros registros

-- Alterações em registros na tabela Quarto
UPDATE tb_quarto SET preco_diaria = 130.00 WHERE quarto_id = 1;
-- Repita o comando conforme necessário para alterar outros registros

-- Exclusões em registros na tabela Reserva
DELETE FROM tb_reserva WHERE reserva_id = 1;
-- Repita o comando conforme necessário para excluir outros registros



