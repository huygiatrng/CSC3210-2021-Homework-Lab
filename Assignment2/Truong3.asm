;Student: Gia Huy Truong
;Class: CSC3210
;Assignment#: 2 
;Description: This program will operate with z array

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
	z DWORD 3 DUP(?)
	x WORD 10
	y WORD 15
	r WORD 4
.code
main PROC
	; x + y + r
	movzx eax, x
	movzx ebx, y
	add eax, ebx
	movzx ebx, r
	add eax, ebx
	mov z, eax

	;z0+(y-r)
	movzx eax, y
	movzx ebx, r
	sub eax, ebx
	add eax, [z]
	mov [z+4], eax

	;z0+(z1+y)
	movzx eax, y
	add eax, [z+4]
	add eax, [z]
	mov [z+8], eax
	INVOKE ExitProcess, 0
main ENDP
END main