def main():
	f = open("createData1.sql", "a")

	#Generar cliente
	for i in range (100000):
		f.write("INSERT INTO cliente (id) VALUES(" + str(i + 1) + ");\n")

	f.write("\n")

	#Generar boleta
	for i in range (100000):
		f.write("INSERT INTO boleta (id) VALUES(" + str(i + 1) + ");\n")

	f.write("\n")
	
	f.close()


if __name__=="__main__":
	main()