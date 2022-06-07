.model small
.stack 0x100

.data
     label db 10, 13, "Hay nhap vao chuoi: $", 123
     
     chuoi db 10, 13, "Chuoi ban vua nhap:$"
     str db  100 dup(?), 123, "$" 
     
     chuoi2 db 10, 13, "Chuoi chuyen het sang chu hoa:$"
     str2 db 10, 100 dup(?), "$"
     
     chuoi3 db 10, 13, "Chuoi chuyen het sang chu thuong:$"
     str3 db 10, 100 dup(?), "$"
     
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
         
         ;;;;;;;;;;;; chuoi hoa
          
          mov ah, 0x9
          lea dx, chuoi2
          int 21h
          
          pusha
             
             mov cx, 0
                lea bx, str
             
                lea dx, str2
                
             
             _loopHoa:
             
                add bx, 1
                add dx, 1          
                
                inc cx
                
                cmp [bx], 90
                jg _LaKyTuThuong
                
                _continue:
                    mov dx, bx
                    
                    cmp [bx], 0
                    je _done
                    
                    cmp [bx], 7
                    je _done
                    
                    cmp [bx], 8
                    je _done
                    
                    cmp [bx], 9
                    je _done
                    
                     cmp [bx], 10
                    je _done 
                    
                     cmp [bx], 13
                    je _done
                    
                    cmp [bx], 123
                    jne _loopHoa
                    jmp _done
                 
                _LaKyTuThuong:
                    
                    push ax
                    mov ax, [bx]
                    sub ax, 32
                        
                    mov [bx], ax
                    pop ax                    
                    jmp _continue
             
          popa
          
          _done:
            mov ah, 0x9
            lea dx, str2
            int 21h
          
         ;;;;;;;;;;;;;;;;;;;;;;
         
                    
         ;;;;;;;;;;; chuoi thuong
          
       
          
          
         ;;;;;;;;;;;;;;;;;;;;;;;
         
                  
         mov ah, 0x4c
         int 21h   
             
            
    main endp 
    
    
; in chuoi: 0x9 trong dx
; Nhap: 0x1 trong ax
; in 1  ky tu: 0x2 trong dl
;  