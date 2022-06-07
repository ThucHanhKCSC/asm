.model small
.stack 0x100

.data
     label db 10, 13, "Hay nhap vao chuoi: $"
     
     chuoi db 10, 13, "Chuoi ban vua nhap:$"
     str db  100 dup(?), "$" 
     
     chuoiHoa db 10, 13, "Chuoi hoa: $"
     str2 db  100 dup(?), "$"
     
     
     chuoiThg db 10, 13, "Chuoi thuong: $"
     str3 db  100 dup(?), "$"
     
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
         
                                         
         
         mov ah, 0x9
         lea dx, chuoiHoa
         int 21h
            
            push cx
            
           
                
                inc cx
               
                lea bx, str
                
                _in:
                    mov ah, 0x2
                    mov dl, [bx]
                    cmp dl, 90
                    
                    jg _chuHoa
                    _back:
                    
                    
                    
                    int 21h
                    
                    inc bx
                    
                    dec cx
                    cmp cx, 0
                    jne _in
                    
                    jmp _out
                    
                    
                    _chuHoa:
                        sub dl, 32
                        jmp _back
            
            
            _out: 
            
         
        
         pop cx
            
         mov ah, 0x9
         lea dx, chuoiThg
         int 21h
         
         
             pusha
                inc cx
                lea bx, str
                
                _in2:
                    mov ah, 0x2
                    mov dl, [bx]
                    
                    cmp dl, 32
                    je _space
                    cmp dl, 97
                    
                    jb _chuThuong
                    _back2:
                    
                    
                    _space:
                    int 21h
                    
                    inc bx
                    
                    dec cx
                    cmp cx, 0
                    jne _in2
                    
                    jmp _out2
                    
                    
                    _chuthuong:
                        add dl, 32
                        jmp _back2
            popa
            
            _out2:
            
            
         mov ah, 0x4c
         int 21h
    main endp