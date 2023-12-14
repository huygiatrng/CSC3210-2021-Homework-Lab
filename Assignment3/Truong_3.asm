; Gia Huy Truong
; Class: CSC3210
; Assignment#: 3
; Description: This program is the translated of psuedo code in quesion 3

.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
	sum DWORD 0
	i DWORD 0
	j DWORD 12
	var1 DWORD 3
	var2 DWORD 3
	var3 DWORD 0
.code
main PROC
    mov eax, 0         ; load i into eax
    mov ebx, 12        ; load j into ebx
    mov ecx, 3         ; load var1 into ecx
    mov edx, 3         ; load var2 into edx
    mov edi, 0         ; load var3 into edi

    for_loop:
        ; Check if i < j
        cmp eax, ebx
        jge end_for_loop

        ; if (var1 > var3) {
        cmp ecx, edi
        jle else_case

        ; var1 = var1 - i
        sub ecx, eax
        jmp end_if

    else_case:
        ; var3 = var3 + i
        add edi, eax

    end_if:
        ; Increment i
        inc eax

        ; Decrement j
        dec ebx

        ; Jump back to the beginning of the loop
        jmp for_loop

    end_for_loop:
        ;sum = var1 + var2 + var3

        add ecx, edx
        add ecx, edi
        mov [sum], ecx

        ; Exit the program

	INVOKE ExitProcess, 0
main ENDP
END main