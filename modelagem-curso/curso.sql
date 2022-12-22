CREATE DATABASE curso;

CREATE TABLE "alunos" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	"cpf" TEXT NOT NULL,
	"email" TEXT NOT NULL,
	CONSTRAINT "alunos_pk" PRIMARY KEY ("id")
);

CREATE TABLE "turmas" (
	"id" serial NOT NULL,
	"codigo" TEXT NOT NULL,
	CONSTRAINT "turmas_pk" PRIMARY KEY ("id")
);

CREATE TABLE "alunos_turmas" (
	"id" serial NOT NULL,
	"alunoId" integer NOT NULL,
	"turmaId" integer NOT NULL,
	"dataInscricao" DATE NOT NULL,
	"dataSaida" DATE,
	CONSTRAINT "alunos_turmas_pk" PRIMARY KEY ("id")
);

CREATE TABLE "projetos" (
	"id" serial NOT NULL,
	"nota" TEXT NOT NULL,
	"dataEntrega" DATE NOT NULL,
	"nome" TEXT NOT NULL,
	"alunoId" integer NOT NULL,
	"moduloId" integer NOT NULL,
	CONSTRAINT "projetos_pk" PRIMARY KEY ("id")
);

CREATE TABLE "modulos" (
	"id" serial NOT NULL,
	"nome" TEXT NOT NULL,
	CONSTRAINT "modulos_pk" PRIMARY KEY ("id")
);

ALTER TABLE "alunos_turmas" ADD CONSTRAINT "alunos_turmas_fk0" FOREIGN KEY ("alunoId") REFERENCES "alunos"("id");
ALTER TABLE "alunos_turmas" ADD CONSTRAINT "alunos_turmas_fk1" FOREIGN KEY ("turmaId") REFERENCES "turmas"("id");

ALTER TABLE "projetos" ADD CONSTRAINT "projetos_fk0" FOREIGN KEY ("alunoId") REFERENCES "alunos"("id");
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_fk1" FOREIGN KEY ("moduloId") REFERENCES "modulos"("id");






