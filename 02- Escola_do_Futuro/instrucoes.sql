-- Criação da tabela de Alunos
CREATE TABLE tb_aluno (
    aluno_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    cpf TEXT NOT NULL UNIQUE,
    rg TEXT NOT NULL,
    data_nascimento DATE NOT NULL,
    endereco TEXT NOT NULL
);

-- Criação da tabela de Cursos
CREATE TABLE tb_curso (
    curso_id INTEGER PRIMARY KEY AUTOINCREMENT,
    codigo_identificacao TEXT NOT NULL UNIQUE,
    nome TEXT NOT NULL,
    carga_horaria INTEGER NOT NULL
);

-- Criação da tabela de Professores
CREATE TABLE tb_professor (
    professor_id INTEGER PRIMARY KEY AUTOINCREMENT,
    numero_registro TEXT NOT NULL UNIQUE,
    nome TEXT NOT NULL,
    especialidade TEXT NOT NULL,
    contato TEXT NOT NULL
);

-- Criação da tabela de Matrículas
CREATE TABLE tb_matricula (
    matricula_id INTEGER PRIMARY KEY AUTOINCREMENT,
    aluno_id INTEGER,
    curso_id INTEGER,
    numero_matricula TEXT NOT NULL,
    n1 REAL,
    n2 REAL,
    n3 REAL,
    n4 REAL,
    FOREIGN KEY(aluno_id) REFERENCES tb_aluno(aluno_id),
    FOREIGN KEY(curso_id) REFERENCES tb_curso(curso_id)
);

-----------------------------------------------------------------------------------
--Inserindo dados
INSERT INTO tb_aluno (nome, cpf, rg, data_nascimento, endereco)
VALUES
('João Silva', '123.456.789-01', '1234567', '2000-01-01', 'Rua das Flores, 123'),
('Maria Oliveira', '987.654.321-02', '7654321', '1999-02-15', 'Avenida Principal, 456'),
('Carlos Pereira', '111.222.333-03', '1122333', '1998-03-10', 'Rua das Árvores, 789'),
('Ana Souza', '444.555.666-04', '4455666', '1997-04-05', 'Travessa do Lago, 321'),
('Pedro Santos', '777.888.999-05', '7788999', '1996-05-20', 'Avenida dos Ventos, 654');

INSERT INTO tb_curso (codigo_identificacao, nome, carga_horaria)
VALUES
('INF101', 'Informática', 120),
('ING102', 'Inglês', 80),
('ADM103', 'Administração', 100),
('MAT104', 'Matemática', 90),
('ART105', 'Arte', 60);

-- Inserção de dados na tabela tb_professor
INSERT INTO tb_professor (numero_registro, nome, especialidade, contato)
VALUES
('P001', 'Prof. Carlos', 'Informática', '123-4567'),
('P002', 'Prof. Ana', 'Inglês', '987-6543'),
('P003', 'Prof. Maria', 'Administração', '111-2222'),
('P004', 'Prof. João', 'Matemática', '555-1234'),
('P005', 'Prof. Laura', 'Arte', '999-8888');

INSERT INTO tb_matricula (aluno_id, curso_id, numero_matricula, n1, n2, n3, n4)
VALUES
(1, 1, 'M101', 8.5, 7.5, 9.0, 8.0),
(2, 2, 'M102', 9.0, 8.0, 9.5, 8.5),
(3, 3, 'M103', 7.5, 8.0, 7.0, 8.0);
