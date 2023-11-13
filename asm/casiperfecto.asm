; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "Ingrese el Num: $"
    
    
    np db "Es un numero perfecto$"
    nnp db "No es un numero perfecto$"   
    cnp db "Es un numero casi perfecto$"
  
    enter db 10,13,"$"
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:
; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax 
    
    
    
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
    ciclo:
        mov ax,0                            
        mov ah, 1
        int 21h
        cmp ax,10Dh 
        jz fin
        mov ah,0
        mov bx,ax
        sub bx,48 
        mov ax,10
        mul cx
        add ax,bx
        mov cx,ax
        
    jmp ciclo
    fin:
        mov bx,cx
        
    push bx
    mov cx,bx
    mov dx,0
    dec cx
    push dx
    mov dx,0  
    division:     
       mov ax,0
       mov dx,0
       mov ax,bx 
       div cx
       
       cmp dx,0
       jz suma
       jmp fin1
       
       suma:
          pop ax
          add ax,cx
       push ax
       fin1:
       
    loop division
    
    lea dx,enter
    mov ah,9
    int 21h
    
    pop dx
    pop bx
    
    cmp dx,bx    
    jz igual 
    
    inc dx
    cmp dx,bx    
    jz casi   
    
    sub dx, 2
    cmp dx,bx    
    jz casi
    
    lea dx,nnp ; no es perfecto
    mov ah,9
    int 21h
    jmp fin2
    
    casi:
        lea dx,cnp ; es numero casi perfecto
        mov ah,9
        int 21h
        jmp fin2
        
    igual:
        lea dx,np ; es numero perfecto
        mov ah,9
        int 21h
    
    fin2:
    
     
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
