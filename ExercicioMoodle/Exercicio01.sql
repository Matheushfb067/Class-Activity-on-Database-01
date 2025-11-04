--Enunciado:
/*
Poles está começando sua loja sua loja online de itens. Inicialmente ele quer 
começar registrando todos os itens disponíveis para venda.

Dada a lista itens a seguir, Poles precisa ver se os itens foram cadastrados 
corretamente. Para isso, depois de fazer os cadastros execute a query "SELECT * FROM item;".
*/

create table item(
    cod_item int,
    nome varchar(20),
    preco float,
    quantidade int,
    
    primary key(cod_item)
);

insert into item 
values(1, "Arco", 20, 22),
(2,	"Flecha", 2, 43),
(3, "Espada", 35, 16),
(4, "Escudo", 20, 20),
(5, "Maça", 23, 19),
(6,	 "Mangual", 56, 16),
(7, "Lança", 21, 18),
(8,	"Machado",20, 21);

select * from item;