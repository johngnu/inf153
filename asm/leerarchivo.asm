; multi-segment executable file template.
macro mostrarM x
    lea dx, x
    mov ah, 9
    int 21h
endm 

data segment
    ; add your data here!
    archivo db "c:\archivo.txt", 0
    canal dw 0
    fragmento db 10 dup("$")
    limpiar db 10 dup("$")
    errorAbrir db "no se pudo abrir el archivo$"
    errorLeer db "no se pudo leer archivo$"
    enter db 10, 13, 36
    
stack segment
    dw 128 dup(0)
ends

code segment
start:
    ; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    ; add your code here
    abrir:
    lea dx, archivo
    mov ah, 3dh
    mov al, 0
    int 21h
    jc error1
    mov canal, ax    

    leer:
    mov bx, canal
    lea dx, fragmento
    mov cx, 1
    mov ah, 3fh
    int 21h
    jc error2
    cmp ax,0
    jz cerrar
    mostrarM fragmento
    lea si, fragmento
    mov cx, 10
    ciclo:
    mov [si], "$"
    inc si
    loop ciclo
    jmp leer
    error1:
    mostrarM errorAbrir
    error2:
    mostrarM errorLeer
    cerrar:
    mov bx, canal
    mov ah, 3eh
    int 21h
    .exit
    ; wait for any key....
    mov ah, 1
    int 21h
    
    mov ax, 4c00h ; exit to operating system.
    int 21h
    
ends
end start ; set entry point and stop the assembler.
