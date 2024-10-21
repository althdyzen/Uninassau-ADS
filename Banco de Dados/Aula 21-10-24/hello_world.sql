create database escola2mb;
use escola2mb;

-- criar tabela aluno
create table aluno (
matricula char(5) not null,
nome varchar(80) not null,
dt_nasc date not null,
primary key (matricula)
);
describe aluno;


insert into aluno (matricula, nome, dt_nasc)
values
('54321', 'Gustavo da Silva', '2000-10-21'),
('54322', 'Gustavo da Silva', '2000-10-21'),
('54323', 'Caio da Silva', '2000-09-21'),
('54324', 'Mario da Silva', '2000-08-21'),
('54325', 'Lucas da Silva', '2000-07-21');

select matricula, nome, dt_nasc from aluno;

create table nota (
id int unsigned not null auto_increment,
disciplina varchar(20) not null,
matricula char(5) not null,
nota float,
primary key (id),
foreign key (matricula) references aluno(matricula)
);

insert into nota (id, disciplina, matricula, nota)
values 
(default, 'Banco de Dados', '54321', 7.2),
(default, 'Banco de Dados', '54322', 7.2),
(default, 'Banco de Dados', '54323', 7.2),
(default, 'Banco de Dados', '54324', 7.2),
(default, 'Banco de Dados', '54325', 7.2);

select id, disciplina, matricula, nota from nota;
