-- Estas son pruebas del negrito

create table beauty-salon.region (
    id_region int primary key not null,
    nombre varchar(20) not null
);

create table beauty-salon.comuna (
    id_comuna int primary key not null,
    nombre varchar(20) not null,
    id_region int not null
);

create table beauty-salon.sede (
    id_sede int primary key not null,
    nombre varchar(20) not null,
    latitud float not null,
    longitud float not null,
    id_comuna int not null
);

create table beauty-salon.trabajador (
    id_trabajador int primary key not null,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    telefono int not null,
    id_sede int not null,
    id_comuna int not null
);

create table beauty-salon.cargo (
    id_cargo int primary key not null,
    nombre varchar(20) not null
);

create table beauty-salon.contrato(
	id_contrato int primary key not null,
	sueldo int not null,
	fecha_inicio date not null,
	fecha_termino date not null,
	comision int not null,
	id_cargo int not null,
	id_trabajador int not null
);

create table beauty-salon.liquidacion(
	id_liquidacion int primary key not null,
	fecha_pago date not null,
	monto_comision int not null,
	id_contrato int not null
);


create table beauty-salon.producto (
    id_producto int primary key not null,
    precio_compra int not null,
    nombre varchar(20) not null,
    stock int not null,
    flag boolean not null,
    precio_venta int not null,
    id_vender_producto int not null,
    id_tener_venta int not null
);

create table beauty-salon.vender_producto (
    id_vender_producto int primary key not null,
    id_producto int not null,
    id_sede int not null
);

create table beauty-salon.servicio (
    id_servicio int primary key not null,
    precio int not null,
    tipo varchar(20) not null,
    flag varchar(20) not null,
    id_vender_servicio int not null
);

create table beauty-salon.vender_servicio(
    id_vender_servicio int primary key not null,
    id_servicio int not null,
    id_sede int not null
);

create table beauty-salon.venta (
    id_venta int primary key not null,
    precio_venta_total int not null,
    fecha timestamp not null,
    id_cliente int not null,
    id_trabajador int not null,
    id_tener_venta int not null
);

create table beauty-salon.tener_venta(
    id_tener_venta int primary key not null,
    id_producto int not null,
    id_venta int not null
);

create table beauty-salon.cita (
    id_cita int primary key not null,
    fecha timestamp not null,
    id_trabajador int not null,
    id_cliente int not null,
    id_servicio int not null
);

create table beauty-salon.cliente (
    id_cliente int primary key not null,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    rut varchar not null,
    telefono int not null,
    sexo varchar[20] not null,
    id_comuna int not null
);

alter table beauty-salon.comuna 
add constraint id_region
foreign key (id_region) references beauty-salon.region(id_region);

alter table beauty-salon.sede 
add constraint id_comuna
foreign key (id_comuna) references beauty-salon.comuna(id_comuna);

alter table beauty-salon.trabajador 
add constraint id_sede
foreign key (id_sede) references beauty-salon.sede(id_sede);

alter table beauty-salon.producto
add constraint id_vender_producto
foreign key (id_vender_producto) references beauty-salon.vender_producto(id_vender_producto);

alter table beauty-salon.producto
add constraint id_tener_venta
foreign key (id_tener_venta) references beauty-salon.tener_venta(id_tener_venta);

alter table beauty-salon.servicio
add constraint id_vender_servicio
foreign key (id_vender_servicio) references beauty-salon.vender_servicio(id_vender_servicio);

alter table beauty-salon.venta
add constraint id_tener_venta
foreign key (id_tener_venta) references beauty-salon.tener_venta(id_tener_venta);

alter table beauty-salon.venta
add constraint id_trabajador
foreign key (id_trabajador) references beauty-salon.trabajador(id_trabajador);

alter table beauty-salon.venta
add constraint id_cliente
foreign key (id_cliente) references beauty-salon.cliente(id_cliente);

alter table beauty-salon.cita
add constraint id_trabajador
foreign key (id_trabajador) references beauty-salon.trabajador(id_trabajador);

alter table beauty-salon.cita 
add constraint id_cliente
foreign key(id_cliente) references beauty-salon.cliente(id_cliente);

alter table beauty-salon.cita
add constraint id_servicio
foreign key (id_servicio) references beauty-salon.servicio(id_servicio);

alter table beauty-salon.vender_producto 
add constraint id_producto
foreign key (id_producto) references beauty-salon.producto(id_producto);

alter table beauty-salon.vender_producto 
add constraint id_sede
foreign key (id_sede) references beauty-salon.sede(id_sede);

alter table beauty-salon.trabajador 
add constraint id_comuna
foreign key(id_comuna) references beauty-salon.comuna(id_comuna);

alter table beauty-salon.contrato
add constraint id_trabajador
foreign key(id_trabajador) references beauty-salon.trabajador(id_trabajador);

alter table beauty-salon.contrato
add constraint id_cargo
foreign key(id_cargo) references beauty-salon.cargo(id_cargo);

alter table beauty-salon.vender_servicio 
add constraint id_servicio
foreign key (id_servicio) references beauty-salon.servicio(id_servicio);

alter table beauty-salon.liquidacion
add constraint id_contrato
foreign key(id_contrato) references beauty-salon.contrato(id_contrato);

alter table beauty-salon.cliente 
add constraint id_comuna
foreign key(id_comuna) references beauty-salon.comuna(id_comuna);

alter table beauty-salon.vender_servicio 
add constraint id_sede
foreign key (id_sede) references beauty-salon.sede(id_sede);

alter table beauty-salon.tener_venta  
add constraint id_producto
foreign key (id_producto) references beauty-salon.producto(id_producto);

alter table beauty-salon.tener_venta 
add constraint id_venta
foreign key (id_venta) references beauty-salon.venta(id_venta);