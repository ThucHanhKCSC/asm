.model small

.stack 0x100

.data
    a dw 1 dup(?), "$" 
    b dw 1 dup(?), "$"
    carry db ?
    sum db 3 dup(?)
    val_10 db 10
    
    tb_a db 13, "Nhap vao a: $"
    tb_b db 10, 13, "Nhap vao b: $"
    tb_sum db 10, 13, "Tong a + b = $"
    tb_sub db 10, 13, "Hieu a - b = $"
    
     
    
    
.code                                    
   
   mov ax, @data
   mov ds, ax 
    
    main proc
        lea bx, tb_a
        call _inra_bx
        
        lea bx, a
        call _nhap
        
        lea bx, tb_b
        call _inra_bx
        
        lea bx, b
        call _nhap
        
        call _do
        
        lea bx, tb_sub
        call _inra_bx
        
        
        call _do_sub
        
        
        
        
        
        _exit:
            mov ah, 0x4c
            int 0x21
    main endp
   
                                
    
    
    _do_sub:
        xor ax, ax
        xor bx, bx
    
        mov ax, a
        mov bx, b
        
        cmp ah, bh
       
        jb _fix
        
        
        _return:
        sub ax, bx
        
        
        xor bx, bx
        mov bl, ah
        push bx
        
        xor bx, bx                     
        mov bl, al
        push bx
        
        
        mov cx, 2
        _subPrintLoop:
            
            pop dx
            add dl, 0x30
            mov ah, 0x2
            int 0x21
            
            dec cx
            cmp cx, 0
            jne _subPrintLoop
                
        
            
        
        ret
    
    
     
        _fix:
            add ah, 10
            sub al, 1
            jmp _return
            
     
     
   
    _do:
        xor ax, ax
        xor bx, bx
    
        mov ax, a
        mov bx, b
        
        
        add ax, bx
        sub al, 0x60
        sub ah, 0x60
        
        mov bh, ah
        mov ah, 0
        mul val_10
        
        ;bh: bit sau
        
        add al, bh
        mov ah, 0
        
        push ax
        
    
                 
        
        
    
        lea bx, tb_sum
        call _inra_bx 
        
        
        pop ax
        mov cx, 0
        
        _push_Loop:
            inc cx
            div val_10
            push ax
            mov ah, 0
            cmp al, 0
            jne _push_loop   
         
         
         _print_loop:
            pop dx
            shr dx, 8
            add dx, 0x30
            mov ah, 0x2
            int 0x21
            dec cx
            cmp cx, 0
            jne _print_loop  
    
        ret
   
   
   
   

    
     _inra_bx: ; usage lea bx, <value want to print>
                    ;  call _inra_bx
         mov ah, 0x9
         mov dx, bx
         int 0x21
         
         ret 
         
         
     _nhap: 
            ;usage: lea bx, <input value>
            ;       call _nhap 
            
        mov cx, 2
        
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
            
            