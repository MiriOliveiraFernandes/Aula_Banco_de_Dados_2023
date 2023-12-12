-- CRIAR TABELAS
CREATE TABLE "tb_plataforma"(
	"cod_plataforma" INTEGER,
	"nome" TEXT,
	"fabricante" TEXT,
	PRIMARY KEY("cod_plataforma" AUTOINCREMENT)

);

CREATE TABLE "tb_jogo"(

	"cod_jogo" INTEGER,
	"cod_plataforma" INTEGER,
	"titulo" TEXT,
	"genero" TEXT,
	"lancamento" TEXT,
	
	CONSTRAINT "cod_plataforma" FOREIGN KEY("cod_plataforma") REFERENCES "tb_plataforma"("cod_plataforma"),
	PRIMARY KEY ("cod_jogo" AUTOINCREMENT)
	
);

--POPULANDO AS TABELAS

INSERT INTO tb_plataforma (nome, fabricante)
VALUES
	("PlayStation 5", "Sony"),
	("Xbox Series X", "Microsoft"),
	("Nintendo Switch", "Nintendo"),
	("PlayStation 4", "Sony"),
	("Xbox One", "Microsoft"),
	("Wii U", "Nintendo"),
	("PlayStation 3", "Sony"),
	("Xbox 360", "Microsoft"),
	("Nintendo Will", "Nintendo"),
	("PlayStation 2", "Sony");

	
INSERT INTO tb_jogo(cod_plataforma,titulo, genero, lancamento)
VALUES
	(1,"Demon's Sould","RPG","2020-11-12"),
	(2,"Ratchet & Clank: Rift Apart","Ação/Aventura","2021-06-11"),
	(3,"Halo Infinite","FPS","2021-12-08"),
	(4,"Forza Horizon 5","Corrida","2021-11-09"),
	(5,"The Legend of Zelda: Breath of the Wild","Ação/Aventura","2017-03-03"),
	(6,"Animal Crossing: New Horizons","Simulação","2020-03-20"),
	(7,"God of War","Tiro","2016-10-11"),
	(8,"Forza Motorsport 7","Corrida","2017-10-03"),
	(9,"The Legend of Zelda: Wind Waker HD","Ação/Aventura","2013-09-20"),
	(10,"Super Mario 3d World","Plataforma","2013-11-21");
	

	
--CONSUTANDO OS DADOS 
SELECT * FROM tb_jogo WHERE titulo = "Demon's Sould";
	
SELECT * FROM tb_jogo WHERE genero = "Corrida";


-- CONSUTANDO DADOS COM O INNER JOIN

SELECT
	tb_plataforma.nome,
	tb_plataforma.fabricante,
	tb_jogo.titulo,
	tb_jogo.lancamento,
	tb_jogo.genero
FROM
	tb_jogo
INNER JOIN
	tb_plataforma ON tb_plataforma.cod_plataforma = tb_jogo.cod_plataforma;
	
	
--ALTERAR DADOS

UPDATE tb_jogo
	SET lancamento = '2007-04-27'
	WHERE cod_jogo = 1;
	
UPDATE tb_jogo	
	SET lancamento = '2006-12-26'
	WHERE cod_jogo = 2;
UPDATE tb_jogo
	SET lancamento = '2006-12-08'
	WHERE cod_jogo = 3;
UPDATE tb_jogo
	SET lancamento = '2006-12-27'
	WHERE cod_jogo = 4;

--DELETANDO DADOS

DELETE FROM tb_jogo WHERE titulo = 'The Legend of Zelda: Wind Waker HD';
DELETE FROM tb_jogo WHERE titulo = 'Animal Crossing: New Horizons';
DELETE FROM tb_jogo WHERE titulo = 'The Legend of Zelda: Breath of the Wild';
DELETE FROM tb_jogo WHERE titulo = 'Forza Motorsport 7';

	