from faker import Faker
import random

fake = Faker()

productos = ['Shampoo', 'Tinte', 'Crema']

def generarSQL(nombreTabla, columnas, cantidadDatos):
    insertarDatos = []

    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_producto':
                valores.append(str(i))
            elif columna == 'precio_compra':
                valores.append(str(random.randint(500, 10000)))
            elif columna == 'nombre':
                valores.append(f"'{random.choice(productos)}'")
            elif columna == 'stock':
                valores.append(str(random.randint(1, 100)))
            elif columna == 'precio_venta':
                valores.append(str(random.randint(1000, 20000)))
            else:
                valores.append(f"'{fake.word()}'")
        
        values_str = ", ".join(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES ({values_str});"
        insertarDatos.append(sql)

    return insertarDatos

nombreTabla = 'producto'
columnas = ['id_producto', 'precio_compra', 'nombre', 'stock', 'precio_venta']
cantidadDatos = 1000

insertar = generarSQL(nombreTabla, columnas, cantidadDatos)

for datos in insertar:
    print(datos)
