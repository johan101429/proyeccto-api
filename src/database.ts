import { createPool } from 'mysql2/promise';

export async function connect() {


    const connection = await createPool({
        host: 'localhost',
        user: 'root',
        password: '1014',
        database: 'db_arriendos',
        connectionLimit: 10,
    })

    return connection;
}