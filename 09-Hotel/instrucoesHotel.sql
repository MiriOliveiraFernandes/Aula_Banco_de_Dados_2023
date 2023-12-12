------------------------------------------------------------------------------------------------------------
--Tópico 2
CREATE TABLE "tb_hospede"(
	hospede_id INTEGER,
	nome TEXT NOT NULL,
	documento TEXT NOT NULL,
	telefone TEXT NOT NULL,
	PRIMARY KEY("hospede_id" AUTOINCREMENT)
);

CREATE TABLE "tb_quarto"(
	quarto_id INTEGER,
	tipo TEXT NOT NULL,
	preco_diaria TEXT NOT NULL,
	status TEXT NOT NULL,
	PRIMARY KEY("quarto_id" AUTOINCREMENT)
);

CREATE TABLE "tb_reserva"(
	reserva_id INTEGER,
	hospede_id INTEGER NOT NULL,
	quarto_id INTEGER NOT NULL,
	data_entrada TEXT NOT NULL,
	data_saida TEXT NOT NULL,
	PRIMARY KEY("reserva_id" AUTOINCREMENT),
	FOREIGN KEY("hospede_id")REFERENCES tb_hospede("hospede_id"),
	FOREIGN KEY("quarto_id")REFERENCES tb_quarto("quarto_id")
);
------------------------------------------------------------------------------------------------------------
--Tópico 3/4
INSERT INTO tb_hospede (nome, documento, telefone)
VALUES
('João Silva', '123456789', '555-1234'),
('Maria Oliveira', '987654321', '555-5678'),
('Carlos Pereira', '111222333', '555-9012'),
('Ana Souza', '444555666', '555-3456'),
('Pedro Santos', '777888999', '555-7890'),
('Laura Costa', '333222111', '555-2345'),
('Felipe Mendes', '999888777', '555-6789'),
('Amanda Lima', '666777888', '555-0123');

INSERT INTO tb_quarto (tipo, preco_diaria, status)
VALUES
('Standard', '100.00', 'Disponível'),
('Luxo', '200.00', 'Ocupado'),
('Suite', '300.00', 'Disponível'),
('Econômico', '80.00', 'Disponível'),
('Presidencial', '500.00', 'Ocupado'),
('Deluxe', '250.00', 'Disponível'),
('Quarto Familiar', '180.00', 'Ocupado'),
('Cabana na Praia', '350.00', 'Disponível');

INSERT INTO tb_reserva (hospede_id, quarto_id, data_entrada, data_saida)
VALUES
(1, 3, '2023-01-01', '2023-01-05'),
(2, 5, '2023-02-15', '2023-02-20'),
(3, 2, '2023-03-10', '2023-03-15'),
(4, 7, '2023-04-05', '2023-04-10'),
(5, 1, '2023-05-20', '2023-05-25'),
(6, 4, '2023-06-15', '2023-06-20'),
(7, 8, '2023-07-01', '2023-07-05'),
(8, 5, '2023-08-10', '2023-08-15'),
(2, 6, '2023-09-05', '2023-09-10'),
(3, 7, '2023-10-20', '2023-10-25');

------------------------------------------------------------------------------------------------------------
--Tópico 5
SELECT * FROM tb_hospede WHERE "documento" = "123456789"
SELECT * FROM tb_hospede WHERE "hospede_id" = "6"

------------------------------------------------------------------------------------------------------------
--Tópico 6
SELECT * FROM tb_quarto WHERE "tipo" = "Presidencial"
SELECT * FROM tb_quarto WHERE "preco_diaria" > "200.00"
SELECT * FROM tb_quarto WHERE "status" = "Disponível";

------------------------------------------------------------------------------------------------------------
--Tópico 7
SELECT
	tb_reserva.reserva_id,
	tb_hospede.nome,
	tb_hospede.documento,
	tb_quarto.tipo,
	tb_quarto.preco_diaria,
	tb_quarto.status,
	tb_reserva.data_entrada,
	tb_reserva.data_saida
FROM
	tb_reserva
INNER JOIN
	tb_hospede ON tb_reserva.hospede_id = tb_hospede.hospede_id
INNER JOIN
	tb_quarto ON tb_reserva.quarto_id = tb_quarto.quarto_id;

------------------------------------------------------------------------------------------------------------
--Tópico 8
SELECT
	tb_reserva.reserva_id,
	tb_hospede.nome,
	tb_hospede.documento,
	tb_quarto.tipo,
	tb_quarto.preco_diaria,
	tb_quarto.status,
	tb_reserva.data_entrada,
	tb_reserva.data_saida
FROM
	tb_reserva
INNER JOIN
	tb_hospede ON tb_reserva.hospede_id = tb_hospede.hospede_id
INNER JOIN
	tb_quarto ON tb_reserva.quarto_id = tb_quarto.quarto_id WHERE tb_quarto.status = "Ocupado";
	
------------------------------------------------------------------------------------------------------------
--Tópico 9	
UPDATE tb_hospede
SET telefone = '555-1234'
WHERE hospede_id = 1;

UPDATE tb_hospede
SET telefone = '666-7894'
WHERE hospede_id = 3;

UPDATE tb_hospede
SET telefone = '333-7532'
WHERE hospede_id = 5;

UPDATE tb_hospede
SET telefone = '222-1597'
WHERE hospede_id = 7;

UPDATE tb_hospede
SET telefone = '777-4568'
WHERE hospede_id = 4;	

------------------------------------------------------------------------------------------------------------
--Tópico 10	
UPDATE tb_quarto
SET preco_diaria = '1.000'
WHERE quarto_id = 5;

UPDATE tb_quarto
SET preco_diaria = '900'
WHERE quarto_id = 2;

UPDATE tb_quarto
SET preco_diaria = '800'
WHERE quarto_id = 4;

UPDATE tb_quarto
SET preco_diaria = '700'
WHERE quarto_id = 3;

UPDATE tb_quarto
SET preco_diaria = '600'
WHERE quarto_id = 1;

------------------------------------------------------------------------------------------------------------
--Tópico 11
DELETE FROM tb_reserva
WHERE reserva_id = 2;

DELETE FROM tb_reserva
WHERE reserva_id = 4;

DELETE FROM tb_reserva
WHERE reserva_id = 6;

DELETE FROM tb_reserva
WHERE reserva_id = 8;

DELETE FROM tb_reserva
WHERE reserva_id = 10;
