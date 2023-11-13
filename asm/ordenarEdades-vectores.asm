; multi-segment executable file template.
macro imprimeM x
    lea dx,x
    mov ah,9
    int 21h
endm

mostrar2 macro x
    mov cx,65535
    push cx
    mov ax,x
    mov bx,0
    mov cx,0
    mov dx,0
    mov bx,10
    c2:
        mov cx,0
        mov dx,0
        div bx
        mov cx,ax
        add dx,48
        push dx
        mov ax,cx
        mov cx,0
        cmp ax,cx
        jz f2
    jmp c2
    f2:
       pop bx
       cmp bx,65535
       jz ff2
       mov ax,0
       mov ah,2
       mov dx,bx
       int 21h
    jmp f2
    ff2:        
endm 


data segment
    ; add your data here!
    pkey db "press any key...$"     
    v db 0,0,0,0,0,0,0,0,0,0,0 
    w db 0,0,0,0,0,0,0,0,0,0,0
    
    enter db 10,13,36  
    num db 0 
    sum db 0    
    mensaje1 db "Nivel 1$"
    mensaje2 db "Nivel 2$"
    espacio db " $"
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
    mov si,offset v   
    mov bl,10 
    mov cx,0    
    leerVector:
        mov ah,1
        int 21h
        cmp al,13
        jz finLectura
        cmp al," "
        jz moverNumero 
        
        componerNmero:
            sub al,30h
            mov ah,0
            mov cl,al
            mov al,num
            mul bl
            add al,cl 
            mov num,al
            jmp continua 
        moverNumero:
            mov ah,0
            mov al,num 
            mov [si],al
            inc si  
            inc ch  
            mov num,0
        continua:  
        jmp leerVector   
        
    finLectura: 
    
    mov ah,0
    mov al,num 
    mov [si],al    
    mov num,0
    inc ch   
        
    imprimeM enter
    imprimeM mensaje1  
    imprimeM enter
         
    mov cl,ch
    mov ch,0 
             
    mov si,offset v 
    ciclo:
      mov ax,0
      mov bx,0 
      mov dx,0 
      mov al,[si]
      inc si
      push cx
            
      mostrar2 ax  
      imprimeM espacio
            
      pop cx
                          
      loop ciclo  
              
    fin:
       
    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.