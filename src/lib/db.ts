import { } from 'dotenv/config'
import mysql from 'mysql2/promise';

export function dbConnect() {
    const connection = mysql.createConnection(process.env.DATABASE_URL)
    console.log('Connected to PlanetScale!')
    return connection;
}