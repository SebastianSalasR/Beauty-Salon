from faker import Faker
import random

fake = Faker()

servicios = ['Corte de Pelo', 'Tenir Pelo', 'Corte de Pelo y Barba']

def generarSQL(nombreTabla, columnas, cantidadDatos):
    insertarDatos = []

    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_servicio':
                valores.append(str(i))
            elif columna == 'precio':
                valores.append(str(random.randint(500, 10000)))
            elif columna == 'tipo':
                valores.append(f"'{random.choice(servicios)}'")
            else:
                valores.append(f"'{fake.word()}'")
        
        values_str = ", ".join(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES ({values_str});"
        insertarDatos.append(sql)

    return insertarDatos

nombreTabla = 'servicio'
columnas = ['id_servicio', 'precio', 'tipo']
cantidadDatos = 1000

insertar = generarSQL(nombreTabla, columnas, cantidadDatos)

for datos in insertar:
    print(datos)
