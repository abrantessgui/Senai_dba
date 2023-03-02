CREATE DATABASE IF NOT EXISTS db_videogame 
COLLATE utf8mb4_general_ci 
CHARSET utf8mb4;

DROP DATABASE db_videogame;

USE db_videogame;

CREATE TABLE IF NOT EXISTS tb_jogo (
	id_jogo INTEGER PRIMARY KEY NOT NULL,
    nome VARCHAR(35) NOT NULL,
    CONSTRAINT  uq_nome_jogo UNIQUE (nome)
);

CREATE TABLE IF NOT EXISTS tb_console (
	id_console INTEGER PRIMARY KEY NOT NULL,
    nome VARCHAR(35) NOT NULL,
    CONSTRAINT  uq_nome_console UNIQUE (nome)
);

CREATE TABLE IF NOT EXISTS tb_jogo_console (
	id_jogo INTEGER NOT NULL,
    id_console INTEGER NOT NULL,
PRIMARY KEY (id_jogo, id_console),
CONSTRAINT fk_id_jogo FOREIGN KEY (id_jogo) REFERENCES tb_jogo (id_jogo),
CONSTRAINT fk_id_console FOREIGN KEY (id_console) REFERENCES tb_console (id_console)
);

DESCRIBE tb_jogo_console;
