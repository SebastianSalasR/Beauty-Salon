-- 1 tiempo: 0.083
SELECT s.nombre AS nombre_peluqueria, c.nombre AS comuna, DATE_PART('hour', ac.fecha_cita) AS hora, COUNT(ac.id_cita) AS total_citas FROM agendar_cita ac
JOIN sede s ON ac.id_sede = s.id_sede 
JOIN comuna c ON ac.id_comuna = c.id_comuna
GROUP BY s.nombre, c.nombre, DATE_PART('hour', ac.fecha_cita)
ORDER BY total_citas DESC LIMIT 1;

-- 2 tiempo: 0.457 (no tiro nada)
SELECT cl.nombre AS nombre_cliente, cl.apellido AS apellido_cliente, cc.nombre AS comuna_cliente, s.nombre AS nombre_peluqueria, cs.nombre AS comuna_peluqueria, SUM(vp.precio_venta) AS total_gasto
FROM vender_producto vp
JOIN cliente cl ON vp.id_cliente = cl.id_cliente
JOIN comuna cc ON cl.id_comuna = cc.id_comuna
JOIN sede s ON vp.id_sede = s.id_sede
JOIN comuna cs ON vp.id_comuna = cs.id_comuna
GROUP BY cl.nombre, cl.apellido, cc.nombre, s.nombre, cs.nombre ORDER BY total_gasto DESC;

-- 3 tiempo: 0.037(no tiro nada)
SELECT t.nombre AS nombre_peluquero, t.apellido AS apellido_peluquero, s.nombre AS nombre_peluqueria, DATE_TRUNC('month', vp.fecha_venta) AS mes, SUM(vp.precio_venta) AS total_ganado FROM vender_producto vp
JOIN trabajador t ON vp.id_trabajador = t.id_trabajador
JOIN sede s ON vp.id_sede = s.id_sede
WHERE DATE_PART('year', vp.fecha_venta) = 2023
GROUP BY t.nombre, t.apellido, s.nombre, mes ORDER BY total_ganado DESC;

-- 4 tiempo: 0.012(no tiro nada)
SELECT cl.nombre, cl.apellido, cl.telefono FROM agendar_cita ac
JOIN cliente cl ON ac.id_cliente = cl.id_cliente
JOIN servicio s ON ac.id_servicio = s.id_servicio
WHERE s.tipo IN ('Corte de pelo', 'Corte de barba');

-- 5 ta mala la query
SELECT cl.nombre AS nombre_cliente, cl.apellido AS apellido_cliente, cc.nombre AS comuna_cliente, s.nombre AS nombre_peluqueria, vp.precio_venta AS valor_pagado FROM vender_producto vp
JOIN cliente cl ON vp.id_cliente = cl.id_cliente
JOIN comuna cc ON cl.id_comuna = cc.id_comuna
JOIN sede s ON vp.id_sede = s.id_sede
JOIN servicio srv ON vp.id_servicio = srv.id_servicio
WHERE srv.tipo = 'Tinte de pelo';

-- 6 tiempo: 0.013 (no tiro nada)
SELECT s.nombre AS nombre_peluqueria, DATE_TRUNC('month', ac.fecha_cita) AS mes, DATE_PART('hour', ac.fecha_cita) AS hora, COUNT(ac.id_cita) AS total_citas FROM agendar_cita ac
JOIN sede s ON ac.id_sede = s.id_sede
WHERE DATE_PART('year', ac.fecha_cita) IN (2019, 2020)
GROUP BY s.nombre, mes, hora
ORDER BY mes, total_citas DESC;

-- 7 tiempo: 0.305
SELECT s.nombre AS nombre_peluqueria, DATE_TRUNC('month', ac.fecha_cita) AS mes, cl.nombre AS nombre_cliente, cl.apellido AS apellido_cliente, MAX(ac.fecha_cita - LAG(ac.fecha_cita) OVER (PARTITION BY ac.id_cliente ORDER BY ac.fecha_cita)) AS duracion_maxima
FROM agendar_cita ac
JOIN cliente cl ON ac.id_cliente = cl.id_cliente
JOIN sede s ON ac.id_sede = s.id_sede
GROUP BY s.nombre, mes, cl.nombre, cl.apellido ORDER BY mes, duracion_maxima DESC;

-- 8 tiempo: 0.063 
SELECT s.nombre AS nombre_peluqueria, srv.tipo AS servicio_mas_caro, MAX(srv.precio_servicio) AS precio_maximo FROM servicio srv
JOIN agendar_cita ac ON srv.id_servicio = ac.id_servicio
JOIN sede s ON ac.id_sede = s.id_sede
GROUP BY s.nombre, srv.tipo
ORDER BY precio_maximo DESC;

-- 9 tiempo: 0.011 (no tiro nada)
SELECT t.nombre AS nombre_peluquero, t.apellido AS apellido_peluquero, s.nombre AS nombre_peluqueria, DATE_TRUNC('month', ac.fecha_cita) AS mes, COUNT(ac.id_cita) AS total_citas FROM agendar_cita ac
JOIN trabajador t ON ac.id_trabajador = t.id_trabajador
JOIN sede s ON ac.id_sede = s.id_sede
WHERE DATE_PART('year', ac.fecha_cita) = 2019
GROUP BY t.nombre, t.apellido, s.nombre, mes ORDER BY mes, total_citas DESC;

-- 10 tiempo: 0.203 
SELECT c.nombre AS nombre_comuna, COUNT(DISTINCT cl.id_cliente) AS total_clientes, COUNT(DISTINCT s.id_sede) AS total_peluquerias, COUNT(DISTINCT CASE WHEN cl.id_comuna = c.id_comuna THEN cl.id_cliente END) AS clientes_residentes
FROM cliente cl
JOIN comuna c ON cl.id_comuna = c.id_comuna
JOIN sede s ON s.id_comuna = c.id_comuna
GROUP BY c.nombre ORDER BY total_clientes DESC;