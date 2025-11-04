/*
Enunciado: 

Crie o esquema para os itens e cadastre as seguintes informações:

Itens
id|nome|     preço      |peso|vol
-----------------------------------
1 |Ungento restaurador  |80  |0.25
2 |Poção de regeneração	|200 |0.35
3 |Bolsa de explorador	|20  |1.2
4 |Bolsa encantada	    |500 |1.1
5 |Machado de guerra	|50  |10.1

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
    foreign key(id_paginas) references mundos(id_mundos)
);

create table itens(
    id_itens int, 
    nome varchar(45),
    preco int,
    peso float,
    vol float,
    
    primary key(id_itens)
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

select * from itens;