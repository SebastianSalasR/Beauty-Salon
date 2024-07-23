def main():
	f = open("createData.sql", "a")

	#Generar cliente
	for i in range (100000):
		f.write("INSERT INTO cliente (id) VALUES(" + str(i + 1) + ");\n")

	f.write("\n")

	#Generar boleta
	for i in range (100000):
		f.write("INSERT INTO boleta (id) VALUES(" + str(i + 1) + ");\n")

	f.write("\n")
	
	#Generar centro_distribucion
	for i in range (100000):
		f.write("INSERT INTO centro_distribucion (id) VALUES(" + str(i + 1) + ");\n")

	f.write("\n")
	
	#Generar medidor
	for i in range (100000):
		f.write("INSERT INTO medidor (id) VALUES(" + str(i + 1) + ");\n")

	f.write("\n")
	
	#Generar poste_luz
	for i in range (100000):
		f.write("INSERT INTO poste_luz (id) VALUES(" + str(i + 1) + ");\n")

	f.write("\n")

	#Geenrar transformador
	for i in range (100000):
		f.write("INSERT INTO transformador (id) VALUES(" + str(i + 1) + ");\n")

	f.write("\n")

	
	f.close()


if __name__=="__main__":
	main()