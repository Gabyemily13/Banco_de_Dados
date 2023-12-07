-- Criar tabela de pneus
CREATE TABLE Pneus (
    NumeroSerie INTEGER PRIMARY KEY,
    Marca TEXT,
    Modelo TEXT,
    Dimensoes TEXT,
    QuantidadeEmEstoque INTEGER
);

-- Inserir dados aleatórios na tabela de pneus
INSERT INTO Pneus (Marca, Modelo, Dimensoes, QuantidadeEmEstoque) VALUES
    ('Michelin', 'Pilot Sport', '225/45 R17', 50),
    ('Goodyear', 'Eagle F1', '205/55 R16', 40),
    ('Bridgestone', 'Potenza', '245/40 R18', 30),
    ('Continental', 'ContiSportContact', '255/35 R19', 60);

-- Criar tabela de clientes
CREATE TABLE Clientes (
    CPF INTEGER PRIMARY KEY,
    Nome TEXT,
    Telefone TEXT,
    Endereco TEXT
);

-- Inserir dados aleatórios na tabela de clientes
INSERT INTO Clientes (Nome, CPF, Telefone, Endereco) VALUES
    ('João da Silva', 12345678901, '(11) 98765-4321', 'Rua A, 123'),
    ('Maria Oliveira', 98765432109, '(21) 99999-8888', 'Av. B, 456'),
    ('Carlos Santos', 34567890123, '(31) 55555-7777', 'Rua C, 789');

-- Criar tabela de serviços
CREATE TABLE Servicos (
    NumeroOrdemServico INTEGER PRIMARY KEY,
    DataRealizacao DATE,
    Valor REAL,
    ClienteCPF INTEGER,
    FOREIGN KEY (ClienteCPF) REFERENCES Clientes(CPF)
);

-- Inserir dados aleatórios na tabela de serviços
INSERT INTO Servicos (DataRealizacao, Valor, ClienteCPF) VALUES
    ('2023-01-15', 150.00, 12345678901),
    ('2023-02-20', 200.50, 98765432109),
    ('2023-03-25', 120.75, 34567890123);

-- Criar tabela de pneus trocados em cada serviço
CREATE TABLE PneusTrocados (
    NumeroOrdemServico INTEGER,
    NumeroSeriePneu INTEGER,
    PRIMARY KEY (NumeroOrdemServico, NumeroSeriePneu),
    FOREIGN KEY (NumeroOrdemServico) REFERENCES Servicos(NumeroOrdemServico),
    FOREIGN KEY (NumeroSeriePneu) REFERENCES Pneus(NumeroSerie)
);

-- Inserir dados aleatórios na tabela de pneus trocados
INSERT INTO PneusTrocados (NumeroOrdemServico, NumeroSeriePneu) VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (3, 4);