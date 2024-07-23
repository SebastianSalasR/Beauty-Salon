-- 1) Lista de empleados de una compañía junto con su salario promedio
select empleado.id, avg(sueldo.cantidad) as promedio from empleado
inner join sueldo on empleado.id = sueldo.id_empleado
group by empleado.id
order by empleado.id;

-- 2) Lista de aviones comprados por una compañía en un rango de fechas
select avion.id from avion 
inner join compania on avion.id_compania = id_compania 
where avion.fecha_compra >= '2023-01-15 10:23:00.000'
group by avion.id
order by avion.id;

-- 3) Cantidad de pasajes vendidos en cada destino por una compañía en el último año
select pasaje.destino, count(pasaje.destino) pasajes_vendidos from pasaje 
inner join compania on compania.nombre = 'Sky'
group by pasaje.destino;

-- 4) Vuelos realizados por cada avión de cada compañía ordenados de menor a mayor
select compania.nombre, avion.modelo as modelo_del_avion, avion.cant_vuelos as vuelos_realizados from compania 
inner join avion on compania.id = avion.id_compania 
group by compania.nombre, avion.modelo, avion.cant_vuelos
order by avion.cant_vuelos;

-- 5) Total de ingresos generados por una compañía
select compania.nombre, sum(vuelo.ingreso) as ingresos_totales from compania
inner join vuelo on compania.id = vuelo.id_compania
group by compania.nombre;

-- 6) Promedio de vuelos realizados por cada avión de una compañía
SELECT c.nombre AS nombre_compania, a.modelo AS modelo_avion, AVG(a._cantidad_vuelos) AS cantidad_vuelos FROM compania c INNER JOIN avion a ON  c.id = a.id_compania GROUP BY c.nombre, a.modelo;

-- 7) Lista de clientes que han comprado pasajes más de una vez durante junio en el anho 2023
SELECT c.nombre, c.apellido FROM cliente c INNER JOIN pasaje p ON  c.id = p.id_cliente WHERE EXTRACT(YEAR FROM p.fecha_inicio) = 2023 AND EXTRACT(MONTH FROM p.fecha_inicio) = 6 GROUP BY c.id, c.nombre, c.apellido HAVING COUNT(*) > 1;

-- 8) Empleado por companhia con mejor sueldo
SELECT c.nombre, e.cantidad FROM compania c INNER JOIN  empleado e ON c.id = e.id_compania INNER JOIN (SELECT id_compania, MAX(cantidad) AS max_sueldo FROM empleado GROUP BY id_compania) max_sueldo_empleado ON e.id_compania = max_sueldo_empleado.id_compania AND e.cantidad = max_sueldo_empleado.max_sueldo;

-- 9) Modelo de avion mas caro comprado junto a su fecha de compra
SELECT a.precio, a.fecha_compra FROM avion a INNER JOIN ( SELECT MAX(precio) AS max_precio FROM avion) max_avion ON a.precio = max_avion.max_precio;

-- 10) Cantidad de empleados por tipo en una compañía
SELECT e.tipo, e.id, COUNT(*) FROM empleado e INNER JOIN compania c ON c.id = e.id_compania GROUP BY e.tipo;

-- 11) Destino mas visitado en el 2024
SELECT p.destino, COUNT(*) FROM pasaje p WHERE EXTRACT (YEAR FROM fecha_inicio) = 2024 GROUP BY p.destino ORDER BY COUNT(*) DESC LIMIT 1;

------------------------------------------------------------------------------------
-- EStas son las sentencias de de la tarea 3

-- 1) lista de lugares al que más viajan los chilenos por año, durante los últimos 5 años
select p.destino, COUNT(p.destino) FROM pasaje p INNER JOIN cliente c ON c.nacionalidad = 'Chilena' WHERE EXTRACT(YEAR FROM p.fecha_inicio) > 2019 GROUP BY p.destino ORDER BY COUNT DESC ;

-- 2) Lista con las secciones de vuelo más comprada por Argentinos
SELECT s.tipo , COUNT(s.tipo) FROM seccion s INNER JOIN cliente c ON c.nacionalidad = 'Argentina' GROUP BY c.nacionalidad ORDER BY COUNT DESC;

-- 3) lista de mensual de países que más gastan en volar (durante los últimos 5 años)
SELECT EXTRACT(YEAR FROM p.fecha_inicio) AS year, EXTRACT(MONTH FROM p.fecha_inicio) AS month, c.nacionalidad AS country, SUM(p.costo) AS total_spending
FROM pasaje p
INNER JOIN cliente c ON p.id_cliente = c.id
WHERE p.fecha_inicio >= CURRENT_DATE - INTERVAL '5 years'
GROUP BY year, month, c.nacionalidad
ORDER BY total_spending DESC;

-- 4) lista de pasajeros con que viajan en “First Class” más de 3 veces al mes
SELECT EXTRACT(MONTH FROM p.fecha_inicio) AS month, c.id, c.nombre, c.apellido, s.tipo, COUNT(s.tipo)
FROM pasaje p
INNER JOIN seccion s ON p.id = s.id_pasaje
INNER JOIN cliente c ON p.id_cliente = c.id
WHERE s.tipo = '4'
GROUP BY month, c.id, s.tipo, c.nombre, c.apellido
HAVING COUNT(s.tipo) > 3;

-- 5) avión con más vuelos
SELECT MAX(a.precio) as max_precio, a.modelo FROM avion a 
GROUP BY a.modelo LIMIT 1;
