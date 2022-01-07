title MPSLab01x02
.686
.model flat, stdcall
option casemap :none ; case sensitive
; Раздел подключения библиотек
 include c:\masm32\include\windows.inc
 include c:\masm32\include\kernel32.inc
 include c:\masm32\include\user32.inc
 includelib c:\masm32\include\kernel32.lib
 includelib c:\masm32\include\user32.lib
; Сегмент данных
.data
x dd 87654321h
; Сегмент кода
.code
; Точка входа в программу
main proc far
 mov EAX, 12345678h
 mov EBX, [x]
; Выход из программы
quit:
 mov EAX, 0
 invoke ExitProcess, EAX
main endp
; Конец программы
end main