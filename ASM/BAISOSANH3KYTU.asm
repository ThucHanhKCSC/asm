.model small

.stack 0x100

.data
    inp db ?
    str db 10, 13, "Nhap vao: $"
    mor db 10, 13, "Good morning$"
    aft db 10, 13, "Good afternoon$"
    eve db 10, 13, "Good everning$"
    
    str2 db 10, 13, "Khong co!$"
.code 
    mov ax, @data
    mov ds, ax
    
    main proc
         
        mov ah, 0x9
        lea dx, str
        int 21h
        
        mov ah, 0x1
        int 21h 
        
        mov inp, al
        
        cmp inp, 'S'
        je _Mor
        cmp inp, 's'
        je _Mor
        
        cmp inp, 'T'
        je _aft
        cmp inp, 't'
        je _aft
        
        
        cmp inp, 'C'
        je _eve
        cmp inp, 'c'
        je _eve
        
        mov ah, 0x9
        lea dx, str2
        int 21h
        
        _end:
            mov ah, 0x4c
            int 21h
            
        
        _eve:
            mov ah, 0x9
            lea dx, eve
            int 21h
            jmp _end  
        
        _aft:
            mov ah, 0x9
            lea dx, aft
            int 21h
            jmp _end 
        
            
        _Mor:
            mov ah, 0x9
            lea dx, mor
            int 21h
            jmp _end 
    main endp