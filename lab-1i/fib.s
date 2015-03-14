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

	subs r5, r0, #2 @counter for .Loop
	mov r4, #0 		@inital a0 = 0
	mov r0, #1 		@inital a1 = 1

@optimize latter
.Loop:

		@fib: f(n) = f(n-1) + f(n-2)
		@r4 = r4 + r0
	add r4, r4, r0

		@exchange r4, r0 by exclusive or
		@r4^=r0
		@r0^=r4
		@r4^=r0
	eor r4, r4, r0
	eor r0, r0, r4
	eor r4, r4, r0

		@update counter
	subs r5, r5, #1

		@loop until counter greater than upper bound
	bge .Loop

	pop {r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
