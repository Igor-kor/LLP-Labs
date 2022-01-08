.686
.model flat,stdcall
; Вставляет содержимое одного символьного массива в заданное место 
; другого символьного массива. 
include \masm32\include\masm32rt.inc
; Сегмент данных
.data
array_length dd 5
Char_Array db 'ABC', 17 dup(?)
dst db "0123456789" , 17 dup(?)
src db 5 dup("t")
.CODE
; передача по значению


; передача по стеку
proc3 proc far
push EBP
mov EBP, ESP
mov ESI, [EBP+12]  ; адрес источника
mov EDI, [EBP+16] ; адрес приемника
add EDI, [EBP+20] ; смещение для вставки
mov ECX, [EBP+24] ; длина копируемой строки
rep movsb ; копирование
 pop EBP
 ret 0
proc3 endp

main PROC
 ;call proc3
; lea ESI, src ; адрес источника
;lea EDI, [dst+3] ; адрес приемника
;mov ECX, 3 ; длина копируемой строки
;rep movsb ; копирование
push array_length; длина строки
push 4; позиия куда вставится
push offset dst
push offset src
call proc3

mov ECX, 10
mov eax, 0
p1:
push ecx
push eax
printf("%c", byte ptr[dst+eax])
pop eax
pop ecx
add eax,1
dec ecx
jnz p1

    invoke ExitProcess, 0
main ENDP

END main