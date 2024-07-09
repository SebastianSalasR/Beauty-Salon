from faker import Faker
import random
import psycopg2

fake = Faker()

servicios = ['Corte de Pelo', 'Tenir Pelo', 'Corte de Pelo y Barba']

def generarSQL(cursor, nombreTabla, columnas, cantidadDatos):
    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_servicio':
                valores.append(i)
            elif columna == 'precio':
                valores.append(random.randint(500, 10000))
            elif columna == 'tipo':
                valores.append(random.choice(servicios))
            else:
                valores.append(fake.word())

        values_tuple = tuple(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES (%s, %s, %s);"
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
        nombreTabla = 'servicio'
        columnas = ['id_servicio', 'precio', 'tipo']
        cantidadDatos = 100000

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
