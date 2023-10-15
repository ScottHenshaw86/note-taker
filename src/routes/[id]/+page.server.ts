import { dbConnect } from "$lib/db";

export const load = async ({ params }) => {
    const id = params.id;
    let dbConnection = await dbConnect();

    try {
        // const results = await dbConnection.query("SELECT title, content FROM notes;");

        const results = await dbConnection.execute(
            'SELECT title, content FROM notes WHERE id = ?;',
            [id]);

        // console.log("====================")
        // console.log("RESULTS:", results[0]);
        // console.log("====================")

        return {
            data: JSON.stringify(results),
            page: id
        };
    } catch (error) {
        console.log("Got an ERROR ERROR ERROR!!!");
        console.log(error);
        return error;
    } finally {
        console.log("closing connection...");
        dbConnection.end();
    }
}