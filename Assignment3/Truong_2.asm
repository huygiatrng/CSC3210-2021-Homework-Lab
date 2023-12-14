; Gia Huy Truong
; Class: CSC3210
; Assignment#: 3
; Description: This program is the translated of psuedo code in quesion 2

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
	var1 DWORD 10d
	var2 DWORD 11d
	var3 DWORD 12d
.code
main PROC
	; Check if var1 > var2 OR var3 < var2

	mov eax, var1   ; Move var1 to EAX
	cmp eax, var2   ; Compare EAX with var2
	jle else_block  ; Jump to else block if var1 <= var2
	mov eax, var3   ; Move var3 to EAX
	cmp eax, var2   ; Compare EAX with var2
	jge then_block  ; Jump to then block if var3 >= var2
  
	else_block:

		mov eax, var1   ; Move var1 to EAX
		sub eax, 1      ; Subtract 1 from EAX
		mov var1, eax   ; Move EAX back to var1
		mov eax, var2   ; Move var2 to EAX
		sub eax, 1      ; Subtract 1 from EAX
		mov var2, eax   ; Move EAX back to var2
		mov eax, var3   ; Move var3 to EAX
		sub eax, 1      ; Subtract 1 from EAX
		mov var3, eax   ; Move EAX back to var3
		jmp end_if      ; Jump to end of if-else block
  
	then_block:

		mov eax, var2   ; Move var2 to EAX
		add eax, var3   ; Add var3 to EAX
		mov var1, eax   ; Move EAX back to var1
		mov eax, var2   ; Move var2 to EAX
		add eax, 1      ; Add 1 to EAX
		mov var2, eax   ; Move EAX back to var2
		mov eax, var3   ; Move var3 to EAX
		add eax, 1      ; Add 1 to EAX
		mov var3, eax   ; Move EAX back to var3
  
	end_if:
	  ; End the if

	INVOKE ExitProcess, 0
main ENDP
END main