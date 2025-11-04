/*
ENUNCIADO

Crie a tabela de páginas e cadastre as seguintes informações:

PAGINAS
id|     título     |                               Descrição                                               |mundo
------------------------------------------------------------------------------------------------------------------
1 |O Culto do Heroi|Uma sociedade religiosa que segue os passos do Heroi que salvou Granjaran dos sombrios.|1	
2 | Uanteji        |Uma organização secreta de mercenários, espiões e assassinos.	                       |1

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

insert into mundos
values
(1, "Maygïk", "Uma teocracia aliada aos magnatas exploradores regem esse mundo. Os desafios vão muito além do que você espera."),
(2, "Lucinera", "O mundo é dominado por dragões. Como você vai trilhar o seu caminho:  Para livrar o seu povo ou para ascender como um senhor dos dragões?");

insert into paginas(id_paginas, titulo, descricao, id_mundos)
values 
(1, "O Culto do Heroi	", "Uma sociedade religiosa que segue os passos do Heroi que salvou Granjaran dos sombrios.	", 1),
(2, "Uanteji", "Uma organização secreta de mercenários, espiões e assassinos.	", 1);

select * from paginas;