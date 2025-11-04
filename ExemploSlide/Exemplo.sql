/*
Exercicio proposto:

Para as Tabelas faltantes do Modelo Relacional abaixo, escreva suas declarações DDL SQL. Para as Chaves
Estrangeiras, escolha a ação apropriada – cascade, set null, set default, – para cada restrição de integridade
referencial, tanto para exclusão da linha (ON DELETE), quanto para atualização (ON UPDATE).

EMPREGADO:
PNome | MInicial | UNome | SSN | DataNasc | Sexo | Salario | SSN_Supervisor | DNunero_Departamento |

DEPARTAMENTO:
| DNome | DNumero | SSN_Empregado | DataInicio |

DEPTO_LOCALIZACOES:
| LNumero | DLocalizacao | DNumero_Departamento |

PROJETO:
| PNome | PNumero | PLocalizacao | DNumero_Departamento |

TRABALHA_EM:
| SSN_Empregado | PNumero_Projeto | Horas |

DEPENDENTE:
| SSN_Empregado | Nome_Dependente | Sexo | DataNasc | Parentesco |

Observações:

- O DDL da Tabela Empregado não precisa ser feito, pois já foi usada como exemplo;
- Para configuração das Chaves Estrangeiras, utilize as opções que achar mais conveniente;
- Para os tipos das colunas das Tabelas, utilize as opções que achar mais conveniente.
*/

create table Empregado (
    Pnome VARCHAR(15) not null,
    Minicial char,
    Unome VARCHAR(15) not null,
    SSN int not null,
    DataNasc date,
    Endereco varchar(80),
    Sexo bit,
    Salario decimal(10,2),
    SSN_supervisor int,
    Dnumero_Departamento INTEGER not null default 1,

    primary key (SSN),
    constraint fk1,
    -- on DELETE: Define o que acontece com os registros relacionados quando você deleta um registro da tabela pai.
    -- on update: Define o que acontece quando você atualiza a chave primária da tabela pai.
    -- CASCADE - Atualiza automaticamente o valor da chave estrangeira nos registros relacionados.
    foreign key (SSN_supervisor) references Empregado(SSN) on delete set null on update cascade,
    constraint fk2,
    foreign key (Dnumero_Departamento) references Departamento(Dnumero) on delete set default on update cascade;
);

create table Departamento(
    Dnome varchar(45),
    Dnumero int,
    SSN_empregado int not null,
    Data_inicio date,

    primary key (Dnumero);
);

create table Projeto (
    Pnome varchar(45),
    Pnumero int,
    Plocaizacao varchar(80),
    Dnumero_Departamento integer not null,

    primary key (Pnumero),
    foreign key (Pnumero) references Empregado(Dnumero_Departamento);
);

create table Dependente (
    SSN_empregado int not null,
    Nome_Dependente varchar(45),
    Sexo bit,
    Data_Nasc date,
    Parentesco varchar(15),

    primary key (SSN_empregado, Nome_Dependente),
);

create table Depto_Localizacoes(
    LNumero int,
    DLocalizacoes varchar(80),
    Dnumero_Departamento INTEGER not null default 1,

    primary key (LNumero),
    foreign key (LNumero) references Departamento(Dnumero);
);

create table Trabalha_Em(
    SSN_Empregado int not null,
    PNumero_projeto int,
    horas time,

    primary key (SSN_Empregado, PNumero_projeto),
);