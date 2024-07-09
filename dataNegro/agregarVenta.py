import random
from datetime import datetime, timedelta
from faker import Faker
import psycopg2

fake = Faker()

def generate_random_timestamp(start_date, end_date):
    delta = end_date - start_date
    random_seconds = random.randint(0, int(delta.total_seconds()))
    random_date = start_date + timedelta(seconds=random_seconds)
    return random_date

def generarSQL(cursor, nombreTabla, columnas, cantidadDatos):
    start_date = datetime(2024, 1, 1)
    end_date = datetime(2024, 12, 31)

    for i in range(1, cantidadDatos + 1):
        valores = []

        random_timestamp = generate_random_timestamp(start_date, end_date)

        for columna in columnas:
            if columna == 'id_venta':
                valores.append(str(i))
            elif columna == 'precio_venta_total':
                valores.append(str(random.randint(1000, 200000)))
            elif columna == 'fecha':
                valores.append(str(random_timestamp))
            elif columna == 'id_cliente':
                valores.append(str(random.randint(1, 1000)))
            elif columna == 'id_trabajador':
                valores.append(str(random.randint(1, 1000)))
            else:
                valores.append(f"'{fake.word()}'")

        values_str = ", ".join(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES ({values_str});"
        cursor.execute(sql)

def main():
    # Datos de conexión a la base de datos
    dbname = "beautySalonFull"
    user = "postgres"
    password = "Computin1."
    host = "localhost"
    port = "5432"

    try:
        # Conectar a la base de datos
        conn = psycopg2.connect(dbname=dbname, user=user, password=password, host=host, port=port)
        cursor = conn.cursor()

        # Definir la tabla y columnas
        nombreTabla = 'venta'
        columnas = ['id_venta', 'precio_venta_total', 'fecha', 'id_cliente', 'id_trabajador']
        cantidadDatos = 100000

        # Generar y ejecutar las inserciones
        generarSQL(cursor, nombreTabla, columnas, cantidadDatos)

        # Confirmar los cambios
        conn.commit()

        cursor.close()
        conn.close()
        print("Inserción de datos completada.")

    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()
