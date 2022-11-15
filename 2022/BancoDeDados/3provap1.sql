-- Criação das tabelas

CREATE database biblioteca; use biblioteca;

CREATE TABLE obra( cd_obra int, nm_titulo varchar(100), ds_edicao varchar(20), dt_publicacao date, ds_sinopse varchar(255), tp_obra int, cd_editora int );

CREATE TABLE autor( cd_autor int, nm_autor varchar(100), primary key (cd_autor) );

CREATE TABLE editora( cd_editora int primary key, nm_editora varchar(100) );

CREATE TABLE tipo_obra( tp_obra int primary key, ds_tipo varchar(30) );

CREATE TABLE obra_autor( obra_cd_obr int, autor_cd_au int, primary key (obra_cd_obr, autor_cd_au) ); alter TABLE obra add constraint primary key (cd_obra); ALTER TABLE obra_autor ADD CONSTRAINT foreign key (obra_cd_obr) references obra(cd_obra); alter TABLE obra_autor add constraint foreign key (autor_cd_au) references autor(cd_autor); alter TABLE obra add constraint foreign key (cd_editora) references editora(cd_editora), add constraint foreign key(tp_obra)references tipo_obra(tp_obra);
--b) 
ALTER TABLE autor add constraint unique (nm_autor);
--c)
-- 10 autores, 3 tipo obras, 5 editoras, 10 obras
INSERT INTO editora(cd_editora, nm_editora) VALUES(1, 'penguin');
INSERT INTO editora(cd_editora, nm_editora) VALUES(2, 'harper');
INSERT INTO editora(cd_editora, nm_editora) VALUES(3, 'macmillan');
INSERT INTO editora(cd_editora, nm_editora) VALUES(4, 'simon');
INSERT INTO editora(cd_editora, nm_editora) VALUES(5, 'hachette');
INSERT INTO tipo_obra(tp_obra, ds_tipo) values(1, 'manga');
INSERT INTO tipo_obra(tp_obra, ds_tipo) values(2, "romance");
INSERT INTO tipo_obra(tp_obra, ds_tipo) values(3, "suspense");
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(1, 'Oda');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(2, 'Tezuka');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(3, 'Miura');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(4, 'Urasawa');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(5, 'Inoue');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(6, 'Kishimoto');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(7, 'Takeuchi');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(8, 'Hagio');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(9, 'Toriyama');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(10, 'Kishibe');
INSERT INTO OBRA(cd_obra, nm_titulo, ds_edicao, dt_publicacao, ds_sinopse, tp_obra, cd_editora) VALUES (1, 'One Piece', '1999', '1998-02-02', 'CAN WE GET MUCH HIGHER', 1, 1);
INSERT INTO OBRA(cd_obra, nm_titulo, ds_edicao, dt_publicacao, ds_sinopse, tp_obra, cd_editora) VALUES (2, 'Bleach', '2009', '2002-06-09', 'Espadachim de almas', 2, 2);
INSERT INTO OBRA(cd_obra, nm_titulo, ds_edicao, dt_publicacao, ds_sinopse, tp_obra, cd_editora) VALUES (3, 'Stone Ocean', '2019', '2012-03-03', 'Cali prison', 3, 3);
INSERT INTO OBRA(cd_obra, nm_titulo, ds_edicao, dt_publicacao, ds_sinopse, tp_obra, cd_editora) VALUES (4, 'Naruto', '2000', '2001-01-09', 'Ninjas', 2, 4);
INSERT INTO OBRA(cd_obra, nm_titulo, ds_edicao, dt_publicacao, ds_sinopse, tp_obra, cd_editora) VALUES (5, 'My Hero Academia', '2018', '2015-09-02', 'Children with power', 1, 5);
INSERT INTO OBRA(cd_obra, nm_titulo, ds_edicao, dt_publicacao, ds_sinopse, tp_obra, cd_editora) VALUES (6, 'Baki', '2003', '1992-02-02', 'Extreme violence', 2, 3);
INSERT INTO OBRA(cd_obra, nm_titulo, ds_edicao, dt_publicacao, ds_sinopse, tp_obra, cd_editora) VALUES (7, 'Kimetsu no Yaiba', '2018', '2015-01-01', 'Demons and Katanas', 3, 1);
INSERT INTO OBRA(cd_obra, nm_titulo, ds_edicao, dt_publicacao, ds_sinopse, tp_obra, cd_editora) VALUES (8, 'Death Note', '2017', '2008-02-02', 'Death in a notebook', 3, 4);
INSERT INTO OBRA(cd_obra, nm_titulo, ds_edicao, dt_publicacao, ds_sinopse, tp_obra, cd_editora) VALUES (9, 'Akame Ga Kill', '2016', '2003-02-02', 'so many deaths', 2, 5);
INSERT INTO OBRA(cd_obra, nm_titulo, ds_edicao, dt_publicacao, ds_sinopse, tp_obra, cd_editora) VALUES (10, 'Fault at Amigara', '1991', '1972-01-06', 'brbrbrbrbr', 2, 3);
INSERT INTO OBRA(cd_obra, nm_titulo, dt_publicacao, ds_sinopse, tp_obra, cd_editora) VALUES (12, 'Promised Neverland', '1972-01-06', 'smart children', 2, 3);
INSERT INTO OBRA(cd_obra, nm_titulo, ds_edicao, dt_publicacao, ds_sinopse, tp_obra, cd_editora) VALUES (11, 'Steel Ball Run', '2022', '2022-01-06', 'nails and wheelchair', 2, 3);
INSERT INTO obra_autor(obra_cd_obr, autor_cd_au) VALUES (1, 1);
INSERT INTO obra_autor(obra_cd_obr, autor_cd_au) VALUES (1, 2);
INSERT INTO obra_autor(obra_cd_obr, autor_cd_au) VALUES (3, 1);
INSERT INTO obra_autor(obra_cd_obr, autor_cd_au) VALUES (4, 2);
INSERT INTO obra_autor(obra_cd_obr, autor_cd_au) VALUES (5, 3);
INSERT INTO obra_autor(obra_cd_obr, autor_cd_au) VALUES (6, 4);
INSERT INTO obra_autor(obra_cd_obr, autor_cd_au) VALUES (7, 6);
INSERT INTO obra_autor(obra_cd_obr, autor_cd_au) VALUES (8, 5);
INSERT INTO obra_autor(obra_cd_obr, autor_cd_au) VALUES (9, 6);
INSERT INTO obra_autor(obra_cd_obr, autor_cd_au) VALUES (10, 7);
INSERT INTO obra_autor(obra_cd_obr, autor_cd_au) VALUES (11, 8);
INSERT INTO obra_autor(obra_cd_obr, autor_cd_au) VALUES (3, 9);
INSERT INTO obra_autor(obra_cd_obr, autor_cd_au) VALUES (4, 10);
INSERT INTO obra_autor(obra_cd_obr, autor_cd_au) VALUES (5, 6);       
--d) Listar os dados das obras (título, data de publicação, nome da editora e descrição do tipo da obra);

SELECT  nm_titulo     AS titulo
       ,dt_publicacao AS data_publicacao
       ,nm_editora    AS editora
       ,ds_tipo       AS tipo
FROM obra
JOIN editora e
ON (obra.cd_editora = e.cd_editora)
JOIN tipo_obra tob
ON (obra.tp_obra = tob.tp_obra);
--e) Listar o título da(s) obra(s) do tipo "romance" e que foram publicados no ano de 2022;

SELECT  ds_tipo       AS tipo
       ,nm_titulo     AS titulo
       ,dt_publicacao AS data_publicacao
FROM obra
JOIN tipo_obra tob
ON (obra.tp_obra = tob.tp_obra)
WHERE ds_tipo like '%romance%'
AND year(dt_publicacao) = 2022;
--f)
SELECT  nm_titulo  AS titulo
       ,nm_editora AS editora
FROM obra
JOIN editora e
ON (obra.cd_editora = e.cd_editora)
WHERE ds_edicao is null;