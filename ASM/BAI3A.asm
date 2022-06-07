.model small
.stack 0x100

.data
     kytu db ?
     str db "Nhap 1 phim: $"
     str2 db  10, 13,  "Ky tu thuong $"
     str3 db 10, 13, "Ky tu hoa $"
.code
    mov ax, @data                  
    mov ds, ax
    
    main proc
       
       mov ah, 0x9
       lea dx, str
       int 21h
       
       
       mov ah, 0x1
       int 21h
       
       mov kytu, al
       cmp kytu, 90
       
       jg _kytuHoa
       
       mov ah, 0x9
       lea dx, str3
       int 21h
       
       _end:
       mov ah, 0x4c
       int 21h
       
       _kytuHoa:
       mov ah, 0x9
       lea dx, str2
       int 21h
       jmp _end         
        
        
    main endp     
    
    
    
    