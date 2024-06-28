/*
  Warnings:

  - You are about to drop the `cargo` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cita` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `cliente` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `comuna` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `detalle` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `producto` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `region` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `sede` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `servicio` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `trabajador` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `venta` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE "cita" DROP CONSTRAINT "id_cliente";

-- DropForeignKey
ALTER TABLE "cita" DROP CONSTRAINT "id_detalle";

-- DropForeignKey
ALTER TABLE "cita" DROP CONSTRAINT "id_trabajador";

-- DropForeignKey
ALTER TABLE "cliente" DROP CONSTRAINT "id_venta";

-- DropForeignKey
ALTER TABLE "comuna" DROP CONSTRAINT "id_region";

-- DropForeignKey
ALTER TABLE "detalle" DROP CONSTRAINT "id_servicio";

-- DropForeignKey
ALTER TABLE "detalle" DROP CONSTRAINT "id_venta";

-- DropForeignKey
ALTER TABLE "producto" DROP CONSTRAINT "id_sede";

-- DropForeignKey
ALTER TABLE "sede" DROP CONSTRAINT "id_comuna";

-- DropForeignKey
ALTER TABLE "servicio" DROP CONSTRAINT "id_sede";

-- DropForeignKey
ALTER TABLE "trabajador" DROP CONSTRAINT "id_cargo";

-- DropForeignKey
ALTER TABLE "trabajador" DROP CONSTRAINT "id_sede";

-- DropForeignKey
ALTER TABLE "venta" DROP CONSTRAINT "id_product";

-- DropForeignKey
ALTER TABLE "venta" DROP CONSTRAINT "id_trabajador";

-- DropTable
DROP TABLE "cargo";

-- DropTable
DROP TABLE "cita";

-- DropTable
DROP TABLE "cliente";

-- DropTable
DROP TABLE "comuna";

-- DropTable
DROP TABLE "detalle";

-- DropTable
DROP TABLE "producto";

-- DropTable
DROP TABLE "region";

-- DropTable
DROP TABLE "sede";

-- DropTable
DROP TABLE "servicio";

-- DropTable
DROP TABLE "trabajador";

-- DropTable
DROP TABLE "venta";

-- CreateTable
CREATE TABLE "Region" (
    "id_region" INTEGER NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "Region_pkey" PRIMARY KEY ("id_region")
);

-- CreateTable
CREATE TABLE "Comuna" (
    "id_comuna" INTEGER NOT NULL,
    "nombre" TEXT NOT NULL,
    "id_region" INTEGER NOT NULL,

    CONSTRAINT "Comuna_pkey" PRIMARY KEY ("id_comuna")
);

-- CreateTable
CREATE TABLE "Sede" (
    "id_sede" INTEGER NOT NULL,
    "nombre" TEXT NOT NULL,
    "latitud" DOUBLE PRECISION NOT NULL,
    "longitud" DOUBLE PRECISION NOT NULL,
    "id_comuna" INTEGER NOT NULL,

    CONSTRAINT "Sede_pkey" PRIMARY KEY ("id_sede")
);

-- CreateTable
CREATE TABLE "Trabajador" (
    "id_trabajador" INTEGER NOT NULL,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "telefono" INTEGER NOT NULL,
    "sueldo" INTEGER NOT NULL,
    "id_sede" INTEGER NOT NULL,
    "id_cargo" INTEGER NOT NULL,

    CONSTRAINT "Trabajador_pkey" PRIMARY KEY ("id_trabajador")
);

-- CreateTable
CREATE TABLE "Cargo" (
    "id_cargo" INTEGER NOT NULL,
    "nombre" TEXT NOT NULL,

    CONSTRAINT "Cargo_pkey" PRIMARY KEY ("id_cargo")
);

-- CreateTable
CREATE TABLE "Producto" (
    "id_producto" INTEGER NOT NULL,
    "precio_compra" INTEGER NOT NULL,
    "nombre" TEXT NOT NULL,
    "stock" INTEGER NOT NULL,
    "flag" BOOLEAN NOT NULL,
    "precio_venta" INTEGER NOT NULL,
    "id_sede" INTEGER NOT NULL,

    CONSTRAINT "Producto_pkey" PRIMARY KEY ("id_producto")
);

-- CreateTable
CREATE TABLE "Servicio" (
    "id_servicio" INTEGER NOT NULL,
    "precio" INTEGER NOT NULL,
    "tipo" TEXT NOT NULL,
    "id_sede" INTEGER NOT NULL,

    CONSTRAINT "Servicio_pkey" PRIMARY KEY ("id_servicio")
);

-- CreateTable
CREATE TABLE "Venta" (
    "id_venta" INTEGER NOT NULL,
    "precio_venta" INTEGER NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,
    "id_producto" INTEGER NOT NULL,
    "id_trabajador" INTEGER NOT NULL,

    CONSTRAINT "Venta_pkey" PRIMARY KEY ("id_venta")
);

-- CreateTable
CREATE TABLE "Cita" (
    "id_cita" INTEGER NOT NULL,
    "fecha" TIMESTAMP(3) NOT NULL,
    "id_detalle" INTEGER NOT NULL,
    "id_trabajador" INTEGER NOT NULL,
    "id_cliente" INTEGER NOT NULL,

    CONSTRAINT "Cita_pkey" PRIMARY KEY ("id_cita")
);

-- CreateTable
CREATE TABLE "Cliente" (
    "id_cliente" INTEGER NOT NULL,
    "nombre" TEXT NOT NULL,
    "apellido" TEXT NOT NULL,
    "rut" TEXT NOT NULL,
    "telefono" INTEGER NOT NULL,
    "id_venta" INTEGER NOT NULL,

    CONSTRAINT "Cliente_pkey" PRIMARY KEY ("id_cliente")
);

-- CreateTable
CREATE TABLE "Detalle" (
    "id_detalle" INTEGER NOT NULL,
    "id_servicio" INTEGER NOT NULL,
    "id_venta" INTEGER NOT NULL,

    CONSTRAINT "Detalle_pkey" PRIMARY KEY ("id_detalle")
);

-- AddForeignKey
ALTER TABLE "Comuna" ADD CONSTRAINT "Comuna_id_region_fkey" FOREIGN KEY ("id_region") REFERENCES "Region"("id_region") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Sede" ADD CONSTRAINT "Sede_id_comuna_fkey" FOREIGN KEY ("id_comuna") REFERENCES "Comuna"("id_comuna") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trabajador" ADD CONSTRAINT "Trabajador_id_sede_fkey" FOREIGN KEY ("id_sede") REFERENCES "Sede"("id_sede") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Trabajador" ADD CONSTRAINT "Trabajador_id_cargo_fkey" FOREIGN KEY ("id_cargo") REFERENCES "Cargo"("id_cargo") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Producto" ADD CONSTRAINT "Producto_id_sede_fkey" FOREIGN KEY ("id_sede") REFERENCES "Sede"("id_sede") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Servicio" ADD CONSTRAINT "Servicio_id_sede_fkey" FOREIGN KEY ("id_sede") REFERENCES "Sede"("id_sede") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Venta" ADD CONSTRAINT "Venta_id_producto_fkey" FOREIGN KEY ("id_producto") REFERENCES "Producto"("id_producto") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Venta" ADD CONSTRAINT "Venta_id_trabajador_fkey" FOREIGN KEY ("id_trabajador") REFERENCES "Trabajador"("id_trabajador") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cita" ADD CONSTRAINT "Cita_id_detalle_fkey" FOREIGN KEY ("id_detalle") REFERENCES "Detalle"("id_detalle") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cita" ADD CONSTRAINT "Cita_id_trabajador_fkey" FOREIGN KEY ("id_trabajador") REFERENCES "Trabajador"("id_trabajador") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cita" ADD CONSTRAINT "Cita_id_cliente_fkey" FOREIGN KEY ("id_cliente") REFERENCES "Cliente"("id_cliente") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Cliente" ADD CONSTRAINT "Cliente_id_venta_fkey" FOREIGN KEY ("id_venta") REFERENCES "Venta"("id_venta") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Detalle" ADD CONSTRAINT "Detalle_id_servicio_fkey" FOREIGN KEY ("id_servicio") REFERENCES "Servicio"("id_servicio") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Detalle" ADD CONSTRAINT "Detalle_id_venta_fkey" FOREIGN KEY ("id_venta") REFERENCES "Venta"("id_venta") ON DELETE RESTRICT ON UPDATE CASCADE;
