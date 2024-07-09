from faker import Faker
import random
from datetime import datetime, timedelta
import psycopg2

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

def generarSQL(cursor, nombreTabla, columnas, cantidadDatos):
    insertarDatos = []

    start_date = datetime(2000, 1, 1)
    end_date = datetime(2024, 12, 31)

    for i in range(1, cantidadDatos + 1):
        valores = []

        start_date_col, end_date_col = generate_start_end_dates(start_date, end_date)

        for columna in columnas:
            if columna == 'id_contrato':
                valores.append(i)
            elif columna == 'sueldo':
                valores.append(random.randint(400000, 800000))
            elif columna == 'fecha_inicio':
                valores.append(start_date_col)
            elif columna == 'fecha_termino':
                valores.append(end_date_col)
            elif columna == 'comision':
                valores.append(round(random.uniform(0.0, 1.0), 2))
            elif columna == 'id_cargo':
                valores.append(random.randint(1, 4))
            elif columna == 'id_trabajador':
                valores.append(random.randint(1, 1000))
            else:
                valores.append(fake.word())  # Manejar cualquier otra columna que puedas agregar
        
        values_tuple = tuple(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES (%s, %s, %s, %s, %s, %s, %s);"
        cursor.execute(sql, values_tuple)

def main():
    # Datos de conexión a la base de datos
    dbname = "beautySalonFull"
    user = "postgres"
    password = "Computin1."
    host = "localhost"
    port = "5432"

    conn = None
    cursor = None
    try:
        # Conectar a la base de datos
        conn = psycopg2.connect(dbname=dbname, user=user, password=password, host=host, port=port)
        cursor = conn.cursor()

        # Definir la tabla y columnas
        nombreTabla = 'contrato'
        columnas = ['id_contrato', 'sueldo', 'fecha_inicio', 'fecha_termino', 'comision', 'id_cargo', 'id_trabajador']
        cantidadDatos = 100000  # Generaremos 1000 registros

        # Generar y ejecutar las inserciones
        generarSQL(cursor, nombreTabla, columnas, cantidadDatos)

        # Confirmar los cambios
        conn.commit()
        print("Inserción de datos completada.")

    except Exception as e:
        print(f"Error: {e}")
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()

if __name__ == "__main__":
    main()
