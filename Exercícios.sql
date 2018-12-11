/* Exercício 1 */
/* Lista de nome de todas as mulheres */
select nome from gafanhotos
where sexo = 'F';

/* Exercício 2 */ 
/* Lista de todos que nasceram entre 1/Jan/2000 e 31/Dez/2015 */
select * from gafanhotos
where nascimento between '2000/01/01' and '2015/12/31';

/*Exercício 3 */
/* Nome de todos os homens que são programadores */
select nome from gafanhotos
where profissao= 'Programador' and sexo = 'M';

/* Exercício 4 */
/* Lista de mulheres que nasceram no Brasil e que têm seu nome iniciando com J */
select * from gafanhotos
where nacionalidade = 'Brasil'and nome like 'J%' and sexo = 'F';

/* Exercício 5 */
/* Lista com nome e nacionalidade de todos os homens que têm Silva no nome, não nasceram no Brasil
e pesam menos de 100kg */

select nome, nacionalidade from gafanhotos
where sexo = 'M' and nome like '%Silva%'and nacionalidade != 'Brasil' and peso <100;

/* Exercício 6 */
/* Maior altura entre homens no Brasil */
select max(altura) from gafanhotos
where nacionalidade = 'Brasil' and sexo = 'M';

/* Exercício 7 */
/* Média de peso dos cadastrados */
select avg(peso) from gafanhotos;

/* Exercício 8 */
/* Menor peso entre as mulheres que nasceram fora do Brasil entre 01/Jan/1990 e 31/Dez/2000 */
select min(peso) from gafanhotos
where sexo = 'F' and nacionalidade <> 'Brasil' and nascimento between '1990/01/01' and '2000/12/31';


/* Exercício 9 */
/* Quantas mulheres têm mais de 1.90m de altura */
select count(altura) from gafanhotos
where sexo = 'F' and altura > 1.90;

/* Exercício 10 */
/* Lista de profissões e quantidade de pessoas dentro delas */
 select profissao, count(*) from gafanhotos
 group by profissao;
 
 /* Exercício 11*/
 /* Quantos homens e mulheres nasceram após 01/Jan/2015 */
 /* Primeiro selecionar todos que nasceram após a data e agrupar por sexo */
 select sexo, count(*) from gafanhotos
 where nascimento > '2005/01/01'
 group by sexo;
 
 /* Exercício 12 */
 /* Lista de pessoas que nasceram fora do Brasil, mostrando país de origem e total de pessoas
 nascidas lá. Mostrar apenas os países que tiverem mais de 3 pessoas.*/ 
select nacionalidade, count(*) from gafanhotos
where nacionalidade != 'Brasil'
group by nacionalidade;

select nacionalidade, count(*) from gafanhotos
where nacionalidade != 'Brasil'
group by nacionalidade
having count(nacionalidade) >3;

/* Exercício 13 */
/*  */
select altura, peso, count(*) from gafanhotos
where peso > 100
group by altura
having altura > (select avg(altura) from gafanhotos);
 
 