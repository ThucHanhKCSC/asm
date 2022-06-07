.model small

.stack 0x100

.data
    msg1 db "Nhap vao so nhi phan 8bit: $"
    msg2 db 10, 13, "So nhi phan da nhap la:$"
    binary db 100 dup(?), "$"
    binary2 db 10, "test", "$"
    
.code
       
    main proc
        mov ax, @data
        mov ds, ax
        

        lea bx, msg1
        call _displayText
 
        
      
        
        call _inputBin
        
            
        
        lea bx, msg2
        call _displayText                    
        
        lea bx, binary
        call _displayText
        
        _exit:
            mov ah, 0x4c
            int 21h 
         
    main endp
    
        _displayText:
         
            mov ah, 0x9
            mov dx, bx               
            int 21h
 
            ret
         
                                    
        _inputBin:
        
        
            mov cx, 0                                                                
            lea bx, binary 
            
            _nhap:
                mov ah, 0x1
                int 21h
                
                cmp al, 0xd
                je _DoneInput
                add bx, 1               
                mov [bx], al
               
                inc cx
                
                
                jmp _nhap
                
                _doneInput:
                    ;mov [bx], al 
            
             ret     