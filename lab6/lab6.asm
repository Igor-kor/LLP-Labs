.686
.model flat,stdcall

include \masm32\include\masm32rt.inc
; Сегмент данных
.data
x dw 10
va dw 0
vb dw 0
vc dw 0

.CODE
main PROC
xor EAX, EAX
xor ECX, ECX
mov CX, 10
m1:
 mov AX, x
 mov BX, 0
 cmp AX, BX
 jl case1
 jg case2
 jmp default1
case1:
 mov AX, vb
 mov BX, 0
 cmp AX, BX
 jne default1
 jmp endcase
; x<0, b!=0
; -((2x-c)/(cx-a))
case2:
 mov AX, vb
 mov BX, 0
 cmp AX, BX
 je default1
  jmp endcase
; x>0, b == 0
; (x-a)/(x-c)
default1:
; default
; -(x/c) + (-c)/(2x)
jmp endcase
endcase:
 dec x
 LOOP m1



    invoke ExitProcess, 0
main ENDP

END main