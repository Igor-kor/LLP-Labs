.686
.model flat, stdcall
option casemap :none ; case sensitive
; ������ ����������� ���������
include \masm32\include\windows.inc
include \masm32\include\kernel32.inc
include \masm32\include\user32.inc
include \masm32\include\masm32.inc
include \masm32\macros\macros.asm
includelib \masm32\lib\masm32.lib
includelib \masm32\lib\kernel32.lib
includelib \masm32\lib\user32.lib
;������� ������
.data
X dq 123456789ABCDEF0h
Y dq 123456789ABCDEF0h
Z dq ?
; ������� ����
.code
main proc far
; ��������� f (x, y, z) = -x* y + z
mov        eax,dword ptr X
mov        ebx,eax
mul        dword ptr Y         ; ����������� ������� ������� �����
mov        dword ptr Z,eax     ; ��������� ������� ����� ������������
mov        ecx,edx             ; ��������� ������� ������� �����
mov        eax,ebx             ; ������� ����� "X" � ���
mul        dword ptr Y[4]      ; �������� ������� ����� �� �������
add        eax,ecx
adc        edx,0               ; �������� �������
mov        ebx,eax             ; ��������� ��������� ������������
mov        ecx,edx
mov        eax,dword ptr X[4]
mul        dword ptr Y         ; �������� ������� ����� �� �������
add        eax,ebx             ; ������� � ��������� �������������
mov        dword ptr Z[4],eax
adc        ecx,edx
mov        eax,dword ptr X[4]
mul        dword ptr Y[4]      ; �������� ������� �����
add        eax,ecx             ; ������� � ��������� �������������
adc        edx,0               ; � �������� �������
;mov        word ptr Z[8],eax
;mov        word ptr Z[12],edx
 

invoke ExitProcess, EAX
main endp
; ����� ���������
end main