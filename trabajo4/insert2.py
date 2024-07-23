from faker import Faker
import numpy as np
from datetime import datetime, timedelta

def main():
	fake = Faker()
	f = open("createData.sql", "a")
	digits = ["0", "1", "2", "3", "4", "5", " 6", "7", "8", "9", "k"]

	paises = ["Chile", "El salvador", "Argentina", "Brasil", "Colombia", "Ecuador", "Peru", "Uruguay", "Venezuela", "Mexico", "Paraguay"]

	comunas = ["Santiago", "Valparaíso", "Concepción", "La Serena", "Antofagasta", "Temuco", "Iquique", "Rancagua", "Talca", "Chillan", "Arica", "Puerto Montt", "Coquimbo", "Valdivia", "Punta Arenas", "Copiapo", "Curicó", "Osorno", "Los Ángeles", "Calama"]

	regiones = ["Region de Arica y Parinacota", "Region de Tarapacá", "Region de Antofagasta", "Region de Atacama", "Region de Coquimbo", "Region de Valparaiso", "Region Metropolitana de Santiago", "Region del Libertador General Bernardo O'Higgins", "Region del Maule", "Region de nhuble", "Region del Biobio", "Region de La Araucania", "Region de Los Rios", "Region de Los Lagos", "Region de Aysen del General Carlos Ibanhez del Campo", "Region de Magallanes y de la Antartica Chilena"]

	iterations = 50000
	#iterations = 10
	
	# Generar paises
	for i in range(5, 10):
		f.write("INSERT INTO pais(id, nombre) VALUES (" + str(i+1) + ", " + "'"+np.random.choice(paises)+"'" + ");\n")

	f.write("\n")

	# Generar region
	for i in range(5, 10):
		f.write("INSERT INTO region(id, nombre, id_pais) VALUES (" + str(i+1) + ", " + "'"+np.random.choice(regiones)+"'" + "," + str(i+1) + ");\n")

	f.write("\n")

	# Generar comunas
	for i in range(5, 10):
		f.write("INSERT INTO comuna(id, nombre, id_region) VALUES (" + str(i+1) + ", " + "'"+np.random.choice(comunas)+"'" + ", " + str(i+1) + ");\n")

	f.write("\n")

	#Generar cliente
	for i in range (iterations, 100000):
		full_name = str(fake.name()).split(" ")
		name = full_name[0]
		last_name = " ".join(full_name[1:])
		latitud = str(np.random.uniform(-53.15483, 53.15483))
		longitud = str(np.random.uniform(-73.04977, 73.04977))
		f.write("INSERT INTO cliente (id, nombre, apellido, rut, latitud, longitud, id_comuna, id_medidor) VALUES(" + str(i+1) + ", " + "'"+ name +"'" +", " + "'"+last_name+"'" + ", " + "'"+str(1200000+i) + "-" + str(np.random.choice(digits))+"'" + ", " + latitud + ", " + longitud + ", " + str(i+1) + ", " + str(i+1) + ");\n")

	f.write("\n")

	# Generar boleta
	for i in range(iterations, 100000):
		fecha_emitida = fake.date_time_between(start_date='-2y', end_date='now')
		fecha_vencimiento = fecha_emitida + timedelta(days=np.random.randint(30, 365))
		
		fecha_emitida_str = fecha_emitida.strftime('%Y-%m-%d %H:%M:%S')
		fecha_vencimiento_str = fecha_vencimiento.strftime('%Y-%m-%d %H:%M:%S')

		consumo = str(round(np.random.uniform(5, 20),2))

		f.write("INSERT INTO boleta (id, precio, fecha_emitida, fecha_vencimiento, consumo_diario, id_cliente) VALUES (" + str(i+1) + ", " + str(np.random.randint(600000, 4000000)) + ", " + "'"+fecha_emitida_str+"'" + ", "+ "'"+fecha_vencimiento_str+"'" + ", "+ consumo + ", "  + str(i+1) + ");\n")
	
	f.write("\n")



	f.close()

if __name__=="__main__":
	main()
