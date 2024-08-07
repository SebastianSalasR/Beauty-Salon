from faker import Faker
import random

fake = Faker()

def generarSQL(nombreTabla, columnas, cantidadDatos):
    insertarDatos = []

    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_trabajador':
                valores.append(str(i))
            elif columna == 'nombre':
                valores.append(f"'{fake.first_name()}'")
            elif columna == 'apellido':
                valores.append(f"'{fake.last_name()}'")
            elif columna == 'telefono':
                valores.append(f"'{fake.phone_number()}'")
            elif columna == 'id_sede':
                valores.append(str(random.randint(1, 100)))
            elif columna == 'id_comuna':
                valores.append(str(random.randint(1, 10)))
            else:
                valores.append(f"'{fake.word()}'")
        
        values_str = ", ".join(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES ({values_str});"
        insertarDatos.append(sql)

    return insertarDatos

nombreTabla = 'trabajador'
columnas = ['id_trabajador', 'nombre', 'apellido', 'telefono', 'id_sede', 'id_comuna']
cantidadDatos = 1000

insertar = generarSQL(nombreTabla, columnas, cantidadDatos)

for datos in insertar:
    print(datos)
