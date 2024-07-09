import psycopg2
from faker import Faker
import random

fake = Faker()

def generate_lat_lon():
    lat = round(random.uniform(-90, 90), 6)  # Latitud entre -90 y 90
    lon = round(random.uniform(-180, 180), 6)  # Longitud entre -180 y 180
    return lat, lon

def generarSQL(cursor, nombreTabla, columnas, cantidadDatos):
    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_sede':
                valores.append(i)
            elif columna == 'nombre':
                valores.append(fake.company())
            elif columna == 'latitud':
                lat, lon = generate_lat_lon()
                valores.append(lat)
            elif columna == 'longitud':
                lat, lon = generate_lat_lon()
                valores.append(lon)
            elif columna == 'id_comuna':
                valores.append(random.randint(1, 10))
            else:
                valores.append(fake.word())
        
        values_tuple = tuple(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES (%s, %s, %s, %s, %s);"
        cursor.execute(sql, values_tuple)

def main():
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
        nombreTabla = 'sede'
        columnas = ['id_sede', 'nombre', 'latitud', 'longitud', 'id_comuna']
        cantidadDatos = 100000

        # Generar y ejecutar las inserciones
        generarSQL(cursor, nombreTabla, columnas, cantidadDatos)

        # Confirmar los cambios
        conn.commit()
        
        cursor.close()
        conn.close()

    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    main()
