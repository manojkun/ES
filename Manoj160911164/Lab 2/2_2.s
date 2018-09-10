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
	LDR R1, =NUM1
	LDR R2, =NUM2
	LDR R3, =RES
	LDR R4,[R1]
	LDR R5,[R2]
	SUBS R6,R4,R5
	STR R6,[R3]
STOP B STOP
NUM1 DCD 0XF1234567
NUM2 DCD 0x12345678
	AREA mydata, DATA, READWRITE
RES DCD 0
	END