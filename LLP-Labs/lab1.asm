title lab1
.686
.model flat, stdcall
option casemap :none ; case sensitive
; ������ ����������� ���������
 include c:\masm32\include\windows.inc
 include c:\masm32\include\kernel32.inc
 include c:\masm32\include\user32.inc
 include c:\masm32\include\masm32.inc
 include c:\masm32\macros\macros.asm
 includelib c:\masm32\lib\masm32.lib
 includelib c:\masm32\lib\kernel32.lib
 includelib c:\masm32\lib\user32.lib
; ������� ������
.data
; ---------------------------------------------------
; ����� ������������� ������ (����������) ���������
; ---------------------------------------------------
; ������� ����
.code
; ����� ����� � ���������
main proc far
 ; ������ print ������� ������ �� �����
 print "Hello world"
 ; ���������� ��������� ����� �����
 ; ��������� ������� ExitProcess
 invoke ExitProcess, EAX
main endp
; ����� ���������
end main