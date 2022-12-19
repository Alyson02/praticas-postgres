create database ecommerce;

create table "usuarios"(
	id serial primary key,
	nome text not null,
	senha text not null
);

create table "usuariosEndereco"(
	id serial primary key,
	"usuarioId" integer references "usuarios"("id"),
	cep text not null,
	numero integer not null,
	rua text not null,
	estado text not null,
	bairro text not null
);

create table "categorias"(
	id serial primary key,
	nome text not null
);

create table "produtos"(
	id serial primary key,
	nome text not null,
	texto text,
	"categoriaId" integer references "categorias"("id")
);

create table "fotos"(
	id serial primary key,
	"produtoId" integer references "produtos"("id"),
	url text not null,
	principal boolean not null default false
);

create table "pedidoStatus"(
	id serial primary key,
	nome text not null
);

create table "pedidos"(
	id serial primary key,
	"usuarioId" integer references "usuarios"("id"),
	total integer not null,
	"statusId" integer references "pedidoStatus"("id"),
	data date default now(),
	"enderecoId" integer references "usuariosEndereco"("id")
);

create table "itensPedido"(
	id serial primary key,
	"produtoId" integer references "produtos"("id"),
	"pedidoId" integer references "pedidos"("id"),
	quantidade integer not null
);
