                                                           ;exercicio da prova 3 de arquitetura de computadores
 ;com o objetivo de efetuar 4 subrotinas
 ;  procurar palavra em uma string
 ;  procurar palavra ao contrario em uma string
 ;  procurar uma palavra na vertical em uma string
 ;  procurar uma palavra na vertical, ao contrario
 
                                                                                                                                   include "emu8086.inc"
tamanho equ 9 ; incluir null
tamanho1 equ 30
org 100h  

DEFINE_GET_STRING 
DEFINE_PRINT_STRING     



;CALL PROCURARPALAVRA
;CALL PROCURARPALAVRAMANGA
;CALL PROCURAVERTICAL   
;CALL PROCURAVERTICALMANGA
 
;CALL PROCURADIAGONAL
;CALL PROCURARDIAGONALMANGA
;CALL IMPRIMEDB
CALL imprimirpalavradiagonal

jmp $



PROCURARPALAVRA:
PUSH AX
PUSH BX
PUSH CX
PUSH DX
PUSH DI
PUSH SI
PUSHF




;ENDERECO DA STRING
MOV DI, offset MIGUEL   
;TAMANHO DA STRING
MOV DX, tamanho          
call GET_STRING          
call pula_linha

;ENDERECO DA STRING                                                          
;MOV DI, offset cacapalavra   
;TAMANHO DA STRING
;MOV DX, tamanho1          
;call GET_STRING          
        
MOV DI,offset miguel      
MOV SI,offset cacapalavra
inc SI 
mov ch,[di]
mov cl,[si]      

COMPARASTRING:
cmp ch,cl

je palavraigual

inc SI
mov cl,[SI]
mov DI,offset miguel
mov ch,[di]

cmp cl,0
je IMPRIMIRNAOENCONTRA

jmp comparastring


PALAVRAIGUAL:
inc SI
inc DI
mov ch,[DI]
mov cl,[SI] 
cmp ch,0
je IMPRIMIRENCONTRA

jmp comparastring


IMPRIMIRENCONTRA:
CALL PULA_LINHA 
MOV SI, offset mens8
call PRINT_STRING
mov SI,offset MIGUEL
call PRINT_STRING  
mov SI, offset mens9 
call PRINT_STRING
CALL PULA_LINHA
CALL imprimedb




POPF
POP SI
POP DI
POP DX
POP CX
POP BX 
POP AX
ret 

IMPRIMIRNAOENCONTRA:
CALL PULA_LINHA 
MOV SI, offset mens8
call PRINT_STRING
mov SI,offset MIGUEL
call PRINT_STRING  
mov SI, offset mens19 
call PRINT_STRING
mov SI, offset cacapalavra
inc SI
call PRINT_STRING

POPF
POP SI
POP DI
POP DX
POP CX
POP BX 
POP AX
ret 


PROCURARPALAVRAMANGA:
PUSH AX
PUSH BX
PUSH CX
PUSH DX
PUSH DI
PUSH SI
PUSHF

MOV DI,offset miguel      
MOV SI,offset cacapalavra
push di
pushf

jmp PERCORRERSI
ENCONTREISI:
DEC SI
COMPARASTRINGMANGA:
mov ch,[di]
mov cl,[si]

cmp ch,cl

je palavraigualmanga  
 
dec si
mov cl,[si]
mov di,offset miguel
mov ch,[di]



cmp cl,0
je IMPRIMIRNAOENCONTRA
JMP COMPARASTRINGMANGA



jmp PROCURARPALAVRAMANGA




PALAVRAIGUALMANGA:
INC DI
dec SI
mov ch,[di]
mov cl,[si]
cmp ch,0
je IMPRIMIRENCONTRA


JMP COMPARASTRINGMANGA




;13/10
PULA_LINHA:                       
pushf
push ax
push dx
MOV AH,2  ; socorro, destruiram ax
MOV DL,13          
INT 21H
MOV AH,2  ; socorro, destruiram ax
MOV DL,10
INT 21H
pop dx          
pop ax
popf
RET            

PERCORRERSI:


INC SI
MOV CH,[SI]

cmp ch,0


jne percorrersi


POPF
POP DI 
jmp encontreisi



PROCURAVERTICAL: 
PUSH AX
PUSH BX
PUSH CX
PUSH DX
PUSH DI
PUSH SI
PUSHF
MOV SI,OFFSET MIGUEL
MOV DI,OFFSET INICIO_A
INC DI
mov ch,[di]
mov cl,[si]   
PALAVRAVERTICAL:
cmp ch,cl
je VERTICALIGUAL
cmp ch,0
je IMPRIMIRNAOENCONTRA
MOV SI,OFFSET MIGUEL
mov cl,[si]
INC DI
mov ch,[di]
jmp PALAVRAVERTICAL


VERTICALIGUAL:
INC SI
MOV BX,DI   
ADD DI,42
mov ch,[di]
mov cl,[si]
cmp ch,cl
je VERTICALIGUAL
cmp cl,0
je imprimirencontra
MOV DI,BX   
jmp PALAVRAVERTICAL 
                        
                                                
PROCURAVERTICALMANGA:
PUSH AX
PUSH BX
PUSH CX
PUSH DX
PUSH DI
PUSH SI
PUSHF
jmp PERCORRERVERTICAL                        
verticalmanga1:
MOV SI,OFFSET MIGUEL
DEC DI


mov ch,[di]
mov cl,[si] 
cmp cl,ch
je verticalmangaigual                        

cmp ch,"$"
je IMPRIMIRNAOENCONTRA
MOV SI,OFFSET MIGUEL
mov cl,[si]
jmp VERTICALMANGA1                        
                        
                        

PERCORRERVERTICAL:
MOV DI,OFFSET INICIO_A
inc di
mov ch,[di]
ateofim:
inc di
mov ch,[di]
cmp ch,"*"
jne ateofim

jmp verticalmanga1


VERTICALMANGAIGUAL:
INC SI
MOV BX,DI
SUB DI,42
mov ch,[di]
mov cl,[si]
cmp ch,cl
je VERTICALMANGAIGUAL
cmp cl,0
je imprimirencontra
MOV DI,BX  
jmp verticalmanga1 


                    
PROCURADIAGONAL:
PUSH AX
PUSH BX
PUSH CX
PUSH DX
PUSH DI
PUSH SI
PUSHF
MOV SI,OFFSET MIGUEL
MOV DI,OFFSET INICIO_A
INC DI
mov ch,[di]
mov cl,[si]
PALAVRADIAGONAL:
cmp ch,cl
je DIAGONALIGUAL1
cmp ch,0
je IMPRIMIRNAOENCONTRA
MOV SI,OFFSET MIGUEL
mov cl,[si]
INC DI
mov ch,[di]
jmp PALAVRADIAGONAL







DIAGONALIGUAL1:
 PUSH DI
 mov di,variavel
 mov [di],ch
 mov ah,2
 mov dl,cl
 int 21h
 pop di



INC SI
MOV BX,DI   
MOV AX,VARIAVEL
ADD DI,43
ADD VARIAVEL,43
mov ch,[di]
mov cl,[si]
cmp ch,cl
je DIAGONALIGUAL1
cmp cl,0
je imprimirencontra
MOV DI,BX   
MOV VARIAVEL,AX
jmp PALAVRADIAGONAL




DIAGONALIGUAL2:
INC SI
MOV BX,DI   
ADD DI,41
mov ch,[di]
mov cl,[si]
cmp ch,cl
je DIAGONALIGUAL2
cmp cl,0
je imprimirencontra
MOV DI,BX   
jmp PALAVRADIAGONAL


DIAGONALIGUAL3:
INC SI
MOV BX,DI   
SUB DI,41
mov ch,[di]
mov cl,[si]
cmp ch,cl
je DIAGONALIGUAL3
cmp cl,0
je imprimirencontra
MOV DI,BX   
jmp PALAVRADIAGONAL

DIAGONALIGUAL4:
INC SI
MOV BX,DI   
SUB DI,43
mov ch,[di]
mov cl,[si]
cmp ch,cl
je DIAGONALIGUAL4
cmp cl,0
je imprimirencontra
MOV DI,BX   
jmp PALAVRADIAGONAL


IMPRIMEDB:
PUSH AX
PUSH BX
PUSH CX
PUSH DX
PUSH DI
PUSH SI
PUSHF
MOV SI,OFFSET MIGUEL
mov cl,[si]
MOV DI,OFFSET INICIO_C
IMPRIMEDB1:
INC DI
IMPRIMEDB3:
mov ch,[di]
cmp ch,'!'
je IMPRIMEDB2
cmp ch,cl

mov ah,2
mov dl,ch
int 21h
cmp ch,0
je FIM123
JMP IMPRIMEDB1


IMPRIMEDB2:
INC DI
INC DI
CALL PULA_LINHA
jmp imprimedb3


FIM123:
POPF
POP SI
POP DI
POP DX
POP CX
POP BX 
POP AX
ret


imprimirpalavradiagonal:
PUSH AX
PUSH BX
PUSH CX
PUSH DX
PUSH DI
PUSH SI
PUSHF
MOV SI,OFFSET MIGUEL
MOV DI,OFFSET INICIO_A
 push di
 mov di,offset inicio_c
 mov variavel,di
 pop di
 INC VARIAVEL
INC DI
mov ch,[di]
mov cl,[si]
PALAVRADIAGONAL0:
cmp ch,cl
je DIAGONALIGUAL1
cmp ch,0
je IMPRIMIRNAOENCONTRA
MOV SI,OFFSET MIGUEL
mov cl,[si]
INC DI
INC VARIAVEL
mov ch,[di]
jmp PALAVRADIAGONAL0





;FINDSUBSTRING





mens8 db "A substring ",0

mens10  db "se encontra na string ",0   
                                                 
mens9 db " se encontra na string ",0 

mens19 db " nao se encontra na string ", 0
        
CACAPALAVRA DB 0, "miguelxxxleugim#",0
;CACAPALAVRA DB 0, tamanho1 DUP(" "),0                          

mens129 db " se encontra na string ",0 
mens119 db " se encontra na string ",0  
;MIGUEL DB tamanho DUP(" "),0
MIGUEL DB "MIGUEL",0

variavel DW  0

PALAVRA DB TAMANHO DUP(" "),0


;use qualquer marcador
;fixo 10x40
DB 0,"#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$!"
INICIO_A:
DB "!xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx!"
DB "!xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxMxxxxxxx!"
DB "!xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxIxxxxxxxx!"    
DB "!xxxxMxxxxxxxxxxxxxxxMxxxxxxxxxGxxxxxxxxx!"
DB "!xxxxxIxxxxxxxxxxxxxxxIxxxxxxxUxxxxxxxxxx!"       ;kxl  
DB "!xxxxxxGxxxxxxxxxxxxxxxGxxxxxxxxxxxxxxxxx!"
DB "!xxxxxxxUxxxxxxxxxxxxxxxxxxxLxxxxxxxxxxxx!"  ;aqui
DB "!xxxxxxxxExxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx!"
DB "!xxxxxxxxxLxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx!#",0


DB 0,"#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$!"
INICIO_C:
DB "!----------------------------------------!"
DB "!----------------asd-----------------------!"
DB "!----------------------------------------!"    
DB "!----------------------------------------!"
DB "!----------------------------------------!"       ;k-l  
DB "!----------------------------------------!"
DB "!----------------------------------------!"  ;aqui
DB "!----------------------------------------!"
DB "!----------------------------------------!#",0