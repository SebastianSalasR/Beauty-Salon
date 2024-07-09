create table cita(
	id int primary key not null,
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

create table cliente (
	id int primary key not null,
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	rut varchar not null,
	telefono int not null
);

create table servicio (
	id int primary key not null,
	precio int not null,
	tipo varchar(20) not null
);

create table trabajador (
	id int primary key not null,
	nombre varchar(20) not null,
	apellido varchar(20) not null,
	telefono int not null,
	sueldo int not null
);

create table sede(
	id int primary key not null,
	nombre varchar(20) not null,
	latitud float not null,
	longitud float not null
);

create table comuna(
	id int primary key not null,
	nombre varchar(20) not null
);

create table region(
	id int primary key not null,
	nombre varchar(20) not null
);

create table venta (
	id int primary key not null,
	precio_venta int not null,
	fecha timestamp not null
);

create table cargo (
	id int primary key not null,
	nombre varchar(20) not null
);

create table producto (
	id int primary key not null,
	precio_compra int not null,
	nombre varchar(20) not null,
	stock int not null,
	flag boolean not null
);

alter table cita
add constraint id_region
foreign key (id_region) references region(id);

alter table cita
add constraint id_comuna 
foreign key (id_comuna) references comuna(id);

alter table cita
add constraint id_sede
foreign key (id_sede) references sede(id);

alter table cita
add constraint id_cliente
foreign key (id_cliente) references cliente(id);

alter table cita
add constraint id_trabajador 
foreign key (id_trabajador) references trabajador(id);

alter table cita
add constraint id_servicio 
foreign key (id_servicio) references servicio(id);

alter table cita
add constraint id_venta 
foreign key (id_venta) references venta(id);

alter table cita
add constraint id_cargo
foreign key (id_cargo) references cargo(id);

alter table cita
add constraint id_producto
foreign key (id_producto) references producto(id);
