;Nhap 2 so nhi phan 16 bit
;tinh A+B,A-B,A and B,A OR B
.model small
.stack 100
.data
    b1 dw ?
    b2 dw ?
    tb1 db 'So A 16bit: $'
    tb2 db 10, 13, 'So B 16bit: $'
    tb3 db 10, 13, 'A + B =    $'
    tb4 db 10, 13, 'A - B =     $'
    tb5 db 10, 13, 'A OR B =    $'
    tb6 db 10, 13, 'A AND B =   $'
MAIN PROC     
    
    
    mov ax, @data
    mov ds,ax
    
    mov bx, 0
    mov cx, 16
    mov ah,9           ;in ra chuoi thong bao1
    lea dx,tb1
    int 21h
    
    
    
input1:
    mov ah,1
    int 21h
    sub al,30h
    shl bx,1
    add bl,al
    loop input1       ; nhap vao chuoi 1
    mov b1, bx
    
    
    
    
    mov bx,0
    mov cx, 16
    lea dx, tb2    ;in ra chuoi thong bao 2
    mov ah,9
    int 21h   
    
    
    
    
     
input2:
    mov ah,1
    int 21h
    sub al,30h
    shl bx,1      ;nhap vao chuoi 2
    add bl, al
    Loop input2
    mov b2,bx 
    
    
    
    
    mov ah, 09
    lea dx, tb3    ;in ra chuoi thong bao 3
    int 21h
    
    
    
_carry:    
    mov bx,b2
    add bx,b1 
    
    mov cx,16
    mov dx, 30h    ;carry flag
    adc dx,0
    mov ah,2
    int 21h  
    
    
    
    
    
sum:
    mov dl,30h
    shl bx,1            ;bx: sum
    adc dl,0
    mov ah,2
    int 21h
    loop sum  
 
 
   
   
   
   
 
    
    mov ah,9
    lea dx,tb4       ;in ra chuoi thong bao 4
    int 21h
                
    mov bx,b1
    sub bx,b2
    mov cx,16
    
    
       
_sub:
    mov dl,30h
    shl bx,1
    adc dl,0
    mov ah,2
    int 21h
    loop _sub





    
    mov ah,9
    lea dx,tb5   ; in ra thong bao 5
    int 21h  
    
    mov bx,b1
    or bx,b2
    mov cx,16
    
_or:
    mov dl,30h
    shl bx,1
    adc dl,0
    mov ah,2
    int 21h
    loop _or
    
    mov ah,9
    lea dx,tb6  ; in ra thong bao 6
    int 21h
    
    
    mov bx,b1
    and bx,b2
    mov cx,16
_and:
    mov dl,30h
    shl bx,1
    adc dl,0
    mov ah,2
    int 21h
    loop _and
    
        _exit:
        mov ah,4ch
        int 21h
    main endp
end main