.586
.model flat, stdcall
option casemap :none ; case sensitive
; Раздел подключения библиотек
 include c:\masm32\include\windows.inc
 include c:\masm32\include\kernel32.inc
 include c:\masm32\include\user32.inc
 includelib c:\masm32\lib\kernel32.lib
 includelib c:\masm32\lib\user32.lib
; Сегмент данных
.data
x dd 2
y dd 10
z dd ?
; Сегмент кода
.code
main:
; Вариант 19 z = -(1-y)/(1+x);

; (1-y)
 mov EAX, 1
 sub EAX, [y]
 ; Изменяем знак числа -(1-y)
 neg EAX ; -EAX 
 ; (1+x)
 mov EBX, [x]
 inc EBX
 ; -(1-y)/(1+x);
  ; Обнулим старшую часть делимого (см. работу команды деления)
 mov EDX, 0 ;
 div EBX
 mov z, EAX ; EAX -> Z
 ; Выход из программы
quit:
 mov eax, 0
 invoke ExitProcess, eax
end main