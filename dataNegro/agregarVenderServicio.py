from faker import Faker
import random
import psycopg2

fake = Faker()

def generarSQL(cursor, nombreTabla, columnas, cantidadDatos):
    try:
        for i in range(1, cantidadDatos + 1):
            valores = []
            for columna in columnas:
                if columna == 'id_vender_servicio':
                    valores.append(str(i))
                elif columna == 'id_servicio':
                    valores.append(str(random.randint(1, 1000)))
                elif columna == 'id_sede':
                    valores.append(str(random.randint(1, 100)))
                else:
                    valores.append(f"'{fake.word()}'")
            
            values_str = ", ".join(valores)
            sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES ({values_str});"
            cursor.execute(sql)
        
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
        nombreTabla = 'vender_servicio'
        columnas = ['id_vender_servicio', 'id_servicio', 'id_sede']
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
