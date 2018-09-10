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
	MOV R0,#2 ; LOOP COUNTER
	MOV R3,#0
	MSR XPSR,R3 ;CLEAR FLAG
up	
	LDR R4,[R1], #4
	LDR R5,[R2], #4
	ADCS R6, R4, R5
	STR R6, [R7], #4
	SUB R0, #1
	TEQ R0, #0
	BNE up
	ADC R0, #0
	STR R0, [R7]
	
STOP B STOP
NUM1 DCD 0x10000000, 0x12345678
NUM2 DCD 0xF1111111, 0XF0000000
	AREA mydata, DATA, READWRITE
RES DCD 0
	END