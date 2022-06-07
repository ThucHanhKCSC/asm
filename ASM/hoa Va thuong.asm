.model small
.stack 0x100

.data
                                    
    num db ?
    
.code
    mov ax, @data
    mov ds, ax
    
    main proc
        
        
        mov ah, 0x1
        int 21h
        
        mov num, al
        
        mov dl, num
        mov cx, 0

        
        _loop123:
                    
            
            inc cx
            inc dl
            
            call _inradauCach
            
            mov ah, 0x2
            int 21h
           
            
            
            cmp dl, 'z'
            
          
            je _end
            
            jmp _loop123
            
    
        _end:
            mov ah, 0x4c
            int 21h


    _inradauCach:
        pusha
                       
            mov dl, " "
            mov ah, 0x2
            int 21h
           
            
        popa    
        ret
        
    main endp