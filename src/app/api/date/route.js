import prisma from "@/libs/prisma";
import { NextResponse } from "next/server";
import pool from "@/utils/postgres";

export async function POST(req) {

	const client = await pool.connect();

	try {
		await client.query("BEGIN");
		const data = await req.json();
		console.log(data);
		const [client_nombre, client_apellido] = data.client_date.split(' ');
		const [worker_nombre, worker_apellido] = data.worker_date.split(' ');

		const id_trabajadorr = await client.query(
			'SELECT id_trabajador FROM trabajador WHERE nombre = $1 AND apellido = $2',
			[worker_nombre, worker_apellido]
		);
		const id_trabajador = id_trabajadorr.rows[0]?.id_trabajador;

		const id_clientee = await client.query(
			'SELECT id_cliente FROM cliente WHERE nombre = $1 AND apellido = $2',
			[client_nombre, client_apellido]
		);
		
		const id_cliente = id_clientee.rows[0]?.id_cliente;

		const id_servicioo = await client.query(
			'SELECT id_servicio FROM servicio WHERE tipo = $1',
			[data.service_date]
		)
		const id_servicio = id_servicioo.rows[0]?.id_servicio;

		console.log("Nombre cliente ", data.client_date, "ID: ",id_trabajador);
		console.log("Nombre trabajador ", data.worker_date, "ID: ",id_cliente);
		console.log("Servicio ", data.service_date, "ID: ", id_servicio);

		const newDate = await client.query(`INSERT INTO cita (fecha, id_trabajador, id_cliente, id_servicio) VALUES ($1, $2, $3, $4)`, [data.date_date, id_trabajador, id_cliente, id_servicio]);

		await client.query("COMMIT");

		console.log("New date created: ")
		console.log(newDate.rows[0]);

		return NextResponse.json({ message: 'Date created successfully', date: newDate.rows[0] });
	} catch (error) {
		await client.query('ROLLBACK');
		console.error("Error creating date:", error);
		return NextResponse.json({ message: 'Error creating date', error: error.message }, { status: 500 });
	} finally {
		client.release();
	}
};
