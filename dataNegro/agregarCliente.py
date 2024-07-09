from faker import Faker
import random
import numpy as np
import psycopg2

fake = Faker()

sexo = ['Masculino', 'Femenino']
digitos = ["0", "1", "2", "3", "4", "5", " 6", "7", "8", "9", "k"]

def generarSQL(cursor, nombreTabla, columnas, cantidadDatos):
    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_cliente':
                valores.append(i)
            elif columna == 'nombre':
                valores.append(fake.first_name())
            elif columna == 'apellido':
                valores.append(fake.last_name())
            elif columna == 'rut':
                valores.append(str(1200000+i) + "-" + str(np.random.choice(digitos)))
            elif columna == 'telefono':
                valores.append(fake.phone_number())
            elif columna == 'sexo':
                valores.append(random.choice(sexo))
            elif columna == 'id_comuna':
                valores.append(random.randint(1, 10))
            else:
                valores.append(fake.word())
        
        values_tuple = tuple(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES (%s, %s, %s, %s, %s, %s, %s);"
        cursor.execute(sql, values_tuple)

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
        nombreTabla = 'cliente'
        columnas = ['id_cliente', 'nombre', 'apellido', 'rut', 'telefono', 'sexo', 'id_comuna']
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
