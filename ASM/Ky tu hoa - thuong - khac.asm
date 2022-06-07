.model small
.stack 0x100

.data
     kytu db ?
     str db "Nhap 1 phim: $"
     str2 db  10, 13,  "Ky tu thuong $"
     str3 db 10, 13, "Ky tu hoa $"
     str4 db 10, 13, "Khong phai ky tu$"
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
       
       jg _kytuThuong1
       
        cmp kytu, 65
       jb _KhongPhai
       
       mov ah, 0x9
       lea dx, str3
       int 21h
       
       _end:
       mov ah, 0x4c
       int 21h
       
       _kytuThuong1:
       
       cmp kytu, 122
       jg _KhongPhai
              
       mov ah, 0x9
       lea dx, str2
       int 21h
       jmp _end
       
       
       _KhongPhai:
       mov ah, 0x9
       lea dx, str4
       int 21h
       jmp _end         
        
        
    main endp     
    
    
    
    