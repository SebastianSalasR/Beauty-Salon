import prisma from "@/libs/prisma";
import { NextResponse } from "next/server";
import pool from "@/utils/postgres";

export async function POST(req) {
	
	const client = await pool.connect();

	try {
		await client.query("BEGIN");
		const data = await req.json();

		const newWorker = await client.query(`insert into trabajador (nombre, apellido, telefono, id_sede, id_comuna) values ($1, $2, $3, $4, $5)`,[data.worker_name, data.worker_last_name, data.worker_phone_number, 1, 1]);

		await client.query("COMMIT");


		console.log("New worker created: ")
		console.log(newWorker.rows[0]);

		return NextResponse.json({ message: 'Trabajador created successfully', worker: newWorker.rows[0] });
	} catch (error) {
		await client.query('ROLLBACK');
		console.error("Error creating trabajador:", error);
		return NextResponse.json({ message: 'Error creating trabajador', error: error.message }, { status: 500 });
	} finally {
		client.release();
	}
};
