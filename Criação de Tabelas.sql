use cadastro;
create table pessoas (
id int not null auto_increment, /*auto_increment aumenta o código a cada dado novo, id, id2, automaticamente */
nome varchar(30) not null,
nascimento date,
sexo enum ('M', 'F'),
peso decimal (5,2), /*5 é o total de todas as casas e o 2 o número de casas decimais depois da vírgula'*/
altura decimal (3,2),
nacionalidade varchar(20) default 'Brasil', /* por padrão será Brasil se não digitar nada */
primary key (id) /* chave primária*/
)default charset = utf8; /*aceita caracteres acentuados do padrão latino*/

create table if not exists cursos ( /* IF NOT EXISTS, se não existir essa tabela, cria */ 
nome varchar(30) not null unique, 
/* a diferença de UNIQUE para PRIMARY KEY é que o primeiro não identifica os registros de um
campo como chave primária, mas sim, evita que sejam criados outros campos com o mesmo nome */
descricao text, /* utiliza o tipo TEXT porque se refere ao texto mais longo */
carga int unsigned, /* não considera sinal no número, ou seja, sem negativo */
totaulas int unsigned,
ano year default '2016' /* se não for digitado o ano, o padrão será 2016 */
) default charset = utf8;

desc gafanhotos;


 
