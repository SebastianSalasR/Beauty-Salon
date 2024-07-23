import os
import schedule
import time
import psycopg2
import sys


# Función para conectar a la base de datos
def conectarPostgres(db, host_ip, usuario, contrasena, puerto):
	try:
		conn = psycopg2.connect(database=db,
								host=host_ip,
								user=usuario,
								password=contrasena,
								port=puerto,
								options="-c client_encoding=utf8")
		print("Conexión exitosa a PostgreSQL")
	except psycopg2.Error as e:
		print(f"Error al conectar a PostgreSQL: {e}")
		sys.exit(1)
	return conn


user = "postgres"
host = "localhost"
port = "5432"
password = "Computin1."
nombre_base_datos_antigua= "beautySalonFull"
nombre_base_datos_nueva = "beautySalonStarFull"
# Conectar a la base de datos antigua y nueva

print(host)
conn_old = conectarPostgres(nombre_base_datos_antigua, host, user, password, port)
conn_new = conectarPostgres(nombre_base_datos_nueva, host, user, password, port)
print("hola")

cursor_old = conn_old.cursor()
cursor_new = conn_new.cursor()


# Función para traspasar datos de una tabla
def transfer_data(query_select, query_insert, transform_fn=None):
	cursor_old.execute(query_select)
	rows = cursor_old.fetchall()
	print(len(rows))
	for row in rows:
		if transform_fn:
			row = transform_fn(row)
		cursor_new.execute(query_insert, row)

# Paso 1: Traspasar información de 'region'
transfer_data(
	"SELECT id_region, nombre FROM public.region",
    "INSERT INTO public.region (id_region, nombre) VALUES (%s, %s)"
)
print("Paso 1 completado")

# Paso 2: Traspasar información de 'comuna'
transfer_data(
	"SELECT id_comuna, nombre FROM public.comuna",
	"INSERT INTO public.comuna (id_comuna, nombre) VALUES (%s, %s)"
)
print("Paso 2 completado")

# Paso 3: Traspasar información de 'sede'
transfer_data(
	"SELECT id_sede, nombre, latitud, longitud FROM public.sede",
	"INSERT INTO public.sede (id_sede, nombre, latitud, longitud) VALUES (%s, %s, %s, %s)"
)
print("Paso 3 completado")

# Paso 4: Traspasar información de 'trabajador'
transfer_data(
	"SELECT id_trabajador, nombre, apellido, telefono FROM public.trabajador",
	"INSERT INTO public.trabajador (id_trabajador, nombre, apellido, telefono) VALUES (%s, %s, %s, %s)"
)
print("Paso 4 completado")

# Paso 5: Traspasar información de 'cargo'
transfer_data(
	"SELECT id_cargo, nombre FROM public.cargo",
	"INSERT INTO public.cargo (id_cargo, nombre) VALUES (%s, %s)"
)

print("Paso 5 completado")

# Paso 6: Traspasar información de 'producto'
transfer_data(
	"SELECT id_producto, precio_compra, nombre, stock FROM public.producto",
	"INSERT INTO public.producto (id_producto, precio_compra, nombre, stock) VALUES (%s, %s, %s, %s)"
)
print("Paso 6 completado")


# Paso 7: Traspasar información de 'servicio'
transfer_data(
	"SELECT id_servicio, precio, tipo FROM public.servicio",
	"INSERT INTO public.servicio (id_servicio, tipo, precio_servicio) VALUES (%s, %s, %s)",
	lambda row: (row[0], row[2], row[1])
)
print("Paso 7 completado")


# Paso 8: Traspasar información de 'venta'
transfer_data(
	"SELECT id_venta, precio_venta_total, fecha FROM public.venta",
	"INSERT INTO public.venta (id_venta, precio_venta, fecha) VALUES (%s, %s, %s)"
)
print("Paso 8 completado")


# Paso 9: Traspasar información de 'cliente'
transfer_data(
	"SELECT id_cliente, nombre, apellido, rut, telefono FROM public.cliente",
	"INSERT INTO public.cliente (id_cliente, nombre, apellido, rut, telefono) VALUES (%s, %s, %s, %s, %s)"
)

print("Paso 9 completado")


# Paso 10: Traspasar información de 'cita' a 'agendar_cita'
transfer_data(
    """
    SELECT c.id_cita, 						  c.id_cliente, c.id_servicio, c.id_trabajador,         s.id_sede, s.id_comuna, ca.id_region, c.fecha 
    FROM public.cita c
    JOIN public.trabajador t ON c.id_trabajador = t.id_trabajador
    JOIN public.sede s ON t.id_sede = s.id_sede
    JOIN public.comuna ca ON s.id_comuna = ca.id_comuna
    """,
    """
    INSERT INTO public.agendar_cita (id_cita, id_cliente, id_servicio,      id_trabajador, id_cargo, id_sede, id_comuna, id_region, fecha_cita) 
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
    """,
    lambda row: (row[0], row[1], row[2], row[3], 1, row[4], row[5], row[6], row[7])  # Asignar 1 como id_cargo por defecto
)
print("Paso 10 completado")



# Confirmar los cambios y cerrar las conexiones
conn_new.commit()

cursor_old.close()
cursor_new.close()
conn_old.close()
conn_new.close()
