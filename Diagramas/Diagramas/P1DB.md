----
<h1>Item 1 </h1>

| Data_name                  | Data_Type |
| -------------------------- | --------- |
| Duracion                   | timestamp |
| Puntos_destacados          | varchar   |
| disponibilidad_fechas      | varchar   |
| Precio                     | int       |
| Nombre                     | varchar   |
| Correo_electronico         | varchar   |
| Numero_telefono            | Int       |
| Numero_contacto_emergencia | int       |
| Nombre_contacto_emergencia | varchar   |
| Adicional_traslado         | varchar   |
| Adicional_alojamiento      | varchar   |
| Adicional_comida           | varchar   |
| Reservas                   | int       |
| Ingresos                   | int       |
| resenhas                   | varchar   |



---
<h1>Item 3</h1>
Ciudad(PK_nombre, region, numero_habitantes)
Farmacia(PK_nombre, direccion, FK_nombre_Ciudad, FK_id_Medicamento, FK_RUT_Propietario)
Vender(PK_id_venta, FK_id_medicamento,FK_nombre_farmacia)
Medicamento(PK_id, nombre)
Propietario(PK_RUT, nombre, direccion)