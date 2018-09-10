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
	LDR R0,=ARR
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
stop b stop
	AREA mydata,DATA,READWRITE
ARR DCD 0
	END