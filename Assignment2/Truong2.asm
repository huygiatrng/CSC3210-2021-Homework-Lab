;Student: Gia Huy Truong
;Class: CSC3210
;Assignment#: 2 
;Description: This program will operate ECX = –(val3 - val1) + (-val4 + val2) + 3

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
	val1 WORD 12d
	val2 DWORD 9d
	val3 BYTE 2d
	val4 BYTE 20d
.code
main PROC
	;-(val3-val1)
	movzx eax, val3
	movzx ebx, val1
	sub eax, ebx
	neg eax

	;(-val4+val2)
	movzx ebx, val4
	neg ebx
	mov ecx, val2
	add ebx, ecx

	;-(val3-val1) + (-val4+val2) + 3
	add eax, ebx
	add eax, 3

	;move result into ecx
	mov ecx, eax
	INVOKE ExitProcess, 0
main ENDP
END main