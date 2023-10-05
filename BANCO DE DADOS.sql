--comando para selecao
SELECT * FROM produtos ORDER BY id ASC;

--DDL - liguagem de definicao de dados (interagir com a tabela inteira)
-- criacao de tabela
CREATE TABLE produtos(
	id INT PRIMARY KEY NOT NULL,
	nome VARCHAR(255),
	preco DECIMAL(10,2)
);

-- excluir uma tabela
DROP TABLE produtos;

--alterar tabela
ALTER TABLE produtos ADD descricao TEXT;

--DML - linguagem de manipulacao de dados (mexer com linha)

-- inserir dado na tabela 
INSERT INTO produtos (id, nome, preco) VALUES
(1,'Nescau Radical', 8.00),
(2,'Yakult activia', 4.00),
(3,'Alpino', 5.00),
(4, 'Miojo', 1.00);

-- alterar dado da tabela
UPDATE produtos SET preco = 15.00 where id=1;

--alterar dado de tabela
UPDATE produtos SET preco = 15.00 WHERE id=1;
UPDATE produtos SET nome = 'Toddy' WHERE nome LIKE 'Nescau Radical';

UPDATE produtos SET descricao = 'armazenar em ambiente gelado'
WHARE id=2 or id=3;

UPDATE produtos SET descricao = 'Promoção'
WHARE preco <5.00;

--deleter dado de um tabela
DELETE FROM produtos WHARE nome LIKE 'alpino'
DELETE FROM produtos WHERE id = 1;
 
--comando DQL (linguagem de consulta de dados )
--selecionar todos(*)produtos, ordene ascendente
SELECT * FROM produtos ORDER BY id ASC;

--ordenar pelo preco crescente(menor para maior)
SELECT * FROM produtos ORDER BY preco ASC;
--ordenar pelo preco descrecente(maior para menor)
SELECT * FROM produtos ORDER BY preco DESC;

--selecionar colunas
SELECT nome, preco FROM produtos ORDER BY id;

--selecionar produtos maior que 4,00
SELECT preco, nome FROM produtos WHARE preco > 4.00;

--selecionar produto mais caro
SELECT MAX(preco) AS maior_valor FROM produtos;
SELECT preco, nome FROM produtos ORDER BY preco DESC LIMIT 1;

--simulando busca por nome exato
SELECT * FROM produtoS WHARE nome LIKE 'Nescau Radical';

--busca pelos primeiros caracteres, o resto nao importa
SELECT * FROM produtos WHARE nome LIKE 'Ne%';

-- A parte anterior nao importa, buasca o ultimo
SELECT * FROM produtos WHARE nome LIKE 'Fit%';

--busca por qualquer parte do nome
SELECT * FROM produtos WHARE nome LIKE 'Nestle%';



-- Fase 2 ---------------------------------------------------------
-- Criando Tabela Funcionário--------------------------------------

CREATE TABLE funcionario(
  id  SERIAL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL,
	data_nasc DATE,
	sexo CHAR(1),
	salario DECIMAL (10, 2),
	ativo BOOLEAN
	
	
);

SELECT * FROM funcionario;

INSERT INTO funcionario (nome, data_nasc, sexo, salario, ativo) VALUES
('Bod','1990-05-15', 'M', 2000.00, true),
('Augusto', '1970-04-01','M', 1500.00, false),
('Joanir', '2000-01-01', 'F', 1800.00, true),
('Elisa', '1995-10-02','F' , 1900.00, true);

-- 1.Criar uma tabela "Clientes" com campos para ID, Nome 
CREATE TABLE Clientes (
	id SERIAL PRIMARY KEY,
	nome VARCHAR(60);
	email VARCHAR(60);

);


-- 2.Adicionar uma coluna "telefone" á tabela "clientes" usando ALTER TABLE.
ALTER TABLE clientes ADD telefone VARCHAR (20);


-- 3.Remover a coluna "Email" da tabela "Clientes" usando ALTER TABLE.
ALTER TABLE clientes DROP email;


-- 4.Criar uma tabela "Itens" com campos para ID, Nome e Preço.
CREATE TABLE itens(
	id SERIAL PRIMARY KEY,
	nome VARCHER( 60),
	preco DECIMAL(10,2),
);
SELECT * FROM itens;


-- 5.Inserir um novo cliente na tabela "Cliente" INSERT.
INSERT INTO clientes(nome, telefone) VALUES
('Joao','(44)99142-2219'),
('maria','(44)99144-3322'),
('jose','(44)99155-8252');


-- 6.Inserir 3 novos itens na tabela "Itens" INSERT.
INSERT INRO itens(nome, preco)VALUES
(2,'Moster', 4.00),
(3,'Red Bull'8.00),
(4,'Coca-Cola', 10.00);


-- 7.Atualizar o nome de um cliente na tabela "Clientes" UPDATE.
UPDATE clientes SET nome = 'harry poter' WHARE id=1;
UPDATE clientes SET nome = 'Harry poter' WHARE nome LIKE 'joao';


-- 8.Atualizar o preco de um item na tabela "Itens" UPDATE.
UPDATE itens SET preco = 7.00 WHERE is=3;


-- 9.Excluir um cliente da tabela  "Clientes" DELETE.
DELETE FROM clientes WHARE id=2;


-- 10.Excluir um item da tabela "Itens" DELETE.
DELETE FROM itens WHARE id=2;



SELECT * FROM clientes;
SELECT * FROM itens;



----------Entendendo Relacionamentos entre tabelas no banco de dados

-----Criacao das tabelas 
CREATE TABLE estados(
	id_estado SERIAL PRIMARY KEY,
	nome_estado VARCHAR(50) NOT NULL,
	sigla CHAR(2)
);

CREATE TABLE cidades(
    id_cidade SERIAL PRIMARY KEY,
	nome_cidade VARCHAR(50),
	cep VARCHAR(50),
	id_estado INT REFERENCES estados(id_estado)
);


---inserindos dados na tabelas
INSERT INTO estados(id_estado, nome_estado, sigla) VALUES
(1,'parana','PR'),
(2,'sao paulo','SP'),
(3,'minas gerais','MG');

INSERT INTO cidades(id_cidade, nome_cidade, cep, id_estado) VALUES
(10,'nova londrina','87970-000', 1),
(11,'marilena','87960-000', 1),
(12,'itauna','87980-000', 1),
(13,'primavera','19273-000', 2),
(14,'rosana','19274-000', 2),
(15,'cachoeira da prata','35765-000', 3);

SELECT * FROM estados;
SELECT * FROM cidade;

---selecionar todas as cidades e seus estados
 SELECT cidades.nome_cidade, estados.nome_estado
 FROM estados INNER JOIN cidades
 ON cidades.id_estado = estados.id_estado;
 
---seleciona todas as cidades do parana
SELECT cidades.nome_cidade, estados.sigla
FROM estadoS INNER JOIN cidades
ON cidades.id_estado = estados.id_estado
WHERE estados.sigla LIKE 'SP' OR estados.sigla LIKE 'PR'
ORDER BY cidades.nome_cidade ASC;


---selecionar estados com mais cidades
SELECT estados.nome_estado, COUNT(cidades.id_cidade)AS total_cidades
FROM estados INNER JOIN cidades
ON estados.id_estado = cidades.id_estado
GROUP BY estados.nome_estado
ORDER BY TOTAL_cidades DESC;


---criando mais um tabela para o relacionamento de cidade-estado
CREATE TABLE pessoa(
	id_pessoa SERIAL PRIMARY KEY,
	nome_pessoa VARCHAR(60),
	data_nascimento DATE,
	sexo CHAR(1),
	estado_civil VARCHAR(60),
	profissao VARCHAR(60),
	id_cidade INT REFERENCES cidades(id_cidade)
	
);


INSERT INTO pessoa (id_pessoa, nome_pessoa, data_nascimento, sexo, estado_civil, profissao, id_cidade) VALUES
	(1, 'Marcele', '2000-01-01', 'f', 'solteira', 'Arquiteta', 10),
	(2, 'Ananias', '1980-02-20', 'm', 'casado', 'Carpinteiro', 10),
	(3, 'Silvio', '1950-10-10', 'm', 'casado', 'Dublador', 11),
	(4, 'Léo', '2001-01-02', 'm', 'casado', 'Entregador', 11),
	(5, 'Chris', '1990-05-05', 'm', 'solteiro', 'Fisiculturista', 12),
	(6, 'Ana', '1997-04-01', 'f', 'solteira', 'Cantora', 13),
	(7, 'Jaime', '1970-03-01', 'm', 'casado', 'Carteiro', 14),
	(8, 'Alice', '2002-01-10', 'f', 'solteira', 'Advogada', 15),
	(9, 'Valentina', '1995-05-03', 'f', 'solteira', 'Zootecnista', 15),
	(10, 'Laura', '1998-05-09', 'f', 'solteira', 'Balconista', 15)
	
---seleciona estado, cidade, pessoa
SELECT pessoa.nome_pessoa, cidades.nome_cidade, estados.nome_estado
FROM pessoa INNER JOIN cidades
ON pessoa.id_cidade = cidades.id_cidade
INNER JOIN estados
ON cidades.id_estado = estados.id_estado;

---selecione pessoa de estado do parana
SELECT pessoa.nome_pessoa, estado.nome_estado, cidade.nome_cidade
FROM estado INNER JOIN cidades
ON estado.id_estado = cidade.id_estado
INNER JOIN pessoa
ON cidade.id_cidade = pessoa.id_cidade
WHERE estado.nome_estado LIKE 'parana';

---selecione o nome sda pessoa, profissao e qual cidade pertence
SELECT pessoa.nome_pessoa, cidade.ome_cidade, pessoa.profissao
FROM pessoa INNER JOIN cidades
ON pessoa.id_cidade = cidades.id_cidade

---selecionar cidade com mais mulher/homem
SELECT cidade.nome, COUNT(*) AS quantidade
FROM cidades INNER JOIN pessoa
ON cidae.id-cidade = pessoa.id_cidade
GRUP BY cidades.id_cidade


--1 - Selecione todas as pessoas
SELECT pessoa.nome_pessoa FROM pessoa;

--2 - Selecione todas pessoas do sexo Masculino "m";
SELECT pessoa.nome_pessoa, pessoa.sexo FROM pessoa
WHERE pessoa.sexo = 'm';

--3 - Selecione todas pessoas com estado civil solteiro;
SELECT pessoa.nome_pessoa, pessoa.estado_civil FROM pessoa
WHERE pessoa.estado_civil LIKE 'solteiro' 
OR pessoa.estado_civil LIKE 'solteira';

SELECT pessoa.nome_pessoa, pessoa.estado_civil FROM pessoa
WHERE pessoa.estado_civil LIKE 'solteir%';

--4 - Selecione as pessoas e sua profissão
SELECT pessoa.nome_pessoa, pessoa.profissao FROM pessoa;

--5 - Selecione as pessoas que nasceram entre 1980-01-01 e 2000-01-01
SELECT pessoa.nome_pessoa, pessoa.data_nascimento
FROM pessoa WHERE data_nascimento BETWEEN '1980-01-01' AND '2000-01-01';

--6 - Selecione as pessoas do Estado de São Paulo

SELECT pessoa.nome_pessoa, estados.nome_estado 
FROM pessoa INNER JOIN cidades
ON pessoa.id_cidade = cidades.id_cidade
INNER JOIN estados
ON cidades.id_estado = estados.id_estado
WHERE estados.nome_estado LIKE 'São Paulo';




