from faker import Faker
import random

fake = Faker()

def generarSQL(nombreTabla, columnas, cantidadDatos):
    insertarDatos = []

    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_vender_producto':
                valores.append(str(i))
            elif columna == 'id_producto':
                valores.append(str(random.randint(1, 1000)))
            elif columna == 'id_sede':
                valores.append(str(random.randint(1, 100)))
            else:
                valores.append(f"'{fake.word()}'")
        
        values_str = ", ".join(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES ({values_str});"
        insertarDatos.append(sql)

    return insertarDatos

nombreTabla = 'vender_producto'
columnas = ['id_vender_producto', 'id_producto', 'id_sede']
cantidadDatos = 1000

insertar = generarSQL(nombreTabla, columnas, cantidadDatos)

for datos in insertar:
    print(datos)
