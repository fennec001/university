-- modelo atualizado do returnit

CREATE database returnit; use returnit;

CREATE TABLE `contato`( `id_contato` Bigint not null AUTO_INCREMENT, `telefone_contato` varchar(14) not null, `email_contato` varchar(100) not null, primary key (`id_contato`));

CREATE TABLE `endereco`( `id_endereco` Bigint not null AUTO_INCREMENT, `numero_casa_endereco` smallint not null, `logradouro_endereco` varchar(100) not null, `complemento_endereco` varchar(100), `bairro_endereco` varchar(100) not null, primary key (`id_endereco`));

CREATE TABLE `usuario`( `id_usuario` Bigint not null AUTO_INCREMENT, `nome_usuario` varchar(30) not null, `senha_usuario` varchar(30) not null, `id_contato` Bigint, `id_endereco` Bigint, primary key(`id_usuario`), constraint `fk_usuario_contato` foreign key(`id_contato`) references `returnit`.`contato`(`id_contato`)
ON delete

SET null
ON update cascade, constraint `fk_usuario_endereco` foreign key(`id_endereco`) references `returnit`.`endereco`(`id_endereco`)
ON
DELETE restrict
ON update cascade);

CREATE TABLE `reciclador`( `cpf_registrador` varchar(14) not null, `genero_reciclador` enum('MASCULINO', 'FEMINO', 'NEUTRO', 'PREFIRO NAO DECLARAR') not null, `id_usuario` Bigint, primary key(`cpf_registrador`), constraint `fk_reciclador_usuario` foreign key(`id_usuario`) references `returnit`.`usuario`(`id_usuario`)
ON
DELETE restrict
ON update cascade);

CREATE TABLE `cooperado`( `cnpj_cooperado` varchar(14) not null, `id_usuario` Bigint, primary key(`cnpj_cooperado`), constraint `fk_cooperado_usuario` foreign key(`id_usuario`) references `returnit`.`usuario`(`id_usuario`)
ON
DELETE restrict
ON update cascade);

CREATE table`empresa`( `cnpj_empresa` varchar(14) not null, `id_usuario` Bigint not null, primary key (`cnpj_empresa`), constraint `fk_empresa_usuario` foreign key(`id_usuario`) references `returnit`.`usuario`(`id_usuario`)
ON
DELETE restrict
ON update cascade);

CREATE TABLE `agendamento`( `id_agendamento` Bigint not null, `realizado_agendamentos` boolean not null, `data_agendamento` timestamp not null, `cnpj_empresa` Varchar(14), `cnpj_cooperado`Varchar(14), primary key(`id_agendamento`), constraint `fk_agendamento_empresa` foreign key(`cnpj_empresa`) references `returnit`.`empresa`(`cnpj_empresa`)
ON delete

SET null
ON update cascade, constraint `fk_agendamento_cooperado` foreign key(`cnpj_cooperado`) references `returnit`.`cooperado`(`cnpj_cooperado`)
ON
DELETE restrict
ON update cascade);

CREATE TABLE `retornavel`( `id_retornavel` Bigint not null, `material` varchar(30) not null, `modelo_retornavel` varchar(50) not null, `marca_retornavel` varchar(50) not null, `cnpj_empresa` Varchar(14), primary key(`id_retornavel`), constraint `fk_retornavel_empresa` foreign key(`cnpj_empresa`) references `returnit`.`empresa`(`cnpj_empresa`)
ON
DELETE restrict
ON update cascade);

CREATE TABLE `agendamento_retornavel`( `quantidade` int not null, `id_retornavel` Bigint, `id_agendamento` Bigint, primary key(`id_retornavel`), constraint `fk_agendamento_retornavel_retornavel` foreign key(`id_retornavel`) references `returnit`.`retornavel`(`id_retornavel`)
ON
DELETE restrict
ON update cascade, constraint `fk_agendamento_retornavel_agendamento` foreign key(`id_agendamento`) references `returnit`.`agendamento`(`id_agendamento`)
ON
DELETE restrict
ON update cascade);

CREATE TABLE `empresa_retornavel` ( `cnpj_empresa` varchar(14), `id_retornavel` Bigint, constraint `fk_empresa_retornavel_empresa` foreign key(`cnpj_empresa`) references `returnit`.`empresa`(`cnpj_empresa`)
ON
DELETE restrict
ON update cascade, constraint `fk_empresa_retornavel_retornavel` foreign key(`id_retornavel`) references `returnit`.`retornavel`(`id_retornavel`)
ON
DELETE restrict
ON update cascade); alter TABLE empresa_retornavel add constraint primary key(cnpj_empresa, id_retornavel); 

CREATE TABLE `deposito`( `id_deposito` Bigint not null auto_increment, `data_deposito` date not null, `quantidade_deposito` int not null, `retornavel_deposito` Bigint, primary key(`id_deposito`), constraint `fk_deposito_retornavel_deposito` foreign key(`retornavel_deposito`) references `returnit`.`retornavel`(`id_retornavel`)
ON
DELETE restrict
ON update cascade);

CREATE TABLE `reciclador_deposito`( `cpf_registrador` varchar(14), `id_deposito` Bigint, primary key(`cpf_registrador`), constraint `fk_reciclador_deposito_deposito` foreign key(`id_deposito`) references `returnit`.`deposito`(`id_deposito`)
ON
DELETE restrict
ON update cascade, constraint `fk_reciclador_deposito_reciclador` foreign key(`cpf_registrador`) references `returnit`.`reciclador`(`cpf_registrador`)
ON
DELETE restrict
ON update cascade); ALTER TABLE `returnit`.`endereco` ADD UNIQUE INDEX `numero_casa_endereco_UNIQUE` (`numero_casa_endereco` ASC) VISIBLE;

ALTER TABLE `returnit`.`contato` ADD UNIQUE INDEX `email_contato_UNIQUE` (`email_contato` ASC) VISIBLE, ADD UNIQUE INDEX `telefone_contato_UNIQUE` (`telefone_contato` ASC) VISIBLE;

