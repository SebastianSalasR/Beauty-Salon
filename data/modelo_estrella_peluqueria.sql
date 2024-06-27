create schema pel_estrella;

alter schema pel_estrella owner to pg_database_owner;

create table pel_estrella.cita(
    id_cita int primary key not null,
    fecha timestamp not null,
    id_servicio int not null,
    id_trabajador int not null,
    id_cliente int not null,
    id_comuna int not null,
    id_region int not null,
    id_sede int not null,
    id_venta int not null,
    id_producto int not null,
    id_cargo int not null
);

create table pel_estrella.cliente (
    id_cliente int primary key not null,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    rut int not null,
    telefono int not null
);

create table pel_estrella.servicio (
    id_servicio int primary key not null,
    precio int not null,
    tipo varchar(20) not null
);

create table pel_estrella.trabajador (
    id_trabajador int primary key not null,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    telefono int not null,
    sueldo int not null
);

create table pel_estrella.sede(
    id_sede int primary key not null,
    nombre varchar(20) not null,
    latitud float not null,
    longitud float not null
);

create table pel_estrella.comuna(
    id_comuna int primary key not null,
    nombre varchar(20) not null
);

create table pel_estrella.region(
    id_region int primary key not null,
    nombre varchar(20) not null
);

create table pel_estrella.venta (
    id_venta int primary key not null,
    precio_venta int not null,
    fecha timestamp not null
);

create table pel_estrella.cargo (
    id_cargo int primary key not null,
    nombre varchar(20) not null
);

create table pel_estrella.producto (
    id_producto int primary key not null,
    precio_compra int not null,
    nombre varchar(20) not null,
    stock int not null,
    flag boolean not null
);

alter table pel_estrella.cita
add constraint fk_cita_region
foreign key (id_region) references pel_estrella.region(id_region);

alter table pel_estrella.cita
add constraint fk_cita_comuna 
foreign key (id_comuna) references pel_estrella.comuna(id_comuna);

alter table pel_estrella.cita
add constraint fk_cita_sede
foreign key (id_sede) references pel_estrella.sede(id_sede);

alter table pel_estrella.cita
add constraint fk_cita_cliente
foreign key (id_cliente) references pel_estrella.cliente(id_cliente);

alter table pel_estrella.cita
add constraint fk_cita_trabajador 
foreign key (id_trabajador) references pel_estrella.trabajador(id_trabajador);

alter table pel_estrella.cita
add constraint fk_cita_servicio 
foreign key (id_servicio) references pel_estrella.servicio(id_servicio);

alter table pel_estrella.cita
add constraint fk_cita_venta 
foreign key (id_venta) references pel_estrella.venta(id_venta);

alter table pel_estrella.cita
add constraint fk_cita_cargo
foreign key (id_cargo) references pel_estrella.cargo(id_cargo);

alter table pel_estrella.cita
add constraint fk_cita_producto
foreign key (id_producto) references pel_estrella.producto(id_producto);
