-- tarefa de BD
--a) Listar todos os dados dos modelos disponíveis ordenados pela descrição; use veiculo;

SELECT  *
FROM modelo ORDER BY ds_modelo;
--b) Listar a descrição de todas AS marcas disponíveis; use veiculo;

SELECT  ds_marca AS marca
FROM marca;
--c) Listar qual(IS) proprietário(s) residem nos estados de "SC" ou "PR";

SELECT  cd_proprietario AS ID
       ,nm_proprietario AS NOME
       ,ds_logradouro   AS LOCAL
FROM proprietario
WHERE ds_logradouro like "SC" or sg_uf like "PR" ORDER BY ID
--d) Listar qual(IS) proprietário(s) não possuem e-mail, mas que possuem número de telefone cadastrado;

SELECT  *
FROM proprietario
WHERE ds_email is null
AND nr_telefone != null;
--e) Listar qual(IS) proprietário(s) apresentam "Silva" no nome;

SELECT  *
FROM proprietario
WHERE nm_proprietario like '%silva%'; -- importante
--f) Listar AS informações DO(s) veículo(s) que apresenta(m) ano de fabricação diferente DO ano modelo;

SELECT  *
FROM veiculo
WHERE nr_ano_fab != nr_ano_mod;
--g) Listar o número da placa, o ano DO modelo, a quantidade de km rodados e a quantidade de portas dos veículos fabricados após ano de 2000, inclusive ano 2000;

SELECT  nr_placa
       ,nr_ano_mod
       ,qt_km_rodado
       ,qt_portas
FROM veiculo
WHERE nr_ano_fab >= '2000';
--h) Listar o número da placa DO(s) veículo(s) que não possui(em) uma informação adicional cadastrada (coluna observação);

SELECT  nr_placa
FROM veiculo
WHERE ds_observacao is null;
--i) Listar os dados DO(s) veículo(s) que apresenta(m) quatro portas ou mais, ordenados pelo ano DO modelo descendente;

SELECT  *
FROM veiculo
WHERE qt_portas >= 4 ORDER BY nr_ano_mod desc;
--j) Listar todos os acessórios ordenados pela descrição;

SELECT  *
FROM veiculo_acessorio ORDER BY ds_acessorio;
--k) Listar o número da placa DO veículo, ano de fabricação e modelo DO(s) veículos fabricados a partir de 2015, com km rodada menor de 50000, com 4 portas ou mais e que não possui(am) observações;

SELECT  nr_placa
       ,nr_ano_fab
       ,nr_ano_mod
FROM veiculo
WHERE nr_ano_fab >= 2015
AND qt_km_rodado < 50000
AND qt_portas >= 4
AND ds_observacao is null;
--l) Listar o nome DO(s) proprietário(s) que residem em um bairro em que o nome tenha a palavra "Novo" ou "Nova" e que a UF seja de "SC";

SELECT  nm_proprietario
       ,
FROM proprietario
WHERE (ds_bairro like '%Novo%' or ds_bairro like '%Nova%')
AND sg_uf = 'SC';