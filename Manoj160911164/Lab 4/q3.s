	AREA RESET, DATA, READONLY
	EXPORT __Vectors
__Vectors
	DCD 0x40001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R2,=ANS
	LDR R0,=HEX
	MOV R4,#8
up	LDRB R1,[R0],#1
	ORR R6,R1
	ROR R6,#4
	SUBS R4,#1
	BNE up
	STR R6,[R2]
HERE B HERE
HEX DCB 0x01,0X02,0X03,0X04,0X05,0X06,0X07,0X0A
	AREA mydata, DATA, READWRITE
ANS DCD 0
 END