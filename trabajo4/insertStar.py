from faker import Faker
import numpy as np
from datetime import datetime, timedelta

def main():
	fake = Faker()
	f = open("createDataStar.sql", "a")
	
	iterations = 2500
	start = 2001
	
	# Generate data for cliente
	for i in range(start, iterations + 1):
		nombre = fake.first_name()
		apellido = fake.last_name()
		f.write(f"INSERT INTO cliente (id, nombre, apellido) VALUES ({i}, '{nombre}', '{apellido}');\n")
	
	f.write("\n")
	
	# Generate data for boleta
	for i in range(start, iterations + 1):
		f.write(f"INSERT INTO boleta (id) VALUES ({i});\n")
	
	f.write("\n")
	
	# Generate data for centro_distribucion
	for i in range(start, iterations + 1):
		ubicacion_centro = fake.city()
		f.write(f"INSERT INTO centro_distribucion (id, ubicacion_centro) VALUES ({i}, '{ubicacion_centro}');\n")
	
	f.write("\n")
	
	# Generate data for medidor
	for i in range(start, iterations + 1):
		f.write(f"INSERT INTO medidor (id) VALUES ({i});\n")
	
	f.write("\n")
	
	# Generate data for transformador
	for i in range(start, iterations + 1):
		f.write(f"INSERT INTO transformador (id) VALUES ({i});\n")
	
	f.write("\n")
	
	# Generate data for poste_luz
	for i in range(start, iterations + 1):
		f.write(f"INSERT INTO poste_luz (id) VALUES ({i});\n")
	
	f.write("\n")
	
	# Generate data for distribuir_energia
	for i in range(start, iterations + 1):
		id_cliente = i
		id_boleta = i
		id_centro_distribucion = i
		id_medidor = i
		id_transformador = i
		id_poste_luz = i
		precio_boleta = round(np.random.uniform(10, 1000), 2)
		fecha_emitida_boleta = fake.date_time_between(start_date='-2y', end_date='now').strftime('%Y-%m-%d %H:%M:%S')
		fecha_vencimiento_boleta = (datetime.strptime(fecha_emitida_boleta, '%Y-%m-%d %H:%M:%S') + timedelta(days=np.random.randint(30, 365))).strftime('%Y-%m-%d %H:%M:%S')
		operador_centro = fake.name()
		tipo_energia_centro = fake.word()
		ubicacion_centro = fake.address().replace('\n', ', ')
		tipo_medidor = fake.word()
		cantidad_energia = round(np.random.uniform(100, 1000), 2)
		estado_transformador = fake.word()
		ubicacion_transformador = fake.address().replace('\n', ', ')
		potencia_transformador = round(np.random.uniform(100, 500), 2)
		ubicacion_poste = fake.address().replace('\n', ', ')
		estado_poste = fake.word()
		
		f.write(f"INSERT INTO distribuir_energia (id, id_cliente, id_boleta, id_centro_distribucion, id_medidor, id_transformador, id_poste_luz, precio_boleta, fecha_emitida_boleta, fecha_vencimiento_boleta, operador_centro, tipo_energia_centro, ubicacion_centro, tipo_medidor, cantidad_energia, estado_transformador, ubicacion_transformador, potencia_transformador, ubicacion_poste, estado_poste) VALUES ({i}, {id_cliente}, {id_boleta}, {id_centro_distribucion}, {id_medidor}, {id_transformador}, {id_poste_luz}, {precio_boleta}, '{fecha_emitida_boleta}', '{fecha_vencimiento_boleta}', '{operador_centro}', '{tipo_energia_centro}', '{ubicacion_centro}', '{tipo_medidor}', {cantidad_energia}, '{estado_transformador}', '{ubicacion_transformador}', {potencia_transformador}, '{ubicacion_poste}', '{estado_poste}');\n")
	
	f.write("\n")
	
	f.close()

if __name__ == "__main__":
	main()
