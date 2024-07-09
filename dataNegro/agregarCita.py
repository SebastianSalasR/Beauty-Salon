from faker import Faker
import random
from datetime import datetime, timedelta

fake = Faker()

def generate_random_timestamp(start_date, end_date):
    delta = end_date - start_date
    random_seconds = random.randint(0, int(delta.total_seconds()))
    random_date = start_date + timedelta(seconds=random_seconds)
    return random_date

def generarSQL(nombreTabla, columnas, cantidadDatos):
    insertarDatos = []

    start_date = datetime(2024, 1, 1)
    end_date = datetime(2024, 12, 31)

    for i in range(1, cantidadDatos + 1):
        valores = []
    
        random_timestamp = generate_random_timestamp(start_date, end_date)

        for columna in columnas:
            if columna == 'id_cita':
                valores.append(str(i))
            elif columna == 'fecha':
                valores.append(f"'{random_timestamp}'")
            elif columna == 'id_trabajador':
                valores.append(str(random.randint(1, 1000)))
            elif columna == 'id_cliente':
                valores.append(str(random.randint(1, 1000)))
            elif columna == 'id_servicio':
                valores.append(str(random.randint(1, 1000)))
            else:
                valores.append(f"'{fake.word()}'")
        
        values_str = ", ".join(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES ({values_str});"
        insertarDatos.append(sql)

    return insertarDatos

nombreTabla = 'cita'
columnas = ['id_cita', 'fecha', 'id_trabajador', 'id_cliente', 'id_servicio']
cantidadDatos = 1000

insertar = generarSQL(nombreTabla, columnas, cantidadDatos)

for datos in insertar:
    print(datos)
