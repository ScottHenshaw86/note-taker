import { dbConnect } from "$lib/db";
import { redirect } from '@sveltejs/kit';

export const load = async ({ params }) => {
    const id = params.id;
    let dbConnection = await dbConnect();
    console.log(`load - routes/${id}/+page.server.ts`)

    // const results = await dbConnection.query("SELECT title, content FROM notes;");

    const note = await dbConnection.execute(
        'SELECT id, title, block_order, date_created, last_modified FROM notes WHERE id = ?;',
        [id]);

    const blocks = await dbConnection.execute(
        'SELECT id, type, parent_id, size, content, children_order FROM blocks WHERE note_id = ?;',
        [id]);

    dbConnection.end();
    return {
        note: JSON.stringify(note),
        blocks: JSON.stringify(blocks),
        page: id
    };
}

export const actions = {
    createNewNote: async ({ request }) => {
        const data = await request.formData();
        const title = data.get('title');

        let dbConnection = await dbConnect();
        console.log(`actions/createNewNote - routes/[id]/+page.server.ts`)

        // TODO: remove hard-coded user_id (1)
        const results = await dbConnection.execute(
            'INSERT INTO notes (user_id, title) VALUES (1, ?)',
            [title]);

        dbConnection.end();
        const noteId = results[0].insertId;
        throw redirect(302, `/${noteId}`);


    },

    updateTitle: async ({ request }) => {
        const data = await request.formData();
        const title = data.get('title');
        const id = data.get('id');
        console.log("ID:", id)

        let dbConnection = await dbConnect();
        console.log(`actions/updateTitle - routes/${id}/+page.server.ts`)

        const results = await dbConnection.execute(
            'UPDATE notes SET title = ? WHERE id = ?',
            [title, id]);

        dbConnection.end();

    },

    updateBlockSize: async ({ request }) => {
        const data = await request.formData();
        const newSize = data.get('newSize');
        const blockId = data.get('blockId');

        let dbConnection = await dbConnect();
        console.log(`actions/updateBlockSize - routes/[id]/+page.server.ts`)

        const results = await dbConnection.execute(
            'UPDATE blocks SET size = ? WHERE id = ?',
            [newSize, blockId]);

        dbConnection.end();
    }
};