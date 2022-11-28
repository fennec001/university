SELECT AVG(qt_km_rodado), nr_placa
FROM veiculo
WHERE qt_km_rodado > (SELECT AVG(qt_km_rodado) FROM veiculo)
GROUP BY nr_placa;


# a)     Listar a descrição da(s) cor(es) cadastrada(s) na base e que não apresenta nenhum veículo cadastrado;

SELECT cor.ds_cor,cor.cd_cor
FROM cor
where cor.cd_cor not in(select cd_cor from veiculo)
GROUP BY ds_cor,cor.cd_cor;

# b)     Listar a placa e a descrição do modelo do(s) veículo(s) mais novo(s) cadastrado(s) - considerar o ano modelo. Atenção, pois poderá haver mais de um veículo;

SELECT ds_modelo, nr_placa, nr_ano_mod
FROM modelo
         JOIN veiculo v ON modelo.cd_modelo = v.cd_modelo
WHERE v.nr_ano_mod = (SELECT MAX(nr_ano_mod) FROM veiculo)
GROUP BY ds_modelo, nr_placa, nr_ano_mod;

# c)          Listar dados dos veículos: placa, descrição da marca, descrição do modelo que são movidos por mais de um combustível;
select veiculo.nr_placa,ds_marca,ds_modelo
from veiculo
JOIN modelo m ON veiculo.cd_modelo = m.cd_modelo
JOIN marca m2 ON m2.cd_marca = m.cd_marca
join veiculo_combustivel vc ON veiculo.nr_placa = vc.nr_placa
JOIN combustivel c ON vc.cd_combustivel = c.cd_combustivel
group by nr_placa,ds_marca,ds_modelo
having count(vc.cd_combustivel) >=  all (select count(cd_combustivel) from veiculo_combustivel group by cd_combustivel);
# perguntar para o professor por que esta alteração da questão que tambem traz a descrição do combustível está errada
select ds_combustivel,vc.cd_combustivel,ds_marca,ds_modelo,v.nr_placa
from combustivel
JOIN veiculo_combustivel vc ON combustivel.cd_combustivel = vc.cd_combustivel
JOIN veiculo v ON vc.nr_placa = v.nr_placa
JOIN modelo m ON v.cd_modelo = m.cd_modelo
JOIN marca m2 ON m2.cd_marca = m.cd_marca
group by ds_combustivel,cd_combustivel,ds_marca,ds_modelo,vc.nr_placa
having count(vc.cd_combustivel) >= all (select count(cd_combustivel) from veiculo_combustivel group by vc.cd_combustivel);

select * from veiculo_combustivel

# d)     Listar a descrição do(s) modelo(s) que possui(em) o maior número de veículos cadastrado;

select modelo.cd_modelo,ds_modelo,count(nr_placa) as quantia_carros from modelo
JOIN veiculo v ON modelo.cd_modelo = v.cd_modelo
group by ds_modelo,cd_modelo
having count(ds_modelo) >= all (select count(*) from veiculo group by cd_modelo);

# e)     Listar a descrição da marca que possui o menor número de modelos cadastrados;

select ds_marca,count(m.cd_marca)
from marca
JOIN modelo m ON marca.cd_marca = m.cd_marca
group by ds_marca,m.cd_marca
having count(m.cd_marca) <= all (select count(cd_marca) from modelo group by cd_marca);


# f)      Listar a descrição do acessório mais popular (que mais é encontrado) entre os veículos fabricados. Atenção, pois poderá haver mais de um acessório ranqueado com mais...;

select ds_acessorio,count(va.cd_acessorio),va.cd_acessorio
from acessorio
JOIN veiculo_acessorio va ON acessorio.cd_acessorio = va.cd_acessorio
group by ds_acessorio
having count(va.cd_acessorio) <= all (select count(*) from veiculo_acessorio group by cd_acessorio);


# g)     Listar qual(is) acessórios não estão associados a veículos fabricados anterior ao ano de 2015;

select a.cd_acessorio from acessorio a
where a.cd_acessorio not in (select cd_acessorio from veiculo_acessorio join veiculo v ON veiculo_acessorio.nr_placa = v.nr_placa where v.nr_ano_fab < 2015);

