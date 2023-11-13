; multi-segment executable file template.

data segment  
    v db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0 
    enter db 10,13,36
    
    x1 db 0 
    x2 db 0
    x3 db 0
    x4 db 0
    x5 db 0
        
ends

stack segment
    dw   128  dup(0)
ends

code segment
start:

    mov ax, data
    mov ds, ax
    mov es, ax

    mov si,0
    ciclo:
        mov ax,0
        mov ah,1
        int 21h
        cmp al,13
        jz fin
        
        mov v[si],al
        inc si 
        jmp ciclo
    fin:
    
    lea dx,enter
    mov ah,9
    int 21h
    
    cmp si,6
    jc menor
    jmp sustituir 
    
    menor:        
        ; imprimir
        mov di,0
        imprimir:
            mov dl,v[di]
            mov ah,2
            int 21h
            
            inc di
            cmp si,di
            jz final
            jmp imprimir
            
    sustituir:
        dec si
        mov al,v[si]
        mov ah,0
        push ax
        
        mov ax,0
        dec si
        mov ax,si
        mov bx,10
        mov cx,0
        numero:
            mov dx,0
            div bx  
            
            add dx,30h
            push dx
            
            inc cx
            cmp ax,0
            jz mostrar
            jmp numero
            
        mostrar:
        mov bl,v[0]
        push bx
        add cx,2
        
        imprimir1:
            pop dx 
            mov ah,2
            int 21h
            loop imprimir1             
    
    final:
    
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
