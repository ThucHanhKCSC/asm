.model small

.stack 0x100

.data

     str db 10, 13, "Nhap vao ky tu: $"
     str2 db 10, 13, "Ky tu chuyen sang bin ASCII: $"
     buffer db 8 dup(48), "$"
    
     str3 db 10, 13, "MA ASCII DANG HEX: $"
     hexbuffer db 2 dup(?), "$"
     
     
     str4 db 10, 13, "Ma ASCII dang Dec: $"
     decbuffer db 100 dup(?), "$"
                     
     num db 2
     val  db ?, "$"
     val2 db ?, "$"
     val3 db ?, "$"
     val_10 db 10
     val_16 db 16 
.code
                                                  
                                                 
    mov ax, @data
    mov ds, ax
    
    main proc
         

         
          
         mov ah, 0x1
         int 21h
         
         mov val, al
         mov val2, al
         mov val3, al
         
         
         xor ax, ax
         
         lea bx, buffer
         mov al, val
         add bx, 8   
            _loop:                            
               
                mov ah, 0
                div num
                                
                sub bx, 1
                mov [bx], ah
                add [bx], 0x30
                
                cmp al, 0
                jne _loop
                
         
         
         mov ah, 0x9
         lea dx, str2
         int 21h
         
         mov ah, 0x9
         lea dx, buffer
         int 0x21
         
         mov ah, 0x2
         mov dl, 'b'
         int 0x21  
         
         
         
         mov ah, 0x9
         lea dx, str4
         int 0x21
         
         ;val2: data
         
         
         xor cx, cx
         mov cl, val2
         
         mov ax, cx
         mov cx, 0
         
         _decLoop:
            mov ah, 0
            div val_10
            
           
            
            xor dx, dx
            mov dl, ah
         
            push dx
            
            inc cx
            cmp al, 0
            jne _decLoop
            
            
            _printLoop:
                xor dx, dx
                pop dx
                add dx, 0x30
                mov ah, 0x2
                int 21h
                
                dec cx
                cmp cx, 0
                jne _printLoop
        
         
         mov ah, 0x9
         lea dx, str3
         int 0x21         
         
         ;val3: data
         
         xor cx, cx
         mov cl, val3
         
         mov ax, cx
         mov cx, 0
         
         _HexLoop:
            mov ah, 0
            div val_16
            
            xor dx, dx
            mov dl, ah
            
            push dx
            inc cx
            cmp al, 0
            
            jne _HexLoop
            
            _printHex:
                xor dx, dx
                pop dx
                add dx, 0x30
                mov ah, 0x2
                int 21h
                
                dec cx
                cmp cx, 0
                jne _printHex
            
          
          
          mov dl, "h"
          mov ah, 0x2
          int 0x21
             
         _exit:
            mov ah, 0x4c
            int 0x21
    main endp
    