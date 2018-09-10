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
	LDR R0,=arr
	ldr r1,=num
	ldr r1,[r1]
	mov r3,#0
	mov r2,#10
	mov r7,#-1
up	ldr r5,[r0]
	cmp r1,r5
	beq ext
	add r0,#4
	add r3,#1
	subs r2,#1
	bne up
ext	ldr r5,=res
	cmp r2,#00
	streq r7,[r5]
	strne r3,[r5]
stop b stop
arr dcd 10,11,12,13,14,15,16,17,18,19
num dcd 14
	AREA mydata,DATA,READWRITE
res dcd 0
	END