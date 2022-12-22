CREATE DATABASE agencia_viagem;

CREATE TABLE "companhias" (
	"id" serial NOT NULL,
	"sigla" TEXT NOT NULL,
	"nome" TEXT NOT NULL,
	CONSTRAINT "companhias_pk" PRIMARY KEY ("id")
);

CREATE TABLE "voos" (
	"id" serial NOT NULL,
	"companhiaId" integer NOT NULL,
	"sigla" TEXT NOT NULL,
	"aeroportoDestinoId" integer NOT NULL,
	"aeroportoOrigemId" integer NOT NULL,
	"saida" TIMESTAMP NOT NULL,
	"chegada" TIMESTAMP,
	CONSTRAINT "voos_pk" PRIMARY KEY ("id")
);

CREATE TABLE "aeroportos" (
	"id" serial NOT NULL,
	"sigla" TEXT NOT NULL,
	"nome" TEXT NOT NULL,
	CONSTRAINT "aeroportos_pk" PRIMARY KEY ("id")
);

ALTER TABLE "voos" ADD CONSTRAINT "voos_fk0" FOREIGN KEY ("companhiaId") REFERENCES "companhias"("id");
ALTER TABLE "voos" ADD CONSTRAINT "voos_fk1" FOREIGN KEY ("aeroportoDestinoId") REFERENCES "aeroportos"("id");
ALTER TABLE "voos" ADD CONSTRAINT "voos_fk2" FOREIGN KEY ("aeroportoOrigemId") REFERENCES "aeroportos"("id");




