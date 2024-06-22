create table region (
    id int primary key not null,
    nombre varchar(20) not null,
);

create table comuna (
    id int primary key not null,
    nombre varchar(20) not null,
);

create table sede (
    id int primary key not null,
    nombre varchar(20) not null,
    latitud float not null,
    latitud float not null,
);

create table trabajador (
    id int primary key not null,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    telefono int not null,
    sueldo int not null,
);

create table cargo (
    id int primary key not null,
    sueldo int not null,
    nombre varchar(20) not null,
);

create table producto (
    id int primary key not null ,
    precio_compra int not null,
    nombre varchar(20) not null,
    stock int not null,
    flag boolean not null,
    precio_venta int not null,
);

create table servicio (
    id int primary key not null,
    precio int not null,
    tipo varchar(20) not null,
);
create table region (
    id int primary key not null,
    nombre varchar(20) not null,
);

create table comuna (
    id int primary key not null,
    nombre varchar(20) not null,
);

create table sede (
    id int primary key not null,
    nombre varchar(20) not null,
    latitud float not null,
    latitud float not null,
);

create table trabajador (
    id int primary key not null,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    telefono int not null,
    tipo varchar(10) not null,
    sueldo int not null,
);

create table producto (
    id int primary key not null,
    precio_compra int not null,
    nombre varchar(20) not null,
);

create table servicio (
    id int primary key not null,
    precio int not null,
    tipo varchar(20) not null,
);

create table venta(
    id int primary key not null,
    precio_venta int not null,
    fecha timestamp not null,
);

create table cita (
    id int primary key not null,
    fecha timestamp not null,
);

create table cliente (
    id int primary key not null,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    rut int not null,
    telefono int not null,
);

alter table comuna 
add constraint id_region
foreign key (id_region) references region(id);

alter table sede 
add constraint id_comuna
foreign key (id_comuna) references comuna(id);

alter table trabajador 
add constraint id_sede
foreign key (id_sede) references sede(id);

alter table producto
add constraint id_sede
foreign key (id_sede) references sede(id);

alter table servicio
add constraint id_sede
foreign key (id_sede) references sede(id);

alter table venta
add constraint id_producto
add constraint id_trabajador
foreign key (id_producto) references producto(id);
foreign key (id_trabajador) references trabajador(id);

alter table cita
add constraint id_servicio
add constraint id_trabajador
foreign key (id_servicio) references servicio(id);
foreign key (id_trabajador) references trabajador(id);

alter table cliente
add constraint id_venta
add constraint id_servicio
foreign key (id_venta) references venta(id);
foreign key (id_servicio) references servicio(id);

add constraint id_sede
foreign key (id_sede) references sede(id);

alter table venta
add constraint id_producto
add constraint id_trabajador
foreign key (id_producto) references producto(id);
foreign key (id_trabajador) references trabajador(id);