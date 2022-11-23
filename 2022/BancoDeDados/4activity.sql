--a)     Listar a média de km rodados entre os veículos cadastrados;
SELECT qt_km_rodado AS media_km 
FROM veiculo;

--b)     Listar o ano de fabricação do(s) veículo(s) mais novo e ano de fabricação do(s) veículo(s) mais antigo cadastrado na base de dados;

SELECT MIN(nr_ano_fab),MAX(nr_ano_fab)
FROM veiculo; 

-- os sgbds são malandros, e o mariadb é o pior de tudo
ele deixa a gente executar e nos enganac com o valor
quqnado nao colocamos o group by, se não tvessemos feito o teste de mesa ele realmente nos enganaria
e nos passaria um valor "equivocado". por que lá em cima, na clausula SELECTtemos uma função de grupo
que é uma das 6 disponiveis
ou seja, toda vez que temos uma funca o de grupo na clausula select e junto com a funcao de grupo ouver uma ou mais colunas simples
como a sg_uf 
esta coluna ou estas colunas tem que ir para a clausula group by, OBRIGATORIAMENTE,
pois neste caso estamos dizendo explicitamente para o banco que gostariamos que o agrupamento seja feito por estas oclunas asqui,nesta ordem asquie ai ele vai lá e agrupa para mim.
Muitas vezes nós nçao eprcebemos o erro por que o mariaDB ou o MySql não nos dá avisos.
Existem bancos com o oracle que avisa... o sqlserver tambm
porem o mariadb e o mysql não avisam

as vezes isso acontece involuntariamente, pois as vezes todos os proprietarios moram em santa catarina, e então nos podemos nos enganar 
por isso é neessario realmente fazer testes de mesa, para testarmos todas as possibilidades
SEMPRE QUE TIVEMOS UMA FUNÇÃO E UMA TABELA SIMPLES, ESTAS COLUNAS DEVEM IR JUNTAS NA ORDEM QUE ELES ESTÃO NO SELECT DENTRO DO GROUP BY , FAZENDO ISTO NÓS SEMPRE TEREMOS A CERTEZA QUE O QUE ESTAMOS BUSCANDO SERA TRAZIDO PARA nos
logo, sempre utilize todas as tabelas simples  que estão no select dentro do group by.

--c)     Listar o ano modelo do veículo com a respectiva quantidade de veículos correspondente ao ano listado;

SELECT nr_ano_fab, COUNT(nr_ano_fab)
 FROM veiculo
GROUP BY nr_ano_fab;

-- agrupando pelo nr_ano_fab, dá o foco para nr_ano_fab, caso agrupemos pelo count, dará apenas 1 resultado com todos os carros


--d)     Listar a descrição do combustível com a respectiva quantidade de veículos que apresentam o combustível, ordenando pelo maior número de veículos descendente;



--e)     Listar a descrição do modelo com a respectiva quantidade de veículo(s) correspondente ao modelo listado;

--f)      Listar todas as marcas (descrição) disponíveis com o respetivo modelo (descrição), bem como a quantidade de veículo associada a marca e modelo listado;

--g)     Listar a descrição do acessório com a respectiva quantidade de veículo que possuem o referido acessório listado.

--h)     Listar o nome da localidade com a respectiva quantidade de proprietários vinculado(s) a cada localidade, restringindo ao estado de "SC";

--i)      Listar dados dos veículos: placa, descrição da marca, descrição do modelo e quantidade de acessórios associado a cada veículo listado, sendo que os veículos devem apresentar dois ou mais acessórios.

--j)     Listar dados dos veículos: placa, descrição da marca, descrição do modelo e quantidade de combustíveis associados a cada veículo listado.