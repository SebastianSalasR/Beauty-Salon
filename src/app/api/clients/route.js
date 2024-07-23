import pool from "@/utils/postgres"
import { NextResponse } from "next/server";

export async function POST(req) {

    const client = await pool.connect();

    try {
        await client.query("BEGIN");
        const data = await req.json();

        const newClient = await client.query(
            `INSERT INTO cliente (nombre, apellido, rut, telefono, sexo, id_comuna) 
             VALUES ($1, $2, $3, $4, $5, $6)`,
            [data.client_name, data.client_last_name, "20540693k", data.client_phone_number, "mujer", 1]
        );

        await client.query("COMMIT");

        console.log("New client created: ", newClient.rows[0]);
        
        return NextResponse.json({message: "New client created", client: newClient.rows[0]});
    } catch (error) {
        await client.query("ROLLBACK");
        console.error("Error creating cliente:", error);
        return NextResponse.json({message: "Error creating client", error: error.message}, {status: 500});
    } finally {
        client.release();
    }
}
