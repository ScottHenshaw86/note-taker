import { dbConnect } from "$lib/db";

export async function load() {
    let dbConnection = await dbConnect();
    console.log("load - routes/+layout.server.ts")

    try {
        const results = await dbConnection.query("SELECT id, title FROM notes ORDER BY id DESC;");
        return {
            data: JSON.stringify(results),
        };
    } catch (error) {
        console.log("Got an ERROR ERROR ERROR!!!");
        console.log(error);
        return error;
    } finally {
        console.log(`closing connection... - load - routes/+layout.server.ts`);
        dbConnection.end();
    }
}