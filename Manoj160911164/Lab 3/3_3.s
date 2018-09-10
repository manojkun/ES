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
	mov r10,#8
	mov r7,#0 ;difference
	mov r8,#32
	ldr r0,=num
	ldr r1,[r0],#4
	ldr r2,[r0]
	mov r5,#0 ; borrow
	mov r3,r1
	mov r4,r2
up	bl bcd_sub
	lsr r1,#4
	lsr r2,#4
	mov r3,r1
	mov r4,r2
	subs r10,#1
	bne up
stop b stop
bcd_sub	
	and r3,#0x0f
	and r4,#0x0f
	cmp r3,r4
	addlo r3,#0x0a
	sub r6,r3,r4
	sub r6,r5
	movlo r5,#1
	movhs r5,#0
	orr r7,r6
	ror r7,#4
	sub r8,#4
	bx lr
num dcd 0x00000012,0x00000008	
	AREA mydata,DATA,READWRITE
RES DCD 0
	END