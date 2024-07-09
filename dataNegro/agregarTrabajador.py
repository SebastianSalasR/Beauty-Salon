from faker import Faker
import random
import psycopg2

fake = Faker()

def generarSQL(cursor, nombreTabla, columnas, cantidadDatos):
    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_trabajador':
                valores.append(i)
            elif columna == 'nombre':
                valores.append(fake.first_name())
            elif columna == 'apellido':
                valores.append(fake.last_name())
            elif columna == 'telefono':
                valores.append(fake.phone_number())
            elif columna == 'id_sede':
                valores.append(random.randint(1, 100))
            elif columna == 'id_comuna':
                valores.append(random.randint(1, 100))
            else:
                valores.append(fake.word())

        values_tuple = tuple(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES (%s, %s, %s, %s, %s, %s);"
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
        nombreTabla = 'trabajador'
        columnas = ['id_trabajador', 'nombre', 'apellido', 'telefono', 'id_sede', 'id_comuna']
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
