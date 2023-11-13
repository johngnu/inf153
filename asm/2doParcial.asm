; multi-segment executable file template.

data segment
    ; add your data here!
    entrada db "ENTRADA: ",10,13,"$"
    enter db 10,13,"$"
    salida db 10,13,"SALIDA: ",10,13,"$"
    v db 0
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
    mov bx, 0
    mov cx, 0        
    lectura:
        push cx
        mov dx, 0
        
        mov ah, 1
        int 21h
        
        cmp al, 13
        jz finLectura
        
        mov ah, 0
        sub al, 30h
        mov cx, 10
        
        add bx, ax
        mov ax, bx
        mul cx
        mov bx, ax
        
        pop cx
        inc cx
        jmp lectura
    finLectura:
    
    mov ax, bx
    mov bx, 10
    div bx
    
    push cx
    push ax
    
    lea dx, enter
    mov ah, 9
    int 21h
    
    pop ax
    
    mov si, offset v
    mov [si], 10
    mov cx, 66
    muestra:
        push ax
        mov dx, 0
        mov bx, ax
        mov al, v
        mov ah, 0        
        div bx
        
        mov dh, dl
        
        
        add al, 30h
        mov dl, al
        mov ah, 2
        int 21h
        
        mov al, dh
        mov ah, 0
        
        mov bx, 10
        mul bx
        mov [si], al
        pop ax
        
        loop muestra
        
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
