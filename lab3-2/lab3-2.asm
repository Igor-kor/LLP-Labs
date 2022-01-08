.686
.model flat, stdcall
option casemap :none ; case sensitive
; Раздел подключения библиотек
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\include\masm32.inc
include \masm32\macros\macros.asm
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
;Сегмент данных
.data
X dq 123456789ABCDEF0h
Y dq 123456789ABCDEF0h
Z dq ?
; Сегмент кода
.code
main proc far
; Вычисляем f (x, y, z) = -x* y + z
mov        eax,dword ptr X
mov        ebx,eax
mul        dword ptr Y         ; перемножить младшие двойные слова
mov        dword ptr Z,eax     ; сохранить младшее слово произведения
mov        ecx,edx             ; сохранить старшее двойное слово
mov        eax,ebx             ; младшее слово "X" в еах
mul        dword ptr Y[4]      ; умножить младшее слово на старшее
add        eax,ecx
adc        edx,0               ; добавить перенос
mov        ebx,eax             ; сохранить частичное произведение
mov        ecx,edx
mov        eax,dword ptr X[4]
mul        dword ptr Y         ; умножить старшее слово на младшее
add        eax,ebx             ; сложить с частичным произведением
mov        dword ptr Z[4],eax
adc        ecx,edx
mov        eax,dword ptr X[4]
mul        dword ptr Y[4]      ; умножить старшие слова
add        eax,ecx             ; сложить с частичным произведением
adc        edx,0               ; и добавить перенос
;mov        word ptr Z[8],eax
;mov        word ptr Z[12],edx
 

invoke ExitProcess, EAX
main endp
; Конец программы
end main