create table agendar_cita(
	id_cita int primary key not null,
	id_cliente int not null,   
	id_servicio int not null,
	id_trabajador int not null,
	id_cargo int not null,
	id_sede int not null,
	id_comuna int not null,
	id_region int not null,
	fecha_cita timestamp not null 
);

create table cliente (
	id_cliente int primary key not null,
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	rut varchar(20) not null,
	telefono varchar(20) not null
);

create table servicio (
	id_servicio int primary key not null,
	tipo varchar(20) not null,
	precio_servicio int not null
);

create table trabajador (
	id_trabajador int primary key not null,
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	telefono varchar(20) not null
);

create table sede(
	id_sede int primary key not null,
	nombre varchar(20) not null,
	latitud float not null,
	longitud float not null
);

create table comuna(
	id_comuna int primary key not null,
	nombre varchar(20) not null
);

create table region(
	id_region int primary key not null,
	nombre varchar(50) not null
);

create table venta (
	id_venta int primary key not null,
	precio_venta int not null,
	fecha timestamp not null
);

create table cargo (
	id_cargo int primary key not null,
	nombre varchar(20) not null
);

create table producto (
	id_producto int primary key not null,
	precio_compra int not null,
	nombre varchar(20) not null,
	stock int not null
);

create table vender_producto(
	id_vender int primary key not null,
	id_producto int not null,
	id_cliente int not null,   
	id_servicio int not null,
	id_trabajador int not null,
	id_cargo int not null,
	id_sede int not null,
	id_comuna int not null,
	id_region int not null,
	id_venta int not null,
	fecha_venta timestamp not null,
	precio_venta int not null
);


create table contrato(
	id_contrato int primary key not null,
	porcentaje_comision float not null,
	fecha_inicio timestamp not null,
	sueldo int not null	
);

create table liquidacion(
	id_liquidacion int primary key not null,
	id_contrato int not null,
	id_trabajador int not null, 
	id_sede int not null,
	id_comuna int not null,
	id_region int not null,
	monto_comision int not null,
	pago_total int not null,
	fecha_pago timestamp not null
);

alter table agendar_cita
add constraint fk_cita_region
foreign key (id_region) references region(id_region);

alter table agendar_cita
add constraint fk_cita_comuna 
foreign key (id_comuna) references comuna(id_comuna);

alter table agendar_cita
add constraint fk_cita_sede
foreign key (id_sede) references sede(id_sede);

alter table agendar_cita
add constraint fk_cita_cliente
foreign key (id_cliente) references cliente(id_cliente);

alter table agendar_cita
add constraint fk_cita_trabajador 
foreign key (id_trabajador) references trabajador(id_trabajador);

alter table agendar_cita
add constraint fk_cita_servicio 
foreign key (id_servicio) references servicio(id_servicio);

alter table agendar_cita
add constraint fk_cita_cargo
foreign key (id_cargo) references cargo(id_cargo);

alter table vender_producto
add constraint fk_cita_producto
foreign key (id_producto) references producto(id_producto);

alter table vender_producto
add constraint fk_vender_region
foreign key (id_region) references region(id_region);

alter table vender_producto
add constraint fk_vender_comuna 
foreign key (id_comuna) references comuna(id_comuna);

alter table vender_producto
add constraint fk_vender_sede
foreign key (id_sede) references sede(id_sede);

alter table vender_producto
add constraint fk_vender_cliente
foreign key (id_cliente) references cliente(id_cliente);

alter table vender_producto
add constraint fk_vender_trabajador 
foreign key (id_trabajador) references trabajador(id_trabajador);

alter table vender_producto
add constraint fk_vender_venta 
foreign key (id_venta) references venta(id_venta);

alter table vender_producto
add constraint fk_vender_cargo
foreign key (id_cargo) references cargo(id_cargo);

alter table liquidacion
add constraint fk_liquidacion_region
foreign key (id_region) references region(id_region);

alter table liquidacion
add constraint fk_liquidacion_comuna 
foreign key (id_comuna) references comuna(id_comuna);

alter table liquidacion
add constraint fk_liquidacion_sede
foreign key (id_sede) references sede(id_sede);

alter table liquidacion
add constraint fk_liquidacion_trabajador
foreign key (id_trabajador) references trabajador(id_trabajador);

alter table liquidacion
add constraint fk_liquidacion_contrato
foreign key (id_contrato) references contrato(id_contrato);