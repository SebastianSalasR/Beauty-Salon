DROP TABLE IF EXISTS compania
DROP TABLE IF EXISTS avion
DROP TABLE IF EXISTS empleado
DROP TABLE IF EXISTS sueldo
DROP TABLE IF EXISTS vuelo
DROP TABLE IF EXISTS pasaje
DROP TABLE IF EXISTS cliente
DROP TABLE IF EXISTS seccion

create table compania (
	id INT primary key,
	nombre varchar
);

create table avion (
	id INT primary key,
	modelo varchar,
	cant_vuelos int,
	fecha_compra timestamp,
	precio float
	id_compania int,
);

create table empleado (
	id INT primary key,
	tipo varchar,
	cantidad int,44 
	id_compania int
);

create table sueldo (
	id INT primary key,
	cantidad float,
	mes varchar,
	ano varchar,
	id_empleado int
);

create table vuelo (
	id INT primary key,
	numero int,
	ingreso float,
	id_empleado int,
	id_avion int,
	id_compania int
);

create table pasaje (
	id INT primary key,
	costo float,
	fecha_inicio timestamp,
	fecha_termino timestamp,
	destino varchar,
	id_vuelo int,
	id_cliente int
);

create table cliente (
	id INT primary key,
	nombre varchar,
	apellido varchar,
	nacionalidad varchar,
	RUT varchar
);

create table seccion (
	id INT primary key,
	tipo int,
	id_pasaje int
);

alter table avion
add constraint id_compania
foreign key (id_compania) references compania(id);

alter table empleado
add constraint id_compania
foreign key (id_compania) references compania(id);

alter table vuelo
add constraint id_empleado
foreign key (id_empleado) references empleado(id),
add constraint id_avion
foreign key (id_avion) references avion(id),
add constraint id_compania
foreign key (id_compania) references compania(id);

alter table pasaje
add constraint id_vuelo
foreign key (id_vuelo) references vuelo(id),
add constraint id_cliente
foreign key (id_cliente) references cliente(id);

alter table sueldo
add constraint id_empleado
foreign key (id_empleado) references empleado(id);

alter table seccion
add constraint id_pasaje
foreign key (id_pasaje) references pasaje(id);

COMMENT ON COLUMN public.avion.id IS 'identificador del avion';
COMMENT ON COLUMN public.avion.modelo IS 'modelo del avion';
COMMENT ON COLUMN public.avion.cant_vuelos IS 'cantidad de vuelos que ha realizado el avion';
COMMENT ON COLUMN public.avion.fecha_compra IS 'fecha en la que el avion fue comprado por la compania';
COMMENT ON COLUMN public.avion.id_compania IS 'identificador de la compania a la cual pertenece el avion';

COMMENT ON COLUMN public.cliente.id IS 'identificador del cliente';
COMMENT ON COLUMN public.cliente.nombre IS 'nombre del cliente';
COMMENT ON COLUMN public.cliente.apellido IS 'apellido del cliente';
COMMENT ON COLUMN public.cliente.nacionalidad IS 'nacionalidad del cliente';
COMMENT ON COLUMN public.cliente.rut IS 'rut del cliente';

COMMENT ON COLUMN public.compania.id IS 'identificador de la compania';
COMMENT ON COLUMN public.compania.nombre IS 'nombre de la compania';

COMMENT ON COLUMN public.empleado.id IS 'identificador del empleado';
COMMENT ON COLUMN public.empleado.tipo IS 'a que se dedica el empleado, ej: piloto';
COMMENT ON COLUMN public.empleado.id_compania IS 'identificador de la compania en la que trabaja';

COMMENT ON COLUMN public.pasaje.id IS 'identificador del pasaje';
COMMENT ON COLUMN public.pasaje.costo IS 'costo del pasaje';
COMMENT ON COLUMN public.pasaje.fecha_inicio IS 'fecha y hora de cuando comienza el viaje';
COMMENT ON COLUMN public.pasaje.fecha_termino IS 'fecha y hora de cuando termina el viaje';
COMMENT ON COLUMN public.pasaje.destino IS 'destino del pasaje';
COMMENT ON COLUMN public.pasaje.id_vuelo IS 'identificador del vuelo al que pertenece el pasaje';
COMMENT ON COLUMN public.pasaje.id_cliente IS 'identificador del cliente que compro el pasaje';

COMMENT ON COLUMN public.sueldo.id IS 'identificador del sueldo';
COMMENT ON COLUMN public.sueldo.cantidad IS 'cantidad de dinero que entrega el sueldo';
COMMENT ON COLUMN public.sueldo.mes IS 'mes en el que es entregado el sueldo';
COMMENT ON COLUMN public.sueldo.ano IS 'ano en el que es entregado el sueldo';
COMMENT ON COLUMN public.sueldo.id_empleado IS 'id del empleado al que le corresponde el sueldo';

COMMENT ON COLUMN public.vuelo.id IS 'identificador del vuelo';
COMMENT ON COLUMN public.vuelo.numero IS 'numero del vuelo, ej: 3211';
COMMENT ON COLUMN public.vuelo.ingreso IS 'ingreso total que genero el vuelo';
COMMENT ON COLUMN public.vuelo.id_empleado IS 'identificador del empleado asignado al vuelo';
COMMENT ON COLUMN public.vuelo.id_avion IS 'identificador del avion que realiza el vuelo';
COMMENT ON COLUMN public.vuelo.id_compania IS 'identificador de la comapania a la que pertenece el vuelo';

COMMENT ON COLUMN public.seccion.id IS 'identificador de la seccion';
COMMENT ON COLUMN public.seccion.tipo IS 'el numero indica que seccion pertenece: 1)Economy, 2)Premium economy, 3)Busimess, 4)First class';
COMMENT ON COLUMN public.seccion.id_pasaje IS 'identificador del pasaje';