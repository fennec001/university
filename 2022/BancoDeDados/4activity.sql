--a)     Listar a média de km rodados entre os veículos cadastrados;
SELECT AVG(qt_km_rodado) AS media_km
FROM veiculo;

--b)     Listar o ano de fabricação DO(s) veículo(s) mais novo e ano de fabricação DO(s) veículo(s) mais antigo cadastrado na base de dados;

SELECT MIN(nr_ano_fab),MAX(nr_ano_fab)
FROM veiculo; 

-- os sgbds são malandros, e o mariadb é o pior de tudo
ele deixa a gente executar e nos enganac com o valor
quqnado nao colocamos o GROUP BY, se não tvessemos feito o teste de mesa ele realmente nos enganaria
e nos passaria um valor "equivocado". por que lá em cima, na clausula SELECTtemos uma função de grupo
que é uma das 6 disponiveis
ou seja, toda vez que temos uma funca o de grupo na clausula SELECT e junto com a funcao de grupo ouver uma ou mais colunas simples
como a sg_uf 
esta coluna ou estas colunas tem que ir para a clausula GROUP BY, OBRIGATORIAMENTE,
pois neste caso estamos dizendo explicitamente para o banco que gostariamos que o agrupamento seja feito por estas oclunas asqui,nesta ordem asquie ai ele vai lá e agrupa para mim.
Muitas vezes nós nçao eprcebemos o erro por que o mariaDB ou o MySql não nos dá avisos.
Existem bancos com o oracle que avisa... o sqlserver tambm
porem o mariadb e o mysql não avisam

AS vezes isso acontece involuntariamente, pois AS vezes todos os proprietarios moram em santa catarina, e então nos podemos nos enganar 
por isso é neessario realmente fazer testes de mesa, para testarmos todas AS possibilidades
SEMPRE QUE TIVEMOS UMA FUNÇÃO E UMA TABELA SIMPLES, ESTAS COLUNAS DEVEM IR JUNTAS NA ORDEM QUE ELES ESTÃO NO SELECT DENTRO DO GROUP BY , FAZENDO ISTO NÓS SEMPRE TEREMOS A CERTEZA QUE O QUE ESTAMOS BUSCANDO SERA TRAZIDO PARA nos
logo, sempre utilize todas AS tabelas simples  que estão no SELECT dentro DO GROUP by.

--c)     Listar o ano modelo DO veículo com a respectiva quantidade de veículos correspondente ao ano listado;

SELECT nr_ano_fab, COUNT(nr_ano_fab)
 FROM veiculo
GROUP BY nr_ano_fab;

-- agrupando pelo nr_ano_fab, dá o foco para nr_ano_fab, caso agrupemos pelo COUNT, dará apenas 1 resultado com todos os carros


--d)     Listar a descrição DO combustível com a respectiva quantidade de veículos que apresentam o combustível, ordenando pelo maior número de veículos descendente;
SELECT ds_combustivel,COUNT(vc.nr_placa)
FROM combustivel
JOIN veiculo_combustivel vc ON combustivel.cd_combustivel = vc.cd_combustivel
GROUP BY ds_combustivel;



--e)     Listar a descrição DO modelo com a respectiva quantidade de veículo(s) correspondente ao modelo listado;
SELECT ds_modelo,COUNT(nr_placa)
    FROM modelo
             JOIN veiculo v ON modelo.cd_modelo = v.cd_modelo
    GROUP BY ds_modelo;

--f)      Listar todas AS marcas (descrição) disponíveis com o respetivo modelo (descrição), bem como a quantidade de veículo associada a marca e modelo listado;
 SELECT ds_marca as marca,ds_modelo as modelo,count(nr_placa)
    from marca JOIN modelo m ON marca.cd_marca = m.cd_marca
               JOIN veiculo v ON m.cd_modelo = v.cd_modelo
    GROUP BY ds_marca, ds_modelo
--g)     Listar a descrição DO acessório com a respectiva quantidade de veículo que possuem o referido acessório listado.
 select nm_localidade,count(cd_proprietario)
    from localidade JOIN proprietario p ON localidade.cd_localidade = p.cd_localidade
 where sg_uf = 'SC';
--i)      Listar dados dos veículos: placa, descrição da marca, descrição DO modelo e quantidade de acessórios associado a cada veículo listado, sendo que os veículos devem apresentar dois ou mais acessórios.
select veiculo.nr_placa,ds_marca,ds_modelo,count(cd_acessorio)
    from veiculo
             JOIN modelo m ON veiculo.cd_modelo = m.cd_modelo
             join marca m2 ON m.cd_marca = m2.cd_marca
             JOIN veiculo_acessorio va ON veiculo.nr_placa = va.nr_placa
    group by ds_marca,ds_modelo,nr_placa
    having count(cd_acessorio) >= 2;
--j)     Listar dados dos veículos: placa, descrição da marca, descrição DO modelo e quantidade de combustíveis associados a cada veículo listado.

select v.nr_placa,ds_marca,ds_modelo,count(cd_combustivel)
from veiculo_combustivel vc
join veiculo v ON vc.nr_placa = v.nr_placa
join modelo m ON v.cd_modelo = m.cd_modelo
join marca m2 ON m.cd_marca = m2.cd_marca;
