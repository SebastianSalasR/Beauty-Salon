def main():
	f = open("createData2.sql", "a")
	#Generar centro_distribucion
	for i in range (100000):
		f.write("INSERT INTO centro_distribucion (id) VALUES(" + str(i + 1) + ");\n")

	f.write("\n")
	
	#Generar medidor
	for i in range (100000):
		f.write("INSERT INTO medidor (id) VALUES(" + str(i + 1) + ");\n")

	f.write("\n")
	
if __name__=="__main__":
	main()