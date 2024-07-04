create schema peluqueria;

alter schema peluqueria owner to pg_database_owner;

create table peluqueria.region (
    id_region serial primary key,
    nombre varchar(20) not null
);

create table peluqueria.comuna (
    id_comuna serial primary key,
    nombre varchar(20) not null,
    id_region int not null
);

create table peluqueria.sede (
    id_sede serial primary key,
    nombre varchar(20) not null,
    latitud float not null,
    longitud float not null,
    id_comuna int not null
);

create table peluqueria.trabajador (
    id_trabajador serial primary key,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    telefono int not null,
    id_sede int not null,
    id_comuna int not null
);

create table peluqueria.cargo (
    id_cargo serial primary key,
    nombre varchar(20) not null
);

create table peluqueria.contrato(
	id_contrato serial primary key,
	sueldo int not null,
	fecha_inicio date not null,
	fecha_termino date not null,
	comision int not null,
	id_cargo int not null,
	id_trabajador int not null
);

create table peluqueria.liquidacion(
	id_liquidacion serial primary key,
	fecha_pago date not null,
	monto_comision int not null,
	id_contrato int not null
);


create table peluqueria.producto (
    id_producto serial primary key,
    precio_compra int not null,
    nombre varchar(20) not null,
    stock int not null,
    flag boolean not null,
    precio_venta int not null,
    id_vender_producto int not null,
    id_tener_venta int not null
);

create table peluqueria.vender_producto (
    id_vender_producto serial primary key,
    id_producto int not null,
    id_sede int not null
);

create table peluqueria.servicio (
    id_servicio serial primary key,
    precio int not null,
    tipo varchar(20) not null,
    flag varchar(20) not null,
    id_vender_servicio int not null
);

create table peluqueria.vender_servicio(
    id_vender_servicio serial primary key,
    id_servicio int not null,
    id_sede int not null
);

create table peluqueria.venta (
    id_venta serial primary key,
    precio_venta_total int not null,
    fecha timestamp not null,
    id_cliente int not null,
    id_trabajador int not null,
    id_tener_venta int not null
);

create table peluqueria.tener_venta(
    id_tener_venta serial primary key,
    id_producto int not null,
    id_venta int not null
);

create table peluqueria.cita (
    id_cita serial primary key,
    fecha timestamp not null,
    id_trabajador int not null,
    id_cliente int not null,
    id_servicio int not null
);

create table peluqueria.cliente (
    id_cliente serial primary key,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    rut varchar not null,
    telefono int not null,
    sexo varchar[20] not null,
    id_comuna int not null
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

alter table peluqueria.producto
add constraint id_vender_producto
foreign key (id_vender_producto) references peluqueria.vender_producto(id_vender_producto);

alter table peluqueria.producto
add constraint id_tener_venta
foreign key (id_tener_venta) references peluqueria.tener_venta(id_tener_venta);

alter table peluqueria.servicio
add constraint id_vender_servicio
foreign key (id_vender_servicio) references peluqueria.vender_servicio(id_vender_servicio);

alter table peluqueria.venta
add constraint id_tener_venta
foreign key (id_tener_venta) references peluqueria.tener_venta(id_tener_venta);

alter table peluqueria.venta
add constraint id_trabajador
foreign key (id_trabajador) references peluqueria.trabajador(id_trabajador);

alter table peluqueria.venta
add constraint id_cliente
foreign key (id_cliente) references peluqueria.cliente(id_cliente);

alter table peluqueria.cita
add constraint id_trabajador
foreign key (id_trabajador) references peluqueria.trabajador(id_trabajador);

alter table peluqueria.cita 
add constraint id_cliente
foreign key(id_cliente) references peluqueria.cliente(id_cliente);

alter table peluqueria.cita
add constraint id_servicio
foreign key (id_servicio) references peluqueria.servicio(id_servicio);

alter table peluqueria.vender_producto 
add constraint id_producto
foreign key (id_producto) references peluqueria.producto(id_producto);

alter table peluqueria.vender_producto 
add constraint id_sede
foreign key (id_sede) references peluqueria.sede(id_sede);

alter table peluqueria.trabajador 
add constraint id_comuna
foreign key(id_comuna) references peluqueria.comuna(id_comuna);

alter table peluqueria.contrato
add constraint id_trabajador
foreign key(id_trabajador) references peluqueria.trabajador(id_trabajador);

alter table peluqueria.contrato
add constraint id_cargo
foreign key(id_cargo) references peluqueria.cargo(id_cargo);

alter table peluqueria.vender_servicio 
add constraint id_servicio
foreign key (id_servicio) references peluqueria.servicio(id_servicio);

alter table peluqueria.liquidacion
add constraint id_contrato
foreign key(id_contrato) references peluqueria.contrato(id_contrato);

alter table peluqueria.cliente 
add constraint id_comuna
foreign key(id_comuna) references peluqueria.comuna(id_comuna);

alter table peluqueria.vender_servicio 
add constraint id_sede
foreign key (id_sede) references peluqueria.sede(id_sede);

alter table peluqueria.tener_venta  
add constraint id_producto
foreign key (id_producto) references peluqueria.producto(id_producto);

alter table peluqueria.tener_venta 
add constraint id_venta
foreign key (id_venta) references peluqueria.venta(id_venta);