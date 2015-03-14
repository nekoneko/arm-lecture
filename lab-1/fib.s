	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG

	cmp r0, #0
	itt le
	movle r0, #0
	bxle lr

	cmp r0, #1
	it eq
	bxeq lr

	push {r4, r5, lr}

	@ R4 = R0 - 0 (update flags)
	subs 	r4, r0, #0

	@ R0 = R4 - 1
	@ Recursive call to fibonacci with R4 - 1 as parameter
	sub 	r0, r4, #1
	bl 		fibonacci

	@ R5 = R0
	@ R0 = R4 - 2
	@ Recursive call to fibonacci with R4 - 2 as parameter
	mov 	r5, r0
	sub 	r0, r4, #2
	bl 		fibonacci

	@ R0 = R5 + R0 (update flags)
	adds 	r0, r0, r5

	pop {r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
