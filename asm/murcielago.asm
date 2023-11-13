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
        
        cmp al,48
        jz lm
        
        cmp al,49
        jz lu
        
        cmp al,50
        jz lr
        
        cmp al,51
        jz lc        
        
        cmp al,52
        jz li
        
        cmp al,53
        jz le
        
        cmp al,54
        jz ll
        
        cmp al,55
        jz la
        
        cmp al,56
        jz lg
        
        cmp al,57
        jz lo
        jmp normal 
        
        lm:
         mov v[si],77
         jmp sig 
        lu:
         mov v[si],85
         jmp sig
        lr:
         mov v[si],82
         jmp sig
        lc:
         mov v[si],67
         jmp sig
        li:
         mov v[si],73
         jmp sig      
        le:
         mov v[si],69
         jmp sig
        ll:
         mov v[si],76
         jmp sig  
        la:
         mov v[si],65
         jmp sig 
        lg:
         mov v[si],71
         jmp sig 
        lo:
         mov v[si],79
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