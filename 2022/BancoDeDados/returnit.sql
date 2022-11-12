CREATE DATABASE returnit;
-- AS tabelas mãe serão criadas inicialmente, e depois AS filhas.

CREATE TABLE endereco( ID BIGINT NOT NULL, numero BIGINT NOT NULL, logradouro VARCHAR(100) NOT NULL, complemento VARCHAR(100) NOT NULL, PRIMARY KEY (numero) );

CREATE TABLE retornavel( id bigint not null, marca varchar(50) not null, material VARCHAR(30) not null, primary key (id) );

CREATE TABLE usuario( id bigint not null, nome varchar(100) not null, cpf VARCHAR(11) not null, genero ENUM('Feminino', 'Masculino', 'Neutre'), endereco bigint not null, primary key (id), foreign key (endereco) references endereco(numero) );

CREATE TABLE contato( id bigint not null, whatsapp varchar(14) not null, email varchar(100) not null, usuario bigint not null, primary key (whatsapp), foreign key (usuario) references usuario(id) );

CREATE TABLE cooperado( id bigint not null, cnpj varchar(14) not null, nome varchar(30) not null, endereco bigint not null, primary key (id), foreign key (endereco) references endereco(numero) );

CREATE TABLE empresa( id bigint not null, cnpj varchar(14) not null, marca varchar(30) not null, numero bigint not null, retornavel bigint not null, primary key (id) ); ALTER TABLE EMPRESA add constraint foreign key (numero) references endereco(numero); ALTER TABLE EMPRESA add constraint foreign key (retornavel) references retornavel(id);

CREATE TABLE deposito( id bigint not null, dataDeposito date not null, quantidade int not null, cooperado bigint not null, retornavel bigint not null, primary key (id) ); ALTER TABLE DEPOSITO add constraint foreign key (retornavel) references retornavel(id); ALTER TABLE DEPOSITO add constraint foreign key (cooperado) references cooperado(id);

CREATE TABLE coleta( id bigint not null, realizado boolean, empresa bigint, cooperado bigint, primary key (id) ); ALTER TABLE coleta add constraint foreign key(empresa) references empresa(id); alter TABLE coleta add constraint foreign key (cooperado) references cooperado(id);

CREATE TABLE retornavel_coleta( retornavel bigint not null, coleta bigint not null, quantidade int ); alter TABLE retornavel_coleta add constraint foreign key (retornavel) references retornavel (id); alter TABLE retornavel_coleta add constraint foreign key (coleta) references coleta(id);