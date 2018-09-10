	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x10001000
	DCD Reset_Handler
	ALIGN
	
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
	
Reset_Handler
	; initialising r1-r10 with values to be sorted
	mov r1,#10
	mov r2,#09
	mov r3,#03
	mov r4,#11
	mov r5,#21
	mov r6,#19
	mov r7,#12
	mov r8,#43
	mov r9,#32
	mov r10,#05
	ldr r11,=0x10000028
	stmdb r11!,{r1-r10}
	bl selection_sort
	ldm r11,{r1-r10}
stop b stop

selection_sort
	mov r0,r11
	;sub r0,#40
	mov R8,#09
up1 mov r7,r8
	mov r1,r0
up2	ldr r2,[r0]
	ldr r3,[r1,#4]!
	cmp r2,r3
	bls skip
	str r2,[r1]
	str r3,[r0]
skip
	sub r7,#1
	teq r7,#0
	bne up2
	add r0,#04
	sub r8,#1
	teq r8,#0
	bne up1
	bx lr
	END