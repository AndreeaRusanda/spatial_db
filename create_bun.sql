CREATE EXTENSION IF NOT EXISTS postgis;

CREATE TABLE IF NOT EXISTS gradinita(
    id serial PRIMARY KEY NOT NULL,
    nume varchar(100) NOT NULL,
    adresa varchar(100) NOT NULL,
    geom geometry('Polygon', 4326) NOT NULL
);

CREATE TABLE IF NOT EXISTS directoare(
    id serial PRIMARY KEY NOT NULL,
    nume varchar(50) NOT NULL,
    mail varchar(50),
    gradinita_id int NOT NULL,
    geom geometry('Point', 4326) NOT NULL,
    FOREIGN KEY (gradinita_id) REFERENCES gradinita(id)
);

CREATE TABLE IF NOT EXISTS grupa(
    id serial PRIMARY KEY NOT NULL,
    tip varchar(50) NOT NULL,
    gradinita_id int NOT NULL,
    geom geometry('LineString', 4326) NOT NULL,
    FOREIGN KEY (gradinita_id) REFERENCES gradinita(id)
);

CREATE TABLE IF NOT EXISTS educatoare(
    id serial PRIMARY KEY NOT NULL,
    nume varchar(50) NOT NULL,
    telefon char(10),
    grupa_id int NOT NULL,
    geom geometry('Point', 4326) NOT NULL,
    FOREIGN KEY (grupa_id) REFERENCES grupa(id)
);

CREATE TABLE IF NOT EXISTS ingrijitoare(
    id serial PRIMARY KEY NOT NULL,
    nume varchar(50) NOT NULL,
    mail varchar(50),
    grupa_id int NOT NULL,
    geom geometry('Point', 4326) NOT NULL,
    FOREIGN KEY (grupa_id) REFERENCES grupa(id)
);

CREATE TABLE IF NOT EXISTS grupa_ingrijitoare(
    id serial PRIMARY KEY NOT NULL,
    grupa_id int NOT NULL,
    ingrijitoare_id int NOT NULL,
    FOREIGN KEY (grupa_id) REFERENCES grupa(id),
    FOREIGN KEY (ingrijitoare_id) REFERENCES ingrijitoare(id)
);
