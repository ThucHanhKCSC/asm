.model small

.stack 0x100

.data
    tenfile db "E:/chien/chien.txt", 0
    thefile dw ?
    ok db 13, "Tao file thanh cong$"
    
.code
    mov ax, @data
    mov ds, ax
    
    main proc
        
        mov ah, 3ch
        lea dx, tenfile
        mov cx, 0
        int 0x21
        
        mov thefile, ax ; cat the file
        mov ah, 3eh ; dong tap tin
        mov bx, thefile
        int 21h
        
        jc _exit
        
        mov ah, 0x9
        lea dx, ok
        int 0x21

        
        _exit:
            mov ah, 0x4c
            int 0x21
    main endp