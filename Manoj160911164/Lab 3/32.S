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
	LDR R0,=NUM1
	LDR R1,=NUM2
	LDR R3,=RES
	MOV R9,#32
	LDR R0,[R0]
	LDR R1,[R1]
	BL mul_add
BACK BL div
	CMP R4,#0
	BNE BACK
	LSR R6,R9
	STR R6,[R3]
STOP B STOP
NUM1 DCD 23
NUM2 DCD 2
div mov r5,#0;quotient
up	cmp r4,#10
	blo down
	sub r4,#10
	add r5,#1
	b up
down
	orr r6,r4
	ror r6,#4
	sub r9,#4
	mov r4,r5
	bx lr

mul_add
	mov r4,#0
up2	adds r4,r1
	adc r7,#0
	subs r0,#1
	bne up2
	bx lr
	AREA mydata,DATA,READWRITE
RES DCD 0
	END