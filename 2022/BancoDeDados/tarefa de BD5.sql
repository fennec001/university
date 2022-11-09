--a) Listar os nomes dos proprietários com a respectiva localidade (nome) em que residem;

SELECT  nm_proprietario AS nome
       ,nm_localidade   AS cidade
FROM proprietario p , localidade l
WHERE p.cd_localidade = l.cd_localidade;
--b) Listar todos os modelos da marca "FIAT" ordenados pelo descrição DO modelo;

SELECT  mo.ds_modelo AS modelo
       ,ma.ds_marca  AS marca
FROM modelo mo, marca ma
WHERE mo.cd_marca = ma.cd_marca
AND ma.ds_marca = 'FIAT'
ORDER BY mo.ds_modelo;

SELECT  mo.ds_modelo AS modelo
       ,ma.ds_marca  AS marca
FROM modelo mo
JOIN marca ma
ON (mo.cd_marca = ma.cd_marca)
WHERE ma.ds_marca = 'FIAT' ORDER BY mo.ds_modelo;
--c) Listar todas AS marcas (descrição) disponíveis com o respetivo modelo (descrição), ordenando em ordem crescente de marca, seguida de modelo;

SELECT  ds_marca  AS marca
       ,ds_modelo AS modelo
FROM modelo mo, marca ma
WHERE mo.cd_marca = ma.cd_marca ORDER BY ma.ds_marca asc;
--d) Listar a placa, o ano modelo e a descrição da cor de todos os veículos cadastrados, ordenando pelo ano modelo, seguido da descrição da cor;

SELECT  nr_placa AS placa
       ,nr_ano_mod ano
       ,ds_cor   AS cor
FROM veiculo v, cor c
WHERE v.cd_cor = c.cd_cor ORDER BY nr_ano_mod, ds_cor;
--e) Listar os seguintes dados DO veículo: placa, nome DO proprietário e nome da localidade que o mesmo reside, desde que sua UF seja "SC";

SELECT  nr_placa        AS placa
       ,nm_proprietario AS nome
       ,nm_localidade   AS localidade
FROM veiculo v, proprietario p, localidade l
WHERE p.sg_uf = 'SC'
AND (v.cd_proprietario = p.cd_proprietario);

SELECT  nr_placa        AS placa
       ,nm_proprietario AS nome
       ,nm_localidade   AS localidade
FROM veiculo v
JOIN proprietario p
ON (v.cd_proprietario = p.cd_proprietario)
JOIN localidade l
ON (p.cd_localidade = l.cd_localidade)
WHERE p.sg_uf = 'SC';
--f) Listar os dados dos veículos com placa, descrição da marca, descrição DO modelo, ano DO modelo e a(s) respectiva(s) descrição(ões) DO(s) combustível(IS) que é movido;

SELECT  veiculo.nr_placa AS placa
       ,ds_marca         AS marca
       ,ds_modelo        AS modelo
       ,nr_ano_mod       AS ano_modelo
       ,ds_combustivel   AS combustivel
FROM veiculo
JOIN modelo
ON (veiculo.cd_modelo = modelo.cd_modelo)
JOIN marca
ON (modelo.cd_marca = marca.cd_marca)
JOIN veiculo_combustivel
ON (veiculo.nr_placa = veiculo_combustivel.nr_placa)
JOIN combustivel
ON (veiculo_combustivel.cd_combustivel = combustivel.cd_combustivel);
--g) Listar os veículos (com placa, descrição da marca, descrição DO modelo) que possuem como acessório "Direção hidráulica"se;

SELECT  v.nr_placa   AS placa
       ,ds_modelo    AS modelo
       ,ds_marca     AS marca
       ,ds_acessorio AS acessorio
FROM veiculo v
JOIN modelo mo
ON (mo.cd_modelo = v.cd_modelo)
JOIN marca ma
ON (ma.cd_marca = mo.cd_marca)
JOIN veiculo_acessorio va
ON (v.nr_placa = va.nr_placa)
JOIN acessorio a
ON (a.cd_acessorio = va.cd_acessorio)
WHERE ds_acessorio = 'Direção Hidráulica';
--h) Listar dados completos dos veículos: placa, descrição da marca, descrição DO modelo, descrição da cor, ano modelo, ano fabricação, quantidade de km rodado, quantidade de portas, descrição dos acessórios e descrição DO combustível que o move.
SELECT  v.nr_placa   AS placa
       ,ds_marca     AS marca
       ,ds_modelo    AS modelo
       ,ds_cor       AS cor
       ,nr_ano_mod   AS ano_modelo
       ,nr_ano_fab   AS ano_fabricacao
       ,qt_km_rodado AS kilometragem
       ,qt_portas    AS portas
       ,ds_acessorio AS acessorio
FROM veiculo v
JOIN cor c
ON (v.cd_cor = c.cd_cor)
JOIN veiculo_acessorio va
ON (v.nr_placa = va.nr_placa)
JOIN acessorio a
ON (va.cd_acessorio = a.cd_acessorio)
JOIN modelo mo
ON (v.cd_modelo = mo.cd_modelo)
JOIN marca ma
ON (mo.cd_marca = ma.cd_marca);

SELECT  v.nr_placa     AS placa
       ,ds_marca       AS marca
       ,ds_modelo      AS modelo
       ,ds_cor         AS cor
       ,nr_ano_mod     AS ano_modelo
       ,nr_ano_fab     AS ano_fabricacao
       ,qt_km_rodado   AS kilometragem
       ,qt_portas      AS portas
       ,ds_acessorio   AS acessorio
       ,ds_combustivel AS combustivel
FROM veiculo v
JOIN cor c
ON (v.cd_cor = c.cd_cor)
JOIN veiculo_acessorio va
ON (v.nr_placa = va.nr_placa)
JOIN acessorio a
ON (va.cd_acessorio = a.cd_acessorio)
JOIN modelo mo
ON (v.cd_modelo = mo.cd_modelo)
JOIN marca ma
ON (mo.cd_marca = ma.cd_marca)
JOIN veiculo_combustivel vc
ON (v.nr_placa = vc.nr_placa)
JOIN combustivel co
ON (vc.cd_combustivel = co.cd_combustivel);

