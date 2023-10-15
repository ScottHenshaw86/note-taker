<script>
	import { page } from '$app/stores';
	export let data;

	$: note = JSON.parse(data.data)[0][0];
	$: title = note.title;
	$: content = JSON.parse(note.content);

	$: console.log('NOTE NOTE NOTE:', title);
	$: console.log('dBLOCKS dBLOCKS NOTE:', content);
	$: index = $page.params.id;
</script>

<h1>{index}</h1>
<h1>{title}</h1>
<h2>PAGE: {page}</h2>
{#if content?.blocks}
	{#each content.blocks as block}
		{block.text}
		<br />
		<br />
	{/each}
{/if}
