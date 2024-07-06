import prisma from "@/libs/prisma";
import { NextResponse } from "next/server";
import pool from "@/utils/postgres";

export async function POST(req) {

	const client = await pool.connect();

	try {
		await client.query("BEGIN");
		const data = await req.json();

		const id_trabajador = await client.query('SELECT id_trabajador FROM trabajador WHERE nombre =', data.client_date);
		const id_cliente = await client.query('SELECT id_cliente FROM cliente WHERE nombre =', data.worker_date);
		id_servicio = await client.query('SELECT id_servicio FROM trabajadores WHERE nombre =', data.service_date);

		console.log("Nombre cliente ", data.client_date, "ID: ",id_trabajador);
		console.log("Nombre trabajador ", data.worker_date, "ID: ",id_cliente);
		console.log("Nombre servicio ", data.service_date, "ID: ",id_servicio);


		const newDate = await client.query(`insert into cita (fecha, id_trabajador, id_cliente, id_servicio) values ($1, $2, $3, $4, $5)`, [date_date, id_trabajador, id_cliente, id_servicio]);

		await client.query("COMMIT");

		console.log("New date created: ")
		console.log(newCita.rows[0]);

		return NextResponse.json({ message: 'Date created successfully', worker: newWorker.rows[0] });
	} catch (error) {
		await client.query('ROLLBACK');
		console.error("Error creating date:", error);
		return NextResponse.json({ message: 'Error creating date', error: error.message }, { status: 500 });
	} finally {
		client.release();
	}
};
