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
; вариант 19 + 5  
; X xor (not X) or (Y and X) 

 mov AX, x ; x = true
 mov BX, y ; y = false
 mov CX, AX ; Копия x
 not CX ; (not X)
 xor CX, AX ; X xor (not X)

 and AX, BX ;  (Y and X) 
 or AX, CX ; X xor (not X) or (Y and X) 


quit:
 mov eax, 0
 invoke ExitProcess, eax
end main