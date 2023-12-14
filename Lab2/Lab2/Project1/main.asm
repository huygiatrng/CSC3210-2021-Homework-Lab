.model small
.stack 100h
.data
	
	msg1 db 10,13, 'Nhap so 1: $'
	msg2 db 10,13, 'Nhap so 2: $'
	msg3 db 10,13, 'Nhap so 3: $'

.code
	mov ax, 1
	mov ds, ax

	mov ah, 4Ch
	int 21h
END