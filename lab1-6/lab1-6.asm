title MPSLab01x06
.686
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
x dd 87654321h
y dd ?
; ������� ����
.code
; ����� ����� � ���������
main proc far
 mov EAX, 12345678h ; �������� � ������� EAX ����� 0x12345678
 mov EBX, [x] ; �������� � ������� EBX �������� ���������� x
 add EAX, EBX ;���������� EAX � EBX � �������� ��������� � EAX
 mov [y], EAX ; ��������� ��������� � ���������� y
 ; ����� �� ���������
quit:
 mov EAX, 0
 invoke ExitProcess, EAX
main endp
; ����� ���������
end main