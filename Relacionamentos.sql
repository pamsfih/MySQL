desc gafanhotos;

alter table gafanhotos
add column cursopreferido int;
alter table gafanhotos

add foreign key(cursopreferido) /* chave estrangeira que referencia a primária idcurso */
references cursos(idcurso); /* chave primária */

select * from gafanhotos;
select * from cursos;

update gafanhotos set cursopreferido = '6' where id = '1'; /* a pessoa de código 1 prefere o curso de
código 6 */

delete from cursos
where idcurso = '28';

select nome, cursopreferido from gafanhotos;
select nome, ano from cursos;

/* INNER JOIN e JOIN são a mesma coisa */ 
select gafanhotos.nome, gafanhotos.cursopreferido, cursos.nome, cursos.ano
from gafanhotos inner join cursos /* junção de gafanhotos com cursos */ 
on cursos.idcurso = gafanhotos.cursopreferido /* o idcurso precisa ser igual ao cursopreferido
da tabela gafanhotos para conseguir relacionar */
order by gafanhotos.nome;

/* OU */
/* Colocando um nome (variável), apelido específico para cada tabela */
select g.nome, g.cursopreferido, c.nome, c.ano
from gafanhotos as g join cursos as c /* junção de gafanhotos com cursos */ 
on c.idcurso = g.cursopreferido /* o idcurso precisa ser igual ao cursopreferido
da tabela gafanhotos para conseguir relacionar */
order by g.nome;

/* LEFT OUTER JOIN ou LEFT JOIN dá prefrência para os dados do lado esquerdo, ou seja, mostra
as preferências dos gafanhotos que citaram somado aos que não optaram nenhum curso de preferência */

select g.nome, g.cursopreferido, c.nome, c.ano
from gafanhotos as g left outer join cursos as c /* junção de gafanhotos com cursos */ 
on c.idcurso = g.cursopreferido; /* o idcurso precisa ser igual ao cursopreferido
da tabela gafanhotos para conseguir relacionar */

/* LEFT OUTER JOIN ou LEFT JOIN dá prefrência para os dados do lado direito, ou seja, mostra
as preferências aos cursos mesmo os que não foram escolhidos */

select g.nome, g.cursopreferido, c.nome, c.ano
from gafanhotos as g right outer join cursos as c /* junção de gafanhotos com cursos */ 
on c.idcurso = g.cursopreferido; /* o idcurso precisa ser igual ao cursopreferido
da tabela gafanhotos para conseguir relacionar */

/* Modelo de dados N PARA N */
create table gafanhoto_assiste_curso (
id int not null auto_increment,
data date,
idgafanhoto int,
idcurso int,
primary key(id),
foreign key (idgafanhoto) references gafanhotos(id),
foreign key (idcurso) references cursos(idcurso)
) default charset = utf8;

insert into gafanhoto_assiste_curso values
(default, '2014-03-01', '1', '2'); /* 1 é o id do aluno e 2 é o id do curso */

select g.nome, c.nome from gafanhotos g
join gafanhoto_assiste_curso a
on g.id = a.idgafanhoto
join cursos c
on c.idcurso = a.idcurso
order by g.nome;