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
	MLA R1,R0,R0,R0
	LSR R1,#1
	LDR R2,=RES
	STR R1,[R2]
STOP B STOP
NUM1 DCD 25
	AREA mydata,DATA,READWRITE
RES DCD 0
	END