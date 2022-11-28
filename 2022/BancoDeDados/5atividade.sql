SELECT AVG(qt_km_rodado), nr_placa
FROM veiculo
WHERE qt_km_rodado > (SELECT AVG(qt_km_rodado) FROM veiculo)
GROUP BY nr_placa;


# a)     Listar a descrição da(s) cor(es) cadastrada(s) na base e que não apresenta nenhum veículo cadastrado;

SELECT cor.ds_cor, cor.cd_cor
FROM cor
WHERE cor.cd_cor NOT IN (SELECT cd_cor FROM veiculo)
GROUP BY ds_cor, cor.cd_cor;

# b)     Listar a placa e a descrição do modelo do(s) veículo(s) mais novo(s) cadastrado(s) - considerar o ano modelo. Atenção, pois poderá haver mais de um veículo;

SELECT ds_modelo, nr_placa, nr_ano_mod
FROM modelo
         JOIN veiculo v ON modelo.cd_modelo = v.cd_modelo
WHERE v.nr_ano_mod = (SELECT MAX(nr_ano_mod) FROM veiculo)
GROUP BY ds_modelo, nr_placa, nr_ano_mod;

# c)          Listar dados dos veículos: placa, descrição da marca, descrição do modelo que são movidos por mais de um combustível;
SELECT veiculo.nr_placa, ds_marca, ds_modelo
FROM veiculo
         JOIN modelo m ON veiculo.cd_modelo = m.cd_modelo
         JOIN marca m2 ON m2.cd_marca = m.cd_marca
         JOIN veiculo_combustivel vc ON veiculo.nr_placa = vc.nr_placa
         JOIN combustivel c ON vc.cd_combustivel = c.cd_combustivel
GROUP BY nr_placa, ds_marca, ds_modelo
HAVING COUNT(vc.cd_combustivel) >= ALL (SELECT COUNT(cd_combustivel) FROM veiculo_combustivel GROUP BY cd_combustivel);
# perguntar para o professor por que esta alteração da questão que tambem traz a descrição do combustível está errada
SELECT ds_combustivel, vc.cd_combustivel, ds_marca, ds_modelo, v.nr_placa
FROM combustivel
         JOIN veiculo_combustivel vc ON combustivel.cd_combustivel = vc.cd_combustivel
         JOIN veiculo v ON vc.nr_placa = v.nr_placa
         JOIN modelo m ON v.cd_modelo = m.cd_modelo
         JOIN marca m2 ON m2.cd_marca = m.cd_marca
GROUP BY ds_combustivel, cd_combustivel, ds_marca, ds_modelo, vc.nr_placa
HAVING COUNT(vc.cd_combustivel) >= ALL
       (SELECT COUNT(cd_combustivel) FROM veiculo_combustivel GROUP BY vc.cd_combustivel);

SELECT *
FROM veiculo_combustivel

# d)     Listar a descrição do(s) modelo(s) que possui(em) o maior número de veículos cadastrado;

SELECT modelo.cd_modelo, ds_modelo, COUNT(nr_placa) AS quantia_carros
FROM modelo
         JOIN veiculo v ON modelo.cd_modelo = v.cd_modelo
GROUP BY ds_modelo, cd_modelo
HAVING COUNT(ds_modelo) >= ALL (SELECT COUNT(*) FROM veiculo GROUP BY cd_modelo);

# e)     Listar a descrição da marca que possui o menor número de modelos cadastrados;

SELECT ds_marca, COUNT(m.cd_marca)
FROM marca
         JOIN modelo m ON marca.cd_marca = m.cd_marca
GROUP BY ds_marca, m.cd_marca
HAVING COUNT(m.cd_marca) <= ALL (SELECT COUNT(cd_marca) FROM modelo GROUP BY cd_marca);


# f)      Listar a descrição do acessório mais popular (que mais é encontrado) entre os veículos fabricados. Atenção, pois poderá haver mais de um acessório ranqueado com mais...;

SELECT ds_acessorio, COUNT(va.cd_acessorio), va.cd_acessorio
FROM acessorio
         JOIN veiculo_acessorio va ON acessorio.cd_acessorio = va.cd_acessorio
GROUP BY ds_acessorio
HAVING COUNT(va.cd_acessorio) <= ALL (SELECT COUNT(*) FROM veiculo_acessorio GROUP BY cd_acessorio);


# g)     Listar qual(is) acessórios não estão associados a veículos fabricados anterior ao ano de 2015;

SELECT a.cd_acessorio
FROM acessorio a
WHERE a.cd_acessorio NOT IN (SELECT cd_acessorio
                             FROM veiculo_acessorio
                                      JOIN veiculo v ON veiculo_acessorio.nr_placa = v.nr_placa
                             WHERE v.nr_ano_fab < 2015);

