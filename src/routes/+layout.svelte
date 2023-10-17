<script lang="ts">
	import { onMount } from 'svelte';
	import '../app.css';
	import Sidebar from '$lib/Sidebar.svelte';
	import Header from '$lib/Header.svelte';

	export let data;
	const notes = JSON.parse(data.notes)[0];

	console.log('NOTES', notes);

	let colorMode: string = 'dark';
	let sidebarOpen = true;

	let ready: boolean = false;
	onMount(() => {
		ready = true;
		sidebarOpen = window.innerWidth > 750;
	});
</script>

<main class={colorMode === 'dark' ? 'dark' : ''}>
	{#if ready}
		<div class="bg-white dark:bg-stone-950">
			<!-- <nav
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
			</nav> -->

			<Header bind:colorMode bind:sidebarOpen />
			<Sidebar {notes} {sidebarOpen} />

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
