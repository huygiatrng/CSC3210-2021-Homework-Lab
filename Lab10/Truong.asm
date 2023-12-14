.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
	Array DWORD 10, 11, 13, 18, 21, 23, 24, 17, 45
	sum DWORD 0
.code
main PROC
	;esi point to address of array
	
	; eax as current_size = array_size because we don't use array_size more than 1
    mov eax, LENGTHOF Array

	;ebx as index
	mov ebx, 0

	;esi as size of whole array
	mov esi, SIZEOF Array

	for_loop:
		cmp eax, 0
		jna stop_for_loop
		while_loop:
			cmp ebx, esi			;check if index will now is greater than size of array
			jae stop_while_loop

			mov edx, DWORD PTR [Array + ebx]
			test edx, 00000001b

			jnz not_even
				add sum, edx
			not_even:
				add ebx, TYPE Array		;increase index by size of element in array
				jmp while_loop

		stop_while_loop:
			dec eax
	jmp for_loop
	stop_for_loop:
	INVOKE ExitProcess, 0
main ENDP
END main