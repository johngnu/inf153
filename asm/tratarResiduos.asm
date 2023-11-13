; multi-segment executable file template.

data segment
    ; add your data here!
    entrada db "ENTRADA: ", 10, 13, "$"
    v db 0,0,0,0,0,0,0,0,0
    salida db 10, 13, "SALIDA: ", 10, 13, "$"
    digitos db 0,0,0,0,0,0,0,0,0,0     
    nivel2 db 10, 13, "NIVEL 2: ", 10, 13, "$"
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

    ;****************************************
    
        
   
    ;****************************************
    ; NIVEL 1: TRATAR LOS RESIDUOS   
            
    lea dx, entrada
    mov ah, 9
    int 21h 
    
    ; wait for any key....
    mov cx, 0
    mov si, offset v
    lecturaDatos:    
        mov ah, 1
        int 21h
        
         
         
        cmp al, 32
        jz lecturaDatos
        
        cmp al, 13
        jz finLectura
        
        sub al, 30h
        mov [si], al
        
        inc cx
        cmp cx, 9
        jz finLectura
        
        inc si
        jmp lecturaDatos
    finLectura:
    mov [si], 13
    
    push cx
    
    mov di, offset digitos
    mov si, offset v
    mov ax, 0
    mov ah, [si]
    mov bx, 0
    dec cx
    dividir:
        push bx
        mov bx, 0
        mov dx, 0
        inc si
        mov al, [si]
        cmp ah, al
        jc menor
        jmp mayor
        menor:
            mov bl, ah
            mov ch, al
            jmp divi    
        mayor:
            mov bl, al
            mov ch, al
            mov al, ah
        
        divi: 
        mov ah, 0
        div bx
        
        mov [di], dl
        
        pop bx
        inc bx
        
        inc di
        mov ah, ch
        mov ch, 0
        loop dividir
    
    ; NIVEL 2: SUMAR LOS DIGITOS DE LA ANTERIOR SALIDA
    lea dx, salida
    mov ah, 9
    int 21h
    mov di, offset digitos
    mov ax, 0
    push bx  
    
    mov cx, bx
    mov bx, 0
    mostrar:
        mov al, [di]
        add bl, al
        add al, 30h
        mov dl, al
        mov ah, 2
        int 21h
        
        inc di
        loop mostrar
    
    lea dx, nivel2
    mov ah, 9
    int 21h
    
    
    ;***********************************
    cmp bx, 9
    jc mostrarSuma
    jmp mostrarSumaC
        
    mostrarSuma:
        add bl, 30h
        mov dl, bl
        mov ah, 2
        int 21h 
        jmp finPrograma
        
    mostrarSumaC:  
    mov ax, bx
    mov bx, 10
    push 36
    descomponer:
        mov dx, 0
        div bx
        push dx
        cmp ax, 0
        jz finD
        jmp descomponer
    
    mov ax, 0
        
    finD:
        mov dx, 0
        pop ax
            
        cmp ax, 36
        jz finPrograma:
            
        add ax, 30h
            
        mov dl, al
        mov ah, 2
        int 21h
            
        jmp finD
    finPrograma:
        
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.