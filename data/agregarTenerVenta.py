from faker import Faker
import random

fake = Faker()

def generarSQL(nombreTabla, columnas, cantidadDatos):
    insertarDatos = []

    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_tener_venta':
                valores.append(str(i))
            elif columna == 'id_producto':
                valores.append(str(random.randint(1, 1000)))
            elif columna == 'id_venta':
                valores.append(str(random.randint(1, 1000)))
            else:
                valores.append(f"'{fake.word()}'")
        
        values_str = ", ".join(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES ({values_str});"
        insertarDatos.append(sql)

    return insertarDatos

nombreTabla = 'tener_venta'
columnas = ['id_tener_venta', 'id_producto', 'id_venta']
cantidadDatos = 1000

insertar = generarSQL(nombreTabla, columnas, cantidadDatos)

for datos in insertar:
    print(datos)
