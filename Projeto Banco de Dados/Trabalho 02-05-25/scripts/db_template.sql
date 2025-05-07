CREATE DATABASE populacao;

USE populacao;

DROP TABLE IF EXISTS pessoas;

CREATE TABLE pessoas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    idade TINYINT UNSIGNED NOT NULL,
    genero VARCHAR(10) NOT NULL,
    escolaridade VARCHAR(30) NOT NULL,
    ocupacao VARCHAR(20) NOT NULL,
    renda VARCHAR(20) NOT NULL,
    estado_civil VARCHAR(20) NOT NULL,
    estado CHAR(2) NOT NULL,
    cidade VARCHAR(50) NOT NULL
);