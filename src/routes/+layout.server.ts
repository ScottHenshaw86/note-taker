import { dbConnect } from "$lib/db";

export async function load() {
    let dbConnection = await dbConnect();
    console.log("load - routes/+layout.server.ts")

    const user_id = 1;

    try {
        const notes = await dbConnection.execute("SELECT id, title FROM notes WHERE user_id = ? ORDER BY id DESC;", [user_id]);
        return {
            notes: JSON.stringify(notes),
        };
    } catch (error) {
        console.log("layout.server", "Got an ERROR ERROR!!!");
        console.log(error);
        return error;
    } finally {
        console.log(`closing connection... - load - routes/+layout.server.ts`);
        dbConnection.end();
    }
}