create table region (
    id_region serial primary key,
    nombre varchar(20) not null
);

create table comuna (
    id_comuna serial primary key,
    nombre varchar(20) not null,
    id_region int not null
);

create table sede (
    id_sede serial primary key,
    nombre varchar(20) not null,
    latitud float not null,
    longitud float not null,
    id_comuna int not null
);

create table trabajador (
    id_trabajador serial primary key,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    telefono int not null,
    id_sede int not null,
    id_comuna int not null
);

create table cargo (
    id_cargo serial primary key,
    nombre varchar(20) not null
);

create table contrato(
	id_contrato serial primary key,
	sueldo int not null,
	fecha_inicio date not null,
	fecha_termino date not null,
	comision int not null,
	id_cargo int not null,
	id_trabajador int not null
);

create table liquidacion(
	id_liquidacion serial primary key,
	fecha_pago date not null,
	monto_comision int not null,
	id_contrato int not null
);


create table producto (
    id_producto serial primary key,
    precio_compra int not null,
    nombre varchar(20) not null,
    stock int not null,
    flag boolean not null,
    precio_venta int not null,
    id_vender_producto int not null,
    id_tener_venta int not null
);

create table vender_producto (
    id_vender_producto serial primary key,
    id_producto int not null,
    id_sede int not null
);

create table servicio (
    id_servicio serial primary key,
    precio int not null,
    tipo varchar(20) not null,
    flag varchar(20) not null,
    id_vender_servicio int not null
);

create table vender_servicio(
    id_vender_servicio serial primary key,
    id_servicio int not null,
    id_sede int not null
);

create table venta (
    id_venta serial primary key,
    precio_venta_total int not null,
    fecha timestamp not null,
    id_cliente int not null,
    id_trabajador int not null,
    id_tener_venta int not null
);

create table tener_venta(
    id_tener_venta serial primary key,
    id_producto int not null,
    id_venta int not null
);

create table cita (
    id_cita serial primary key,
    fecha timestamp not null,
    id_trabajador int not null,
    id_cliente int not null,
    id_servicio int not null
);

create table cliente (
    id_cliente serial primary key,
    nombre varchar(20) not null,
    apellido varchar(20) not null,
    rut varchar not null,
    telefono int not null,
    sexo varchar[20] not null,
    id_comuna int not null
);

alter table comuna 
add constraint id_region
foreign key (id_region) references region(id_region);

alter table sede 
add constraint id_comuna
foreign key (id_comuna) references comuna(id_comuna);

alter table trabajador 
add constraint id_sede
foreign key (id_sede) references sede(id_sede);

alter table producto
add constraint id_vender_producto
foreign key (id_vender_producto) references vender_producto(id_vender_producto);

alter table producto
add constraint id_tener_venta
foreign key (id_tener_venta) references tener_venta(id_tener_venta);

alter table servicio
add constraint id_vender_servicio
foreign key (id_vender_servicio) references vender_servicio(id_vender_servicio);

alter table venta
add constraint id_tener_venta
foreign key (id_tener_venta) references tener_venta(id_tener_venta);

alter table venta
add constraint id_trabajador
foreign key (id_trabajador) references trabajador(id_trabajador);

alter table venta
add constraint id_cliente
foreign key (id_cliente) references cliente(id_cliente);

alter table cita
add constraint id_trabajador
foreign key (id_trabajador) references trabajador(id_trabajador);

alter table cita 
add constraint id_cliente
foreign key(id_cliente) references cliente(id_cliente);

alter table cita
add constraint id_servicio
foreign key (id_servicio) references servicio(id_servicio);

alter table vender_producto 
add constraint id_producto
foreign key (id_producto) references producto(id_producto);

alter table vender_producto 
add constraint id_sede
foreign key (id_sede) references sede(id_sede);

alter table trabajador 
add constraint id_comuna
foreign key(id_comuna) references comuna(id_comuna);

alter table contrato
add constraint id_trabajador
foreign key(id_trabajador) references trabajador(id_trabajador);

alter table contrato
add constraint id_cargo
foreign key(id_cargo) references cargo(id_cargo);

alter table vender_servicio 
add constraint id_servicio
foreign key (id_servicio) references servicio(id_servicio);

alter table liquidacion
add constraint id_contrato
foreign key(id_contrato) references contrato(id_contrato);

alter table cliente 
add constraint id_comuna
foreign key(id_comuna) references comuna(id_comuna);

alter table vender_servicio 
add constraint id_sede
foreign key (id_sede) references sede(id_sede);

alter table tener_venta  
add constraint id_producto
foreign key (id_producto) references producto(id_producto);

alter table tener_venta 
add constraint id_venta
foreign key (id_venta) references venta(id_venta);