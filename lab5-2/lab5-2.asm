.586
.model flat, stdcall
option casemap :none ; case sensitive
 include c:\masm32\include\windows.inc
 include c:\masm32\include\kernel32.inc
 include c:\masm32\include\user32.inc
 includelib c:\masm32\lib\kernel32.lib
 includelib c:\masm32\lib\user32.lib
.data
x dw 0FFFFh ; true
y dw 00000h ; false
.code
main:
; вариант 19 + 3 (not X) xor (not Y) or (X) and (Y) 

 mov AX, x ; x = true
 mov BX, y ; y = false
 mov CX, AX ; Копия x
 mov DX, BX ; Копия y

 not CX ; (not X)
 not DX ; (not Y)

 xor CX, DX ; (not X) xor (not Y)
 or CX, AX ;  or (X)
 and CX, BX ; and (Y) 

quit:
 mov eax, 0
 invoke ExitProcess, eax
end main