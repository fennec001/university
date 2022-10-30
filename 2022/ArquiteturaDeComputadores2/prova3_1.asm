    ;prova 3 de arquitetura, com o objetivo de efetuar as 3 funcoes que estao sendo chamadas

                                           include "emu8086.inc"
tamanho equ 9 ; incluir null
tamanho1 equ 30
org 100h  

DEFINE_GET_STRING 
DEFINE_PRINT_STRING     



CALL PROCURARPALAVRA
CALL PROCURARPALAVRAMANGA
;CALL PROCURAVERTICAL
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
;MOV DI, offset MIGUEL   
;TAMANHO DA STRING
;MOV DX, tamanho          
;call GET_STRING          
;call pula_linha

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


mens8 db "A substring ",0

mens10  db "se encontra na string ",0   

mens9 db " se encontra na string ",0 

mens19 db " nao se encontra na string ", 0
        
CACAPALAVRA DB 0, "miguelxxxleugim",0
;CACAPALAVRA DB 0, tamanho1 DUP(" "),0                          

mens129 db " se encontra na string ",0 
mens119 db " se encontra na string ",0  
;MIGUEL DB tamanho DUP(" "),0
MIGUEL DB "miguel",0