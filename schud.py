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
nombre_base_datos_antigua= "beauty_salon"
nombre_base_datos_nueva = "beauty_salon_star"
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
    for row in rows:
        if transform_fn:
            row = transform_fn(row)
        cursor_new.execute(query_insert, row)

# Paso 1: Traspasar información de 'region'
transfer_data(
    "SELECT id_region, nombre FROM beauty_salon.region",
    "INSERT INTO beauty_salon_star.region (id_region, nombre) VALUES (%s, %s)"
)

# Paso 2: Traspasar información de 'comuna'
transfer_data(
    "SELECT id_comuna, nombre, id_region FROM beauty_salon.comuna",
    "INSERT INTO beauty_salon_star.comuna (id_comuna, nombre) VALUES (%s, %s)"
)

# Paso 3: Traspasar información de 'sede'
transfer_data(
    "SELECT id_sede, nombre, latitud, longitud, id_comuna FROM beauty_salon.sede",
    "INSERT INTO beauty_salon_star.sede (id_sede, nombre, latitud, longitud) VALUES (%s, %s, %s, %s)"
)

# Paso 4: Traspasar información de 'trabajador'
transfer_data(
    "SELECT id_trabajador, nombre, apellido, telefono FROM beauty_salon.trabajador",
    "INSERT INTO beauty_salon_star.trabajador (id_trabajador, nombre, apellido, telefono) VALUES (%s, %s, %s, %s)"
)

# Paso 5: Traspasar información de 'cargo'
transfer_data(
    "SELECT id_cargo, nombre FROM beauty_salon.cargo",
    "INSERT INTO beauty_salon_star.cargo (id_cargo, nombre) VALUES (%s, %s)"
)

# Paso 6: Traspasar información de 'producto'
transfer_data(
    "SELECT id_producto, precio_compra, nombre, stock, flag, precio_venta FROM beauty_salon.producto",
    "INSERT INTO beauty_salon_star.producto (id_producto, precio_compra, nombre, stock, flag) VALUES (%s, %s, %s, %s, %s)"
)

# Paso 7: Traspasar información de 'servicio'
transfer_data(
    "SELECT id_servicio, precio, tipo FROM beauty_salon.servicio",
    "INSERT INTO beauty_salon_star.servicio (id_servicio, tipo, precio_servicio, flag) VALUES (%s, %s, %s, %s)",
    lambda row: (row[0], row[2], row[1], True)  # Transformación para ajustar campos y agregar flag
)

# Paso 8: Traspasar información de 'venta'
transfer_data(
    "SELECT id_venta, precio_venta, fecha FROM beauty_salon.venta",
    "INSERT INTO beauty_salon_star.venta (id_venta, precio_venta, fecha) VALUES (%s, %s, %s)"
)

# Paso 9: Traspasar información de 'cliente'
transfer_data(
    "SELECT id_cliente, nombre, apellido, rut, telefono FROM beauty_salon.cliente",
    "INSERT INTO beauty_salon_star.cliente (id_cliente, nombre, apellido, rut, telefono) VALUES (%s, %s, %s, %s, %s)"
)

# Paso 10: Traspasar información de 'detalle' a 'agendar_cita'
transfer_data(
    """
    SELECT c.id_cita, c.fecha, c.id_detalle, c.id_trabajador, c.id_cliente, d.id_servicio, v.id_producto, 
           v.id_trabajador, v.id_sede, s.id_comuna, s.id_region
    FROM beauty_salon.cita c
    JOIN beauty_salon.detalle d ON c.id_detalle = d.id_detalle
    JOIN beauty_salon.venta v ON d.id_venta = v.id_venta
    JOIN beauty_salon.sede s ON v.id_sede = s.id_sede
    """,
    """
    INSERT INTO beauty_salon_star.agendar_cita (id_cita, id_cliente, id_servicio, id_trabajador, id_cargo, id_sede, id_comuna, id_region, fecha_cita) 
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
    """,
    lambda row: (row[0], row[4], row[5], row[3], 1, row[8], row[9], row[10], row[1])  # Asignar 1 como id_cargo por defecto
)

# Paso 11: Traspasar información de 'detalle' a 'vender_producto'
transfer_data(
    """
    SELECT d.id_detalle, d.id_servicio, d.id_venta, v.precio_venta, v.fecha, v.id_producto, v.id_cliente, 
           v.id_trabajador, v.id_sede, s.id_comuna, s.id_region
    FROM beauty_salon.detalle d
    JOIN beauty_salon.venta v ON d.id_venta = v.id_venta
    JOIN beauty_salon.sede s ON v.id_sede = s.id_sede
    """,
    """
    INSERT INTO beauty_salon_star.vender_producto (id_vender, id_producto, id_cliente, id_servicio, id_trabajador, id_cargo, id_sede, id_comuna, id_region, id_venta, fecha_venta, precio_venta)
    VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
    """,
    lambda row: (row[0], row[5], row[6], row[1], row[7], 1, row[8], row[9], row[10], row[2], row[4], row[3])  # Asignar 1 como id_cargo por defecto
)

# Confirmar los cambios y cerrar las conexiones
conn_new.commit()

cursor_old.close()
cursor_new.close()
conn_old.close()
conn_new.close()
