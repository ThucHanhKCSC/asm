.model small

.stack 0x100

.data
     n dw ?
     str db 13, "Nhap vao so tu nhien n < 8: $"
     err db 10, 13, "Vui long nhap so tu nhien < 8$"
     

     ketQua db 10, 13, "Ket qua = $"
     val_10 dw 10
     
.code
      mov ax, @data
      mov ds, ax
      
      
    main proc
           
        mov ah, 0x9
        lea dx, str
        int 0x21
        
        mov ah, 0x1
        int 0x21
        
        cmp al, "8"
        jg _error
        
        
        mov ah, 0
        sub al, 0x30
        mov n, ax
        
        mov ax, 1
        _begin:
 
            mul n
            dec n
            cmp n, 0
            jg _begin
         
        mov n, ax
       
        mov ah, 0x9
        lea dx, ketQua
        int 0x21
        
        mov ax, n                                       
        mov cx, 0
        
        _pushLoop:
            inc cx
            xor dx, dx
            div val_10    
            add dx, 0x30
            push dx
            
            cmp al, 0
            jne _pushLoop
         
         
         
         
         
         
         
        _printLoop:
            pop dx
            mov ah, 0x2
            int 0x21
            
            dec cx
            cmp cx, 0
            jne _printLoop
        
        
        _exit:
            mov ah, 0x4c
            int 0x21
            
        _error:
            mov ah, 0x9
            lea dx, err
            int 0x21
            jmp _exit
            
    main endp