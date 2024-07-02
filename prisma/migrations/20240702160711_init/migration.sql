-- CreateTable
CREATE TABLE "Cita" (
    "id_cita" SERIAL NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,
    "id_trabajador" INTEGER NOT NULL,
    "id_cliente" INTEGER NOT NULL,
    "id_servicio" INTEGER NOT NULL,

    CONSTRAINT "Cita_pkey" PRIMARY KEY ("id_cita")
);

-- CreateTable
CREATE TABLE "Region" (
    "id_region" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "Region_pkey" PRIMARY KEY ("id_region")
);

-- CreateTable
CREATE TABLE "Comuna" (
    "id_comuna" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "id_region" INTEGER NOT NULL,

    CONSTRAINT "Comuna_pkey" PRIMARY KEY ("id_comuna")
);

-- CreateTable
CREATE TABLE "Sede" (
    "id_sede" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "latitud" DOUBLE PRECISION NOT NULL,
    "longitud" DOUBLE PRECISION NOT NULL,
    "id_comuna" INTEGER NOT NULL,

    CONSTRAINT "Sede_pkey" PRIMARY KEY ("id_sede")
);

-- CreateTable
CREATE TABLE "Trabajador" (
    "id_trabajador" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "telefono" INTEGER NOT NULL,
    "id_comuna" INTEGER NOT NULL,
    "id_sede" INTEGER NOT NULL,

    CONSTRAINT "Trabajador_pkey" PRIMARY KEY ("id_trabajador")
);

-- CreateTable
CREATE TABLE "Cargo" (
    "id_cargo" SERIAL NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "Cargo_pkey" PRIMARY KEY ("id_cargo")
);

-- CreateTable
CREATE TABLE "Contrato" (
    "id_contrato" SERIAL NOT NULL,
    "sueldo" INTEGER NOT NULL,
    "fecha_inicio" TIMESTAMP(3) NOT NULL,
    "fecha_termino" TIMESTAMP(3) NOT NULL,
    "comision" INTEGER NOT NULL,
    "id_cargo" INTEGER NOT NULL,
    "id_trabajador" INTEGER NOT NULL,

    CONSTRAINT "Contrato_pkey" PRIMARY KEY ("id_contrato")
);

-- CreateTable
CREATE TABLE "Liquidacion" (
    "id_liquidacion" SERIAL NOT NULL,
    "fecha_pago" TIMESTAMP(3) NOT NULL,
    "monto_comision" INTEGER NOT NULL,
    "id_contrato" INTEGER NOT NULL,

    CONSTRAINT "Liquidacion_pkey" PRIMARY KEY ("id_liquidacion")
);

-- CreateTable
CREATE TABLE "Producto" (
    "id_producto" SERIAL NOT NULL,
    "precio_compra" INTEGER NOT NULL,
    "nombre" TEXT NOT NULL,
    "stock" INTEGER NOT NULL,
    "flag" BOOLEAN NOT NULL,
    "precio_venta" INTEGER NOT NULL,

    CONSTRAINT "Producto_pkey" PRIMARY KEY ("id_producto")
);

-- CreateTable
CREATE TABLE "VenderProducto" (
    "id_vender_producto" SERIAL NOT NULL,
    "id_producto" INTEGER NOT NULL,
    "id_sede" INTEGER NOT NULL,

    CONSTRAINT "VenderProducto_pkey" PRIMARY KEY ("id_vender_producto")
);

-- CreateTable
CREATE TABLE "Servicio" (
    "id_servicio" SERIAL NOT NULL,
    "precio" INTEGER NOT NULL,
    "tipo" TEXT NOT NULL,
    "flag" TEXT NOT NULL,

    CONSTRAINT "Servicio_pkey" PRIMARY KEY ("id_servicio")
);

-- CreateTable
CREATE TABLE "VenderServicio" (
    "id_vender_servicio" SERIAL NOT NULL,
    "id_servicio" INTEGER NOT NULL,
    "id_sede" INTEGER NOT NULL,

    CONSTRAINT "VenderServicio_pkey" PRIMARY KEY ("id_vender_servicio")
);

-- CreateTable
CREATE TABLE "Venta" (
    "id_venta" SERIAL NOT NULL,
    "precio_venta_total" INTEGER NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,
    "id_cliente" INTEGER NOT NULL,
    "id_trabajador" INTEGER NOT NULL,

    CONSTRAINT "Venta_pkey" PRIMARY KEY ("id_venta")
);

-- CreateTable
CREATE TABLE "TenerVenta" (
    "id_tener_venta" SERIAL NOT NULL,
    "id_producto" INTEGER NOT NULL,
    "id_venta" INTEGER NOT NULL,

    CONSTRAINT "TenerVenta_pkey" PRIMARY KEY ("id_tener_venta")
);

-- CreateTable
CREATE TABLE "Cliente" (
    "id_cliente" SERIAL NOT NULL,
    "nombre" VARCHAR(20) NOT NULL,
    "apellido" VARCHAR(20) NOT NULL,
    "rut" TEXT NOT NULL,
    "telefono" INTEGER NOT NULL,
    "sexo" VARCHAR(20) NOT NULL,
    "id_comuna" INTEGER NOT NULL,

    CONSTRAINT "Cliente_pkey" PRIMARY KEY ("id_cliente")
);

-- CreateIndex
CREATE UNIQUE INDEX "Region_nombre_key" ON "Region"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "Comuna_nombre_key" ON "Comuna"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "Sede_nombre_key" ON "Sede"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "Cargo_nombre_key" ON "Cargo"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "Producto_nombre_key" ON "Producto"("nombre");

-- CreateIndex
CREATE UNIQUE INDEX "VenderProducto_id_producto_key" ON "VenderProducto"("id_producto");

-- CreateIndex
CREATE UNIQUE INDEX "VenderServicio_id_servicio_key" ON "VenderServicio"("id_servicio");

-- CreateIndex
CREATE UNIQUE INDEX "TenerVenta_id_producto_key" ON "TenerVenta"("id_producto");

-- CreateIndex
CREATE UNIQUE INDEX "TenerVenta_id_venta_key" ON "TenerVenta"("id_venta");

-- AddForeignKey
ALTER TABLE "Cita" ADD CONSTRAINT "Cita_id_trabajador_fkey" FOREIGN KEY ("id_trabajador") REFERENCES "Trabajador"("id_trabajador") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cita" ADD CONSTRAINT "Cita_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "Cliente"("id_cliente") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cita" ADD CONSTRAINT "Cita_id_servicio_fkey" FOREIGN KEY ("id_servicio") REFERENCES "Servicio"("id_servicio") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Comuna" ADD CONSTRAINT "Comuna_id_region_fkey" FOREIGN KEY ("id_region") REFERENCES "Region"("id_region") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Sede" ADD CONSTRAINT "Sede_id_comuna_fkey" FOREIGN KEY ("id_comuna") REFERENCES "Comuna"("id_comuna") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trabajador" ADD CONSTRAINT "Trabajador_id_comuna_fkey" FOREIGN KEY ("id_comuna") REFERENCES "Comuna"("id_comuna") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trabajador" ADD CONSTRAINT "Trabajador_id_sede_fkey" FOREIGN KEY ("id_sede") REFERENCES "Sede"("id_sede") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contrato" ADD CONSTRAINT "Contrato_id_cargo_fkey" FOREIGN KEY ("id_cargo") REFERENCES "Cargo"("id_cargo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Contrato" ADD CONSTRAINT "Contrato_id_trabajador_fkey" FOREIGN KEY ("id_trabajador") REFERENCES "Trabajador"("id_trabajador") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Liquidacion" ADD CONSTRAINT "Liquidacion_id_contrato_fkey" FOREIGN KEY ("id_contrato") REFERENCES "Contrato"("id_contrato") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VenderProducto" ADD CONSTRAINT "VenderProducto_id_producto_fkey" FOREIGN KEY ("id_producto") REFERENCES "Producto"("id_producto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VenderProducto" ADD CONSTRAINT "VenderProducto_id_sede_fkey" FOREIGN KEY ("id_sede") REFERENCES "Sede"("id_sede") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VenderServicio" ADD CONSTRAINT "VenderServicio_id_servicio_fkey" FOREIGN KEY ("id_servicio") REFERENCES "Servicio"("id_servicio") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "VenderServicio" ADD CONSTRAINT "VenderServicio_id_sede_fkey" FOREIGN KEY ("id_sede") REFERENCES "Sede"("id_sede") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Venta" ADD CONSTRAINT "Venta_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "Cliente"("id_cliente") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Venta" ADD CONSTRAINT "Venta_id_trabajador_fkey" FOREIGN KEY ("id_trabajador") REFERENCES "Trabajador"("id_trabajador") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TenerVenta" ADD CONSTRAINT "TenerVenta_id_producto_fkey" FOREIGN KEY ("id_producto") REFERENCES "Producto"("id_producto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TenerVenta" ADD CONSTRAINT "TenerVenta_id_venta_fkey" FOREIGN KEY ("id_venta") REFERENCES "Venta"("id_venta") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cliente" ADD CONSTRAINT "Cliente_id_comuna_fkey" FOREIGN KEY ("id_comuna") REFERENCES "Comuna"("id_comuna") ON DELETE RESTRICT ON UPDATE CASCADE;
