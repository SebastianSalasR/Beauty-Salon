create schema peluqueria;

alter schema peluqueria owner to pg_database_owner;

create table peluqueria.region (
    id_region int primary key not null,
    nombre varchar(20) not null
);

create table peluqueria.comuna (
    id_comuna int primary key not null,
    nombre varchar(20) not null,
    id_region int not null
);

create table peluqueria.sede (
    id_sede int primary key not null,
    nombre varchar(20) not null,
    latitud float not null,
    longitud float not null,
    id_comuna int not null
);

create table peluqueria.trabajador (
    id_trabajador int primary key not null,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    telefono int not null,
    sueldo int not null,
    id_sede int not null,
    id_cargo int not null
);

create table peluqueria.cargo (
    id_cargo int primary key not null,
    nombre varchar(20) not null
);

create table peluqueria.producto (
    id_producto int primary key not null,
    precio_compra int not null,
    nombre varchar(20) not null,
    stock int not null,
    flag boolean not null,
    precio_venta int not null,
    id_sede int not null
    
);

create table peluqueria.servicio (
    id_servicio int primary key not null,
    precio int not null,
    tipo varchar(20) not null,
    id_sede int not null
    
);

create table peluqueria.venta (
    id_venta int primary key not null,
    precio_venta int not null,
    fecha timestamp not null,
    id_producto int not null,
    id_trabajador int not null,
    id_cliente int not null
);

create table peluqueria.cita (
    id_cita int primary key not null,
    fecha timestamp not null,
    id_trabajador int not null,
    id_cliente int not null,
    id_servicio int not null
    
);

create table peluqueria.cliente (
    id_cliente int primary key not null,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    rut int not null,
    telefono int not null
);

alter table peluqueria.comuna 
add constraint id_region
foreign key (id_region) references peluqueria.region(id_region);

alter table peluqueria.sede 
add constraint id_comuna
foreign key (id_comuna) references peluqueria.comuna(id_comuna);

alter table peluqueria.trabajador 
add constraint id_sede
foreign key (id_sede) references peluqueria.sede(id_sede);

alter table peluqueria.trabajador 
add constraint id_cargo
foreign key(id_cargo) references peluqueria.cargo(id_cargo);

alter table peluqueria.producto
add constraint id_sede
foreign key (id_sede) references peluqueria.sede(id_sede);

alter table peluqueria.servicio
add constraint id_sede
foreign key (id_sede) references peluqueria.sede(id_sede);

alter table peluqueria.venta
add constraint id_product
foreign key (id_producto) references peluqueria.producto(id_producto);

alter table peluqueria.venta
add constraint id_trabajador
foreign key (id_trabajador) references peluqueria.trabajador(id_trabajador);

alter table peluqueria.cita
add constraint id_trabajador
foreign key (id_trabajador) references peluqueria.trabajador(id_trabajador);

alter table peluqueria.cita 
add constraint id_cliente
foreign key(id_cliente) references peluqueria.cliente(id_cliente);

alter table peluqueria.cita
add constraint id_servicio
foreign key (id_servicio) references peluqueria.servicio(id_servicio);

alter table peluqueria.venta
add constraint id_cliente
foreign key (id_cliente) references peluqueria.cliente(id_cliente);

alter table peluqueria.detalle
add constraint id_venta
foreign key(id_venta) references peluqueria.venta(id_venta);

alter table peluqueria.cliente
add constraint id_venta
foreign key (id_venta) references peluqueria.venta(id_venta);



