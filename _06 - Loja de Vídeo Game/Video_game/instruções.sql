CREATE DATABASE loja_videogame;
USE loja_videogame;

-- Tabela Plataformas
CREATE TABLE Plataformas (
    cod_plataforma INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT,
    fabricante TEXT
);

-- Tabela Jogos
CREATE TABLE Jogos (
    cod_jogo INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo TEXT,
    genero TEXT,
    lancamento DATE,
    cod_plataforma INTEGER,
    FOREIGN KEY (cod_plataforma) REFERENCES Plataformas(cod_plataforma)
);
-- Inserir registros na tabela Plataformas
INSERT INTO Plataformas (nome, fabricante) VALUES
    ('PlayStation 5', 'Sony'),
    ('Xbox Series X', 'Microsoft'),
    ('Nintendo Switch', 'Nintendo');

-- Inserir registros na tabela Jogos
INSERT INTO Jogos (titulo, genero, lancamento, cod_plataforma) VALUES
    ('Spider-Man: Miles Morales', 'Ação', '2020-11-12', 1),
    ('Halo Infinite', 'Tiro', '2021-12-08', 2),
    ('The Legend of Zelda: Breath of the Wild', 'Aventura', '2017-03-03', 3);

-- Consulta em uma plataforma específica (por exemplo, PlayStation 5)
SELECT * FROM Jogos WHERE cod_plataforma = 1;

-- Consulta focada em um gênero específico (por exemplo, Aventura)
SELECT * FROM Jogos WHERE genero = 'Aventura';

-- Consulta utilizando INNER JOIN para combinar informações de ambas as tabelas
SELECT Plataformas.nome, Plataformas.fabricante, Jogos.titulo, Jogos.lancamento, Jogos.genero
FROM Plataformas
INNER JOIN Jogos ON Plataformas.cod_plataforma = Jogos.cod_plataforma;

-- Alteração de registros
UPDATE Jogos SET lancamento = '2022-01-01' WHERE cod_jogo IN (1, 3, 5, 7);

-- Exclusão de registros
DELETE FROM Jogos WHERE cod_jogo IN (2, 4, 6, 8);


