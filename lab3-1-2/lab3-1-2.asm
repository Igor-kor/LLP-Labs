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
x dd 4
y dd 2
z dd ?
; ������� ����
.code
main:
; ������� 19 + 5
; z = x**3 / (x-y); 

 ;(x-y)
 mov EAX, [x]
 sub EAX, [y]
  ; �������� ������������� ���������� � ECX
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
 ; ����� �� ���������
quit:
 mov eax, 0
 invoke ExitProcess, eax
end main