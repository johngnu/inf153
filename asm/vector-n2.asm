; multi-segment executable file template.

data segment
    ; add your data here!             
    pkey db "press any key...$"
    v db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
    enter db 10,13,36    
    w db 0,0,0,0,0
    x1 db 0
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
    
    ;add your code here
    mov si,0
    
    ciclo:
        mov ax,0
        mov ah,1
        int 21h
        cmp al,13
        jz fin:
        
        mov v[si],al       
        
        cmp al,61h ;a
        jz vocala
        
        cmp al,65h ;e
        jz vocale
        
        cmp al,69h ;i
        jz vocali
        
        cmp al,6Fh ;o
        jz vocalo
        
        cmp al,75h ;u
        jz vocalu
        jmp sig
        
        vocala:
            mov di,0
            add w[di],1  
            jmp sig
        
        vocale:
            mov di,1
            add w[di],1  
            jmp sig 
            
        vocali:
            mov di,2
            add w[di],1  
            jmp sig
        
        vocalo:
            mov di,3
            add w[di],1  
            jmp sig
            
        vocalu:
            mov di,4
            add w[di],1  
        
        sig:    
        
        inc si
        jmp ciclo
        
    
    
    
    fin:
    
    lea dx, enter
    mov ah,9
    int 21h
    
    cmp si,6
    jc menor
    jmp sustituir
    
    menor:
        mov dl,0
        imprimir:
            mov dl,v[si]
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
        
        mov bx,0
        mov cx,0
        mov di,0
        mayor:
            cmp bl,w[di]
            jc cambio
            jmp sec
            
            cambio:
                mov bl,w[di]
                
            sec:
            inc dl
            loop mayor
            
        mov x1,bl
        
        mov cx,0
        mov dl,0
        
        letra:
            cmp bl,w[di]
            jz buscaLetra    
            jmp sig2
            
            buscaLetra:
                cmp di,0
                jz letraA
                
                cmp di,1
                jz letraE
                
                cmp di,2
                jz letraI
                
                cmp di,3
                jz letraO
                
                cmp di,4
                jz letraU
                
                letraA:
                    mov ax,61h
                    push ax
                    jmp acabar
                    
                letraE:
                    mov ax,65h
                    push ax
                    jmp acabar
                
                letraI:
                    mov ax,69h
                    push ax
                    jmp acabar        
                    
                letraO:
                    mov ax,6Fh
                    push ax
                    jmp acabar    
                    
                letraU:
                    mov ax,75h
                    push ax
                    jmp acabar    
                    
            sig2:
                inc di
                loop letra
                                
        acabar:
            mov ax,0
            mov al,x1
            add al,30h                
            mov ah,0
            push ax       
            
            mov ax,0
            mov al,v[0]
            mov ah,0
            push ax     
            
            mov cx,4
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
