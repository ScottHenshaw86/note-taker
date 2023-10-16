import { dbConnect } from "$lib/db";

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
            console.log("Got an ERROR ERROR ERROR!!!");
            console.log(error);
            return error;
        } finally {
            console.log(`closing connection... - actions/createNewNote - routes/+page.server.ts`);
        dbConnection.end();

        }

	}
};