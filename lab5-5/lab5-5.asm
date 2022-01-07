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
; вариант 19 + 13 (2) 
; (not X) or (X xor (X and Y)) 

 mov AX, x ; x = true
 mov BX, y ; y = false
 and BX, AX ;(X and Y)
 xor BX, AX ;(X xor (X and Y)) 
 not AX ; (not X)
 or AX, BX

quit:
 mov eax, 0
 invoke ExitProcess, eax
end main