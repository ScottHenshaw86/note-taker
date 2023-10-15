import { dbConnect } from "$lib/db";

export async function load() {
    let dbConnection = await dbConnect();

    try {
        const results = await dbConnection.query("SELECT id, title FROM notes;");
        return {
            data: JSON.stringify(results),
        };
    } catch (error) {
        console.log("Got an ERROR ERROR ERROR!!!");
        console.log(error);
        return error;
    } finally {
        dbConnection.end();
    }
}