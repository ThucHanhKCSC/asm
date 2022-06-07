;Nhap vao ban phim 1 ky tu
;hien thi ma ascii cua no o dang Hex, Dec, Bin
.model small
.stack 100
.data
     muoi db 10 
     xuong db 10,13,'$'
     b1 db ?  
     chia16 db 16
.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov ah,1
    int 21h
    mov b1,al
    lea dx, xuong
    mov ah,9
    int 21h
    
    mov ax,0
    mov al,b1
    xor cx,cx
Lap1:
    xor dx,dx
    div chia16
    cmp ah,9
    ja chucai
    add ah,30h  
    jmp so
    chucai:  
    add ah,55   
    so:
    mov dl, ah
    push dx
    inc cx
    xor ah,ah
    cmp ax,0
    jne Lap1
    Hienthi:
        pop dx
        mov ah,2
        int 21h
        loop hienthi  
    mov dx,'h'
    mov ah,2 
    int 21h
    
    lea dx,xuong
    mov ah,9
    int 21h 
    
    xor ah,ah
    mov al,b1
    xor cx,cx     
Lapchia:                                
        xor dx,dx  
        div muoi      
        
        add ah,30h     
        mov dl,ah  
        push dx     
        inc cx        
        xor ah,ah     
        cmp ax,0   
        jne Lapchia
        
Dochienthi:       
        pop dx    
        mov ah,2
        int 21h
        loop Dochienthi  
        
        lea dx,xuong
        mov ah,9
        int 21h 
        xor bx,bx
        mov bl,b1
        mov cx,8
Lap4:
    mov dl,30h
    shl bl,1
    adc dl,0
    mov ah,2
    int 21h
    loop Lap4
    mov dl,'b'
    mov ah,2
    int 21h
    
    mov ah,4Ch
    int 21h
    main endp
end main