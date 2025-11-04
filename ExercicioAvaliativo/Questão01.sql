/*
ENUNCIADO QUESTÃO 01
Crie a tabela de mundo e cadastre as seguintes informações:
id|nome    |Descrição
------------------------------------------------------------------------------------------------------------------------------------------------------
1 |Maygïk  |Uma teocracia aliada aos magnatas exploradores regem esse mundo. Os desafios vão muito além do que você espera.
2 |Lucinera|O mundo é dominado por dragões. Como você vai trilhar o seu caminho:  Para livrar o seu povo ou para ascender como um senhor dos dragões?
*/

create table mundos(

    id int,
    nome varchar(45),
    descricao varchar(100),
    
    primary key(id)
);

insert into mundos
values(1, "Maygïk", "Uma teocracia aliada aos magnatas exploradores regem esse mundo. Os desafios vão muito além do que você espera."),
(2, "Lucinera", "O mundo é dominado por dragões. Como você vai trilhar o seu caminho:  Para livrar o seu povo ou para ascender como um senhor dos dragões?");

select * from mundos;