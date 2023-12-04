; multi-segment executable file template.

data segment
    ; add your data here!
    nombre db "CIMAR RODRIGO MORALES, CODIGO: 527", 10, 13, "$"
    pkey db 10,13,"Programa finalizado$"
    enter db 10, 13, "$"
    vectorNumeros1 db 128 dup(0)
    vectorNumeros2 db 128 dup(0)
    vectorUnicos db 128 dup(0)
    auxContador db 0
    contador db 0
    contadorPila db 0
    contadorSinDuplicados db 0
    suma db 0
    vector db 0,0,0,0,0,0,0
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
    lea dx, nombre
    mov ah, 9
    int 21h
        
    mov ax, 0
    mov bx, 0
    mov cx, 0
    mov dx, 0
    
    
    mov si, offset vectorNumeros1
    
    leer1:
        mov ah, 1
        int 21h
        
        cmp al, 13
        jz finComponerEnter1
        cmp al, 20h
        jz finComponer1
        
        sub al, 30h    
        
        mov ah, 0
        mov bh, al
        mov bl, 10
        mov al, dl    
        componer1:
            mul bl
            add al, bh    
            mov dl, al
            jmp leer1
        finComponer1:            
            mov [si], dl
            inc si
            inc cx
            mov ax, 0
            mov bx, 0
            mov dx, 0
            jmp leer1
        finComponerEnter1:
            mov [si], dl
            inc si
            inc cx
            jmp finLeer1
    jmp leer1
    
    finLeer1:
    mov bx, 0
    
    
        
    lea dx, enter
    mov ah, 9
    int 21h    
    
    mov dx, 0
        
    mov si, offset vectorNumeros2
    
    leer2:
        mov ah, 1
        int 21h
        
        cmp al, 13
        jz finComponerEnter2
        cmp al, 20h
        jz finComponer2
        
        sub al, 30h    
        
        mov ah, 0
        mov bh, al
        mov bl, 10
        mov al, dl    
        componer2:
            mul bl
            add al, bh    
            mov dl, al
            jmp leer2
        finComponer2:            
            mov [si], dl
            inc si
            mov ax, 0
            mov bx, 0
            mov dx, 0
            jmp leer2
        finComponerEnter2:
            mov [si], dl
            inc si
            jmp finLeer2
    jmp leer2
    
    finLeer2:
    
    
    mov contador, cl 
    
    
    
    

    
    lea dx, enter
    mov ah, 9
    int 21h

    
    mov ax, 0
    mov bx, 0
    mov dx, 0
    
    mov contador, cl
    
    
    mov di, offset vectorNumeros2
    mov si, offset vectorNumeros1
    posicionar:
        mov bl, [di]
        inc di  
    loop posicionar
    
    dec di
    
    mov cl, contador
    mov dx, 0
    mov bx, 0
    multiplicar:
        mov al, [si]
        mul [di]
        add bx, ax
        inc si
        dec di
    
    loop multiplicar
    
    
    
     
    
    mov cl, 1
    mov si, offset vector
    mov [si], bl
    mostrarVector:
        mov ax, [si]
        mov ah, 0
        inc si
        mov contador, cl
        mov cl, 0 
        agregarP:
             mov dx, 0    
             mov bx, 10
             div bx
             inc cx
             mov dh, 0
             push dx
             cmp al, 0
             jz mostrarP                     
        jmp agregarP
        
        mostrarP:
            mov ah, 2
            pop dx
            mov dh, 0
            add dl, 30h
            int 21h
            
        loop mostrarP
        mov ah, 2
        mov dl, 20h
        int 21h
        mov cl, contador
        
        
    loop mostrarVector:
    
            
    lea dx, pkey
    mov ah, 9
    int 21h        ; output string at ds:dx
    
    
    
    
    
    
    ; wait for any key....    
    mov ah, 1
    int 21h
    jmp FinDelPrograma
    
    
    
    
    
    FinDelPrograma:
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
