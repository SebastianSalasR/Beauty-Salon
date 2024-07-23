-- Nombre y apellido de los clientes que esten conectados al poste de luz con id 200
SELECT nombre, apellido  from cliente
inner join medidor on cliente.id_medidor = medidor.id
inner join transformador on medidor.id_transformador = transformador.id
where transformador.id_poste_luz = 200;

-- Precio de la boleta de los clientes en agosto del 2024
select nombre, apellido, boleta.precio from cliente
inner join boleta on cliente.id = boleta.id_cliente
where year(boleta.fecha_emitida) = 2024 and month(boleta.fecha_emitida) = 8;

-- Cuales y cuantos postes de luz estan en matenimiento
select id, count(id) as total from poste_luz
where poste_luz.estado = 'Mantenimiento'
group by poste_luz.id;

-- Cuantos centros de energia existen en cada comuna
select nombre, count(id) as total_centros from comuna
inner join centro_energia on comuna.id = centro_energia.id_comuna
group by comuna.id;

-- Cuales centros de energia usan energia eolica
select nombre from centro_energia 
where centro_energia.tipo_energia = 'Eolica';



1)
SELECT c.nombre, c.apellido 
FROM cliente c
INNER JOIN distribuir_energia de ON c.id = de.id_cliente
WHERE de.id_poste_luz = 200;
----------------
SELECT c.nombre, c.apellido, de.precio_boleta 
FROM cliente c
INNER JOIN distribuir_energia de ON c.id = de.id_cliente
WHERE EXTRACT(YEAR FROM de.fecha_emitida_boleta) = 2024 
AND EXTRACT(MONTH FROM de.fecha_emitida_boleta) = 8;
---------------------
SELECT de.id_poste_luz AS id, COUNT(de.id_poste_luz) AS total 
FROM distribuir_energia de
WHERE de.estado_poste = 'Mantenimiento'
GROUP BY de.id_poste_luz;
---------------------
SELECT de.ubicacion_centro AS nombre, COUNT(de.id_centro_distribucion) AS total_centros 
FROM distribuir_energia de
GROUP BY de.ubicacion_centro;
------------------------
SELECT DISTINCT de.ubicacion_centro AS nombre 
FROM distribuir_energia de
WHERE de.tipo_energia_centro = 'Eolica';SELECT c.nombre, c.apellido 
FROM cliente c
INNER JOIN distribuir_energia de ON c.id = de.id_cliente
WHERE de.id_poste_luz = 200;
