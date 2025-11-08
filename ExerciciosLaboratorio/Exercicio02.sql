DROP DATABASE IF EXISTS comandosSQL;
CREATE DATABASE comandosSQL;
USE comandosSQL;

CREATE TABLE Pessoa (
    id INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    idade INT NOT NULL,
    telefone CHAR(14) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Carro (
    id INT AUTO_INCREMENT NOT NULL,
    nome VARCHAR(45) NOT NULL,
    marca VARCHAR(45) NOT NULL,
    ano INT NOT NULL,
    cor VARCHAR(45) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE Pessoa_has_Carro (
    idPessoa INT NOT NULL,
    idCarro INT NOT NULL,
    dataAquisicao DATE NOT NULL,
    PRIMARY KEY (idPessoa, idCarro),
    FOREIGN KEY (idPessoa) REFERENCES Pessoa(id) ON DELETE CASCADE,
    FOREIGN KEY (idCarro) REFERENCES Carro(id) ON DELETE CASCADE
);

INSERT INTO Pessoa (nome, idade, telefone) VALUES
('Joao Silva', 28, '(11)98765-432'),
('Maria Santos', 35, '(21)97654-321'),
('Pedro Oliveira', 42, '(31)96543-210'),
('Ana Costa', 31, '(41)95432-109'),
('Carlos Souza', 25, '(51)94321-098'),
('Juliana Lima', 29, '(61)93210-987'),
('Roberto Alves', 38, '(71)92109-876');

INSERT INTO Carro (nome, marca, ano, cor) VALUES
('Civic', 'Honda', 2020, 'Preto'),
('Corolla', 'Toyota', 2021, 'Branco'),
('Gol', 'Volkswagen', 2019, 'Prata'),
('HB20', 'Hyundai', 2022, 'Vermelho'),
('Onix', 'Chevrolet', 2021, 'Azul'),
('Compass', 'Jeep', 2023, 'Branco'),
('Kicks', 'Nissan', 2020, 'Laranja'),
('T-Cross', 'Volkswagen', 2022, 'Cinza'),
('Creta', 'Hyundai', 2023, 'Preto');

INSERT INTO Pessoa_has_Carro (idPessoa, idCarro, dataAquisicao) VALUES
(1, 1, '2020-05-15'),
(1, 3, '2021-08-20'),
(2, 2, '2021-03-10'),
(2, 6, '2023-01-25'),
(3, 4, '2022-07-18'),
(4, 5, '2021-11-30'),
(5, 7, '2020-09-12'),
(6, 8, '2022-04-05'),
(6, 9, '2023-06-14');

-- 1) Busque o nome e a idade das pessoas que têm carro
SELECT p.nome, p.idade
FROM Pessoa p
JOIN Pessoa_has_Carro pc ON p.id = pc.idPessoa;

-- 2) Busque o nome das pessoas que têm mais de um carro
SELECT p.nome, COUNT(pc.idCarro) AS quantidade_carros
FROM Pessoa p
JOIN Pessoa_has_Carro pc ON p.id = pc.idPessoa
GROUP BY p.nome
HAVING quantidade_carros > 1;

-- 3) Busque o nome das pessoas e o nome dos carros que elas possuem
SELECT p.nome AS pessoa, c.nome AS carro
FROM Pessoa p
JOIN Pessoa_has_Carro pc ON p.id = pc.idPessoa
JOIN Carro c ON c.id = pc.idCarro;

-- 4) Busque o nome das pessoas, o nome e marca dos carros que possuem, ordenados pelo nome da pessoa
SELECT p.nome AS pessoa, c.nome AS carro, c.marca
FROM Pessoa p
JOIN Pessoa_has_Carro pc ON p.id = pc.idPessoa
JOIN Carro c ON c.id = pc.idCarro
ORDER BY p.nome;

-- 5) Busque todas as informações das pessoas que possuem carros da marca Honda ou Hyundai
SELECT DISTINCT p.*
FROM Pessoa p
JOIN Pessoa_has_Carro pc ON p.id = pc.idPessoa
JOIN Carro c ON c.id = pc.idCarro
WHERE c.marca = 'Honda' OR c.marca = 'Hyundai';