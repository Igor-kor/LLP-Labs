.586
.model flat, stdcall
option casemap :none ; case sensitive
; ������ ����������� ���������
 include c:\masm32\include\windows.inc
 include c:\masm32\include\kernel32.inc
 include c:\masm32\include\user32.inc
 includelib c:\masm32\lib\kernel32.lib
 includelib c:\masm32\lib\user32.lib
; ������� ������
.data
x dd 2
y dd 10
z dd ?
; ������� ����
.code
main:
; ������� 19 z = -(1-y)/(1+x);

; (1-y)
 mov EAX, 1
 sub EAX, [y]
 ; �������� ���� ����� -(1-y)
 neg EAX ; -EAX 
 ; (1+x)
 mov EBX, [x]
 inc EBX
 ; -(1-y)/(1+x);
  ; ������� ������� ����� �������� (��. ������ ������� �������)
 mov EDX, 0 ;
 div EBX
 mov z, EAX ; EAX -> Z
 ; ����� �� ���������
quit:
 mov eax, 0
 invoke ExitProcess, eax
end main