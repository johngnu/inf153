; multi-segment executable file template.

data segment
    ; add your data here!
    v db 1,2,3,4,4
                   
    m1 db " Mayor $"               
    m2 db " Apariciones $"
    enter db 10,13,"$"              
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

    mov cx,5
    mov bx,0
    mov si, offset v
    ciclo:
       mov al,[si]
       cmp al,bl
       jc mayor
       mov bl,al
       mayor: 
       inc si      
    loop ciclo    
    ; mostrar el mayor   
    lea dx,m1
    mov ah,9
    int 21h
     
    mov ax,0
    mov al,bl
    add al,30h
    mov dl,al
    mov ah,2
    int 21h 
    inc si   
    
    lea dx,m2
    mov ah,9
    int 21h         
    
    mov cx,5
    mov dx,0
    mov si, offset v
    ciclo2:
       mov al,[si]
       cmp al,bl
       jc seguir
       jnz seguir
       inc dl
       seguir: 
       inc si      
    loop ciclo2    
    ; mostrar el mayor    
    mov ax,0
    mov al,dl
    add al,30h
    mov dl,al
    mov ah,2
    int 21h 
    inc si        
    

           
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends

end start ; set entry point and stop the assembler.
