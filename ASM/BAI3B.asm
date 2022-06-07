.model small
.stack 0x100

.data
    
.code
    mov ax, @data                  
    mov ds, ax    
    
    main proc
        mov cx, 0 
        mov ah, 0x2
         mov dl, 'A'
        _loop: 
                                  
        int 21h

	call _space
  
        
        inc cx
        inc dl
        cmp cl, 25
        jg _end
               
        jmp _loop
        
        _end:
        mov ah, 0x4c
        int 21h       
  
	_space:
	pusha
	mov ah, 0x0x2
	mov dl, " "
	int 21h
	popa
	ret
           
    main endp