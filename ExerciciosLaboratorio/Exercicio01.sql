/*1. Crie um banco de dados chamado 'database1' verificando sua
existência. Casoexista, exclua antes mesmo de criá-lo;*/
DROP DATABASE IF EXISTS database1; -- Apaga o banco caso ele já exista.
CREATE DATABASE database1; -- Cria um novo banco de dados chamado database1.

-- 2. Execute o comando para utilizar seu banco de dados;
USE database1; -- Define que o banco ativo será o database1.

SET SQL_SAFE_UPDATES = 0; -- Utilizar Updates sem problemas

/*3. Crie uma nova tabela 'Pessoa', esta tabela deve conter um identificador único
obrigatório e auto-incremental, um nome (40 caracteres), um campo de endereço
e uma profissão (obrigatório);*/
CREATE TABLE Pessoa (
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(40),
    endereco VARCHAR(45),
    profissao VARCHAR(20) NOT NULL,

    primary key (id)
);

-- 4. Faça a inserção de 3 pessoas;
INSERT INTO Pessoa (nome, endereco, profissao) VALUES
('Matheus', 'Rua1', 'Engenheiro'),
('Felipe', 'Rua2', 'Medico'),
('Solange', 'Rua3', 'Jardineiro');

-- 5. Inclua uma nova coluna para o telefone;
ALTER TABLE Pessoa ADD telefone VARCHAR(20);

-- 6. Exclua a coluna de endereço;
ALTER TABLE Pessoa DROP COLUMN endereco;

-- 7. Atualize as pessoas adicionando telefone para as duas últimas;
UPDATE Pessoa SET telefone = '(35)99999-9999' WHERE id = 2;
UPDATE Pessoa SET telefone = '(35)99999-9998' WHERE id = 3;

-- 8. Modifique a capacidade do tipo do campo 'nome' para 30;
ALTER TABLE Pessoa MODIFY nome VARCHAR(30);

-- 9. Exclua a primeira pessoa;
DELETE FROM Pessoa WHERE id = 1;

-- 10. Mostre todos os dados;
SELECT * FROM Pessoa;

-- 11. Delete todos os dados das tabelas com um comando.
TRUNCATE TABLE Pessoa;