
--a) Listar os nomes dos proprietários com a respectiva localidade (nome) em que residem;
SELECT nm_proprietario AS nome, nm_localidade AS cidade 
FROM proprietario p ,localidade l  
WHERE p.cd_localidade = l.cd_localidade;

--b) Listar todos os modelos da marca "FIAT" ordenados pelo descrição DO modelo;
SELECT mo.ds_modelo AS modelo, ma.ds_marca AS marca 
FROM modelo mo, marca ma 
WHERE mo.cd_marca = ma.cd_marca
AND ma.ds_marca = 'FIAT'
ORDER BY mo.ds_modelo;

SELECT mo.ds_modelo AS modelo, ma.ds_marca AS marca 
FROM modelo mo 
JOIN marca ma ON (mo.cd_marca = ma.cd_marca) 
where ma.ds_marca = 'FIAT' 
ORDER BY mo.ds_modelo;

--c) Listar todas AS marcas (descrição) disponíveis com o respetivo modelo (descrição), ordenando em ordem crescente de marca, seguida de modelo;
select ds_marca as marca, ds_modelo as modelo
from modelo mo, marca ma
where mo.cd_marca = ma.cd_marca
order by ma.ds_marca asc;

--d) Listar a placa, o ano modelo e a descrição da cor de todos os veículos cadastrados, ordenando pelo ano modelo, seguido da descrição da cor;
select nr_placa as placa,nr_ano_mod ano,ds_cor as cor
from veiculo v,cor c 
where v.cd_cor = c.cd_cor
order by nr_ano_mod, ds_cor;

--e) Listar os seguintes dados DO veículo: placa, nome DO proprietário e nome da localidade que o mesmo reside, desde que sua UF seja "SC";
select nr_placa as placa, nm_proprietario as nome, nm_localidade as localidade
from veiculo v, proprietario p, localidade l 
where p.sg_uf = 'SC'
and (v.cd_proprietario = p.cd_proprietario);


select nr_placa as placa, nm_proprietario as nome, nm_localidade as localidade
from veiculo v 
JOIN proprietario p  on (v.cd_proprietario = p.cd_proprietario)
JOIN localidade l on (p.cd_localidade = l.cd_localidade) 
where p.sg_uf = 'SC';


--f)  Listar os dados dos veículos com placa, descrição da marca, descrição DO modelo, ano DO modelo e a(s) respectiva(s) descrição(ões) DO(s) combustível(IS) que é movido;
select veiculo.nr_placa as placa,ds_marca as marca, ds_modelo as modelo, nr_ano_mod as ano_modelo,ds_combustivel as combustivel 
from veiculo
join modelo on (veiculo.cd_modelo = modelo.cd_modelo)
join marca on (modelo.cd_marca = marca.cd_marca)
join veiculo_combustivel on (veiculo.nr_placa = veiculo_combustivel.nr_placa) 
join combustivel on (veiculo_combustivel.cd_combustivel = combustivel.cd_combustivel);


--g) Listar os veículos (com placa, descrição da marca, descrição DO modelo) que possuem como acessório "Direção hidráulica"se;
select v.nr_placa as placa, ds_modelo as modelo, ds_marca as marca,ds_acessorio as acessorio from veiculo v
join modelo mo on (mo.cd_modelo = v.cd_modelo)
join marca ma on (ma.cd_marca = mo.cd_marca)
join veiculo_acessorio va on (v.nr_placa = va.nr_placa)
join acessorio a on (a.cd_acessorio = va.cd_acessorio)
where ds_acessorio = 'Direção Hidráulica';

--h) Listar dados completos dos veículos: placa, descrição da marca, descrição DO modelo, descrição da cor, ano modelo, ano fabricação, quantidade de km rodado, quantidade de portas, descrição dos acessórios e descrição DO combustível que o move.
select v.nr_placa as placa,ds_marca as marca, ds_modelo as modelo, ds_cor as cor,nr_ano_mod as ano_modelo,nr_ano_fab as ano_fabricacao, qt_km_rodado as kilometragem,qt_portas as portas, ds_acessorio as acessorio
from veiculo v
join cor c on (v.cd_cor = c.cd_cor)
join veiculo_acessorio va on (v.nr_placa = va.nr_placa)
join acessorio a on (va.cd_acessorio = a.cd_acessorio)
join modelo mo on (v.cd_modelo = mo.cd_modelo)
join marca ma on (mo.cd_marca = ma.cd_marca)
;


select v.nr_placa as placa,ds_marca as marca, ds_modelo as modelo, ds_cor as cor,nr_ano_mod as ano_modelo,nr_ano_fab as ano_fabricacao, qt_km_rodado as kilometragem,qt_portas as portas, ds_acessorio as acessorio, ds_combustivel as combustivel
from veiculo v
join cor c on (v.cd_cor = c.cd_cor)
join veiculo_acessorio va on (v.nr_placa = va.nr_placa)
join acessorio a on (va.cd_acessorio = a.cd_acessorio)
join modelo mo on (v.cd_modelo = mo.cd_modelo)
join marca ma on (mo.cd_marca = ma.cd_marca)
join veiculo_combustivel vc on (v.nr_placa = vc.nr_placa)
join combustivel co on (vc.cd_combustivel = co.cd_combustivel)
;