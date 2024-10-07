drop database if exists interclasse;
create database interclasse character set utf8 collate utf8_general_ci;
use interclasse;

-- Tabela de modalidades
create table modalidade(
    id int not null primary key auto_increment,
    nome varchar(100) not null
);

-- Tabela de classes
create table classe(
    id int not null primary key auto_increment,
    sala varchar(100) not null,
    vitorias int not null,
    derrotas int not null,
    q_ouro int not null,
    q_prata int not null,
    q_bronze int not null
);

-- Tabela de jogadores
create table jogadores(
    id int not null primary key auto_increment,
    nome varchar(100) not null,
    idade varchar(3) not null,
    sala_id int not null,
    FOREIGN KEY (sala_id) REFERENCES classe(id)
);

-- Tabela de destaques
create table destaques(
    id int not null primary key auto_increment,
    sala_id int not null,
    jogador_id int not null,
    modalidade_id int not null,
    FOREIGN KEY (jogador_id) REFERENCES jogadores(id),
    FOREIGN KEY (modalidade_id) REFERENCES modalidade(id),
    FOREIGN KEY (sala_id) REFERENCES classe(id)
);

-- Tabela de jogos
create table jogos(
    id int not null primary key auto_increment,
    data_jogo datetime,
    modalidade_id int not null,
    vencedor_id int not null,
    perdedor_id int not null,
    placar varchar(100) not null,
    FOREIGN KEY (vencedor_id) REFERENCES classe(id),
    FOREIGN KEY (perdedor_id) REFERENCES classe(id),
    FOREIGN KEY (modalidade_id) REFERENCES modalidade(id)
);


show tables;

insert into modalidade values
(null,'Vôlei Fem'),
(null,'Vôlei Misto'),
(null,'Futsal Masc'),
(null,'Society'),
(null,'Dama'),
(null,'Xadrez'),
(null,'Futmesa'),
(null,'Futsal Fem');

insert into classe values
(null,'2ºA', 4, 5, 4, 2, 2),
(null,'1ºA', 2, 7, 2, 3, 1),
(null,'9ºA', 1, 8, 1, 1, 2),
(null,'9ºB', 1, 8, 1, 1, 1),
(null,'1ºB', 1, 8, 1, 1, 1);

INSERT INTO jogadores VALUES
(null,'Milena', '16', 1),
(null,'Lohaine', '16', 1),
(null,'Henrico', '16', 1),
(null,'Lucas Hasman', '16', 1),
(null,'Guilherme Stafocher', '17', 1),
(null,'Leonardo', '17', 1),
(null,'Gabriela', '16', 1),
(null,'Guilherme Canina', '16', 1),
(null,'Laila', '17', 1),
(null,'Isabele', '16', 1),
(null,'Olavo', '16', 1),
(null,'Dahra', '16', 1),
(null,'Maria Eduarda Silva', '16', 1),
(null,'Lucas Giachetto', '17', 1),
(null,'Juliano', '16', 2),
(null,'Murilo', '15', 2),
(null,'Ítalo', '16', 2),
(null,'Miguel Jerbi', '16', 2),
(null,'Luiz Otávio', '15', 2),
(null,'Kaique', '15', 2),
(null,'Davi', '15', 2),
(null,'Otávio', '15', 2),
(null,'Luiza', '16', 2),
(null,'Leandro', '15', 2),
(null,'Beatriz', '15', 2),
(null,'Letícia', '16', 2),
(null,'Julia Novo', '15', 2),
(null,'Clara', '15', 2),
(null,'Tamires', '15', 2),
(null,'Enzo', '15', 2),
(null,'Luiz Henrique', '16', 2),
(null,'Gustavo', '17', 2),
(null,'João Tandelo', '15', 2),
(null,'Mirella', '15', 2),
(null,'Mariana', '16', 2),
(null,'Sayury', '15', 2),
(null, 'Enzo', 14, 3),
(null, 'Tobias', 14, 3),
(null, 'Pedro', 14, 3),
(null, 'Caio', 14, 3),
(null, 'Otávio', 14, 3),
(null, 'Briam', 14, 3),
(null, 'Lavinia', 14, 3),
(null, 'Marina', 14, 3),
(null, 'Vitor', 14, 3),
(null, 'Heitor', 14, 3),
(null, 'Samuel', 14, 4),
(null, 'Samuel Bueno', 16, 4),
(null, 'Thiago', 14, 4),
(null, 'Kauã', 15, 4),
(null, 'Miguel Pignata', 14, 4),
(null, 'João Henrique', 14, 4),
(null, 'Davi Cardial', 15, 4),
(null, 'Nicollas Felisbelo', 15, 5),
(null, 'Henrique', 15, 5);


insert into destaques values
(null, 1, 1, 1),
(null, 2, 28, 1),
(null, 1, 7, 2),
(null, 2, 28, 2),
(null, 2, 33, 2),
(null, 3, 39, 2),
(null, 4, 50, 2),
(null, 5, 28, 2),
(null, 1, 10, 3),
(null, 2, 30, 3),
(null, 3, 36, 3),
(null, 4, 35, 3),
(null, 5, 54, 3),
(null, 1, 5, 4),
(null, 2, 20, 4),
(null, 3, 29, 4),
(null, 5, 53, 5),
(null, 1, 10, 6),
(null, 1, 5, 7),
(null, 1, 6, 7),
(null, 1, 9, 8),
(null, 2, 25, 8);


insert into jogos values
(null,'2024-23-10', 1, 2, 1, '0-2'),
(null,'2024-23-10', 2, 3, 2, '0-2'),
(null,'2024-23-10', 3, 2, 1, '5-1'),
(null,'2024-23-10', 4, 1, 4, '2-10'),
(null,'2024-23-10', 4, 1, 2, '2-7'),
(null,'2024-23-10', 6, 2, 3, '0-0'),
(null,'2024-23-10', 7, 1, 2, '0-0'),
(null,'2024-23-10', 8, 2, 1, '0-3');

create view v_destaques as
SELECT d.id, c.sala, j.nome as jogador, m.nome as modalidade FROM destaques d join classe c on d.sala_id = c.id join jogadores j on d.jogador_id = j.id join modalidade m on d.modalidade_id = m.id;