create extension postgis

create table if not exists gradinita(
	id serial primary key not null,
	nume varchar(100) not null,
	adresa varchar(100) not null,
	geom geometry('Polygon', 4326) not null
);

create table if not exists directoare(
	id serial primary key not null,
	nume varchar(50) not null,
	mail varchar(50),
	gradinita_id int not null,
	geom geometry('Point', 4326) not null,
	foreign key (id) references gradinita(id)
);

create table if not exists grupa(
	id serial primary key not null,
	tip varchar(50) not null,
	gradinita_id int not null,
	geom geometry('LineString', 4326) not null,
	foreign key (id) references gradinita(id)
);

create table if not exists educatoare(
	id serial primary key not null,
	nume varchar(50) not null,
	telefon char(10),
	grupa_id int not null,
	geom geometry('Point', 4326) not null,
	foreign key (id) references grupa(id)
);

create table if not exists ingrijitoare(
	id serial primary key not null,
	nume varchar(50) not null,
	mail varchar(50),
	grupa_id int not null,
	geom geometry('Point', 4326) not null,
	foreign key (id) references grupa(id)
);

create table if not exists grupa_ingrijitoare(
	id serial primary key not null,
	grupa_id int not null,
	ingrijitoare_id int not null,
	foreign key(id) references grupa(id),
	foreign key(id) references ingrijitoare(id)
);
