import { Pool } from "pg";

const pool = new Pool({
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: 'Computin1.',
    database: 'beauty-salon'
})

export default pool;