;Student: Gia Huy Truong
;Class: CSC3210
;Assignment#: 2 
;Description: This program will operate result = (val3 + val4) - (val1 – val2) – (30*4)/55

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
	val1 WORD 134h
	val2 WORD 139h
	val3 WORD 67h
	val4 WORD 47h
	result WORD ?
.code
main PROC
	; (val3 + val4)
	mov ax, val3
	add ax, val4

	; (val1 - val2)
	mov bx, val1
	sub bx, val2

	; (val3 + val4) - (val1 - val2)
	sub ax, bx

	; (val3 + val4) - (val1 - val2) - (30*4)/55
	sub ax, (30*4)/55

	INVOKE ExitProcess, 0
main ENDP
END main