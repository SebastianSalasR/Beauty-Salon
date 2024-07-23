from faker import Faker
import random
import numpy as np

fake = Faker()

sexo = ['Masculino', 'Femenino']
digitos = ["0", "1", "2", "3", "4", "5", " 6", "7", "8", "9", "k"]

def generarSQL(nombreTabla, columnas, cantidadDatos):
    insertarDatos = []

    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_cliente':
                valores.append(str(i))
            elif columna == 'nombre':
                valores.append(f"'{fake.first_name()}'")
            elif columna == 'apellido':
                valores.append(f"'{fake.last_name()}'")
            elif columna == 'rut':
                valores.append("'" + str(1200000+i) + "-" + str(np.random.choice(digitos)) + "'")
            elif columna == 'telefono':
                valores.append(f"'{fake.phone_number()}'")
            elif columna == 'sexo':
                valores.append(f"'{random.choice(sexo)}'")
            elif columna == 'id_comuna':
                valores.append(str(random.randint(1, 10)))
            else:
                valores.append(f"'{fake.word()}'")
        
        values_str = ", ".join(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES ({values_str});"
        insertarDatos.append(sql)

    return insertarDatos

nombreTabla = 'cliente'
columnas = ['id_cliente', 'nombre', 'apellido', 'rut', 'telefono', 'sexo', 'id_comuna']
cantidadDatos = 1000

insertar = generarSQL(nombreTabla, columnas, cantidadDatos)

for datos in insertar:
    print(datos)
