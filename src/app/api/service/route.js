import { NextResponse } from "next/server";
import pool from "@/utils/postgres";

export async function POST(req) {
	
	const client = await pool.connect();

	try {
		await client.query("BEGIN");
		const data = await req.json();

		const newService = await client.query(`insert into servicio (precio, tipo) values ($1, $2)`,[data.service_price, data.service_kind]);

		await client.query("COMMIT");

		console.log("New worker created: ")
		console.log(newService.rows[0]);

		return NextResponse.json({ message: 'Worker created successfully', worker: newService.rows[0] });
	} catch (error) {
		await client.query('ROLLBACK');
		console.error("Error creating trabajador:", error);
		return NextResponse.json({ message: 'Error creating trabajador', error: error.message }, { status: 500 });
	} finally {
		client.release();
	}
};