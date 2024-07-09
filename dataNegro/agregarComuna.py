import psycopg2
from faker import Faker
import random

fake = Faker()

comunas = [
    "Santiago", "Valparaiso", "Concepcion", "La Serena", "Antofagasta", 
    "Temuco", "Iquique", "Rancagua", "Talca", "Chillan", "Arica", 
    "Puerto Montt", "Coquimbo", "Valdivia", "Punta Arenas", "Copiapo", 
    "Curico", "Osorno", "Los Angeles", "Calama"
]

def generarSQL(cursor, nombreTabla, columnas, cantidadDatos):
    for i in range(1, cantidadDatos + 1):
        valores = []
        for columna in columnas:
            if columna == 'id_comuna':
                valores.append(i)
            elif columna == 'nombre':
                valores.append(comunas[i % len(comunas)])
            elif columna == 'id_region':
                valores.append(random.randint(1, 10))
            else:
                valores.append(fake.word())
        
        values_tuple = tuple(valores)
        sql = f"INSERT INTO {nombreTabla} ({', '.join(columnas)}) VALUES %s;"
        cursor.execute(sql, (values_tuple,))

def main():
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
        nombreTabla = 'comuna'
        columnas = ['id_comuna', 'nombre', 'id_region']
        cantidadDatos = 100000

        # Generar y ejecutar las inserciones
        generarSQL(cursor, nombreTabla, columnas, cantidadDatos)

        # Confirmar los cambios
        conn.commit()
        
        cursor.close()
        conn.close()

    except Exception as e:
        print(f"Error: {e}")
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()

if __name__ == "__main__":
    main()
