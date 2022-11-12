-- Criação das tabelas
create database biblioteca;

use biblioteca;

create table obra(
    cd_obra int,
    nm_titulo varchar(100),
    ds_edicao varchar(20),
    dt_publicacao date,
    ds_sinopse varchar(255),
    tp_obra int,
    cd_editora int
);

create table autor(
    cd_autor int,
    nm_autor varchar(100),
    primary key (cd_autor)
);

create table editora(
    cd_editora int primary key,
    nm_editora varchar(100)
);

create table tipo_obra(
    tp_obra int primary key,
    ds_tipo varchar(30)
);

create table obra_autor(
    obra_cd_obr int,
    autor_cd_au int, 
    primary key (obra_cd_obr,autor_cd_au)
);

alter table obra
add constraint primary key (cd_obra);

ALTER TABLE obra_autor  
ADD CONSTRAINT foreign key (obra_cd_obr) references obra(cd_obra);

alter table obra_autor
add constraint foreign key (autor_cd_au) references autor(cd_autor);

alter table obra
add constraint foreign key (cd_editora) references editora(cd_editora),
add constraint foreign key(tp_obra)references tipo_obra(tp_obra);

--b)
ALTER TABLE autor
add constraint unique (nm_autor);

--c)
-- 10 autores,3 tipo obras, 5 editoras, 10 obras 
INSERT INTO editora(cd_editora,nm_editora) VALUES(1,'penguin');
INSERT INTO editora(cd_editora,nm_editora) VALUES(2,'harper');
INSERT INTO editora(cd_editora,nm_editora) VALUES(3,'macmillan');
INSERT INTO editora(cd_editora,nm_editora) VALUES(4,'simon');
INSERT INTO editora(cd_editora,nm_editora) VALUES(5,'hachette');

INSERT INTO tipo_obra(tp_obra, ds_tipo) values(1,'manga');
INSERT INTO tipo_obra(tp_obra, ds_tipo) values(2,"romance");
INSERT INTO tipo_obra(tp_obra, ds_tipo) values(3,"suspense");

INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(1,'Oda');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(2,'Tezuka');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(3,'Miura');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(4,'Urasawa');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(5,'Inoue');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(6,'Kishimoto');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(7,'Takeuchi');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(8,'Hagio');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(9,'Toriyama');
INSERT INTO AUTOR(cd_autor, nm_autor) VALUES(10,'Kishibe');

