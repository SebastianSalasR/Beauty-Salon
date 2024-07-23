from faker import Faker
import random
import psycopg2

fake = Faker()

def generarSQL(cursor, nombreTabla, columnas, cantidadDatos):
    insertarDatos = []

    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_vender_producto':
                valores.append(i)
            elif columna == 'id_producto':
                valores.append(random.randint(1, 1000))
            elif columna == 'id_sede':
                valores.append(random.randint(1, 100))
            else:
                valores.append(fake.word())  # Manejar cualquier otra columna que puedas agregar
        
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
        nombreTabla = 'vender_producto'
        columnas = ['id_vender_producto', 'id_producto', 'id_sede']
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
