from faker import Faker
import random

fake = Faker()

def generate_lat_lon():
    lat = round(random.uniform(-90, 90), 6)  # Latitud entre -90 y 90
    lon = round(random.uniform(-180, 180), 6)  # Longitud entre -180 y 180
    return lat, lon

def generarSQL(nombreTabla, columnas, cantidadDatos):
    insertarDatos = []

    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_sede':
                valores.append(str(i))
            elif columna == 'nombre':
                valores.append(f"'{fake.company()}'")
            elif columna == 'latitud':
                lat, lon = generate_lat_lon()
                valores.append(str(lat))
            elif columna == 'longitud':
                lat, lon = generate_lat_lon()
                valores.append(str(lon))
            elif columna == 'id_comuna':
                valores.append(str(random.randint(1, 10)))
            else:
                valores.append(f"'{fake.word()}'")
        
        values_str = ", ".join(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES ({values_str});"
        insertarDatos.append(sql)

    return insertarDatos

nombreTabla = 'sede'
columnas = ['id_sede', 'nombre', 'latitud', 'longitud', 'id_comuna']
cantidadDatos = 100

insertar = generarSQL(nombreTabla, columnas, cantidadDatos)

for datos in insertar:
    print(datos)