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
	LDR R0,[R0]
	LDR R1,=NUM2
	LDR R1,[R1]
	LDR R3,=RES
	UMULL R4,R5,R0,R1
	STR R4,[R3],#4
	STR R5,[R3]
STOP B STOP
NUM1 DCD 0X00123412
NUM2 DCD 0X70000000
	AREA mydata,DATA,READWRITE
RES DCD 0
	END