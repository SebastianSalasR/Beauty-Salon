def main():
	f = open("createData3.sql", "a")

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