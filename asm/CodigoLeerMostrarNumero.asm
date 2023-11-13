; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "Ingrese el numero:  $"
    enter db 10,13,"$"              
    mensajefin db "Fin del programa!!!!!$"
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

    ; add your code here
    lea dx,pkey
    mov ah,9
    int 21h
    
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
        
    mov dx,65535
    push bx
    push dx 
    
    mov ax,bx
    mov bx,0
    mov cx,0
    mov dx,0
    mov bx,10
    cicl:
        mov cx,0
        mov dx,0
        div bx
        
        mov cx,ax
        
        add dx,48
        push dx
        mov ax,cx
        mov cx,0
        cmp ax,cx
        jz finn
     jmp cicl
     finn:
     lea dx,enter
    mov ah,9
    int 21h
     
     ci:
        pop bx
        cmp bx,65535
        jz acaba
        mov ax,0
        mov ah,2
        mov dx,bx
        int 21h
     jmp ci
     
     
     
     
     acaba:
        lea dx,enter
        mov ah,9
        int 21h
           
        
        lea dx,mensajefin
        mov ah,9
        int 21h
     pop bx   
        
        
        
        
        
        
        
        
        
        
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
