.686
.model flat,stdcall
; ��������� ���������� ������ ����������� ������� � �������� ����� 
; ������� ����������� �������. 
include \masm32\include\masm32rt.inc
; ������� ������
.data
array_length dd 5
Char_Array db 'ABC', 17 dup(?)
dst db "0123456789" , 17 dup(?)
src db 5 dup("t")
.CODE
; �������� �� ��������


; �������� �� �����
proc3 proc far
push EBP
mov EBP, ESP
mov ESI, [EBP+12]  ; ����� ���������
mov EDI, [EBP+16] ; ����� ���������
add EDI, [EBP+20] ; �������� ��� �������
mov ECX, [EBP+24] ; ����� ���������� ������
rep movsb ; �����������
 pop EBP
 ret 0
proc3 endp

main PROC
 ;call proc3
; lea ESI, src ; ����� ���������
;lea EDI, [dst+3] ; ����� ���������
;mov ECX, 3 ; ����� ���������� ������
;rep movsb ; �����������
push array_length; ����� ������
push 4; ������ ���� ���������
push offset dst
push offset src
call proc3

mov ECX, 10
mov eax, 0
p1:
push ecx
push eax
printf("%c", byte ptr[dst+eax])
pop eax
pop ecx
add eax,1
dec ecx
jnz p1

    invoke ExitProcess, 0
main ENDP

END main