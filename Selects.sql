select * from gafanhotos;
select * from cursos;

select * from cursos
order by nome asc; /* ordem alfabética de A-Z, pode usar o ASC ou não, não faz diferença */

select * from cursos
order by nome desc; /* ordem alfabética inversa */

select nome, carga, ano from cursos /* seleciona os campos nome, carga e ano ordenando esses dados
pelo nome */
order by nome;

select ano, nome, carga from cursos /* seleciona os campos nome, carga e ano ordenando esses dados
pelo ano e o nome (correspondente ao ano) */
order by ano, nome; /* ordena por ano primeiro e logo depois por nome */

/* Esses comandos estão sendo feitos por colunas */

select * from cursos /* utiliza-se o order by apenas para ordenar pelo nome, sendo que todos os dados
selecionados serão de 2016 */
where ano = '2016'
order by nome;

select nome, carga from cursos /* utiliza-se o order by apenas para ordenar pelo nome, sendo que todos os dados
selecionados serão de 2016 sabendo-se o nome e carga */
where ano = '2016' /* todos são de 2016 , mas não necessariamente precisa aparecer na pesquisa */
order by nome;

select nome, descricao, ano from cursos /* pesquisa os cursos que são de 2015 ou antes dele ordenados
por ano e nome */
where ano <= 2015 /* aspas ou não */
order by ano, nome;

select nome, descricao, ano from cursos 
where ano >= 2016 /* aspas ou não */
order by ano, nome;

select nome, descricao, ano from cursos 
where ano != 2016 /* aspas ou não, != ou <> */
order by ano, nome;

/* Esses comandos estão sendo feitos por linhas */

select nome, ano from cursos /* seleciona o nome e ano dos cursos que estão no intervalo de 2014 e 2016 */
where ano between 2014 and 2016;

select nome, ano from cursos /* seleciona o nome e ano dos cursos que estão no intervalo de 2014 e 2016 */
where ano between 2014 and 2016
order by ano desc, nome asc; /* do ano mais atual até os mais antigos e por ordem de nome */

select nome, descricao, ano from cursos
where ano in (2014, 2016)
order by ano;

/* *** BETWEEN é para faixa de valores, intervalos, o IN especifica os anos sem intervalos *** */

select nome, carga, totaulas from cursos /* utiliza operadores lógicos para definir os valores */
where carga > 35 and totaulas < 30;  

select nome, carga, totaulas from cursos /* utiliza operadores lógicos para definir os valores */
where carga > 35 or totaulas < 30
order by nome;

/* OPERADORES LÓGICOS */

/* Wildcards */
select * from cursos
where nome like 'a%'; /* like é parecido, % é um caractere que substitui NENHUM ou VÁRIOS
COMEÇA COM A */

select * from cursos /* like é parecido, % é um caractere que substitui NENHUM ou VÁRIOS
TERMINA COM A */
where nome like '%a';

select * from cursos /* like é parecido, % é um caractere que substitui NENHUM ou VÁRIOS
que tenham A em qualquer lugar */
where nome like '%a%';

select * from cursos /* not like significa não é parecido, que nçao tenha a em canto nenhum */
where nome not like '%a%';

select * from cursos
where nome like 'ph%p%';

select * from cursos
where nome like 'ph%p_'; /* _ que tenha algum caractere no final */

select * from cursos
where nome like 'p__t%';

select * from gafanhotos
where nome like '%silva';

select distinct nacionalidade from gafanhotos /* lista não repetitiva, apenas os nomes, considera
apenas uma ocorrência e não repete informação
Exemplo: não repetir várias vezes Brasil, apenas uma */
order by nacionalidade;

select count(*) from cursos; /* count conta a quantidade de cursos */
select count(*) from cursos
where carga > 40; /* quantos cursos tem carga maior que 40 */

select max(carga) from cursos; /* max equivale a maior, qual a maior carga dos cursos */
select max(totaulas) from cursos
where ano = '2016';

select min(totaulas) from cursos /* min equivale a menor, qual a menor carga dos cursos */
where ano = '2016';

select sum(totaulas) from cursos; /* soma */
select avg(totaulas) from cursos; /* média artitmética */

/* Agrupamento */
select nome, carga, count(nome) from cursos /* várias informações iguais são agrupadas em vários 
grupos diferentes */
group by carga;

select totaulas, count(*) from cursos
group by totaulas
order by totaulas;

select carga, count(nome) from cursos
where totaulas = 30
group by carga;

select nome, carga, count(nome) from cursos 
group by carga;

select ano, count(*) from cursos
group by ano
having count(ano) >=5
order by count(*);

select ano, count(*) from cursos
group by ano
having ano > 2016 /* having é similar a lógica do where, agrupa por ano, mas seleciona os que são
acima de 2016 */
order by count(*) desc;

select ano, count(*) from cursos /* seleciona os anos onde o totaulas= 30, vai agurpar essa seleção
por ano e dentro desse agrupamento só mostra o ano acima de 2013 ordenado */
where totaulas > 30;

select carga, count(*) from cursos /* seleciona */
where ano > 2015 /* filtra */
group by carga /* agrupa */
having carga > (select avg(carga) from cursos); /* utilizou outro select para sempre calcular direto
a média ao invés de manualmente ter de alterar a média digitada */