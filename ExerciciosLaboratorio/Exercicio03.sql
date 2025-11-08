DROP DATABASE IF EXISTS Empresa_funcionario;
CREATE DATABASE Empresa_funcionario;

USE Empresa_funcionario;

CREATE TABLE Funcionario(
    id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(45),
    idade INT,
    departamento VARCHAR(20),
    email VARCHAR(30),

    primary key (id)
);

/*Crie uma Function criaEmailFuncionario para criar um email para cada funcionário
  no estilo: ‘nome@departamento.empresa.com’;*/
-- Use a função CONCAT() para gerar o email, colocando os atributos entre vírgulas
DELIMITER $$
CREATE FUNCTION criaEmailFuncionario (nome VARCHAR(50), departamento VARCHAR(50)) RETURNS VARCHAR (100)
DETERMINISTIC
BEGIN
    RETURN CONCAT(nome, '@', departamento, '.empresa.com');
END $$
DELIMITER ;

-- Crie uma Procedure insereFuncionario para fazer as inserções dos funcionários;
DELIMITER $$
CREATE PROCEDURE insereFuncionario()
BEGIN
    INSERT INTO Funcionario(nome, idade, departamento, email)
    VALUES
        ('Carlos', 30, 'rh', criaEmailFuncionario('Carlos', 'rh')),
        ('Lucia', 27, 'ti', criaEmailFuncionario('Lucia', 'ti')),
        ('Bruno', 35, 'adm', criaEmailFuncionario('Bruno', 'adm'));
END $$
DELIMITER ;

-- Chamando a procedure para inserir os dados
CALL insereFuncionario();

SELECT email FROM Funcionario;


