--Criando tabelas---
	
	CREATE TABLE "tb_cliente" (
	"codigo_cliente"	INTEGER,
	"nome"	TEXT NOT NULL,
	"cpf"	TEXT NOT NULL,
	"telefone"	TEXT NOT NULL,
	"rua"	TEXT,
	"cep"	TEXT,
	"complemento"	TEXT,
	"numero"	TEXT,
	"bairro"	TEXT,
	"cidade"	TEXT,
	"estado"	TEXT,
	PRIMARY KEY("codigo_cliente" AUTOINCREMENT)
);

CREATE TABLE "tb_estoque" (
	"quantidade"	INTEGER
);

CREATE TABLE "tb_pedido" (
	"codigo_cliente"	INTEGER,
	"codigo_pedido"	INTEGER,
	"valor"	TEXT,
	"ordem_de_servico"	INTEGER,
	"data_realizacao"	TEXT,
	CONSTRAINT "codigo_cliente" FOREIGN KEY("codigo_cliente") REFERENCES "tb_pedido"("codigo_cliente"),
	PRIMARY KEY("codigo_pedido" AUTOINCREMENT)
);

CREATE TABLE "tb_pneu" (
	"codigo_pedido"	INTEGER,
	"numero_de_serie"	INTEGER,
	"marca"	TEXT,
	"modelo"	TEXT,
	"dimensoes"	text,
	PRIMARY KEY("numero_de_serie" AUTOINCREMENT),
	CONSTRAINT "codigo_pedido" FOREIGN KEY("codigo_pedido") REFERENCES "tb_pneu"("codigo_pedido")
);

CREATE TABLE "tb_servico" (
	"codigo_pedido"	INTEGER,
	"codigo_servico"	INTEGER,
	"alinhamento"	TEXT,
	"balanciamento"	TEXT,
	"troca_de_pneu"	TEXT,
	CONSTRAINT "codigo_pedido" FOREIGN KEY("codigo_pedido") REFERENCES "tb_pedido"("codigo_pedido"),
	PRIMARY KEY("codigo_servico" AUTOINCREMENT)
);

--Populando as tabelas---
INSERT INTO tb_cliente (nome, cpf,telefone, rua, cep, complemento, numero, bairro, cidade, estado)
VALUES
	('Ana Souza','2222222222', '3333-2222', 'Rua E', '22222-333', 'Casa 7','222',  'Centro', 'Curitiba', 'PR'),
    ('Carlos Lima', '3333333333','5555-4444', 'Rua F', '98765-432','Sala 10','4567',   'Bairro Novo', 'Belo Horizonte', 'MG'),
    ('Mariana Costa', '4444444444','2222-1111', 'Rua G', '12345-678', 'Casa 1', '7890', 'Vila Feliz', 'Rio de Janeiro', 'RJ'),
    ('Lucas Ferreira', '5555555555','4444-3333', 'Rua H', '54321-876', 'Apto 3','6543',  'Bairro Novo', 'Belo Horizonte', 'MG'),
    ('Juliana Oliveira', '6666666666','8888-9999', 'Rua I','98765-432', 'Sala 8','765',   'Jardim Primavera', 'Porto Alegre', 'RS');
	

INSERT INTO tb_estoque (quantidade)
VALUES
	(10),
	(20),
	(35),
	(22),
	(47);
	
INSERT INTO tb_pedido (codigo_cliente, valor, ordem_de_servico, data_realizacao)
VALUES
(1, '100.00', 123, '2023-01-01'),
(2, '150.50', 124, '2023-01-02'),
(1, '75.20', 125, '2023-01-03'),
(3, '200.75', 126, '2023-01-04'),
(2, '120.30', 127, '2023-01-05');

INSERT INTO tb_pneu (codigo_pedido, marca, modelo, dimensoes)
VALUES
(1, 'Michelin', 'Pilot Sport', '225/45R17'),
(2, 'Bridgestone', 'Potenza', '205/55R16'),
(1, 'Goodyear', 'Eagle F1', '235/40R18'),
(3, 'Continental', 'ContiSportContact', '245/50R18'),
(2, 'Pirelli', 'P Zero', '255/35R19');


INSERT INTO tb_servico (codigo_pedido, alinhamento, balanciamento, troca_de_pneu)
VALUES
(1, 'Sim', 'Sim', 'Não'),
(2, 'Sim', 'Sim', 'Sim'),
(1, 'Sim', 'Não', 'Sim'),
(3, 'Não', 'Sim', 'Sim'),
(2, 'Não', 'Sim', 'Não');
	