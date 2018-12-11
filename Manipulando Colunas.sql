use cadastro;

/* Alter table se utiliza apenas para modificar colunas, não linhas, linhas é update */ 
alter table pessoas /* alterar algo na tabela, add acrescentou o campo profissão */
add column profissao varchar(10);

alter table pessoas /* alterar algo na tabela, drop excluiu o campo profissão */
drop column profissao; 

alter table pessoas
add column profissao varchar(10) after nome;
/* modifica o campo profissão para ficar depois do campo nome */

alter table pessoas
add column codigo int first; /* adiciona uma coluna no início */

alter table pessoas
modify column profissao varchar (20) not null default ''; 
/* modify muda o tipo primitivo e as constraints */

alter table pessoas
change column profissao prof varchar(20) not null default ''; 
/* change muda o tipo primitivo, as constraints e renomeia o campo */

alter table pessoas
modify column prof varchar(20) after nome; 
/* modifica o campo prof para ficar depois do campo nome */

alter table pessoas
rename to gafanhotos; /* renomeia uma tabela criada */ 

alter table gafanhotos
rename to pessoas;

alter table cursos
add column idcurso int  first;
alter table cursos
add primary key (idcurso);