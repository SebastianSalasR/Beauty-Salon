import pool from "@/utils/postgres"

export async function POST(req) {
    
    const client = await pool.connect();

    try {

        await client.query("BEGIN");
        const data = req.json();

        

    } catch (error) {

    }
}