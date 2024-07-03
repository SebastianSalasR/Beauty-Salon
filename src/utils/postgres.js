import { Pool } from "pg";

const Pool = new Pool({
    host: 'localhost',
    port: 5432,
    user: 'postgres',
    password: 'Computin1.',
    database: 'beauty-salon'
})

export default Pool;