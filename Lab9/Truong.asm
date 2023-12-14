.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
	Array WORD 10, 2, 23, 45, 21, 11
	MAXIMUM WORD ?
.code
main PROC
    mov ebx, 0				; initialize BX to the index to point to element
    mov ecx, 5				; initialize ECX to the number of comparisions (5 times)
	mov ax, Array			; set AX as the first element

loop_index:
	inc ebx					; increse ebx
	cmp ax, [Array+ebx*2]	; compare the pointing element with dx
	jg not_larger			; skip assigning AX if the pointing element is smaller
larger:
	mov ax, [Array+ebx*2]	; re-assign AX if it pointing element is greater
not_larger:
	loop loop_index			; loop til we get enough comparision or all the element in array passed

	mov MAXIMUM, ax			; move ax into MAXIMUM variable
	INVOKE ExitProcess, 0
main ENDP
END main