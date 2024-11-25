CREATE DATABASE campeonato;

USE campeonato;

CREATE TABLE
    times (
        id_times TINYINT NOT NULL AUTO_INCREMENT,
        nome VARCHAR(80) NOT NULL,
        valor INT NOT NULL,
        ano_de_fundacao DATE NOT NULL,
        PRIMARY KEY (id_times)
    );

CREATE TABLE
    jogadores (
        id_jogadores TINYINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
        nome VARCHAR(80) NOT NULL,
        salario INT NOT NULL,
        dat_nasc DATE NOT NULL,
        id_times TINYINT NOT NULL,
        FOREIGN KEY (id_times) REFERENCES times (id_times)
    );

INSERT INTO
    times (nome, valor, ano_de_fundacao)
VALUES
    ('Time A', 1000000, '1900-01-01'),
    ('Time B', 2000000, '1920-05-15'),
    ('Time C', 1500000, '1950-08-20'),
    ('Time D', 2500000, '1980-11-30'),
    ('Time E', 3000000, '2000-03-10');

INSERT INTO
    jogadores (nome, salario, dat_nasc, id_times)
VALUES
    ('Jogador 1', 50000, '1990-01-01', 1),
    ('Jogador 2', 60000, '1992-02-02', 1),
    ('Jogador 3', 55000, '1991-03-03', 2),
    ('Jogador 4', 70000, '1989-04-04', 2),
    ('Jogador 5', 65000, '1993-05-05', 3),
    ('Jogador 6', 80000, '1988-06-06', 3),
    ('Jogador 7', 75000, '1994-07-07', 4),
    ('Jogador 8', 90000, '1987-08-08', 4),
    ('Jogador 9', 85000, '1995-09-09', 5),
    ('Jogador 10', 95000, '1986-10-10', 5);
