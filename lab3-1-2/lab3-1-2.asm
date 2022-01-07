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
; Вариант 19 + 5
; z = x**3 / (x-y); 

 ;(x-y)
 mov EAX, [x]
 sub EAX, [y]
  ; Сохраним промежуточные результаты в ECX
 mov ECX, EAX

; x**3
 mov EBX, [x]
 mov EAX, EBX 
 mul EBX
 mul EBX

 ;x**3 / (x-y); 
 mov EDX, 0 ;
 div ECX

 mov z, EAX ; EAX -> Z
 ; Выход из программы
quit:
 mov eax, 0
 invoke ExitProcess, eax
end main