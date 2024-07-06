import pool from "@/utils/postgres"
import { NextResponse } from "next/server";

export async function POST(req) {

    const client = await pool.connect();

    try {

        await client.query("BEGIN");
        const data = req.json();

        const newClient = await client.query(`insert into cliente (nombre, apellido, rut, telefono, sexo, sexo, id_comuna) values ($1, $2, $3, $4, $5, $6, $7, $8)`,
            [data.client_name, data.client_last_name, data.client_rut, data.client_phone, data.client_sex, 1]);

        await client.query("COMMIT");

        console.log("New client created: ")
        console.log(newClient.rows[0]);
        
        return NextResponse.json({message: "New client created", client: newClient[0].rows[0]});
    } catch (error) {
        await client.query("ROLLBACK")
        console.error("Error creating cliente:", error);
        return NextResponse.json({message: "Error creating client", error: error.message}, {status: 500});
    } finally {
        client.release();
    }
}