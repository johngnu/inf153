; multi-segment executable file template.

data segment
    ; add your data here!                 
    inicio db "Ingrese el numero: ",10,13,"$"
    ingresa db "Ingrese el numero: $"
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
    
    ;----------Fin-----------------
    
    ;----------------leemos al-------------    
    mov al, 1
    int 21h
    ;-------------------fin-----------------
    
    ;---------pasa datos de al a cx--------- 
    
    mov ah,0
    sub al,48
    mov cx,ax
    ;--------------fin---------------
    
    ;------comenzamos el fibo---------
    
    mov al,0
    mov bh,1
    mov bl,0
    
    
    
    
    ciclo:
    mov bl,al
    
    
    add al,65 
    
    mov dh,0
    mov dl,al
    mov ah,2
    int 21h 
    
    mov dh,0
    mov dl,32
    mov ah,2
    int 21h  
    
    mov al,bh
    add bh,bl
    
    loop ciclo:
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
