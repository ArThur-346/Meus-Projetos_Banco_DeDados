drop database if exists dbexer0003;

create database dbexer0003;

use dbexer0003;

create table Locall(
idlocall int auto_increment primary key,
cod int,
nome varchar(120)
);

create table Cidade(
idcidade int auto_increment primary key,
idlocall int,
nome varchar(120),
cidadaos int,
estado varchar(120),
foreign key(idlocall) references locall(idlocall)

);
create table Usuario(
idusuario int auto_increment primary key,
idcidade int,
idlocall int,
nome varchar(120),
idade int,
dt_nascimento date,
foreign key(idcidade) references cidade(idcidade),
foreign key(idlocall) references locall(idlocall)

);


insert into Locall( cod, nome) values
( 12345, 'ceo'),
( 6789, 'adm'),
( 1543, 'usuario'),
( 5426, 'usuario');

insert into Cidade(idlocall, nome, cidadaos, estado) values
(1 ,'flori', 100000, 'sc'),
(2, 'curi', 500000, 'pr'),
(3, 'tuba', 20000, 'sc'),
(4, 'tuba', 30000, 'sc');

insert into Usuario(idcidade, idlocall, nome, idade, dt_nascimento) values
(1,1, 'arthur', 20, '2012-09-08'),
(2, 2, 'jonh', 19,  '2016-08-09'),
(3, 3, 'nico', 18, '2006-03-07'),
(4, 4, 'nicola', 21, '2006-04-08');

select 
count(usuario.idusuario),
cidade.estado,
cidade.nome
from usuario
inner join cidade on
cidade.idcidade = usuario.idcidade
group by
cidade.estado, 
cidade.nome;

select
count(locall.idlocall),
cidade.nome,
cidade.estado
from cidade 
inner join locall on
locall.idlocall = cidade.idlocall
group by
cidade.nome,
cidade.estado
order by
cidade.nome asc;

select
usuario.nome,
locall.nome,
locall.cod,
cidade.nome,
cidade.estado
from cidade
inner join locall on
locall.idlocall = cidade.idlocall
inner join usuario on
locall.idlocall = usuario.idlocall
where usuario.dt_nascimento >'2006-01-01' and usuario.dt_nascimento < '2016-01-01'
order by
usuario.nome asc;

select 
locall.cod,
cidade.estado,
cidade.nome
from cidade
inner join locall on
locall.idlocall = cidade.idlocall
order by
cidade.nome desc;

select 
usuario.nome,
usuario.idade,
cidade.nome
from usuario
inner join cidade on
cidade.idcidade = usuario.idcidade
order by
usuario.nome;

select 
usuario.nome,
cidade.nome,
cidade.estado
from usuario
inner join cidade on
cidade.idcidade = usuario.idcidade
order by
cidade.nome asc;

select 
count(usuario.idusuario),
cidade.estado
from usuario
inner join cidade on
cidade.idcidade = usuario.idcidade
group by
cidade.estado;

select
max(cidade.cidadaos),
cidade.nome
from cidade
group by 
cidade.nome;

select
usuario.dt_nascimento,
usuario.nome
from usuario
where usuario.dt_nascimento >'2006-01-01'
order by usuario.nome;

select usuario.nome,
locall.nome,
locall.cod
from usuario
inner join locall on
locall.idlocall = usuario.idlocall
order  by
locall.cod asc;

select 
count(cidade.idcidade),
cidade.estado
from cidade 
group by
cidade.estado;

select
sum(cidade.cidadaos),
cidade.estado
from cidade
group by cidade.estado;

select
usuario.nome, 
usuario.idade 
from usuario
where idade >= 18 and idade <=20
order by 
usuario.nome asc;

select 
usuario.nome,
usuario.idusuario,
cidade.nome,
cidade.estado,
locall.nome
from cidade
inner join locall on
locall.idlocall = cidade.idlocall
inner join usuario on
locall.idlocall = usuario.idlocall
where locall.cod > 5000
order by
usuario.nome;

select
cidade.estado,
sum(cidade.cidadaos)
from cidade;

select
max(usuario.idade),
min(usuario.idade),
avg(usuario.idade),
cidade.estado
from usuario
inner join cidade on
cidade.idcidade = usuario.idcidade
group by
cidade.estado;