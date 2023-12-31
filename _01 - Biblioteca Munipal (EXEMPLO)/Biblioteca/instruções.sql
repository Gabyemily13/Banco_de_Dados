-- Tabela de Livros
CREATE TABLE Livros (
    codigo_catalogacao INTEGER PRIMARY KEY,
    titulo TEXT,
    autor TEXT,
    editora TEXT,
    ano_publicacao INTEGER,
    exemplares_disponiveis INTEGER
);

-- Tabela de Usuários
CREATE TABLE Usuarios (
    numero_matricula INTEGER PRIMARY KEY,
    nome TEXT,
    telefone TEXT,
    endereco TEXT
);

-- Tabela de Empréstimos
CREATE TABLE Emprestimos (
    id_emprestimo INTEGER PRIMARY KEY,
    livro_codigo_catalogacao INTEGER,
    usuario_matricula INTEGER,
    data_retirada DATE,
    data_devolucao_prevista DATE,
    FOREIGN KEY (livro_codigo_catalogacao) REFERENCES Livros(codigo_catalogacao),
    FOREIGN KEY (usuario_matricula) REFERENCES Usuarios(numero_matricula)
);

-- Inserir dados na tabela Livros
INSERT INTO Livros (codigo_catalogacao, titulo, autor, editora, ano_publicacao, exemplares_disponiveis)
VALUES
    (1, 'O Senhor dos Anéis', 'J.R.R. Tolkien', 'Editora ABC', 1954, 10),
    (2, '1984', 'George Orwell', 'Editora XYZ', 1949, 8),
    (3, 'Dom Quixote', 'Miguel de Cervantes', 'Editora QWE', 1605, 12);

-- Inserir dados na tabela Usuarios
INSERT INTO Usuarios (numero_matricula, nome, telefone, endereco)
VALUES
    (101, 'Maria Silva', '(11) 98765-4321', 'Rua das Flores, 123'),
    (102, 'João Oliveira', '(11) 91234-5678', 'Avenida Principal, 456'),
    (103, 'Ana Santos', '(11) 93333-4444', 'Praça Central, 789');

-- Inserir dados na tabela Emprestimos
INSERT INTO Emprestimos (livro_codigo_catalogacao, usuario_matricula, data_retirada, data_devolucao_prevista)
VALUES
    (1, 101, '2023-11-01', '2023-11-15'),
    (2, 102, '2023-11-02', '2023-11-16'),
    (3, 103, '2023-11-03', '2023-11-17');