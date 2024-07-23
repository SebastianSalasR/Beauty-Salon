create table centro_distribucion (
id INT primary key,
nombre varchar,
latitud float,
longitud float,
operador varchar,
id_centro_energia int,
id_comuna int
);

create TABLE centro_energia (
id INT PRIMARY KEY,
nombre varchar,
latitud float,
longitud float,
tipo_energia varchar,
id_comuna int
)

create table poste_luz (
id INT primary key,
latitud float,
longitud float,
estado varchar,
id_transformador int,
id_centro_distribucion int,
id_poste_luz int
);

create table transformador (
id INT primary key,
codigo int,
potencia float,
estado varchar,
id_poste_luz int
);

create table cliente (
id INT primary key,
nombre varchar,
apellido varchar,
rut varchar,
latitud float,
longitud float,
id_medidor int,
id_comuna int
);

create table boleta (
id INT primary key,
precio float,
fecha_emitida timestamp,
fecha_vencimiento timestamp,
consumo_diario float,
id_cliente int
);

create table medidor (
id INT primary key,
cantidad_energia float,
modelo varchar,
tipo varchar,
id_transformador int
);

CREATE TABLE comuna (
id INT PRIMARY KEY,
nombre varchar,
id_region int
)

CREATE TABLE region (
id INT PRIMARY KEY,
nombre varchar,
id_pais int
)

CREATE TABLE pais (
id INT PRIMARY KEY,
nombre varchar
)

alter table poste_luz
add constraint id_transformador
foreign key (id_transformador) references transformador(id),
add constraint id_centro_distribucion
foreign key (id_centro_distribucion) references centro_distribucion(id),
add constraint id_poste_luz
foreign key (id_poste_luz) references poste_luz(id);

alter table transformador
add constraint id_poste_luz
foreign key (id_poste_luz) references poste_luz(id);

alter table medidor
add constraint id_transformador
foreign key (id_transformador) references transformador(id);

alter table cliente
add constraint id_comuna
foreign key (id_comuna) references comuna(id),
ADD CONSTRAINT id_medidor
FOREIGN KEY (id_medidor) REFERENCES medidor(id);

alter table boleta
add constraint id_cliente
foreig key (id_cliente) references cliente(id);

ALTER TABLE centro_distribucion
ADD CONSTRAINT id_centro_energia
FOREIGN KEY (id_centro_energia) REFERENCES centro_energia(id),
ADD CONSTRAINT id_comuna
FOREIGN KEY (id_comuna) REFERENCES comuna(id);

ALTER TABLE centro_energia
ADD CONSTRAINT id_comuna
FOREIGN KEY (id_comuna) REFERENCES comuna(id);

ALTER TABLE comuna
ADD CONSTRAINT id_region
FOREIGN KEY (id_region) REFERENCES region(id);

ALTER TABLE region
ADD CONSTRAINT id_pais
FOREIGN KEY (id_pais) REFERENCES pais(id);
