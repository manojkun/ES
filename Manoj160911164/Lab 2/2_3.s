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
	LDR R7, =RES
	LDR R1, =NUM1
	LDR R2, =NUM2
	MOV R0,#4 
	MOV R3,#0x20000000
	MSR XPSR,R3
up
	LDR R4,[R1], #4
	LDR R5,[R2], #4
	SBCS R6, R4, R5
	STR R6, [R7], #4
	SUB R0, #1
	TEQ R0, #0
	BNE up
	
STOP B STOP
NUM2 DCD 0x10000000,0x12345678,0x23451234,0x98765432
NUM1 DCD 0xF1111111,0XF0000000,0xD1234321,0x78931684
	AREA mydata, DATA, READWRITE
RES DCD 0
	END