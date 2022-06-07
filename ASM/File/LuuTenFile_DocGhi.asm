.model small

.stack 0x100

.data
        
    input db 13, "Nhap vao ten file: $"
    inputFile db 10, 13, "Nhap vao noi dung muon ghi len file: $"
    len db ?
    
    msg db 10, 13, "Noi dung doc duoc trong file: $"
    
    tenfile db "E:/chien/", 30 dup(?), 0
    
    noiDungGhi db 100 dup(?)
    lenNoidungGhi db ?

    
    noiDungDoc db 100 dup("$")
    
    thefile dw ?
    ok db 10, 13, "Tao file thanh cong $"
                                         
.code
    mov ax, @data
    mov ds, ax
    
    main proc
        
        mov ah, 0x9
        lea dx, input
        int 0x21
        
        
        
        lea bx, tenfile
        add bx, 9
        _loop:
            mov ah, 0x1
            int 0x21
            
            
            
            cmp al, 0xd
            je _out
            mov [bx], al
            inc bx
            jmp _loop
            
            
        _out:
                
        mov ah, 3ch
        lea dx, tenfile
        mov cx, 0
        int 0x21
        
        mov thefile, ax ; cat the file
        
        
        
        mov ah, 0x9
        lea dx, inputFile  ; "Nhap vao noi dung ghi len file"
        int 0x21
        
        mov len, 0
        lea bx, noiDungGhi
       
        _loopInput:                   ;nhap
            inc len
            mov ah, 0x1
            int 0x21
            
            cmp al, 0xd
            je _doneInput
            
            mov [bx], al
            inc bx
            jmp _loopInput  
          
          
          
        
        _doneInput:
        
        mov ah, 40h ; ghi file
        mov bx, thefile
        xor cx, cx
        mov cl, len
        lea dx, noiDungGhi
        int 0x21

        mov ah, 3eh ; dong tap tin
        mov bx, thefile
        int 21h
      
        
        
        mov ah, 3dh ; mo tap tin da co
        lea dx, tenfile
        mov al, 2 ; thuoc tinh tap tin
        int 21h
       
       
       
        mov thefile, ax ; cat the file
        mov ah, 3fh ; doc noi dung file vao vung dem
        mov bx, thefile
        lea dx, noiDungDoc
        mov cl, 250 ; so byte can doc tu file da mo
        int 21h
        
        
        mov ah, 3eh ; dong tap tin
        mov bx, thefile
        int 21h
        
        jc _exit
        
        mov ah, 0x9
        lea dx, ok
        int 0x21
        
        
        mov ah, 0x9
        lea dx, msg
        int 0x21
        
        mov ah, 0x9
        lea dx, noiDungDoc
        int 0x21
        
        
        
        
        _exit:
            mov ah, 0x4c
            int 0x21
    main endp