CREATE DATABASE IF NOT EXISTS db_discoteca
COLLATE utf8mb4_general_ci 
CHARSET utf8mb4;

USE db_discoteca;

CREATE TABLE IF NOT EXISTS tb_artista (
	id_artista INT PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
    idade DATE NOT NULL
);



CREATE TABLE IF NOT EXISTS tb_gravadora (
	id_gravadora INT PRIMARY KEY NOT NULL,
    nome VARCHAR(20) NOT NULL,
CONSTRAINT  uq_nome_gravadora UNIQUE (nome)
);



CREATE TABLE IF NOT EXISTS tb_genero (
	id_genero INT PRIMARY KEY NOT NULL,
    nome VARCHAR(20),
CONSTRAINT  uq_nome_genero UNIQUE (nome)
);


CREATE TABLE IF NOT EXISTS tb_disco (
	id_disco INT PRIMARY KEY NOT NULL,
    titulo_disco INT NOT NULL,
    tempo_disco FLOAT NOT NULL,
    ano_lancamento YEAR NOT NULL,
    id_artista INT NOT NULL,
    id_gravadora INT NOT NULL,
    id_genero INT NOT NULL,
CONSTRAINT fk_id_artista FOREIGN KEY (id_artista) REFERENCES tb_artista (id_artista),
CONSTRAINT fk_id_gravadora FOREIGN KEY (id_gravadora) REFERENCES tb_gravadora (id_gravadora),
CONSTRAINT fk_id_genero FOREIGN KEY (id_genero) REFERENCES tb_genero (id_genero)
);


CREATE TABLE IF NOT EXISTS tb_musica (
	id_musica INT PRIMARY KEY NOT NULL,
    nome VARCHAR(50) NOT NULL,
	tempo_musica FLOAT,
    id_disco INT NOT NULL,
CONSTRAINT fk_id_disco FOREIGN KEY (id_disco) REFERENCES tb_disco (id_disco)
);

 

