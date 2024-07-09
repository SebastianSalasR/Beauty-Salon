from faker import Faker
import random
import psycopg2

fake = Faker()

productos = ['Shampoo', 'Tinte', 'Crema']

def generarSQL(cursor, nombreTabla, columnas, cantidadDatos):
    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_producto':
                valores.append(i)
            elif columna == 'precio_compra':
                valores.append(random.randint(500, 10000))
            elif columna == 'nombre':
                valores.append(f"'{random.choice(productos)}'")
            elif columna == 'stock':
                valores.append(random.randint(1, 100))
            elif columna == 'precio_venta':
                valores.append(random.randint(1000, 20000))
            else:
                valores.append(f"'{fake.word()}'")  # Esto es para manejar cualquier otra columna que puedas agregar

        values_tuple = tuple(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES (%s, %s, %s, %s, %s);"
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
        nombreTabla = 'producto'
        columnas = ['id_producto', 'precio_compra', 'nombre', 'stock', 'precio_venta']
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
