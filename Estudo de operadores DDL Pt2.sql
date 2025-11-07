-- ddl criando tabela
create table funcionario   
(		 
    matricula int not null primary key auto_increment,      
    nome varchar(50) not null,      
    sobrenome varchar(50) not null,      
    endereco varchar(50),      
    cidade varchar(50),      
    pais varchar(25),      
    data_nasc datetime
);

-- ddl criando tabela com chave estrangeira
create table salario   
(      
    matricula int not null,      
    salario decimal(10,2) not null, 
    foreign key(matricula) references funcionario(matricula)
);

-- ddl criacao de tabela com chave primaria
create table audit_salario   
(  
    transacao int not null auto_increment,    
    matricula int not null,      
    data_trans datetime not nul,      
    sal_antigo decimal(10,2),      
    sal_novo decimal(10,2), 
    usuario varchar(20) not null,
    primary key(transacao),
    foreign key(matricula) references funcionario(matricula) 
);

-- ddl criacao de index
create index ix_func1 on funcionario(data_nasc);

-- ddl criacao de index
create index ix_func2 on funcionario(cidade,pais);

-- adicionando novo campo na tabela 
alter table funcionario add genero char(1);

-- renomeando campo/colunas da tabela
alter table funcionario change genero sexo char(1);

-- retornando situacao anterior
alter table funcionario change sexo genero char(1);

-- renomeando tabela
rename table funcionario to pessoa;

-- retornando situacao anterior
rename table pessoa to funcionario;

-- ddl para adicionar coluna na tab senso 
alter table senso add id int;

-- ddl para adicionar chave primaria na tab senso auto_increment 
alter table senso modify column id int auto_increment primary key;

-- alterando tipo da coluna
alter table funcionario modify column endereco varchar(30);

-- excluindo campo da coluna
alter table funcionario drop column genero; 

-- alterar engine da tabela
alter table senso
engine = myisam;

-- ddl criacao de database
create database teste;

-- excluindo database
drop database teste; 

-- excluindo table
drop table salario;

-- criacao de view
create view v_funcionario as
select * from funcionarios;

-- modificando view
alter view v_funcionario as 
select id, nome from funcionarios;

-- excluindo view
drop view v_funcionario; 

-- excluindo index
drop index ix_func1 on funcionario; 

-- criando index
create index ix_func1 on funcionarios (nome);

-- criando procedure
delimiter $$
create procedure proc_quadrado (inout numero int)
begin
    set numero = numero * numero;
end $$
delimiter ;

-- executando procedure
set @valor = 5;
call proc_quadrado(@valor);
select @valor;

-- excluindo procedure 
drop procedure proc_quadrado; 

-- excluindo função
drop function func_salario;

-- excluindo trigger
drop trigger trig_func_salario;

-- ddl truncate
truncate table senso;

-- verificando registros
select * from funcionarios;

-- criando tabela temporaria
create temporary table tmp_funcionarios
(
    id int,
    nome varchar(50),
    salario decimal(10,2),
    setor varchar(30)
);

-- backup na tabela temporaria
insert into tmp_funcionarios
select * from funcionarios;

-- verificando backup
select * from tmp_funcionarios;

-- truncate na tabela funcionarios
truncate funcionarios;

select * from funcionarios;

-- desativar auto increment da tabela funcionarios
alter table funcionarios change id id int unsigned not null;

-- recuperando dados do backup
insert into funcionarios
select * from tmp_funcionarios;

select * from funcionarios;

-- retornando auto increment
alter table funcionarios modify column id int auto_increment;

-- testando auto increment
insert into funcionarios (nome, salario) values ('leopoldo', 1000);

-- evidencia
select * from funcionarios;