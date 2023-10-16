import { dbConnect } from "$lib/db";

export const load = async ({ params }) => {
    const id = params.id;
    let dbConnection = await dbConnect();
    console.log(`load - routes/${id}/+page.server.ts`)

    try {
        // const results = await dbConnection.query("SELECT title, content FROM notes;");

        const results = await dbConnection.execute(
            'SELECT id, title, content FROM notes WHERE id = ?;',
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
        console.log(`closing connection... - load - routes/${id}/+page.server.ts`);
        dbConnection.end();
    }
}

export const actions = {
    createNewNote: async ({ request }) => {
        const data = await request.formData();
        const title = data.get('title');

		let dbConnection = await dbConnect();
        console.log(`actions/createNewNote - routes/[id]/+page.server.ts`)

        try {
            const results = await dbConnection.execute(
                'INSERT INTO notes (owner, title) VALUES (1, ?)',
                [title]);
            
        } catch (error) {
            console.log("Got an ERROR ERROR ERROR!!!");
            console.log(error);
            return error;
        } finally {
            console.log(`closing connection... - actions/createNewNote - routes/[id]/+page.server.ts`);
        dbConnection.end();
        }

	},

	updateTitle: async ({ request }) => {
		const data = await request.formData();
        const title = data.get('title');
        const id = data.get('id');
        console.log("ID:", id)
        
        let dbConnection = await dbConnect();
        console.log(`actions/updateTitle - routes/${id}/+page.server.ts`)

        try {
            const results = await dbConnection.execute(
                'UPDATE notes SET title = ? WHERE id = ?',
                [title, id]);
        } catch (error) {
            console.log("Got an ERROR ERROR ERROR!!!");
            console.log(error);
        } finally {
            console.log(`closing connection... - actions/updateTitle - routes/${id}/+page.server.ts`);
            dbConnection.end();
        }
	}
};