import psycopg2
from faker import Faker

fake = Faker()

regiones = [
    "Region de Arica y Parinacota", "Region de Tarapaca", "Region de Antofagasta", 
    "Region de Atacama", "Region de Coquimbo", "Region de Valparaiso", 
    "Region Metropolitana de Santiago", "Region del Libertador General Bernardo OHiggins", 
    "Region del Maule", "Region de nhuble", "Region del Biobio", "Region de La Araucania", 
    "Region de Los Rios", "Region de Los Lagos", "Region de Aysen del General Carlos Ibanhez del Campo", 
    "Region de Magallanes y de la Antartica Chilena"
]

def generarSQL(cursor, nombreTabla, columnas, cantidadDatos):
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
        nombreTabla = 'region'
        columnas = ['id_region', 'nombre']
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
