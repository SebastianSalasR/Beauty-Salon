from faker import Faker
import psycopg2
import random

fake = Faker()

# Cargos específicos
cargos = ['peluquero', 'encargado', 'estilista', 'maquilladora']

def generarSQL(cursor, nombreTabla, columnas, cantidadDatos):
    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_cargo':
                valores.append(i)
            elif columna == 'nombre':
                cargo = random.choice(cargos)
                valores.append(f"'{cargo}'")
            else:
                valores.append(f"'{fake.word()}'")  # Esto es para manejar cualquier otra columna que puedas agregar

        values_tuple = tuple(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES (%s, %s);"
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
        nombreTabla = 'cargo'
        columnas = ['id_cargo', 'nombre']
        cantidadDatos = 10000

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
