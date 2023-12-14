; Gia Huy Truong
; Class: CSC3210
; Assignment#: 3
; Description: This program will calculate sum of 4 bytes in dVal which is 32 bit variable


.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
	dVal DWORD 04080102h
.code
main PROC
	mov esi, OFFSET dVal
	mov al, 0			; set al to zero
	mov ecx, 4

	loop_begin:	
		add al, [esi]	; keep adding al the value of esi
		inc esi
		loop loop_begin ; loop til we pointed all 4 bytes

	INVOKE ExitProcess, 0
main ENDP
END main