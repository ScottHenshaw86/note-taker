import { dbConnect } from "$lib/db";

export async function load() {
    let dbConnection = await dbConnect();
    console.log("load - routes/+layout.server.ts")

    const user_id = 1;

    try {
        const results = await dbConnection.execute("SELECT id, title FROM notes WHERE user_id = ? ORDER BY id DESC;", [user_id]);
        return {
            data: JSON.stringify(results),
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

export const actions = {
    createNewNote: async ({ request }) => {
        const data = await request.formData();
        const title = data.get('title');

        console.log("TITLE TITLE TITLE TITLE TITLE:",title);

		let dbConnection = await dbConnect();
        console.log("actions/createNewNote - routes/+page.server.ts")

        try {
            const results = await dbConnection.execute(
                'INSERT INTO notes (owner, title) VALUES (1, ?)',
                [title]);
            
        } catch (error) {
            console.log("page.server", "Got an ERROR ERROR ERROR!!!");
            console.log(error);
            return error;
        } finally {
            console.log(`closing connection... - actions/createNewNote - routes/+page.server.ts`);
        dbConnection.end();

        }

	}
};