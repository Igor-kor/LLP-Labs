.686
.model flat,stdcall

include \masm32\include\masm32rt.inc
; Сегмент данных
.data
x dd 20
va dd 3
vb dd 1
vc dd 3

.CODE
main PROC
xor EAX, EAX
xor ECX, ECX
mov ECX, 10
m1:
 mov EAX, x
 mov EBX, 0
 cmp EAX, EBX
 jl case1
 jg case2
 jmp default1
case1:
 mov EAX, vb
 mov EBX, 0
 cmp EAX, EBX
 jne default1
 mov eax, x
 add eax, eax;2x
 sub eax, vc
 push eax

 mov eax, x
 mul vc
 sub eax, va
 mov ebx, eax
 pop eax
 mov EDX, 0 ;
 div ebx
 neg eax
 push ecx
 printf ("x = %d, f = %d\n", x, eax);
 pop ecx
 jmp endcase
; x<0, b!=0
; -((2x-c)/(cx-a))
case2:
 mov EAX, vb
 mov EBX, 0
 cmp EAX, EBX
 je default1
 mov eax, x
 sub eax, va
 mov ebx, x
 sub ebx, vc
 mov EDX, 0 ;
 div ebx

 push ecx
 printf ("x = %d, f = %d\n", x, eax);
 pop ecx
  jmp endcase
; x>0, b == 0
; (x-a)/(x-c)
default1:
mov eax, vc
neg eax
mov ebx, x
add ebx, ebx
div ebx
pop eax
mov eax, x
div vc
neg eax
pop ebx
add eax, ebx

 push ecx
 printf ("x = %d, f = %d\n", x, eax);
 pop ecx
; default
; -(x/c) + (-c)/(2x)
jmp endcase
endcase:
 dec x
 dec ecx
 jnz m1



    invoke ExitProcess, 0
main ENDP

END main