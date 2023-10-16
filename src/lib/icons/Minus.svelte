<script lang="ts">
	export let size: string = '6';
	export let color: string = 'white';
</script>

<svg
	class="svg-icon"
	aria-hidden="true"
	style="color: {color}"
	xmlns="http://www.w3.org/2000/svg"
	fill="none"
	viewBox="0 0 18 2"
	width="{size}px"
	height="{size}px"
>
	<path
		stroke="currentColor"
		stroke-linecap="round"
		stroke-linejoin="round"
		stroke-width="2"
		d="M1 1h16"
	/>
</svg>
