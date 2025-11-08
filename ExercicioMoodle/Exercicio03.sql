create table itens(
    cod_item int,
    nome varchar(45),
    preco int,
    quantidade int,

    primary key(cod_item)
);

create table vendas(
    cod int,
    data_hora datetime,
    email varchar(45),

    primary key(cod)
);

create table itens_vendidos(
    cod_venda int,
    cod_item int,
    quantidade int,

    primary key(cod_venda, cod_item)
);

insert into itens
values
(1, "Arco", 20, 22),
(2, "Flecha", 2, 43),
(3, "Espada", 35, 16),
(4, "Escudo", 20, 20),
(5, "Maça", 23, 19),
(6, "Mangual", 56, 16),
(7, "Lança", 21, 18),
(8, "Machado", 20, 21);

insert into vendas
values
(1, "2024-05-10 11:22", "j@g.com"),
(2, "2024-05-12 11:22", "k@g.com"),
(3, "2024-05-13 11:22", "a@g.com"),
(4, "2024-05-13 11:22", "r@g.com"),
(5, "2024-05-13 11:22", "r@g.com"),
(6, "2024-05-14 11:22", "f@g.com"),
(7, "2024-05-15 11:22", "r@g.com");

insert into itens_vendidos
values
(1, 1, 15),
(1, 3, 5),
(2, 2, 2),
(3, 5, 2),
(4, 8, 3),
(4, 6, 2),
(4, 1, 1),
(5, 3, 6),
(6, 4, 7),
(6, 3, 5),
(7, 7, 10);

/*Atualizando Estoque*/
UPDATE itens i
SET quantidade = quantidade - IFNULL(
    SELECT SUM(iv.quantidade)
    FROM itens_vendidos iv
    WHERE iv.cod_item = i.cod_item
);

/*Lista de itens com menos de 10 peças ordenados por quantidade*/
SELECT
    nome,
    quantidade
FROM
    itens
WHERE
    quantidade < 10
ORDER BY
    quantidade ASC;