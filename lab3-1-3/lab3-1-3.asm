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
x dd 4
y dd 2
z dd ?
; Сегмент кода
.code
main:
; Вариант 19 + 7
; z = -3x + y**2 +1; 

 ; -3x
 mov EAX, -3
 mul [x]
; Сохраним промежуточные результаты в ECX
 mov ECX, EAX

 mov EBX, [y]
 mov EAX, EBX	
 mul EBX

 add EAX, ECX
 inc EAX

 mov z, EAX ; EAX -> Z
 ; Выход из программы
quit:
 mov eax, 0
 invoke ExitProcess, eax
end main