.686
.model flat,stdcall
; ��������� ����� X �� �������������� ��������� [a, b] � ���������� 
; 0, ���� �����������, � 1 � ��������� ������ (� �������� ��������� 
; ���������� ����� X, a, b).
include \masm32\include\masm32rt.inc
; ������� ������
.data
x dd 10
a dd 5
b dd 50

.CODE
; �������� �� ��������
proc1 proc
cmp eax, ebx
jnae proc3no; ���� ������ �
cmp eax, ecx
jnbe proc3no; ���� ������ b
 ret 1
proc3no:
 ret 0
proc1 endp

; �������� �� ������
proc2 proc
; ��������� �� ������� ��������
; PS: ���� ����� � ��������� ������������ ������ �� ���� �� ���������
mov eax,[eax]
mov ebx,[ebx]
mov ecx,[ecx]

cmp eax,ebx
jnae proc3no; ���� ������ �
cmp eax,ecx
jnbe proc3no; ���� ������ b
 ret 1
proc3no:
 ret 0
 ret
proc2 endp

; �������� �� �����
proc3 proc far
push EBP
 mov EBP, ESP
 mov ebx, [EBP + 8] 
 mov eax, [EBP + 6] 
cmp eax, ebx
jnae proc3no; ���� ������ �
 mov eax, [EBP + 4] 
cmp eax, ebx
jnbe proc3no; ���� ������ b
 pop EBP
 ret 1
proc3no:
 pop EBP
 ret 0
proc3 endp

main PROC
 mov eax,dword ptr x
 mov ebx,dword ptr a
 mov ecx,dword ptr b
 call proc1

 mov eax,offset x
 mov ebx,offset a
 mov ecx,offset b
 call proc2

 push x
 push a
 push b
 call proc3

    invoke ExitProcess, 0
main ENDP

END main