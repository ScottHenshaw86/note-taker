<script>
	import { page } from '$app/stores';
	import BlockStore from '$lib/Store.js';
	import NoteBlock from '$lib/NoteBlock.svelte';
	export let data;
	$: blocks = JSON.parse(data.blocks)[0];
	$: note = JSON.parse(data.note)[0][0];
	$: title = note.title;
	$: console.log('NOTE:', note);
	$: console.log('BLOCKS:', blocks);
	$: BlockStore.update(() => {
		console.log('updating store...');
		return blocks;
	});
	$: blockOrder = note.block_order;

	let formElement;
	let editingTitle = false;
</script>

{#if editingTitle}
	<form bind:this={formElement} action="?/updateTitle" method="POST">
		<input
			on:blur={(e) => {
				if (e.currentTarget.value) {
					console.log('SUBMIT!');
					formElement.submit();
					editingTitle = false;
				}
			}}
			class="text-black text-3xl font-bold"
			type="text"
			name="title"
			value={title}
			autofocus
		/>
		<input type="hidden" value={note.id} name="id" />
	</form>
{:else}
	<h1
		on:click={() => {
			console.log('click');
			editingTitle = true;
			console.log(editingTitle);
		}}
		on:keypress={() => (editingTitle = true)}
		class="text-3xl font-bold underline underline-offset-4 mb-4"
	>
		{note.title}
	</h1>
{/if}
{#if blocks}
	{#each blocks as block}
		<NoteBlock {block} />
		<br />
		<br />
	{/each}
{/if}
