	AREA RESET,DATA,READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x40001000
	DCD Reset_Handler
	ALIGN
	AREA mycode,CODE,READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=SRC
	LDR R1,=DST
	MOV R3,#10
	
up	LDR R2,[R0],#4
	STR R2,[R1],#4
	SUB R3,#1
	TEQ R3,#0
	BNE up
STOP B STOP
SRC DCD 0x12345678,-1,20,34,45,56,78,90,12,34
	AREA mydata,DATA,READWRITE
dummy space 10	
DST DCD 0
	END