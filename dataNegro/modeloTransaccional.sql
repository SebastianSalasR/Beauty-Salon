create table region (
    id_region int  primary key,
    nombre varchar(80) 
);

create table comuna (
    id_comuna int  primary key,
    nombre varchar(50) ,
    id_region int 
);

create table sede (
    id_sede int  primary key,
    nombre varchar,
    latitud float ,
    longitud float ,
    id_comuna int 
);

create table cliente (
    id_cliente int  primary key,
    nombre varchar ,
    apellido varchar ,
    rut varchar ,
    telefono varchar(20) ,
    sexo varchar(20) ,
    id_comuna int 
);

create table servicio (
    id_servicio int  primary key,
    precio int ,
    tipo varchar(20) 
);

create table cargo (
    id_cargo int  primary key,
    nombre varchar(20) 
);

create table trabajador (
    id_trabajador int  primary key,
    nombre varchar(20) ,
    apellido varchar(20) ,
    telefono varchar(20) ,
    id_sede int ,
    id_comuna int 
);

create table contrato(
	id_contrato int  primary key,
	sueldo int ,
	fecha_inicio timestamp ,
	fecha_termino timestamp ,
	comision float ,
	id_cargo int ,
	id_trabajador int 
);

create table liquidacion(
	id_liquidacion int  primary key,
	fecha_pago timestamp ,
	monto_comision int ,
	id_contrato int 
);

create table producto (
    id_producto int  primary key,
    precio_compra int ,
    nombre varchar(20) ,
    stock int ,
    precio_venta int 
);

create table vender_producto (
    id_vender_producto int  primary key,
    id_producto int ,
    id_sede int 
);

create table vender_servicio(
    id_vender_servicio int  primary key,
    id_servicio int ,
    id_sede int 
);

create table venta (
    id_venta int  primary key,
    precio_venta_total int ,
    fecha timestamp ,
    id_cliente int ,
    id_trabajador int 
);

create table tener_venta(
    id_tener_venta int  primary key,
    id_producto int ,
    id_venta int 
);

create table cita (
    id_cita int  primary key,
    fecha timestamp ,
    id_trabajador int ,
    id_cliente int ,
    id_servicio int 
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