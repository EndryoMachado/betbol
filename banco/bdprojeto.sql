create database bdprojeto3;
show databases;
use bdprojeto3;

create table telefone(
id_telefone int not null primary key auto_increment,
numero varchar(45) not null
);

create table usuario(
id_usuario int not null primary key auto_increment,
nome_usuario varchar(45) not null,
email varchar(45) not null,
senha varchar(45) not null,
telefone int not null,
foreign key(telefone) references telefone(id_telefone)
);
/*
Select * from usuario inner join telefone on usuario.telefone = id_telefone;
insert into telefone(numero) values ('92069660');
insert into usuario(nome_usuario, email, senha, telefone) values ( 'Endryo', 'endryo@machado.com', '1234', last_insert_id());
*/