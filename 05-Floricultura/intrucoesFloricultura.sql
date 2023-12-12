--Criando tabelas
CREATE TABLE "tb_flor"(
	flor_id INTEGER,
	nomeCientifico TEXT NOT NULL,
	nomePopular TEXT NOT NULL,
	preco TEXT NOT  NULL,
	PRIMARY KEY ("flor_id" AUTOINCREMENT)
);

CREATE TABLE "tb_estoque"(
	estoque_id INTEGER,
	flor_id INTEGER,
	quantidade INTEGER NOT NULL,
	cor TEXT NOT NULL,
	PRIMARY KEY("estoque_id" AUTOINCREMENT),
	FOREIGN KEY("flor_id")REFERENCES tb_flor("flor_id")
);

CREATE TABLE "tb_cliente"(
	cliente_id INTEGER,
	"nome"	TEXT NOT NULL,
	"cpf" TEXT  NOT NULL,
	"telefone"	TEXT  NOT NULL,
	"rua"	TEXT  NOT NULL,
	"numero"	TEXT  NOT NULL,
	"cep"	TEXT,
	"complemento"	TEXT,
	"bairro"	TEXT  NOT NULL,
	"cidade"	TEXT  NOT NULL,
	"estado"	TEXT  NOT NULL,
	PRIMARY KEY("cliente_id" AUTOINCREMENT)
);

CREATE TABLE "tb_pedido"(
	pedido_id INTEGER,
	flor_id INTEGER NOT NULL,
	cliente_id INTEGER NOT NULL,
	numeroPedido INTEGER NOT NULL,
	dataRealizacao TEXT NOT NULL,
	valorTotal TEXT NOT NULL,
	quantidade INTEGER NOT NULL,
	dataEntrega TEXT NOT NULL,
	horario TEXT NOT NULL,
	PRIMARY KEY("pedido_id" AUTOINCREMENT),
	FOREIGN KEY("flor_id") REFERENCES tb_flor("flor_id"),
	FOREIGN KEY("cliente_id") REFERENCES tb_cliente("cliente_id"
);

-------------------------------------------------------------
--Populando tabelas
INSERT INTO tb_flor (nomeCientifico, nomePopular, preco)
	VALUES
	('Rosa gallica', 'Rosa', '10.00'),
	('Lilium candidum', 'Lírio', '15.50'),
	('Tulipa gesneriana', 'Tulipa', '8.75'),
	('Orchidaceae', 'Orquídea', '20.00'),
	('Campanula medium', 'Campânula', '12.30'),
	('Dianthus caryophyllus', 'Cravo', '7.90'),
	('Iris germanica', 'Íris', '18.25'),
	('Chrysanthemum morifolium', 'Crisântemo', '9.60'),
	('Gerbera jamesonii', 'Gerbera', '14.75'),
	('Anthurium andraeanum', 'Antúrio', '22.50');
	

INSERT INTO tb_estoque (flor_id, quantidade, cor)
	VALUES
	(1, 50, 'Vermelho'),
	(2, 30, 'Branco'),
	(3, 40, 'Amarelo'),
	(4, 25, 'Roxo'),
	(5, 60, 'Azul'),
	(6, 35, 'Rosa'),
	(7, 45, 'Laranja'),
	(8, 20, 'Amarelo'),
	(9, 55, 'Vermelho'),
	(10, 28, 'Branco');


INSERT INTO tb_cliente (nome, cpf, telefone, rua, numero, cep, complemento, bairro, cidade, estado)
	VALUES
	('João Silva', '123.456.789-01', '(55) 1234-5678', 'Rua das Flores', '123', '12345-678', 'Apto 101', 'Centro', 'Cidade A', 'Estado A'),
	('Maria Oliveira', '987.654.321-02', '(55) 2345-6789', 'Avenida Principal', '456', '23456-789', 'Casa', 'Bairro B', 'Cidade B', 'Estado B'),
	('Carlos Pereira', '111.222.333-03', '(55) 3456-7890', 'Rua das Árvores', '789', '34567-890', 'Sala 3', 'Bairro C', 'Cidade C', 'Estado C'),
	('Ana Souza', '444.555.666-04', '(55) 4567-8901', 'Travessa do Lago', '321', '45678-901', 'Cobertura', 'Bairro D', 'Cidade D', 'Estado D'),
	('Pedro Santos', '777.888.999-05', '(55) 5678-9012', 'Avenida dos Ventos', '654', '56789-012', 'Casa 2', 'Bairro E', 'Cidade E', 'Estado E'),
	('Laura Costa', '333.222.111-06', '(55) 6789-0123', 'Rua da Praia', '987', '67890-123', 'Loja 1', 'Bairro F', 'Cidade F', 'Estado F'),
	('Felipe Mendes', '999.888.777-07', '(55) 7890-1234', 'Avenida da Montanha', '654', '78901-234', 'Sala 5', 'Bairro G', 'Cidade G', 'Estado G'),
	('Amanda Lima', '666.777.888-08', '(55) 8901-2345', 'Travessa das Colinas', '321', '89012-345', 'Casa 3', 'Bairro H', 'Cidade H', 'Estado H'),
	('Gustavo Rocha', '222.333.444-09', '(55) 9012-3456', 'Rua do Campo', '987', '90123-456', 'Apartamento 7', 'Bairro I', 'Cidade I', 'Estado I'),
	('Juliana Oliveira', '555.666.777-10', '(55) 0123-4567', 'Avenida do Sol', '654', '01234-567', 'Cobertura 2', 'Bairro J', 'Cidade J', 'Estado J');


INSERT INTO tb_pedido (flor_id, cliente_id, numeroPedido, dataRealizacao, valorTotal, quantidade, dataEntrega, horario)
	VALUES
	(1, 1, 1001, '2023-01-01', '50.00', 10, '2023-01-10', '14:00'),
	(2, 2, 1002, '2023-02-15', '75.00', 15, '2023-02-20', '16:30'),
	(3, 3, 1003, '2023-03-10', '30.00', 5, '2023-03-15', '12:00'),
	(4, 4, 1004, '2023-04-05', '120.00', 24, '2023-04-10', '10:00'),
	(5, 5, 1005, '2023-05-20', '90.00', 18, '2023-05-25', '15:45'),
	(6, 6, 1006, '2023-06-15', '60.00', 12, '2023-06-20', '13:30'),
	(7, 7, 1007, '2023-07-01', '45.00', 9, '2023-07-05', '11:15'),
	(8, 8, 1008, '2023-08-10', '105.00', 21, '2023-08-15', '09:30'),
	(9, 9, 1009, '2023-09-05', '70.00', 14, '2023-09-10', '17:00'),
	(10, 10, 1010, '2023-10-20', '180.00', 36, '2023-10-25', '18:45');