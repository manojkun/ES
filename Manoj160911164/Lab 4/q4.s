	AREA RESET, DATA, READONLY ; bcd to hex
	EXPORT __Vectors
__Vectors
	DCD 0x40001000
	DCD Reset_Handler
	ALIGN
	AREA mycode, CODE, READONLY
	ENTRY
	EXPORT Reset_Handler
Reset_Handler
	LDR R0,=BCD
	LDR R0,[R0] ;R0 <- NUM
	MOV R1,R0  ;R1 <- NUM
	MOV R2,R0  ;R2 <- NUM
	AND R1,#0x0F  ;LAST DIG
	AND R2,#0xF0 	;SECOND LAST DIG
	LSR R2,#4
	MOV R4,#0x0A  ;PROD NUM
	MOV R6,#0x0A   
	MLA R5,R4,R2,R1  ;MLA
	LSR R0,#8
	MOV R8,#6
UP	
	MOV R1,R0
	AND R1,#0x0F ;NEXT DIG
	MUL R4,R4,R6  ; R4 <- A^N
	MLA R7,R4,R1,R5 ; NEW PRODUCT
	MOV R5,R7 ;PROD IN R5
	LSR R0,#4
	SUBS R8,#1
	BNE UP
	LDR R0,=ANS
	STR R5,[R0]
	
HERE B HERE
BCD DCD 0x12345678
	AREA mydata, DATA, READWRITE
ANS DCD 0, 0
 END