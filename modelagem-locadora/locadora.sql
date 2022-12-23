CREATE TABLE "discos" (
	"id" serial NOT NULL,
	"numero" TEXT NOT NULL,
	"codigoBarras" TEXT NOT NULL,
	"filmeId" integer NOT NULL,
	CONSTRAINT "discos_pk" PRIMARY KEY ("id")
);



CREATE TABLE "categorias" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	CONSTRAINT "categorias_pk" PRIMARY KEY ("id")
);



CREATE TABLE "filmes" (
	"id" serial NOT NULL,
	"titulo" TEXT NOT NULL,
	"categoriaId" integer NOT NULL,
	CONSTRAINT "filmes_pk" PRIMARY KEY ("id")
);



CREATE TABLE "atores" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"paisId" integer NOT NULL,
	"nascimento" DATE NOT NULL,
	CONSTRAINT "atores_pk" PRIMARY KEY ("id")
);



CREATE TABLE "paises" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	CONSTRAINT "paises_pk" PRIMARY KEY ("id")
);



CREATE TABLE "atoresFilmes" (
	"id" serial NOT NULL,
	"filmeId" integer NOT NULL,
	"atorId" integer NOT NULL,
	CONSTRAINT "atoresFilmes_pk" PRIMARY KEY ("id")
);



CREATE TABLE "clientes" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"cpf" TEXT NOT NULL,
	CONSTRAINT "clientes_pk" PRIMARY KEY ("id")
);



CREATE TABLE "enderecos" (
	"id" serial NOT NULL,
	"rua" TEXT NOT NULL,
	"numero" TEXT NOT NULL,
	"complemento" TEXT NOT NULL,
	"bairro" TEXT NOT NULL,
	"cep" TEXT NOT NULL,
	"cidadeId" integer NOT NULL,
	CONSTRAINT "enderecos_pk" PRIMARY KEY ("id")
);



CREATE TABLE "telefones" (
	"id" serial NOT NULL,
	"telefone" TEXT NOT NULL,
	CONSTRAINT "telefones_pk" PRIMARY KEY ("id")
);



CREATE TABLE "cidades" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"estadoId" integer NOT NULL,
	CONSTRAINT "cidades_pk" PRIMARY KEY ("id")
);



CREATE TABLE "estados" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	CONSTRAINT "estados_pk" PRIMARY KEY ("id")
);



CREATE TABLE "clientesTelefones" (
	"id" serial NOT NULL,
	"clienteId" integer NOT NULL,
	"telefoneId" integer NOT NULL,
	CONSTRAINT "clientesTelefones_pk" PRIMARY KEY ("id")
);



CREATE TABLE "clientesEnderecos" (
	"id" serial NOT NULL,
	"clienteId" integer NOT NULL,
	"enderecoId" integer NOT NULL,
	CONSTRAINT "clientesEnderecos_pk" PRIMARY KEY ("id")
);



CREATE TABLE "locacoes" (
	"id" serial NOT NULL,
	"clienteId" integer NOT NULL,
	"data" DATE NOT NULL,
	"dataFechamento" DATE NOT NULL,
	"avalicaoAtendimento" integer NOT NULL,
	CONSTRAINT "locacoes_pk" PRIMARY KEY ("id"),
	CONSTRAINT "avaliacaoAtendimento_max" CHECK("avalicaoAtendimento" < 11 and "avalicaoAtendimento" > 0)
);



CREATE TABLE "locacoesDicos" (
	"id" serial NOT NULL,
	"locacaoId" bigint NOT NULL,
	"discoId" integer NOT NULL,
	"tipoLocacaoId" integer NOT NULL,
	"dataDevolucaoDisco" DATE,
	"avaliacaoFilme" integer NOT NULL,
	CONSTRAINT "locacoesDicos_pk" PRIMARY KEY ("id"),
	CONSTRAINT "avaliacaoFilme_max" CHECK("avaliacaoFilme" < 11 and "avaliacaoFilme" > 0)
);



CREATE TABLE "tiposLocacao" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	CONSTRAINT "tiposLocacao_pk" PRIMARY KEY ("id")
);



ALTER TABLE "discos" ADD CONSTRAINT "discos_fk0" FOREIGN KEY ("filmeId") REFERENCES "filmes"("id");


ALTER TABLE "filmes" ADD CONSTRAINT "filmes_fk0" FOREIGN KEY ("categoriaId") REFERENCES "categorias"("id");

ALTER TABLE "atores" ADD CONSTRAINT "atores_fk0" FOREIGN KEY ("paisId") REFERENCES "paises"("id");


ALTER TABLE "atoresFilmes" ADD CONSTRAINT "atoresFilmes_fk0" FOREIGN KEY ("filmeId") REFERENCES "filmes"("id");
ALTER TABLE "atoresFilmes" ADD CONSTRAINT "atoresFilmes_fk1" FOREIGN KEY ("atorId") REFERENCES "atores"("id");


ALTER TABLE "enderecos" ADD CONSTRAINT "enderecos_fk0" FOREIGN KEY ("cidadeId") REFERENCES "cidades"("id");


ALTER TABLE "cidades" ADD CONSTRAINT "cidades_fk0" FOREIGN KEY ("estadoId") REFERENCES "estados"("id");


ALTER TABLE "clientesTelefones" ADD CONSTRAINT "clientesTelefones_fk0" FOREIGN KEY ("clienteId") REFERENCES "clientes"("id");
ALTER TABLE "clientesTelefones" ADD CONSTRAINT "clientesTelefones_fk1" FOREIGN KEY ("telefoneId") REFERENCES "telefones"("id");

ALTER TABLE "clientesEnderecos" ADD CONSTRAINT "clientesEnderecos_fk0" FOREIGN KEY ("clienteId") REFERENCES "clientes"("id");
ALTER TABLE "clientesEnderecos" ADD CONSTRAINT "clientesEnderecos_fk1" FOREIGN KEY ("enderecoId") REFERENCES "enderecos"("id");

ALTER TABLE "locacoes" ADD CONSTRAINT "locacoes_fk0" FOREIGN KEY ("clienteId") REFERENCES "clientes"("id");

ALTER TABLE "locacoesDicos" ADD CONSTRAINT "locacoesDicos_fk0" FOREIGN KEY ("locacaoId") REFERENCES "locacoes"("id");
ALTER TABLE "locacoesDicos" ADD CONSTRAINT "locacoesDicos_fk1" FOREIGN KEY ("discoId") REFERENCES "discos"("id");
ALTER TABLE "locacoesDicos" ADD CONSTRAINT "locacoesDicos_fk2" FOREIGN KEY ("tipoLocacaoId") REFERENCES "tiposLocacao"("id");
