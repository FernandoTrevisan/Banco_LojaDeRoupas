create database projeto_loja;

use projeto_loja;

create table endereco (
	id int auto_increment,
	cidade varchar(100),
	estado char(2),
	cep char(8),
	bairro varchar(50),
	logradouro varchar(100),
	primary key(id)
)default charset = utf8;

create table funcionario (
	id int auto_increment,
	sexo enum('M','F'),
	telefone varchar(11),
	nome varchar(150),
	id_endereco int,
	primary key(id),
	foreign key (id_endereco) references endereco(id)
)default charset = utf8;

create table fornecedor (
	id int auto_increment,
	nome varchar(150),
	telefone varchar(11),
	email varchar(100),
	cnpj char(14),
	id_endereco int,
	primary key(id),
	foreign key (id_endereco) references endereco(id)
)default charset = utf8;

create table cliente (
	id int auto_increment,
	nome varchar(150),
	cpf char(11),
	rg char(9),
	data_nascimento date,
	sexo enum('M','F'),
	id_endereco int,
	id_funcionario int,
	primary key(id),
	foreign key (id_endereco) references endereco(id),
	foreign key (id_funcionario) references funcionario(id)
)default charset = utf8;

create table compra (
	id int auto_increment,
	data_compra date,
	id_funcionario int,
	id_fornecedor int,
	primary key(id),
	foreign key (id_funcionario) references funcionario(id),
	foreign key (id_fornecedor) references fornecedor(id)
)default charset = utf8;

create table categoria (
	id int auto_increment,
	descricao varchar(50),
	primary key(id)
)default charset = utf8;

create table produto (
	id int auto_increment,
	nome varchar(100),
	quantidade int,
	tamanho varchar(3),
	preco double,
	id_fornecedor int,
	id_categoria int,
	primary key(id),
	foreign key (id_fornecedor) references fornecedor(id),
	foreign key (id_categoria) references categoria(id)
)default charset = utf8;

create table venda (
	id int auto_increment,
	data_venda date,
	id_funcionario int,
	id_cliente int,
	id_produto int,
	primary key(id),
	foreign key (id_funcionario) references funcionario(id),
	foreign key (id_cliente) references cliente(id),
	foreign key (id_produto) references produto(id)
)default charset = utf8;
	