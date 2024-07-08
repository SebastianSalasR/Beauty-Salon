from faker import Faker
import random
from datetime import datetime, timedelta

fake = Faker()

def generate_random_timestamp(start_date, end_date):
    delta = end_date - start_date
    random_seconds = random.randint(0, int(delta.total_seconds()))
    random_date = start_date + timedelta(seconds=random_seconds)
    return random_date

def generate_start_end_dates(start_date, end_date):
    start_timestamp = generate_random_timestamp(start_date, end_date)
    end_timestamp = generate_random_timestamp(start_timestamp, end_date)
    return start_timestamp, end_timestamp

def generarSQL(nombreTabla, columnas, cantidadDatos):
    insertarDatos = []

    start_date = datetime(2000, 1, 1)
    end_date = datetime(2024, 12, 31)

    for i in range(1, cantidadDatos + 1):
        valores = []

        start_date_col, end_date_col = generate_start_end_dates(start_date, end_date)

        for columna in columnas:
            if columna == 'id_contrato':
                valores.append(str(i))
            elif columna == 'sueldo':
                valores.append(str(random.randint(400000, 800000)))
            elif columna == 'fecha_inicio':
                valores.append(f"'{start_date_col}'")
            elif columna == 'fecha_termino':
                valores.append(f"'{end_date_col}'")
            elif columna == 'comision':
                valores.append(str(round(random.uniform(0.0, 1.0), 2)))
            elif columna == 'id_cargo':
                valores.append(str(random.randint(1, 4)))
            elif columna == 'id_trabajador':
                valores.append(str(random.randint(1, 1000)))
            else:
                valores.append(f"'{fake.word()}'")
        
        values_str = ", ".join(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES ({values_str});"
        insertarDatos.append(sql)

    return insertarDatos

nombreTabla = 'contrato'
columnas = ['id_contrato', 'sueldo', 'fecha_inicio', 'fecha_termino', 'comision', 'id_cargo', 'id_trabajador']
cantidadDatos = 1000

insertar = generarSQL(nombreTabla, columnas, cantidadDatos)

for datos in insertar:
    print(datos)