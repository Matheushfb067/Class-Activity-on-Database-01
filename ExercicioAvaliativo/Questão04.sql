/*
Enunciado: 

Crie a tabela de habilidades e cadastre as seguintes informações:

Habilidades
id|      descrição      |Atributo Base
---------------------------------------
1 |Corrida longa	    |Constituição
2 |Corrida de arrancada |Força	
3 |Acrobacia            |Destreza
4 | Tiro com arco	    | Destreza

*/

create table mundos(

    id_mundos int,
    nome varchar(45),
    descricao varchar(100),
    
    primary key(id_mundos)
);

create table paginas(
    id_paginas int, 
    titulo varchar(45),
    descricao varchar(100),
    id_mundos int,
    
    primary key (id_paginas)
    foreign key(id_mundos) references mundos(id_mundos)
);

create table itens(
    id_itens int, 
    nome varchar(45),
    preco int,
    peso float,
    vol float,
    
    primary key(id_itens)
);

create table habilidades(
    id_habilidades int, 
    descricao varchar(100),
    at_base char(45),
    
    primary key(id_habilidades)
);

insert into mundos
values
(1, "Maygïk", "Uma teocracia aliada aos magnatas exploradores regem esse mundo. Os desafios vão muito além do que você espera."),
(2, "Lucinera", "O mundo é dominado por dragões. Como você vai trilhar o seu caminho:  Para livrar o seu povo ou para ascender como um senhor dos dragões?");

insert into paginas(id_paginas, titulo, descricao, id_mundos)
values 
(1, "O Culto do Heroi	", "Uma sociedade religiosa que segue os passos do Heroi que salvou Granjaran dos sombrios.	", 1),
(2, "Uanteji", "Uma organização secreta de mercenários, espiões e assassinos.	", 1);

insert into itens
values 
(1, "Ungento restaurador", 80, 0.2, 0.25),
(2, "Poção de regeneração", 200, 0.2, 0.35),
(3, " Bolsa de explorador", 20, 0.6, 1.2),
(4, " Bolsa encantada", 500, 0.7, 1.1),
(5, " Machado de guerra	", 50, 15.5, 10.1);

insert into habilidades
values
(1, "Corrida longa", "Constituição"),
(2, "Corrida de arrancada", "Força"),
(3, "Acrobacia", "Destreza"),
(4, " Tiro com arco	", "Destreza");

select * from habilidades;

