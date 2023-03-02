CREATE DATABASE IF NOT EXISTS db_familia 
COLLATE utf8mb4_general_ci 
CHARSET utf8mb4;  -- cria database, (IF NOT EXISTS) e nao deixa que seja criada novamente.

 DROP DATABASE db_familia;  -- COMANDO QUE EXCLUI UMA DATABASE.

USE db_familia;  -- SELECIONA O BANCO A SER USADO

CREATE TABLE IF NOT EXISTS pai (
	id_pai INTEGER PRIMARY KEY NOT NULL,
    nome VARCHAR(30) NOT NULL,
	dt_nascimento DATE
);  -- CRIA UMA TABELA, (IF NOT EXISTS) e nao deixa que seja criada novamente.

DROP TABLE pai; -- COMANDO QUE EXCLUI UMA TABELA.
 
 CREATE TABLE IF NOT EXISTS filho (
	id_filho INTEGER PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
	dt_nascimento DATE NOT NULL,
    id_pai INTEGER, 
FOREIGN KEY (id_pai) REFERENCES pai (id_pai)
); -- CRIA UMA TABELA, (IF NOT EXISTS) e nao deixa que seja criada novamente.

  DROP TABLE filho; -- EXCLUI UMA TABELA 
 
 DESCRIBE filho;
 
 CREATE TABLE IF NOT EXISTS mae (
	id_mae INTEGER PRIMARY KEY NOT NULL,
    nome VARCHAR(30) NOT NULL,
	dt_nascimento DATE
);  -- CRIA UMA TABELA, (IF NOT EXISTS) e nao deixa que seja criada novamente.

ALTER TABLE filho ADD COLUMN id_mae INTEGER; -- COMANDO QUE ALTERA UMA TABELA CRIANDO UMA NOVA COLUNA.

DESCRIBE filho;
 
ALTER TABLE filho DROP COLUMN id_mae; -- COMANDO QUE ALTERA UMA TABELA EXCLUINDO UMA COLUNA.
 
ALTER TABLE filho ADD COLUMN id_mae INTEGER NOT NULL;
 
ALTER TABLE filho ADD FOREIGN KEY (id_mae) REFERENCES mae (id_mae);
 
 DESCRIBE pai;
 
ALTER TABLE pai ADD COLUMN sobrenome varchar(30); -- comando para criar nava coluna sem precisar dropar a tabela
 
ALTER TABLE pai DROP COLUMN sobrenome; -- comando para dropar colunas sem excluir a tabela.
 
ALTER TABLE pai ADD sobrenome varchar(30) AFTER nome;  -- cria uma nova tabela na posoicao desejada (AFTER)

ALTER TABLE pai ADD coluna_ex DATE FIRST; -- cria uma nova tabela na posoicao desejada (FIRST)

ALTER TABLE pai DROP COLUMN coluna_ex;

ALTER TABLE pai MODIFY sobrenome  VARCHAR (30) NOT NULL; -- COMANDO (MODIFY) PARA MODIFICAR UMA COLUNA EM EXPECIFICO.

ALTER TABLE pai CHANGE dt_nascimento nascimento DATE NOT NULL; -- COMANDO (CHANGE) PARA MODIFICAR UMA COLUNA EM EXPECIFICO. EX: NOME DE COLUNA APENAS DE COLUNA.
 
ALTER TABLE pai CHANGE nascimento dt_nascimento DATE NOT NULL;

ALTER TABLE filho ADD COLUMN sobrenome varchar(30) NOT NULL AFTER nome;
 DESCRIBE filho;
 
ALTER TABLE mae ADD COLUMN sobrenome varchar(30) NOT NULL AFTER nome;
 DESCRIBE mae;
 
 ALTER TABLE filho RENAME TO son;  -- codigo para altera nome de tabelas
 
 RENAME TABLE pai TO father; -- codigo para altera nome de tabelas
 
  RENAME TABLE mae TO mother; -- codigo para altera nome de tabelas
  
  RENAME TABLE father TO pai; -- ''
  
  RENAME TABLE mother TO mae; -- ''
  
  RENAME TABLE son TO filho; -- ''
  
  DESCRIBE filho;
  
  ALTER TABLE filho DROP CONSTRAINT filho_ibfk_1; -- comando para dropar uma coluna com uma restriçao ex: foreign key.
  
  ALTER TABLE filho DROP CONSTRAINT filho_ibfk_2; -- comando para dropar uma coluna com uma restriçao ex: foreign key.
  
 ALTER TABLE filho ADD CONSTRAINT fk_id_pai FOREIGN KEY (id_pai) REFERENCES pai (id_pai);  -- COMANDO QUE ADICIONA EM UMA TABELA UMA NOVA COLUNA COM RESTRIÇAO EX: FOREIGN KEY.
 
  ALTER TABLE filho ADD CONSTRAINT fk_id_mae FOREIGN KEY (id_mae) REFERENCES mae (id_mae);  -- COMANDO QUE ADICIONA EM UMA TABELA UMA NOVA COLUNA COM RESTRIÇAO EX: FOREIGN KEY.
  
CREATE TABLE IF NOT EXISTS vovo (
	id_vovo INTEGER PRIMARY KEY NOT NULL,
    nome VARCHAR(30) NOT NULL,
    id_filho INTEGER,
	dt_nascimento DATE,
    CONSTRAINT fk_id_filho FOREIGN KEY (id_filho) REFERENCES filho (id_filho)
);

RENAME TABLE mae TO tb_mae;

RENAME TABLE pai TO tb_pai;

RENAME TABLE filho TO tb_filho;

RENAME TABLE vovo TO tb_vovo;

-- 02/03/2023

DROP TABLE tb_vovo;

ALTER TABLE tb_pai ADD COLUMN nacionalidade VARCHAR (20);

ALTER TABLE tb_pai MODIFY nacionalidade VARCHAR (20) DEFAULT 'Brasileiro';  -- COMANDO DEFAULT PREENCHE DADOS NA TABELA CASO NAO TENHA SIDO PREENCHIDO NA HORA DA CRIACAO

DESCRIBE tb_pai;

INSERT INTO tb_pai 
	(id_pai, nome, sobrenome, dt_nascimento, nacionalidade)
VALUES
	(4, 'Darth', 'Vader', '1997-05-12', 'USA');  -- COMANDO PARA ISERIR DADOS NA TABELA
    
    SELECT * FROM tb_pai;  -- COMANDO PARA VISUALIZAR TODOS OS CAMPOS DE UMA TABELA  
    
ALTER TABLE tb_filho DROP CONSTRAINT fk_id_pai; -- DROPANDO A CHAVE PRIMARIA PARA PODER FAZER ALTERACAO NA TABELA
    
ALTER TABLE tb_pai MODIFY id_pai INTEGER NOT NULL AUTO_INCREMENT;  -- COMANDO PARA DEIXAR UMA COLUNA COM AUTO INCREMNT

ALTER TABLE tb_filho ADD CONSTRAINT fk_id_pai FOREIGN KEY (id_pai) REFERENCES tb_pai (id_pai); -- ADICIONANDO A CHAVE PRIMARIA NOVAMENTE DEPOIS DE TER FEITO ALTERACAO 

DESCRIBE tb_pai;

INSERT INTO tb_pai 
	(nome, sobrenome, dt_nascimento, nacionalidade)
VALUES
	('Gustavo', 'Abrantes', '2000-12-17', 'Brasileiro');

SELECT * FROM tb_pai;