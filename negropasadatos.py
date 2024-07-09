import psycopg2

def transfer_data(select_query, insert_query, transform_func=None):
	try:
		# Conectar a la base de datos de origen
		conn_source = psycopg2.connect(
			dbname="beautySalon",
			user="postgres",
			password="Computin1.",
			host="localhost",
			port="5432"
		)
		cursor_source = conn_source.cursor()

		# Conectar a la base de datos de destino
		conn_target = psycopg2.connect(
			dbname="beautySalonStar",
			user="postgres",
			password="Computin1.",
			host="localhost",
			port="5432"
		)
		cursor_target = conn_target.cursor()

		cursor_source.execute(select_query)
		rows = cursor_source.fetchall()

		cursor_source.execute("""
		SELECT table_schema, table_name 
		FROM information_schema.tables 
		WHERE table_schema = 'beautySalon';
		""")
		cursor_source.execute("SHOW search_path")
		print(cursor_source.fetchone())
		tables = cursor_source.fetchall()
		print(tables)
		for table in tables:
			print(table)


		for row in rows:
			if transform_func:
				row = transform_func(row)
			cursor_target.execute(insert_query, row)

		conn_target.commit()
		print("Datos transferidos con éxito.")
		
	except Exception as e:
		print(f"Error durante la transferencia de datos: {e}")
	finally:
		cursor_source.close()
		conn_source.close()
		cursor_target.close()
		conn_target.close()

# Paso 1: Traspasar información de 'region'
transfer_data(
	"SELECT id_region, nombre FROM beautySalon.region",
	"INSERT INTO beautySalonStar.region (id_region, nombre) VALUES (%s, %s)"
)

# Paso 2: Traspasar información de 'comuna'
transfer_data(
	"SELECT id_comuna, nombre, id_region FROM beautySalon.comuna",
	"INSERT INTO beautySalonStar.comuna (id_comuna, nombre, id_region) VALUES (%s, %s, %s)"
)

# Paso 3: Traspasar información de 'sede'
transfer_data(
	"SELECT id_sede, nombre, latitud, longitud, id_comuna FROM beautySalon.sede",
	"INSERT INTO beautySalonStar.sede (id_sede, nombre, latitud, longitud, id_comuna) VALUES (%s, %s, %s, %s, %s)"
)

# Paso 4: Traspasar información de 'trabajador'
transfer_data(
	"SELECT id_trabajador, nombre, apellido, telefono FROM beautySalon.trabajador",
	"INSERT INTO beautySalonStar.trabajador (id_trabajador, nombre, apellido, telefono) VALUES (%s, %s, %s, %s)"
)

# Paso 5: Traspasar información de 'cargo'
transfer_data(
	"SELECT id_cargo, nombre FROM beautySalon.cargo",
	"INSERT INTO beautySalonStar.cargo (id_cargo, nombre) VALUES (%s, %s)"
)

# Paso 6: Traspasar información de 'producto'
transfer_data(
	"SELECT id_producto, precio_compra, nombre, stock, flag, precio_venta FROM beautySalon.producto",
	"INSERT INTO beautySalonStar.producto (id_producto, precio_compra, nombre, stock, flag, precio_venta) VALUES (%s, %s, %s, %s, %s, %s)"
)

# Paso 7: Traspasar información de 'servicio'
transfer_data(
	"SELECT id_servicio, precio, tipo FROM beautySalon.servicio",
	"INSERT INTO beautySalonStar.servicio (id_servicio, tipo, precio_servicio, flag) VALUES (%s, %s, %s, %s)",
	lambda row: (row[0], row[2], row[1], True)  # Transformación para ajustar campos y agregar flag
)

# Paso 8: Traspasar información de 'venta'
transfer_data(
	"SELECT id_venta, precio_venta, fecha FROM beautySalon.venta",
	"INSERT INTO beautySalonStar.venta (id_venta, precio_venta, fecha) VALUES (%s, %s, %s)"
)

# Paso 9: Traspasar información de 'cliente'
transfer_data(
	"SELECT id_cliente, nombre, apellido, rut, telefono FROM beautySalon.cliente",
	"INSERT INTO beautySalonStar.cliente (id_cliente, nombre, apellido, rut, telefono) VALUES (%s, %s, %s, %s, %s)"
)

# Paso 10: Traspasar información de 'detalle' a 'agendar_cita'
transfer_data(
	"""
	SELECT c.id_cita, c.fecha, c.id_detalle, c.id_trabajador, c.id_cliente, d.id_servicio, v.id_producto, 
		   v.id_trabajador, v.id_sede, s.id_comuna, s.id_region
	FROM beautySalon.cita c
	JOIN beautySalon.detalle d ON c.id_detalle = d.id_detalle
	JOIN beautySalon.venta v ON d.id_venta = v.id_venta
	JOIN beautySalon.sede s ON v.id_sede = s.id_sede
	""",
	"""
	INSERT INTO beautySalonStar.agendar_cita (id_cita, id_cliente, id_servicio, id_trabajador, id_cargo, id_sede, id_comuna, id_region, fecha_cita) 
	VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)
	""",
	lambda row: (row[0], row[4], row[5], row[3], 1, row[8], row[9], row[10], row[1])  # Asignar 1 como id_cargo por defecto
)

# Paso 11: Traspasar información de 'detalle' a 'vender_producto'
transfer_data(
	"""
	SELECT d.id_detalle, d.id_servicio, d.id_venta, v.precio_venta, v.fecha, v.id_producto, v.id_cliente, 
		   v.id_trabajador, v.id_sede, s.id_comuna, s.id_region
	FROM beautySalon.detalle d
	JOIN beautySalon.venta v ON d.id_venta = v.id_venta
	JOIN beautySalon.sede s ON v.id_sede = s.id_sede
	""",
	"""
	INSERT INTO beautySalonStar.vender_producto (id_vender, id_producto, id_cliente, id_servicio, id_trabajador, id_cargo, id_sede, id_comuna, id_region, id_venta, fecha_venta, precio_venta)
	VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)
	""",
	lambda row: (row[0], row[5], row[6], row[1], row[7], 1, row[8], row[9], row[10], row[2], row[4], row[3])  # Asignar 1 como id_cargo por defecto
)
