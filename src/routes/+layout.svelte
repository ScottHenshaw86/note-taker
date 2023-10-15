<script lang="ts">
	import { onMount } from 'svelte';
	import '../app.css';
	import ColorModeToggle from '$lib/ColorModeToggle.svelte';
	import MenuItem from '$lib/MenuItem.svelte';
	import AddNewFile from '$lib/icons/AddNewFile.svelte';
	import HideSidebar from '$lib/icons/HideSidebar.svelte';
	import ExpandSidebar from '$lib/icons/ExpandSidebar.svelte';

	export let data;
	const notes = JSON.parse(data.data)[0];
	console.log('NOTES NOTES NOTES:', notes);

	let colorMode: string = 'dark';
	let sidebarOpen = true;

	function toggleSidebar() {
		sidebarOpen = !sidebarOpen;
	}

	function changeColorMode() {
		colorMode = colorMode === 'dark' ? 'light' : 'dark';
	}

	let ready: boolean = false;
	onMount(() => {
		ready = true;
		sidebarOpen = window.innerWidth > 750;
		console.log(window);
	});

	let creatingNote: boolean = false;
</script>

<main class={colorMode === 'dark' ? 'dark' : ''}>
	{#if ready}
		<div class="bg-white dark:bg-stone-950">
			<nav
				class="bg-white border-b border-gray-200 px-4 py-2.5 bg-stone-100 dark:bg-stone-800 dark:border-gray-700 fixed left-0 right-0 top-0 z-50"
			>
				<div class="flex justify-between items-center">
					<button
						data-drawer-target="drawer-navigation"
						data-drawer-toggle="drawer-navigation"
						aria-controls="drawer-navigation"
						class="p-2 mr-2 text-gray-600 rounded-lg cursor-pointer hover:text-gray-100 hover:bg-gray-200 dark:hover:bg-gray-700 hover:ring-2 hover:ring-gray-100 dark:hover:ring-gray-700 dark:text-gray-400 dark:hover:bg-gray-700 dark:hover:text-white"
						on:click={toggleSidebar}
					>
						{#if sidebarOpen}
							<HideSidebar />
						{:else}
							<ExpandSidebar />
						{/if}
						<span class="sr-only">Toggle sidebar</span>
					</button>
					<form action="#" method="GET" class="md:block md:pl-2">
						<label for="topbar-search" class="sr-only">Search</label>
						<div class="relative md:w-64 md:w-96">
							<div
								class="flex absolute inset-y-0 left-0 items-center pl-3 pointer-events-none"
							>
								<svg
									class="w-5 h-5 text-gray-500 dark:text-gray-400"
									fill="currentColor"
									viewBox="0 0 20 20"
									xmlns="http://www.w3.org/2000/svg"
								>
									<path
										fill-rule="evenodd"
										clip-rule="evenodd"
										d="M8 4a4 4 0 100 8 4 4 0 000-8zM2 8a6 6 0 1110.89 3.476l4.817 4.817a1 1 0 01-1.414 1.414l-4.816-4.816A6 6 0 012 8z"
									/>
								</svg>
							</div>
							<input
								type="text"
								name="email"
								id="topbar-search"
								class="bg-gray-50 border border-gray-300 text-gray-900 text-sm rounded-lg focus:ring-primary-500 focus:border-primary-500 block w-full pl-10 p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
								placeholder="Search"
							/>
						</div>
					</form>
					<ColorModeToggle {colorMode} on:click={changeColorMode} />
				</div>
			</nav>

			<!-- Sidebar -->

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
					<form action="?/createNewNote" method="POST">
						<input
							on:keyup={(e) => {
								if (e.key === 'Enter' && e.currentTarget.value) {
									console.log('SUBMIT!');
									creatingNote = false;
								}
							}}
							on:blur={(e) => {
								if (e.currentTarget.value) {
									console.log('SUBMIT!');
									creatingNote = false;
								}
							}}
							type="text"
							autofocus
						/>
					</form>
				{/if}
				<div
					class="scroll_enabled overflow-y-auto py-5 px-3 h-full bg-stone-100 dark:bg-stone-800"
				>
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

			<main
				class="p-4 overflow-y-scroll h-screen pt-20 bg-white dark:bg-stone-950 transition-ml duration-200 dark:text-white {sidebarOpen
					? 'ml-64'
					: ''}"
			>
				<slot />
			</main>
		</div>
	{/if}
</main>
