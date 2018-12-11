update cursos
set nome = 'HTML5'
where idcurso = '1';
select * from cursos;

update cursos
set nome = 'PHP', ano = '2015'
where idcurso = '4';

update cursos
set ano = '2018', carga = '0'
where ano = '2050'
limit 1; /* protege as mudanças feitas para apenas uma linha, mesmo tendo 3 linhas com 2050
altera apenas a primeira linha, se limitando a 1 linha */

delete from cursos
where idcurso = '8';

delete from cursos
where ano = '2018'
limit 3; /*3 linhas */

truncate table cursos; /* truncate é pra apagar todas as linhas, ou truncate cursos sem o table */
/* o drop apaga a tabela com todos os dados, já o truncate só apaga os dados */
select * from cursos;