create table vendas(
    cod int,
    data_hora datetime,
    email varchar(45),

    primary key(cod)
);

create table itens_vendas(
    cod_venda int,
    cod_item int,
    quantidade int,


    primary key(cod_venda, cod_item),
    foreign key (cod_venda) references vendas(cod)
);

insert into vendas
values
(1, "2024-05-10 11:22", "j@g.com"),
(2, "2024-05-12 11:22", "k@g.com"),
(3, "2024-05-13 11:22", "a@g.com"),
(4, "2024-05-13 11:22", "r@g.com"),
(5, "2024-05-13 11:22", "r@g.com"),
(6, "2024-05-14 11:22", "f@g.com"),
(7, "2024-05-15 11:22", "r@g.com");

insert into itens_vendas
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

-- SUM: soma as linhas da tabela quantidade
-- COUNT: conta as linhas da tabela
-- DISTINCT: mostra apenas os diferentes valores sem repetições
-- AS: renomeia momentaneamente a tabela
--ROUND: arredonda numeros decimais já que precisamos de uma divisão inteira
select
    ROUND(
        SUM(quantidade) / COUNT(DISTINCT cod_venda)
    ) AS quantidade_media
from
    itens_vendas;

select
    cod_item,
    SUM(quantidade) AS total_vendido
from
    itens_vendas
group by -- serve para agrupar linhas da tabela que têm valores iguais em uma ou mais colunas.
    cod_item
order by
    total_vendido DESC
-- Limit: limita para 5 o total mostrado
limit 5;