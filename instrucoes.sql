´	-- criando tabela
CREATE TABLE "tb_reserva" (
	reserva_id INTEGER,
	passageiro_id INTEGER NOT NULL,
	voo_id INTEGER NOT NULL,
	numeroAcento TEXT NOT NULL,
	PRIMARY KEY("reserva_id" AUTOINCREMENT),
	FOREIGN KEY("passageiro_id") REFERENCES tb_passageiro ("passageiro_id"),
	FOREIGN KEY("voo_id") REFERENCES tb_voo (" voo_id")
	
);
CREATE TABLE tb_passageiro(
	passageiro_id INTEGER,
	nome TEXT NOT NULL,
	cpf TEXT NOT NULL,
	dataNascimento TEXT NOT NULL,
	telefone1 TEXT NOT NULL,
	telefone2 TEXT NOT NULL,
	rua TEXT NOT NULL,
	cep TEXT,
	complemento TEXT,
	bairro TEXT NOT NULL,
	cidade TEXT NOT NULL,
	estado TEXT NOT NULL,
	PRIMARY KEY("passageiro_id" AUTOINCREMENT)
);

CREATE TABLE tb_voo(
	voo_id INTEGER,
	origem TEXT NOT NULL,
	destino TEXT NOT NULL,
	rota TEXT NOT NULL,
	especificacao TEXT NOT NULL,
	modelo TEXT NOT NULL,
	PRIMARY KEY ("voo_id" AUTOINCREMENT)
	
);


--populando
INSERT INTO tb_passageiro ( nome, cpf, dataNascimento, telefone1,rua, cep, complemento,bairro,cidade, estado)
VALUES
    ('Pedro Almeida','11111111111','26/12/2006', '7777-8888', 'Rua D', '1010', 'Apto 5', 'Jardim Primavera', 'Porto Alegre', 'RS'),
    ('Ana Souza','22222222222','27/12/2006' ,'3333-2222', 'Rua E', '222', 'Casa 7', 'Centro', 'Curitiba', 'PR'),
    ('Carlos Lima', '3333333333','01/11/2005','5555-4444', 'Rua F', '4567', 'Sala 10', 'Bairro Novo', 'Belo Horizonte', 'MG'),
    ('Mariana Costa','44444444444','06/09/2006' ,'2222-1111', 'Rua G', '7890', 'Casa 1', 'Vila Feliz', 'Rio de Janeiro', 'RJ'),
    ('Lucas Ferreira','5555555555','01/08/2006', '4444-3333', 'Rua H', '6543', 'Apto 3', 'Bairro Novo', 'Belo Horizonte', 'MG');
	

	
INSERT INTO tb_voo (origem, destino, rota, especificacao, modelo)
VALUES
('Nova York', 'Los Angeles', 'NYC-LAX', 'Voo doméstico', 'Boeing 737'),
('Paris', 'Tóquio', 'CDG-NRT', 'Voo internacional', 'Airbus A380'),
('Londres', 'Sydney', 'LHR-SYD', 'Voo internacional', 'Boeing 777'),
('Pequim', 'Roma', 'PEK-FCO', 'Voo internacional', 'Airbus A330'),
('Dubai', 'Cidade do México', 'DXB-MEX', 'Voo internacional', 'Boeing 787');


INSERT INTO tb_reserva (passageiro_id, voo_id, numeroAcento)
VALUES
(1, 1, 'A1'),
(2, 2, 'B3'),
(3, 3, 'C5'),
(4, 4, 'D7'),
(5, 5, 'E9');
