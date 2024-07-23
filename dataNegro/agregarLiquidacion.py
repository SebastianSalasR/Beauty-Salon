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

def generarSQL(cursor, nombreTabla, columnas, cantidadDatos):
    start_date = datetime(2024, 1, 1)
    end_date = datetime(2024, 12, 31)

    try:
        for i in range(1, cantidadDatos + 1):
            valores = []

            random_timestamp = generate_random_timestamp(start_date, end_date)

            for columna in columnas:
                if columna == 'id_liquidacion':
                    valores.append(i)
                elif columna == 'fecha_pago':
                    valores.append(random_timestamp)
                elif columna == 'monto_comision':
                    valores.append(random.randint(10000, 200000))
                elif columna == 'id_contrato':
                    valores.append(random.randint(1, 1000))
                else:
                    valores.append(fake.word())

            values_str = tuple(valores)
            sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES %s;"
            cursor.execute(sql, (values_str,))
        
        print(f"Inserción de {cantidadDatos} registros en la tabla {nombreTabla} completada.")
    
    except Exception as e:
        print(f"Error al insertar datos: {e}")

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
        nombreTabla = 'liquidacion'
        columnas = ['id_liquidacion', 'fecha_pago', 'monto_comision', 'id_contrato']
        cantidadDatos = 100000

        # Generar y ejecutar las inserciones
        generarSQL(cursor, nombreTabla, columnas, cantidadDatos)

        # Confirmar los cambios y cerrar la conexión
        conn.commit()
        cursor.close()
        conn.close()
    
    except Exception as e:
        print(f"Error al conectar o insertar datos: {e}")

if __name__ == "__main__":
    main()
