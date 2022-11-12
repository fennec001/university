USE VEICULO;

CREATE TABLE localidade( cd_localidade integer, nm_localidade varchar(50), primary key (cd_localidade) );

CREATE TABLE marca( cd_marca integer, ds_marca varchar(30), primary key (cd_marca) );

CREATE TABLE combustivel( cd_combustivel integer, ds_combustivel varchar(30), primary key (cd_combustivel) );

CREATE TABLE acessorio( cd_acessorio integer, ds_acessorio varchar(50), primary key (cd_acessorio) );

CREATE TABLE cor( cd_cor integer, ds_cor varchar(30), primary key (cd_cor) );

CREATE TABLE proprietario( cd_proprietario integer, cd_localidade integer, nm_proprietario varchar(50), ds_logradouro varchar(50), ds_complemento varchar(50), ds_bairro varchar(50), nr_telefone varchar(15), ds_email varchar(50), sg_uf char(2), primary key (cd_proprietario), foreign key (cd_localidade) references localidade (cd_localidade) );

CREATE TABLE modelo( cd_modelo integer, cd_marca integer, ds_modelo varchar(50), primary key (cd_modelo)); ALTER TABLE modelo add foreign key (cd_marca) references marca(cd_marca);

CREATE TABLE VEICULO( nr_placa CHAR(7) PRIMARY KEY, cd_cor INTEGER REFERENCES cor(cd_cor), cd_proprietario INTEGER REFERENCES proprietario(cd_proprietario), cd_modelo INTEGER REFERENCES modelo(cd_modelo), nr_ano_fab INTEGER, nr_ano_mod INTEGER, qt_km_rodado INTEGER, qt_portas INTEGER, ds_observacao VARCHAR (100) );

CREATE TABLE veiculo_combustivel( cd_combustivel integer, nr_placa char(7), primary key (cd_combustivel, nr_placa) );

CREATE TABLE veiculo_acessorio( nr_placa char(7), cd_acessorio integer, foreign key (nr_placa) references veiculo (nr_placa), foreign key (cd_acessorio) references acessorio (cd_acessorio) );
-- inserindo dados nas tabelas...
INSERT INTO localidade (cd_localidade, nm_localidade) values (1, 'Blumenau');
INSERT INTO localidade (cd_localidade, nm_localidade) values (2, 'Gaspar');
INSERT INTO localidade (cd_localidade, nm_localidade) values (3, 'Ilhota');
INSERT INTO localidade (cd_localidade, nm_localidade) values (4, 'Curitiba');
INSERT INTO localidade (cd_localidade, nm_localidade) values (5, 'Porto Alegre');
INSERT INTO localidade (cd_localidade, nm_localidade) values (6, 'São Paulo');
INSERT INTO marca (cd_marca, ds_marca) values (1, 'VW');
INSERT INTO marca (cd_marca, ds_marca) values (2, 'Chevrolet');
INSERT INTO marca (cd_marca, ds_marca) values (3, 'Ford');
INSERT INTO marca (cd_marca, ds_marca) values (4, 'Fiat');
INSERT INTO marca (cd_marca, ds_marca) values (5, 'Renault');
INSERT INTO marca (cd_marca, ds_marca) values (6, 'Jeep');
INSERT INTO marca (cd_marca, ds_marca) values (7, 'Audi');
INSERT INTO marca (cd_marca, ds_marca) values (8, 'BMW');
INSERT INTO marca (cd_marca, ds_marca) values (9, 'Mitsubish');
INSERT INTO marca (cd_marca, ds_marca) values (10, 'Citroen');
INSERT INTO combustivel (cd_combustivel, ds_combustivel) values (1, 'Gasolina');
INSERT INTO combustivel (cd_combustivel, ds_combustivel) values (2, 'Etanol');
INSERT INTO combustivel (cd_combustivel, ds_combustivel) values (3, 'Diesel');
INSERT INTO combustivel (cd_combustivel, ds_combustivel) values (4, 'GNV');
INSERT INTO combustivel (cd_combustivel, ds_combustivel) values (5, 'Elétrico');
INSERT INTO cor (cd_cor, ds_cor) values (1, 'Branco');
INSERT INTO cor (cd_cor, ds_cor) values (2, 'Preto');
INSERT INTO cor (cd_cor, ds_cor) values (3, 'Prata');
INSERT INTO cor (cd_cor, ds_cor) values (4, 'Azul');
INSERT INTO cor (cd_cor, ds_cor) values (5, 'Vermelho');
INSERT INTO cor (cd_cor, ds_cor) values (6, 'Amarelo');
INSERT INTO cor (cd_cor, ds_cor) values (7, 'Verde');
INSERT INTO cor (cd_cor, ds_cor) values (8, 'Cinza');
INSERT INTO cor (cd_cor, ds_cor) values (9, 'Areia');
INSERT INTO cor (cd_cor, ds_cor) values (10, 'Chumbo');
INSERT INTO acessorio (cd_acessorio, ds_acessorio) values (1, 'Direção Hidráulica');
INSERT INTO acessorio (cd_acessorio, ds_acessorio) values (2, 'Ar Condicionado');
INSERT INTO acessorio (cd_acessorio, ds_acessorio) values (3, 'Direção Elétrica');
INSERT INTO acessorio (cd_acessorio, ds_acessorio) values (4, 'Bancos em couro');
INSERT INTO acessorio (cd_acessorio, ds_acessorio) values (5, 'Multimídia');
INSERT INTO acessorio (cd_acessorio, ds_acessorio) values (6, 'GPS');
INSERT INTO acessorio (cd_acessorio, ds_acessorio) values (7, 'Teto solar');
INSERT INTO acessorio (cd_acessorio, ds_acessorio) values (8, 'Rodas Liga-leve');
INSERT INTO acessorio (cd_acessorio, ds_acessorio) values (9, 'Painel digital');
INSERT INTO acessorio (cd_acessorio, ds_acessorio) values (10, 'Air Bag frontais');
INSERT INTO acessorio (cd_acessorio, ds_acessorio) values (11, 'Air Bag laterais');
INSERT INTO acessorio (cd_acessorio, ds_acessorio) values (12, 'Suspenção Hidráulica');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo) values (1, 1, 'Up TSI');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo) values (2, 1, 'Gol 1.6');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo) values (3, 1, 'T-Cross 1.0');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo) values (4, 2, 'Cruze LTZ');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo) values (5, 2, 'Onix Turbo LT');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo) values (6, 3, 'Fiesta 1.0');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo) values (7, 3, 'Ranger CD');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo) values (8, 4, 'Argo 1.0');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo) values (9, 5, 'Kwid 1.0');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo) values (10, 5, 'Sandero');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo) values (11, 7, 'A4');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo) values (12, 7, 'Q5');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo) values (13, 8, 'X1');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo) values (14, 8, 'X3');
INSERT INTO modelo (cd_modelo, cd_marca, ds_modelo) values (15, 8, 'X5');
INSERT INTO proprietario (cd_proprietario, cd_localidade, nm_proprietario, ds_logradouro, ds_complemento, ds_bairro, nr_telefone, ds_email, sg_uf) values (1, 1, 'Proprietario 1 Souza e Silva', 'Rua Antonio da Veiga', '140', 'Itoupava Seca', '4733210200', 'proprietario1@gmail.com', 'SC');
INSERT INTO proprietario (cd_proprietario, cd_localidade, nm_proprietario, ds_logradouro, ds_complemento, ds_bairro, nr_telefone, ds_email, sg_uf) values (2, 2, 'Proprietario 2 Camargo', 'Rua Sete Setembro', '400', 'Centro', '4733210001', 'camargo1@hotmail.com', 'SC');
INSERT INTO proprietario (cd_proprietario, cd_localidade, nm_proprietario, ds_logradouro, ds_complemento, ds_bairro, nr_telefone, ds_email, sg_uf) values (3, 2, 'Proprietario 3 Antunez', 'Rua XV de Novembro', '500', 'Centro', '47999990200', 'proprietario3@gmail.com', 'SC');
INSERT INTO proprietario (cd_proprietario, cd_localidade, nm_proprietario, ds_logradouro, ds_complemento, ds_bairro, nr_telefone, ds_email, sg_uf) values (4, 4, 'Proprietario 4 Silva Almeida', 'Av. Brasil', '999', 'Vila Nova', '472221200', 'proprietario4@gmail.com', 'PR');
INSERT INTO proprietario (cd_proprietario, cd_localidade, nm_proprietario, ds_logradouro, ds_complemento, ds_bairro, nr_telefone, ds_email, sg_uf) values (5, 5, 'Proprietario 5 Martins', 'Alameda Tricolor', '100', 'Taubaté', '5533210200', 'martins@gmail.com', 'RS');
INSERT INTO proprietario (cd_proprietario, cd_localidade, nm_proprietario, ds_logradouro, ds_complemento, ds_bairro, nr_telefone, ds_email, sg_uf) values (6, 6, 'Proprietario 6 Sem Sobrenome', 'Av. Paulista', '1070', 'Centro', '15777210200', null, 'SP');
INSERT INTO proprietario (cd_proprietario, cd_localidade, nm_proprietario, ds_logradouro, ds_complemento, ds_bairro, nr_telefone, ds_email, sg_uf) values (7, 6, 'Proprietario 7 ', 'Av. Paulista', '2177', 'Centro', null, 'proprietario7@live.com', 'SP');
INSERT INTO veiculo (nr_placa, cd_cor, cd_proprietario, cd_modelo, nr_ano_fab, nr_ano_mod, qt_km_rodado, qt_portas, ds_observacao) values ('AAA1234', 1, 1, 1, 2010, 2010, 150000, 4, null);
INSERT INTO veiculo (nr_placa, cd_cor, cd_proprietario, cd_modelo, nr_ano_fab, nr_ano_mod, qt_km_rodado, qt_portas, ds_observacao) values ('BBB5678', 1, 1, 2, 2014, 2015, 8000, 2, null);
INSERT INTO veiculo (nr_placa, cd_cor, cd_proprietario, cd_modelo, nr_ano_fab, nr_ano_mod, qt_km_rodado, qt_portas, ds_observacao) values ('LLL9999', 1, 2, 4, 2017, 2017, 30000, 4, null);
INSERT INTO veiculo (nr_placa, cd_cor, cd_proprietario, cd_modelo, nr_ano_fab, nr_ano_mod, qt_km_rodado, qt_portas, ds_observacao) values ('LXL7755', 4, 3, 5, 2012, 2012, 120000, 2, 'Passagem por leilão');
INSERT INTO veiculo (nr_placa, cd_cor, cd_proprietario, cd_modelo, nr_ano_fab, nr_ano_mod, qt_km_rodado, qt_portas, ds_observacao) values ('AVX0010', 5, 4, 6, 2013, 2014, 99000, 2, null);
INSERT INTO veiculo (nr_placa, cd_cor, cd_proprietario, cd_modelo, nr_ano_fab, nr_ano_mod, qt_km_rodado, qt_portas, ds_observacao) values ('XVA1010', 2, 5, 6, 2019, 2020, 9000, 4, null);
INSERT INTO veiculo (nr_placa, cd_cor, cd_proprietario, cd_modelo, nr_ano_fab, nr_ano_mod, qt_km_rodado, qt_portas, ds_observacao) values ('AXV0010', 3, 7, 9, 2020, 2020, 20000, 4, null);
INSERT INTO veiculo (nr_placa, cd_cor, cd_proprietario, cd_modelo, nr_ano_fab, nr_ano_mod, qt_km_rodado, qt_portas, ds_observacao) values ('XXT0010', 8, 6, 11, 2018, 2018, 30000, 4, 'Ótimo estado de conservação');
INSERT INTO veiculo (nr_placa, cd_cor, cd_proprietario, cd_modelo, nr_ano_fab, nr_ano_mod, qt_km_rodado, qt_portas, ds_observacao) values ('QQL8790', 9, 5, 12, 2021, 2021, 15000, 4, 'Estado de zero km');
INSERT INTO veiculo (nr_placa, cd_cor, cd_proprietario, cd_modelo, nr_ano_fab, nr_ano_mod, qt_km_rodado, qt_portas, ds_observacao) values ('MLT9010', 7, 5, 13, 2019, 2020, 20000, 4, null);