<script lang="ts">
	import AddNewFile from '$lib/icons/AddNewFile.svelte';
	let creatingNote: boolean = false;

	export let notes: any;
	export let sidebarOpen: boolean;
</script>

<aside
	class="fixed top-0 left-0 z-40 w-64 h-screen pt-[3.9rem] transition-transform duration-200 border-r border-gray-200 bg-stone-100 dark:bg-stone-800 dark:border-gray-700 {sidebarOpen
		? 'translate-x-0'
		: '-translate-x-full'} "
	aria-label="Sidenav"
	id="drawer-navigation"
>
	<button
		on:click={() => (creatingNote = true)}
		class="bg-green-400 py-2 px-16 mx-auto mt-2 block rounded-xl"
	>
		<AddNewFile size="30" color="white" />
	</button>
	{#if creatingNote}
		<form action="?/createNewNote" method="POST" class="center">
			<input
				on:blur={(e) => {
					if (e.currentTarget.value) {
						console.log('SUBMIT!');
					}
					creatingNote = false;
				}}
				class="block mx-auto mt-2 w-4/5"
				type="text"
				autofocus
				name="title"
			/>
		</form>
	{/if}
	<div class="scroll_enabled overflow-y-auto py-5 px-3 h-full bg-stone-100 dark:bg-stone-800">
		<ul class="space-y-2 dark:text-white">
			{#each notes as note}
				<li>
					<a
						href="/{note.id}"
						class="block hover:bg-blue-400 cursor-pointer px-2 py-1 rounded-xl"
					>
						{note.title}
					</a>
				</li>
			{/each}
		</ul>
	</div>
</aside>
