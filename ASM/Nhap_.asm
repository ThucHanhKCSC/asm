.model small
.stack 0x100

.data
     label db 10, 13, "Hay nhap vao chuoi: $"
     
     chuoi db 10, 13, "Chuoi ban vua nhap:$"
     str db  100 dup(?), "$" 
     
     ;tbao db 10, 13, "Do dai: "
     
     
.code
    mov ax, @data                  
    mov ds, ax
    
    main proc
             
         mov ah, 0x9
         lea dx, label
         int 21h
         
         mov cx, 0
         
         _Loop:
            
            mov ah, 0x1
            int 21h   
            
            
            
            cmp al, 0xd
            je _endNhap
            
            
            inc cx
            lea bx, str
            add bx, cx
            mov [bx],  al 
            
            
            
            
            jmp _Loop
                  
                  
                  
         _endNhap:
         
         
         mov ah, 0x9
         lea dx, chuoi
         int 21h
         
         mov ah, 0x9
         lea dx, str
         int 21h
         
         ;mov ah, 0x9
         ;lea dx, tbao
         ;int 21h
         
         
         
         
         mov ah, 0x4c
         int 21h   
             
            
    main endp 
    
    
; in chuoi: 0x9 trong dx
; Nhap: 0x1 trong ax
; in 1  ky tu: 0x2 trong dl
;  