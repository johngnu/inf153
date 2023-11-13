; multi-segment executable file template.

data segment
    ; add your data here!
    innumero db "Ingrese el numero: $"
    indigito db "Ingrese el digito: $"  
    se  db "Si existe $"
    ne  db "No existe $"
    
    
    enter db 10,13,"$"              
    mensajefin db "Fin del programa... $"
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
    lea dx,innumero
    mov ah,9
    int 21h

    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0   
    
    mov dx,65535    
    push dx 
    
    ciclo:
        mov ax,0                            
        mov ah,1
        int 21h         
        cmp ax,10Dh 
        jz fin
        mov ah,0
        mov bx,ax
        sub bx,48  
        push bx
        mov ax,10
        mul cx
        add ax,bx
        mov cx,ax                
        jmp ciclo
    fin:
    
    mov bx,cx
    
    lea dx,enter
    mov ah,9
    int 21h
    
    lea dx,indigito
    mov ah,9
    int 21h  
    
    mov ax,0                            
    mov ah,1
    int 21h 
    mov ah,0  
    mov cx,ax
    sub cx,48 
         
    lea dx,enter
    mov ah,9
    int 21h
    
    ci:
        pop bx
        cmp bx,65535
        jz noexiste
        ;mov ax,0
        ;mov ah,2
        cmp cx,bx
        jz existe
        jmp ci 
        
    existe:
    lea dx,se
    mov ah,9
    int 21h
    jmp acaba    
     
    noexiste:
    lea dx,ne
    mov ah,9
    int 21h
    
    acaba:
    lea dx,enter
    mov ah,9
    int 21h
           
    lea dx,mensajefin
    mov ah,9
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
