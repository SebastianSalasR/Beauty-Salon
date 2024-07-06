from faker import Faker
import random

fake = Faker()

comunas = ["Santiago", "Valparaiso", "Concepcion", "La Serena", "Antofagasta", "Temuco", "Iquique", "Rancagua", "Talca", "Chillan", "Arica", "Puerto Montt", "Coquimbo", "Valdivia", "Punta Arenas", "Copiapo", "Curico", "Osorno", "Los Angeles", "Calama"]

def generarSQL(nombreTabla, columnas, cantidadDatos):
    insertarDatos = []

    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_comuna':
                valores.append(str(i))
            elif columna == 'nombre':
                valores.append(f"'{comunas[i]}'")
            else:
                valores.append(f"'{fake.word()}'")
        
        values_str = ", ".join(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES ({values_str});"
        insertarDatos.append(sql)

    return insertarDatos

nombreTabla = 'comuna'
columnas = ['id_comuna', 'nombre']
cantidadDatos = 10

insertar = generarSQL(nombreTabla, columnas, cantidadDatos)

for datos in insertar:
    print(datos)