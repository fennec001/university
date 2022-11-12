-- criando uma tabela...

CREATE TABLE categoria (cd_categoria INTEGER, nm_categoria VARCHAR(30) ); ALTER TABLE categoria ADD PRIMARY KEY (cd_categoria);

CREATE TABLE categoria (cd_categoria INTEGER, nm_categoria VARCHAR(30) PRIMARY KEY (cd_categoria) );
-- inserindo registro
INSERT INTO categoria VALUES (1, 'categoria 1');
--adicionando nova coluna ALTER TABLE categoria ADD COLUMN ds_observacao VARCHAR(30);
-- alterando tipo de dado da coluna ALTER TABLE categoria MODIFY ds_observacao CHAR(10);
-- adicionando uma unique key na coluna nm_categoria ALTER TABLE categoria ADD UNIQUE KEY (nm_categoria);

SELECT  *
FROM categoria
-- script exercicio webaula 17 e 18

CREATE TABLE genero (cd_genero integer, ds_genero varchar(30), primary key (cd_genero) );

CREATE TABLE ator (cd_ator integer, nm_ator varchar(50), primary key (ator) );

CREATE TABLE censura (cd_censura integer, ds_censura varchar(30), primary key (cd_censura) );

CREATE TABLE filme (cd_filme integer, cd_censura integer, cd_genero integer, nm_filme varchar(50), ds_sinopse varchar(250), nr duracao varchar(20), dt_lancamento date, fl_dublado char(1), primary key (cd_filme) ); alter TABLE filme add foreign key (cd_censura) references censura(cd_censura); alter TABLE filme add foreign key (cd_genero) references genero(cd_genero);