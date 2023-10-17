<script>
	import { enhance } from '$app/forms';
	import Plus from './icons/Plus.svelte';
	import Minus from './icons/Minus.svelte';

	export let block;
	console.log('BLOCK noteBlok.svelte - ', block);

	const sizes = [
		'xs',
		'sm',
		'base',
		'lg',
		'xl',
		'2xl',
		'3xl',
		'4xl',
		'5xl',
		'6xl',
		'7xl',
		'8xl',
		'9xl',
	];

	let isHovering = false;
	$: size = sizes.indexOf(block.size);
	$: fontSize = sizes[size];

	function increaseSize() {
		if (size + 1 === sizes.length) return null;
		size = size + 1;
		return sizes[size];
	}

	function decreaseSize() {
		if (size - 1 < 0) return null;
		size = size - 1;
		return sizes[size];
	}
</script>

<div
	class="relative"
	on:mouseenter={() => (isHovering = true)}
	on:mouseleave={() => (isHovering = false)}
>
	{#if block.type === 'p'}
		<p class=" text-black dark:text-white text-{fontSize} p-2">
			{block.content}
		</p>
	{:else if block.type === 'dropdown'}
		<details class="p-2 pl-6 text-primary-500 text-{fontSize}">
			<summary class="-ml-6 font-bold">{block.content}</summary>
			<!-- {#each block.children as child}
				<svelte:self block={child} />
			{/each} -->
		</details>
	{/if}
	<div
		on:mouseenter={() => (isHovering = true)}
		on:mouseleave={() => (isHovering = false)}
		class="absolute flex -top-5 bg-primary-300 rounded-xl overflow-hidden text-[0px] {isHovering
			? 'opacity-1'
			: 'opacity-0'}"
	>
		<form
			action="?/updateBlockSize"
			method="POST"
			use:enhance={({ data, cancel }) => {
				const newSize = decreaseSize();
				if (!newSize) cancel();

				data.append('newSize', newSize);
				data.append('blockId', block.id);

				return async ({ result, update }) => {
					console.log('Request finished');
					// `result` is an `ActionResult` object
					// `update` is a function which triggers the default logic that would be triggered if this callback wasn't set
				};
			}}
		>
			<button class="px-2 py-1 hover:bg-primary-400">
				<Minus size="20" />
			</button>
		</form>

		<form
			action="?/updateBlockSize"
			method="POST"
			use:enhance={({ data, cancel }) => {
				const newSize = increaseSize();
				if (!newSize) cancel();

				data.append('newSize', newSize);
				data.append('blockId', block.id);

				return async ({ result, update }) => {
					console.log('Request finished');
					// `result` is an `ActionResult` object
					// `update` is a function which triggers the default logic that would be triggered if this callback wasn't set
				};
			}}
		>
			<button class="px-2 py-1 hover:bg-primary-400">
				<Plus size="20" />
			</button>
		</form>
	</div>
</div>
