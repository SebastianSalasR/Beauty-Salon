from faker import Faker
import random

fake = Faker()

regiones = ["Region de Arica y Parinacota", "Region de Tarapaca", "Region de Antofagasta", "Region de Atacama", "Region de Coquimbo", "Region de Valparaiso", "Region Metropolitana de Santiago", "Region del Libertador General Bernardo OHiggins", "Region del Maule", "Region de nhuble", "Region del Biobio", "Region de La Araucania", "Region de Los Rios", "Region de Los Lagos", "Region de Aysen del General Carlos Ibanhez del Campo", "Region de Magallanes y de la Antartica Chilena"]

def generarSQL(nombreTabla, columnas, cantidadDatos):
    insertarDatos = []

    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id':
                valores.append(str(i))
            elif columna == 'nombre':
                valores.append(f"'{regiones[i]}'")
            else:
                valores.append(f"'{fake.word()}'")
        
        values_str = ", ".join(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES ({values_str});"
        insertarDatos.append(sql)

    return insertarDatos

nombreTabla = 'region'
columnas = ['id', 'nombre']
cantidadDatos = 10

insertar = generarSQL(nombreTabla, columnas, cantidadDatos)

for datos in insertar:
    print(datos)