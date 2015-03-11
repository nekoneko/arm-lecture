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
	push {r3, r4, r5, r6, lr}

	cmp r0, #0 		@condition for 0
	ble .Zero

	cmp r0, #1 		@condition for 1
	beq .One

	mov r3, #0 		@inital a0 = 0
	mov r4, #1 		@inital a1 = 1
	mov r5, #2 		@counter for .Loop
	mov r6, r0 		@.Loop counter upper bound

@optimize latter
.Loop:

		@update counter
	add r5, r5, #1

		@fib: f(n) = f(n-1) + f(n-2)
		@r3 = r3 + r4
	add r3, r3, r4

		@exchange r3, r4 by exclusive or
		@r3^=r4
		@r4^=r3
		@r3^=r4
	eor r3, r3, r4
	eor r4, r3, r4
	eor r3, r3, r4

		@loop until counter greater than upper bound
	cmp r5, r6
	ble .Loop

	mov r0, r4
	b .Exit

.Zero:
	mov r0, #0
	b .Exit

.One:
	mov r0, #1
	b .Exit

.Exit:
	pop {r3, r4, r5, r6, pc}		@EPILOG

	@ END CODE MODIFICATION

	.size fibonacci, .-fibonacci
	.end
