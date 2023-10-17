import { dbConnect } from "$lib/db";
import { redirect } from '@sveltejs/kit';

export const load = async ({ params }) => {
    const id = params.id;
    let dbConnection = await dbConnect();
    console.log(`load - routes/${id}/+page.server.ts`)

    try {
        // const results = await dbConnection.query("SELECT title, content FROM notes;");

        const note = await dbConnection.execute(
            'SELECT id, title, block_order, date_created, last_modified FROM notes WHERE id = ?;',
            [id]);

        const blocks = await dbConnection.execute(
            'SELECT id, type, parent_id, size, content, children_order FROM blocks WHERE note_id = ?;',
            [id]);

        // console.log("====================")
        // console.log("RESULTS:", results[0]);
        // console.log("====================")

        return {
            note: JSON.stringify(note),
            blocks: JSON.stringify(blocks),
            page: id
        };
    } catch (error) {
        console.log("/id/page.server", "load", "Got an ERROR ERROR ERROR!!!");
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
            // TODO: remove hard-coded user_id (1)
            const results = await dbConnection.execute(
                'INSERT INTO notes (user_id, title) VALUES (1, ?)',
                [title]);

                dbConnection.end();
                const noteId = results[0].insertId;
                throw redirect(302, `..//${noteId}`);
            
        } catch (error) {
            console.log("Got an ERROR ERROR ERROR!!!");
            console.log(error);
            return error;
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