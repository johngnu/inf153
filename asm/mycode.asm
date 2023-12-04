; multi-segment executable file template.

data segment
    ; add your data here!
    pkey db "press any key...$" 
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
        
        cmp al,77
        jz lm
        
        cmp al,85
        jz lu
        
        cmp al,82
        jz lr
        
        cmp al,67
        jz lc        
        
        cmp al,73
        jz li
        
        cmp al,69
        jz le
        
        cmp al,76
        jz ll
        
        cmp al,65
        jz la
        
        cmp al,71
        jz lg
        
        cmp al,79
        jz lo
        jmp normal 
        
        lm:
         mov v[si],49
         jmp sig 
        lu:
         mov v[si],50
         jmp sig
        lr:
         mov v[si],51
         jmp sig
        lc:
         mov v[si],52
         jmp sig
        li:
         mov v[si],53
         jmp sig      
        le:
         mov v[si],54
         jmp sig
        ll:
         mov v[si],55
         jmp sig  
        la:
         mov v[si],56
         jmp sig 
        lg:
         mov v[si],57
         jmp sig 
        lo:
         mov v[si],48
         jmp sig 
         
                                                 
        normal:              
        mov v[si],al
        
        sig:
        inc si 
        jmp ciclo
    
    fin:
    
    lea dx,enter
    mov ah,9
    int 21h
    
    mov di,0
        imprimir:
            mov dl,v[di]
            mov ah,2
            int 21h
            
            inc di
            cmp si,di
            jz final
            jmp imprimir     
            
            
    final:
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.

