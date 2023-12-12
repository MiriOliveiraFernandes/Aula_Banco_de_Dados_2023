--Tópico 2--
CREATE TABLE "tb_produto"(
	produto_id INTEGER,
	nome TEXT NOT NULL,
	tipo TEXT NOT NULL,
	preco TEXT NOT NULL,
	descricao TEXT,
	PRIMARY KEY("produto_id" AUTOINCREMENT)
);

CREATE TABLE "tb_mesa"(
	mesa_id INTEGER,
	numero TEXT NOT NULL,
	capacidade INTEGER NOT NULL,
	PRIMARY KEY("mesa_id" AUTOINCREMENT)
);

CREATE TABLE "tb_cliente"(
	cliente_id INTEGER,
	nome TEXT NOT NULL,
	telefone TEXT ,
	email TEXT
	PRIMARY KEY("cliente_id" AUTOINCREMENT)
);

CREATE TABLE "tb_pedido" (
	pedido_id INTEGER,
	mesa_id INTEGER,
	produto_id INTEGER,
	cliente_id INTEGER, 
	quantidade TEXT NOT NULL,
	total TEXT NOT NULL,
	PRIMARY KEY("pedido_id" AUTOINCREMENT),
	FOREIGN KEY("mesa_id") REFERENCES tb_mesa ("mesa_id"),
	FOREIGN KEY("produto_id") REFERENCES tb_produto("produto_id_id"),
	FOREIGN KEY("cliente_id") REFERENCES tb_cliente ("cliente_id"),
	
);
---------------------------------------------------------------------------------------------------------------
--Tópico 3--
INSERT INTO "tb_cliente" ( nome, telefone, email)
VALUES
	("Giovanna Ferreira" , "12345-6789", "queijo@gmail.com"),
	("Ana Luiza" , "98765 - 4321", "presunto@gmail.com"),
	("Catarina" , "88997-7665", "frango@gmail.com"),
	("Geovanna Campos" , "11111-1111", "lasanha@gmail.com"),
	("Estela" , "22222-2222", "strogonoff@gmail.com"),
	("Denis Holanda" , "33333-3333", "chocolate@gmail.com"),
	("Amanda Ferreira" , "44444-4444", "macarrao@gmail.com"),
	("Suellen Ferreira" , "55555-5555", "pastel@gmail.com"),
	("Samantha Alves" , "66666-6666", "canjica@gmail.com"),
	("Rafel Gino" , "77777-7777", "pizza@gmail.com");
	
INSERT INTO "tb_produto" (nome, tipo, preco, descricao) 
VALUES
		("Bacalhau as Natas", "prato principal", "R$ 80,00"," Bacalhau com nata" ),
		("Frango Marroquino/Coca-cola", "bebida/prato principal", "R$ 75,00"," Combo de Frango Marroquino com 
		Coca-cola" ),
		("Bolo de Chocolate", "Sobremesa", "R$ 20,00"," Bolo com massa de chocolate" ),
		("Sprit", "bebida", "R$ 5,00"," Refrigerante" ),
		("Herissé", "prato principal", "R$ 45,00", "Herissé" ),
		("bolo de festa", "sobremesa", "R$ 15,00", "bolo de festa" ),
		("Torta de Frango", "prato principal", "R$ 120,00", "Torta de Frango"),
		("Frango Oriental", "prato principal", "R$ 60,00", "Frango Oriental"),
		("Frango Marroquino", "prato principal", "R$ 60,00", "Frango Marroquino"),
		("Coca-Cola", "bebida", "R$ 6,00", "Coca-Cola");
	
INSERT INTO "tb_mesa" (numero, capacidade) 
VALUES
	(1, 5),
	(2, 4),
	(3,6),
	(4,2),
	(5,5),
	(6,4),
	(7,5),
	(8,4),
	(9,4),
	(10,4);
	
INSERT INTO "tb_pedido" (cliente_id, mesa_id, produto_id, quantidade, total)
VALUES
	(1,1,1,5,400),
	(2,2,2,6,375),
	(3,3,3,7,140),
	(4,4,4,8,40),
	(5,5,5,9,405),
	(6,6,6,10,450),
	(7,7,7,1,120),
	(8,8,8,2,120),
	(9,9,9,3,180),
	(10,10,10,4,600);
---------------------------------------------------------------------------------------------------------------
-- procurando o produto pelo tipo --
SELECT * FROM tb_produto WHERE tipo = "prato principal";

--procurando a mesa pelo número da mesa
SELECT * FROM tb_mesa wHERE numero = 5;

--consunta do produto
SELECT nome,tipo, preco FROM tb_produto;
---------------------------------------------------------------------------------------------------------------
--procurando mesa
SELECT * FROM tb_mesa WHERE capacidade = 4;
SELECT * FROM tb_mesa WHERE capacidade > 3;
---------------------------------------------------------------------------------------------------------------
--Usando INNER JOIN
SELECT
	tb_pedido.pedido_id,
	tb_cliente.nome AS "NOME CLIENTE",
	tb_produto.nome,
	tb_produto.tipo,
	tb_produto.preco,
	tb_mesa.capacidade,
	tb_mesa.numero,
	tb_pedido.quantidade,
	tb_pedido.total
FROM
	tb_pedido
INNER JOIN
	tb_produto ON tb_pedido.produto_id = tb_produto.produto_id
INNER JOIN
	tb_mesa ON tb_pedido.mesa_id = tb_mesa.mesa_id
INNER JOIN
	tb_cliente ON tb_pedido.cliente_id = tb_cliente.cliente_id;

---------------------------------------------------------------------------------------------------------------
-- Tópico 8
SELECT
	tb_pedido.pedido_id,
	tb_cliente.nome AS "NOME CLIENTE",
	tb_produto.nome,
	tb_produto.tipo,
	tb_produto.preco,
	tb_mesa.capacidade,
	tb_mesa.numero,
	tb_pedido.quantidade,
	tb_pedido.total
FROM
	tb_pedido
INNER JOIN
	tb_produto ON tb_pedido.produto_id = tb_produto.produto_id
INNER JOIN
	tb_mesa ON tb_pedido.mesa_id = tb_mesa.mesa_id
INNER JOIN
	tb_cliente ON tb_pedido.cliente_id = tb_cliente.cliente_id
WHERE
	tb_pedido.total = "120";
	
---------------------------------------------------------------------------------------------------------------
--Tópico 9
SELECT
	tb_pedido.pedido_id,
	tb_cliente.nome AS "NOME CLIENTE",
	tb_produto.nome,
	tb_produto.tipo,
	tb_produto.preco,
	tb_mesa.capacidade,
	tb_mesa.numero,
	tb_pedido.quantidade,
	tb_pedido.total
FROM
	tb_pedido
INNER JOIN
	tb_produto ON tb_pedido.produto_id = tb_produto.produto_id
INNER JOIN
	tb_mesa ON tb_pedido.mesa_id = tb_mesa.mesa_id
INNER JOIN
	tb_cliente ON tb_pedido.cliente_id = tb_cliente.cliente_id
WHERE
	tb_pedido.total > "120";
	
---------------------------------------------------------------------------------------------------------------
--Tópico 10
UPDATE tb_produto
SET nome = "Bobotie"
WHERE produto_id = 1;

UPDATE tb_produto
SET nome = " Pudim de Malva "
WHERE produto_id = 3;

UPDATE tb_produto
SET nome = " Bunny Chow"
WHERE produto_id = 5;

UPDATE tb_produto
SET nome = "  Arroz Jollof"
WHERE produto_id = 7;

UPDATE tb_produto
SET nome = " Acarajé"
WHERE produto_id = 9;

---------------------------------------------------------------------------------------------------------------
--Tópico 11
UPDATE tb_mesa
SET capacidade = 2
WHERE mesa_id = 2;

UPDATE tb_mesa
SET capacidade = 5
WHERE mesa_id = 4;

UPDATE tb_mesa
SET capacidade = 8
WHERE mesa_id = 6;

UPDATE tb_mesa
SET capacidade = 11
WHERE mesa_id = 8;

UPDATE tb_mesa
SET capacidade = 3
WHERE mesa_id = 10;

---------------------------------------------------------------------------------------------------------------
--Tópico 12
DELETE FROM tb_pedido WHERE pedido_id = 2;
DELETE FROM tb_pedido WHERE pedido_id = 4;
DELETE FROM tb_pedido WHERE pedido_id = 6;
DELETE FROM tb_pedido WHERE pedido_id = 8;
DELETE FROM tb_pedido WHERE pedido_id = 10;

---------------------------------------------------------------------------------------------------------------
--Usando o comando SUM()
SELECT sum(capacidade) AS "Capacidade Total do Restaurante" FROM tb_mesa;
-- Usando o comando ORDER BY
SELECT * FROM tb_cliente ORDER BY nome ASC;
--Usando o comando COUNT()
SELECT count() AS "Quantidade de pedidos" FROM tb_pedido;
--Usando o comando BETWEEN
SELECT * FROM tb_produto WHERE produto_id BETWEEN 2 AND 5;