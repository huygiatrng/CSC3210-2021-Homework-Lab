.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
	var1 dd 100d
	var2 dd 200d
	var3 dd 50d
	var4 dd ?
.code
main PROC		
	mov eax, [var1]
	mov ebx, [var2]
	mov ecx, [var3]

	; Calculate var1 * var2
	imul eax, ebx

	; Save the result temporarily
	push eax

	; Calculate var3 * 5
	imul ecx, 5

	; Retrieve the saved result (var1 * var2)
	pop eax

	; Clear EDX and calculate (var1 * var2) / (var3 * 5)
	xor edx, edx
	idiv ecx

	; Store the result in var4
	mov [var4], eax

	INVOKE ExitProcess, 0
main ENDP
END main