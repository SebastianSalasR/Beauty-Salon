import random
from datetime import datetime, timedelta
from faker import Faker
import psycopg2

fake = Faker()


regiones = [
    "Region de Arica y Parinacota", "Region de Tarapaca", "Region de Antofagasta", 
    "Region de Atacama", "Region de Coquimbo", "Region de Valparaiso", 
    "Region Metropolitana de Santiago", "Region del Libertador General Bernardo OHiggins", 
    "Region del Maule", "Region de nhuble", "Region del Biobio", "Region de La Araucania", 
    "Region de Los Rios", "Region de Los Lagos", "Region de Aysen del General Carlos Ibanhez del Campo", 
    "Region de Magallanes y de la Antartica Chilena"
]

def querysRegion(cursor, nombreTabla, columnas, cantidadDatos):
    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_region':
                valores.append(i)
            elif columna == 'nombre':
                valores.append(regiones[i % len(regiones)])
            else:
                valores.append(fake.word())
        
        values_tuple = tuple(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES %s;"
        cursor.execute(sql, (values_tuple,))

def generate_random_timestamp(start_date, end_date):
    delta = end_date - start_date
    random_seconds = random.randint(0, int(delta.total_seconds()))
    random_date = start_date + timedelta(seconds=random_seconds)
    return random_date

def querysVenta(cursor, nombreTabla, columnas, cantidadDatos):
    start_date = datetime(2024, 1, 1)
    end_date = datetime(2024, 12, 31)

    for i in range(1, cantidadDatos + 1):
        valores = []

        random_timestamp = generate_random_timestamp(start_date, end_date)

        for columna in columnas:
            if columna == 'id_venta':
                valores.append(i)
            elif columna == 'precio_venta_total':
                valores.append(random.randint(1000, 200000))
            elif columna == 'fecha':
                valores.append(random_timestamp)
            elif columna == 'id_cliente':
                valores.append(random.randint(1, 1000))
            elif columna == 'id_trabajador':
                valores.append(random.randint(1, 1000))
            else:
                valores.append(fake.word())

        values_str = tuple(valores)
        sql = f"INSERT INTO public.{nombreTabla} ({', '.join(columnas)}) VALUES %s;"
        cursor.execute(sql, (values_str,))

def main():
    dbname = "beautySalonFull"
    user = "postgres"
    password = "Computin1."
    host = "localhost"
    port = "5432"

    try:
        # Conectar a la base de datos
        conn = psycopg2.connect(dbname=dbname, user=user, password=password, host=host, port=port)
        print(conn)
        cursor = conn.cursor()

        # !
        nombreTabla = 'region'
        columnas = ['id_region', 'nombre']
        cantidadDatos = 100000
        
        querysRegion(cursor, nombreTabla, columnas, cantidadDatos)
        

        # 2
        nombreTabla = 'venta'
        columnas = ['id_venta', 'precio_venta_total', 'fecha', 'id_cliente', 'id_trabajador']
        cantidadDatos = 10000

        # Generar y ejecutar las inserciones
        querysVenta(cursor, nombreTabla, columnas, cantidadDatos)

        # Confirmar los cambios
        conn.commit()

        cursor.close()
        conn.close()

    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()
