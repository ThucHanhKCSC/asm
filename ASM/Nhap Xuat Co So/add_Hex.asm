.model small

.stack 0x100

.data
     sum db ?, "$"
     
     a db ?, "$"
     b db ?, "$"
     str_a db 13, "Nhap vao so thap luc phan 8 bit a: $"
     str_b db 10, 13, "Nhap vao so thap luc phan 8 bit b: $"
     str_s db 10, 13, "Tong a + b = $"
     
     val_16 db 16                        

.code
     mov ax, @data
     mov ds, ax
     
     main proc
       
         lea bx, str_a     ;in ra chuoi nhap a
         call _inra_bx
         
  
         lea bx, a   ; nhap a
         call _nhap
         
        
         lea bx, str_b
         call _inra_bx  ; in ra chuoi nhap b
         

         lea bx, b     ; nhap b
         call _nhap
         
         
         
         lea bx, str_s  ; in ra chuoi tong
         call _inra_bx
         
         call _displaySum
         
         mov ah, 0x2
         mov dl, "h"
         int 0x21
         
         _exit:
            mov ah, 0x4c
            int 0x21
         
     main endp
     
     
     _displaySum:
        pusha
            xor ax, ax
            xor bx, bx
            
            cmp a, 87
            jb _ok
            
            
            sub a, 87
            
            _ok:
            cmp b, 87
            
            jb _ok2
            sub b, 87
            
            _ok2:
            
           
            
            _backTo:
            mov al, a
            mov bl, b
                        
            add al, bl
            cmp al, 96
            jg _more
            
            mov cx, 0
            
            _divLoop:
                inc cx
                div val_16
                push ax
                
                mov ah, 0
                cmp al, 0
                jne _divLoop
                
            _print_loop:
                xor bx, bx
                mov ah, 0x2
                pop dx
                shr dx, 8
                
                cmp dl, 9
                jg _Alphabet
                
                
                
                add dl, 0x30
                
                _con:
                int 0x21
                
                dec cx
                cmp cx, 0
                jne _print_loop
                jmp _doneLoop
                
                
                _Alphabet:
                    add dl, 55
                    jmp _con
        
        _doneLoop:
        popa
        ret
        
_more:
    sub al, 96
    jmp _divLoop     
     
     
     _inra_bx:
         mov ah, 0x9
         mov dx, bx
         int 0x21
         
         ret 
         
         
     _nhap:
        mov cx, 1
        
        _inputLoop:
            mov ah, 0x1
            int 0x21
            
            mov ah, 0
            mov [bx], al
            inc bl
            
            dec cx
            cmp cx, 0
            je _done
            
            jmp _inputLoop
            
            _done:
                ret
            
            
       