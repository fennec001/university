;primeira versao da prova, para melhor documentacao verifique o ultimo arquivo deste repositorio

include "emu8086.inc"
tamanho equ 9 ; incluir null
tamanho1 equ 30
org 100h  

DEFINE_GET_STRING 
DEFINE_PRINT_STRING     

LOOPZERO:
;ENDERECO DA STRING
MOV DI, offset MIGUEL   
;TAMANHO DA STRING
MOV DX, tamanho          
call GET_STRING          
call pula_linha

;ENDERECO DA STRING                                                          
MOV DI, offset cacapalavra   
;TAMANHO DA STRING
MOV DX, tamanho1          
call GET_STRING          
      
MOV DI,offset miguel      
MOV SI,offset cacapalavra
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
call PRINT_STRING

jmp $

IMPRIMIRNAOENCONTRA:
CALL PULA_LINHA 
MOV SI, offset mens8
call PRINT_STRING
mov SI,offset MIGUEL
call PRINT_STRING  
mov SI, offset mens19 
call PRINT_STRING
mov SI, offset cacapalavra
call PRINT_STRING

jmp $


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

mens8 db "A substring ",0

mens10  db "se encontra na string ",0   

mens9 db " se encontra na string ",0 

mens19 db " nao se encontra na string ", 0
        
CACAPALAVRA DB tamanho1 DUP(" "),0                          
 
MIGUEL DB tamanho DUP(" "),0