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
	LDR R0,=num
	ldr r1,[r0]
	mov r2,#01
	bl factorial
	ldr r0,=facot
	str r2,[r0]
stop b stop
factorial
	cmp r1,#1
	bxeq lr
	push {r1}
	push {lr}
	sub r1,#01
	bl factorial
	pop	{lr}
	pop	{r1}
	mul r2,r2,r1
	bx lr
num	dcd 5
	AREA mydata,DATA,READWRITE
facot DCD 0
	END