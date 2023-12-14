.386
.model flat, stdcall
.stack 4096

ExitProcess PROTO, dwExitCode:DWORD

.data
    array DWORD 10h, 20h, 30h, 40h,50h
    sample DWORD 50h
.code

Search PROC
    ; Save a copy of the registers except EAX in the stack
    push ebx
    push esi
    push ecx    
    push edx

    ; I want to make sure array size is not empty
    cmp ecx, 0
    je NotFound ; Jump if equal to 0

    ; Our main loop
    SearchLoop:
        mov eax, [esi] ; Load array element into EAX

        cmp eax, ebx ; Compare EAX with the search item (EBX)
        je Found ; If they are equal, jump to Found

        ; Increment array pointer and decrement the item count
        add esi, edx        ; Move to the next array element
        dec ecx             ; Decrease the item count
        loop SearchLoop     ; Continue the loop

    NotFound:
        ; Set EAX to -1 for not found
        mov eax, -1
        jmp RestoreRegisters ; Jump to restore registers

    Found:
        ; do nothing

    RestoreRegisters:
        ; Re-store the items from the stack
        pop edx
        pop ecx
        pop esi
        pop ebx
    ret
    Search ENDP

main PROC

    mov ebx, sample         ; Load the sample value into EBX
    mov esi, OFFSET array   ; Load the address of the array into ESI

    mov ecx, 5              ; Number of items in the array
    mov edx, 4              ; Size of each item in the array (DWORD is 4 bytes)


    call Search             ; Call the Search procedure

    ; EAX now contains the search result (either the found item or -1)

	INVOKE ExitProcess, 0
main ENDP
END main