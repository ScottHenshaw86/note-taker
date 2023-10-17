<script>
	import { page } from '$app/stores';
	import NoteBlock from '$lib/NoteBlock.svelte';
	export let data;
	console.log(data);

	$: note = JSON.parse(data.note)[0][0];
	$: content = note.content;
	$: title = note.title;
	$: console.log('NOTE:', note);

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
{#if content?.blocks}
	{#each content.blocks as block}
		<!-- {block.text} -->
		<NoteBlock {block} />
		<br />
		<br />
	{/each}
{/if}
