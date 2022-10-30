USE EMPRESA;

INSERT INTO GENERO VALUES (01, 'Violência');
INSERT INTO GENERO VALUES (02, 'Romance');
INSERT INTO GENERO VALUES (03, 'Anime');

INSERT INTO CENSURA VALUES (1, 'Livre');
INSERT INTO CENSURA VALUES (2, 'Adultos');
INSERT INTO CENSURA VALUES (3, 'Crianças');

INSERT INTO ATOR VALUES (1, 'Johnatan');
INSERT INTO ATOR VALUES (2, 'Miguel');
INSERT INTO ATOR VALUES (3, 'Allan');
INSERT INTO ATOR VALUES (4, 'Valdameri');
INSERT INTO ATOR VALUES (5, 'Marcel');

INSERT INTO FILME VALUES (1, 1, 1, 'A violência', 'Filme no qual ocorre extrema violência', '2 horas', 22/06/2000, 0);

INSERT INTO FILME VALUES (2, 2, 2, 'O romance', 'Filme no qual ocorre extremo romance', '2 horas', 22-06-2000, 0);

INSERT INTO FILME VALUES (3, 3, 3, 'O SQL', 'Filme no qual ocorre extremo SQL', '2 horas', 23-04-1975, 0);

INSERT INTO FILME VALUES (4, 4, 4, 'A quebrada', 'Filme no qual ocorre extremas quebradas', '3 horas', 22/02/2000, 1);

INSERT INTO FILME VALUES (4, 4, 4, 'A queda', 'Filme no qual ocorre extremas quedas', '5 horas', 23-06-2001, 0);

INSERT INTO FILME_ATOR VALUES (1,2); 

EXCLUDE FROM FILME WHERE ds_sinopse IS NULL;

DELETE FROM FILME WHERE ds_sinopse = null;  
