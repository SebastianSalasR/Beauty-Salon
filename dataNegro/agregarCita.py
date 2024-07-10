from faker import Faker
import random
import psycopg2
from datetime import datetime, timedelta

fake = Faker()

def generarSQL(cursor, nombreTabla, columnas, cantidadDatos):
    try:
        start_date = datetime(2023, 1, 1)
        end_date = datetime(2023, 12, 31)

        for i in range(1, cantidadDatos + 1):
            valores = []
            for columna in columnas:
                if columna == 'id_cita':
                    valores.append(str(i))
                elif columna == 'fecha':
                    random_timestamp = generate_random_timestamp(start_date, end_date)
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
            sql = f"INSERT INTO public.{nombreTabla} ({', '.join(columnas)}) VALUES ({values_str});"
            cursor.execute(sql)
        
        print(f"Inserción de {cantidadDatos} registros en la tabla {nombreTabla} completada.")
    
    except Exception as e:
        print(f"Error al insertar datos: {e}")

def generate_random_timestamp(start_date, end_date):
    delta = end_date - start_date
    random_seconds = random.randint(0, int(delta.total_seconds()))
    random_date = start_date + timedelta(seconds=random_seconds)
    return random_date

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
        nombreTabla = 'cita'
        columnas = ['id_cita', 'fecha', 'id_trabajador', 'id_cliente', 'id_servicio']
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
