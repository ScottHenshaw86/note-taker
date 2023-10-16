<script>
	import Plus from './icons/Plus.svelte';
	import Minus from './icons/Minus.svelte';

	export let block;

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
		if (size + 1 === sizes.length) return;
		size = size + 1;
	}

	function decreaseSize() {
		if (size - 1 < 0) return;
		size = size - 1;
	}
</script>

<div
	class="relative"
	on:mouseenter={() => (isHovering = true)}
	on:mouseleave={() => (isHovering = false)}
>
	{#if block.type === 'p'}
		<p class=" text-black dark:text-white text-{fontSize} p-2">
			{block.text}
		</p>
	{:else}
		<details class="p-2 pl-6 text-primary-500 text-{fontSize}">
			<summary class="-ml-6 font-bold">{block.text}</summary>
			{#each block.children as child}
				<svelte:self block={child} />
			{/each}
		</details>
	{/if}
	<div
		on:mouseenter={() => (isHovering = true)}
		on:mouseleave={() => (isHovering = false)}
		class="absolute -top-5 bg-primary-300 rounded-xl overflow-hidden text-[0px] {isHovering
			? 'opacity-1'
			: 'opacity-0'}"
	>
		<button class="px-2 py-1 hover:bg-primary-400" on:click={decreaseSize}>
			<Minus size="20" />
		</button>
		<button class="px-2 py-1 hover:bg-primary-400" on:click={increaseSize}>
			<Plus size="20" />
		</button>
	</div>
</div>
