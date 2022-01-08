.686
.model flat,stdcall
; Проверяет число X на принадлежность диапазону [a, b] и возвращает 
; 0, если принадлежит, и 1 в противном случае (в качестве параметра 
; передавать числа X, a, b).
include \masm32\include\masm32rt.inc
; Сегмент данных
.data
x dd 10
a dd 5
b dd 50

.CODE
; передача по значению
proc1 proc
cmp eax, ebx
jnae proc3no; если меньше а
cmp eax, ecx
jnbe proc3no; если больше b
 ret 1
proc3no:
 ret 0
proc1 endp

; передача по ссылке
proc2 proc
; извлекаем по ссылкам значения
; PS: если нужно в дльнейшем использовать ссылки то надо их сохранить
mov eax,[eax]
mov ebx,[ebx]
mov ecx,[ecx]

cmp eax,ebx
jnae proc3no; если меньше а
cmp eax,ecx
jnbe proc3no; если больше b
 ret 1
proc3no:
 ret 0
 ret
proc2 endp

; передача по стеку
proc3 proc far
push EBP
 mov EBP, ESP
 mov ebx, [EBP + 8] 
 mov eax, [EBP + 6] 
cmp eax, ebx
jnae proc3no; если меньше а
 mov eax, [EBP + 4] 
cmp eax, ebx
jnbe proc3no; если больше b
 pop EBP
 ret 1
proc3no:
 pop EBP
 ret 0
proc3 endp

main PROC
 mov eax,dword ptr x
 mov ebx,dword ptr a
 mov ecx,dword ptr b
 call proc1

 mov eax,offset x
 mov ebx,offset a
 mov ecx,offset b
 call proc2

 push x
 push a
 push b
 call proc3

    invoke ExitProcess, 0
main ENDP

END main