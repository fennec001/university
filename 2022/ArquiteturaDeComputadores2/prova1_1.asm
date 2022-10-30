  ;primeira prova de arquitetura, ainda com bugs 
  
  
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

mov CX, 0
mov AX, 300
mov BX, 10

DIVISAO:
div BX ;comando para dividir
push DX; empilha o resto da divisao
inc CX; incrementa o cx que esta sendo utilizado como contador
mov DX, 0; zera o DX para continuar a divisao
cmp P, 0
jne P,1 ; logica para dar loop ate zerar a divisao

IMPRESSAO:
pop DX ;desempilha DX
mov AH, 2 ;comandos para impressao
add DL, 48 ; para imprimir o numero correto
int 33 ; imprimindo
dec CX
cmp CX, 0 ; decrementando contador ate zerar
jne IMPRESSAO

ret




ret




