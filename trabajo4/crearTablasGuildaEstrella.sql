create table distribuir_energia (
    id INT primary key,
    id_cliente int,
    id_boleta int,
    id_centro_distribucion int,
    id_medidor int,
    id_transformador int,
    id_poste_luz int,
    precio_boleta float,
    fecha_emitida_boleta timestamp,
    fecha_vencimiento_boleta timestamp,
    operador_centro varchar,
    tipo_energia_centro varchar,
    ubicacion_centro varchar,
    tipo_medidor varchar,
    cantidad_energia float,
    estado_transformador varchar,
    ubicacion_transformador varchar,
    potencia_transformador float,
    ubicacion_poste varchar,
    estado_poste varchar
);

create table poste_luz (id INT primary key);

CREATE TABLE centro_distribucion (
    id INT PRIMARY KEY,
    ubicacion_centro VARCHAR(60)
);

create table medidor (id INT primary key);

create table transformador (id INT primary key);

CREATE TABLE cliente (
    id INT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL
);

create table boleta (id INT primary key);

alter table distribuir_energia
add constraint id_cliente foreign key (id_cliente) references cliente(id),
add constraint id_boleta foreign key (id_boleta) references boleta(id),
add constraint id_centro_distribucion foreign key (id_centro_distribucion) references centro_distribucion(id),
add constraint id_medidor foreign key (id_medidor) references medidor(id),
add constraint id_transformador foreign key (id_transformador) references transformador(id),
add constraint id_poste_luz foreign key (id_poste_luz) references poste_luz(id);