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
            elif columna == 'operador':
                valores.append(f"'{fake.name()}'")
            elif columna == 'nombre':
                valores.append(f"'{random.choice(productos)}'")
            elif columna == 'id_centro_energia':
                valores.append(str(random.randint(1, 100)))
            elif columna == 'id_comuna':
                valores.append(str(random.randint(1, 10)))
            else:
                valores.append(f"'{fake.word()}'")
        
        values_str = ", ".join(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES ({values_str});"
        insertarDatos.append(sql)

    return insertarDatos

nombreTabla = 'producto'
columnas = ['id_producto', 'precio_compra', 'nombre', 'stock', 'flag', 'precio_venta', 'id_vender_producto', 'id_tener_venta']
cantidadDatos = 100

insertar = generarSQL(nombreTabla, columnas, cantidadDatos)

for datos in insertar:
    print(datos)
