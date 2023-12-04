salta macro x
    lea dx,enter
    mov ah,9
    int 21h    
endm

data segment
    ; add your data here!
    enter db 10,13,"$" 
    espacio db " $"
    ea db "Equipo A: $"
    eb db "Equipo B: $" 
    em db "Empates $"
    ga db "Gana A $"
    gb db "Gana B $"
    v db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    a db 0,0,0,0,0,0,0,0,0,0,0
    b db 0,0,0,0,0,0,0,0,0,0,0
    num dw 0              
    sw dw 0
    suma dw 0
    sumb dw 0
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
    
    call leeVec
    
    salta 0 
    
    ; ordenamiento
    mov si,offset v
    c1:
        mov di,si
        inc di
        c2:
            mov bl,[si]
            mov bh,[di] 
            cmp bl,bh
            jc cambiar1
            jmp continuar1
            
            cambiar1:
                mov [si],bh
                mov [di],bl
            continuar1:
                inc di
                cmp [di],0
                jz sigE1
                jmp c2
        sigE1: 
            add si,2
            cmp [si],0
            jz finO1
            dec si
            jmp c1
    finO1:
    
    ;---------muestra el vector 
    
    lea dx,ea
    mov ah,9
    int 21h
    salta 0 
     
    mov si,offset v      
    mov cx,num
    mossa:
         mov ax,[si]
         mov ah,0
         cmp sw,0
         jz muestraa
         dec sw
         jmp seguira
         
         muestraa:   
         add suma,ax 
         call mostrarN
         inc sw
         
         
         seguira:
         inc si
    loop mossa
             
    salta 0                 
    lea dx,eb
    mov ah,9
    int 21h
    salta 0 
              
    mov sw,0          
    mov si,offset v      
    mov cx,num
    mossb:
         mov ax,[si]
         mov ah,0
         cmp sw,1
         jz muestrab
         inc sw
         jmp seguirb
         
         muestrab: 
         add sumb,ax
         call mostrarN
         dec sw
          
         seguirb:
         inc si
    loop mossb   
    
    salta 0
    ;add sumb,3
    mov ax,0
    mov bx,0
    mov ax,suma
    mov bx,sumb
    cmp ax,bx
    jz empate
    jnz ganaa   
    jc ganab
    jmp terminar
    
    ganaa:
    lea dx,ga
    mov ah,9
    int 21h
    jmp terminar
    
    ganab:
    lea dx,gb
    mov ah,9
    int 21h     
    jmp terminar
    
    empate:
    lea dx,em
    mov ah,9
    int 21h
        
    terminar: 
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

; procedimientos 
proc leeVec
    mov si,offset v
    mov ax,0
    mov bx,0
    mov cx,0
    mov dx,0
    lec:
        mov ax,0                            
        mov ah,1
        int 21h
        cmp ax,10Dh 
        jz fin
        mov ah,0
        sub ax,48
        ;---elvalor esta en ax---
        cmp ax,65520
        jz otro
        ;----espacio--
        mov bx,ax
        mov ax,10
        mul cx
        add ax,bx
        mov cx,ax
        jmp fif
        ;-------------------------
        otro:
            mov [si],cx
            inc si
            mov cx,0
            inc num
        fif:    
        
    jmp lec
    fin: 
        mov [si],cx
        inc num
        mov ax,0
        mov bx,0
        mov cx,0
        mov dx,0
    ret
endp

proc mostrarN 
    push bx
    push dx
    push cx
    mov cx,65535
    push cx
    mov bx,0
    mov cx,0
    mov dx,0
    mov bx,10
    cc1:
        mov cx,0
        mov dx,0
        div bx
        mov cx,ax
        add dx,48
        push dx
        mov ax,cx
        mov cx,0
        cmp ax,cx
        jz f1
    jmp cc1
    f1:
       pop bx
       cmp bx,65535
       jz ff1
       mov ax,0
       mov ah,2
       mov dx,bx
       int 21h
    jmp f1
    ff1:  
    pop cx
    pop dx
    pop bx
    lea dx,espacio
    mov ah,9
    int 21h
    ret
endp


end start ; set entry point and stop the assembler.

