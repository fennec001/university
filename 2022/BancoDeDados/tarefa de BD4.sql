-- tarefa de BD 

--a) Listar todos os dados dos modelos disponíveis ordenados pela descrição;
use veiculo;

SELECT * FROM modelo ORDER BY ds_modelo; 

--b)  Listar a descrição de todas AS marcas disponíveis;
use veiculo;

SELECT ds_marca AS marca FROM marca;

--c)     Listar qual(IS) proprietário(s) residem nos estados de "SC" ou "PR";
select cd_proprietario as ID,nm_proprietario as NOME,ds_logradouro as LOCAL from proprietario where ds_logradouro like "SC" or sg_uf like "PR" order by ID

--d)     Listar qual(IS) proprietário(s) não possuem e-mail, mas que possuem número de telefone cadastrado;
select * from proprietario where ds_email is null and nr_telefone != null;

--e)     Listar qual(IS) proprietário(s) apresentam "Silva" no nome;
select * from proprietario where nm_proprietario like '%silva%'; -- importante
--f)      Listar AS informações DO(s) veículo(s) que apresenta(m) ano de fabricação diferente DO ano modelo;
select * from veiculo where nr_ano_fab != nr_ano_mod;
--g)     Listar o número da placa, o ano DO modelo, a quantidade de km rodados e a quantidade de portas dos veículos fabricados após ano de 2000, inclusive ano 2000;
select nr_placa,nr_ano_mod,qt_km_rodado,qt_portas from veiculo where nr_ano_fab >= '2000';
--h)     Listar o número da placa DO(s) veículo(s) que não possui(em) uma informação adicional cadastrada (coluna observação);
select nr_placa from veiculo where ds_observacao is null;
--i)      Listar os dados DO(s) veículo(s) que apresenta(m) quatro portas ou mais, ordenados pelo ano DO modelo descendente;
select * from veiculo where qt_portas >= 4 order by nr_ano_mod desc; 
--j)      Listar todos os acessórios ordenados pela descrição;
select * from veiculo_acessorio order by ds_acessorio;
--k)        Listar o número da placa DO veículo, ano de fabricação e modelo DO(s) veículos fabricados a partir de 2015, com km rodada menor de 50000, com 4 portas ou mais e que não possui(am) observações;
select nr_placa, nr_ano_fab, nr_ano_mod from veiculo where nr_ano_fab >= 2015 and qt_km_rodado < 50000 and qt_portas >= 4 and ds_observacao is null; 
--l)      Listar o nome DO(s) proprietário(s) que residem em um bairro em que o nome tenha a palavra "Novo" ou "Nova" e que a UF seja de "SC";
select nm_proprietario, from proprietario where (ds_bairro like '%Novo%' or ds_bairro like '%Nova%') and sg_uf = 'SC';