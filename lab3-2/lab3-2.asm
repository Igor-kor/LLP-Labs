; �������� ����� 
; ����� �� ������ 19
; ������� 9
; f (x, y,z) = (-x)* y + z


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
x dd 10
y dd 3
z dd ?
; ������� ����
.code
main:
 ; ���������� z = -1*(x**2 + xy -2)/((y + 1)**3)
 ; ��������� x**2
 mov EBX, [x] ; x -> EBX ( EBX = 10 = 0Ah )
 mov EAX, EBX ; x -> EAX ( EAX = 10 = 0Ah )
 mul EAX ; EAX = x**2 ( EAX = 100 = 64h )
 ; �������� ������������� ���������� � ECX
 mov ECX, EAX ; x**2 -> ECX ( ECX = 100 = 64h )
 ; ��������� x*y
 mov EAX, EBX ; x (��� �������� � EBX) -> EAX ( EAX = 10 = 0Ah )
 mov EBX, [y] ; y -> EBX ( EBX = 3 = 03h )
 mul EBX ; EAX = x*y ( EAX = 30 = 1Eh )
 ; �������� 2 �� ����������� ������������
 sub EAX, 2 ; EAX = x*x - 2 ( EAX = 28 = 1Ch )
 ; ��������� x**2 � ���������� ��� ��������� ��������� �����
 add EAX, ECX ; EAX = (x*y - 2) + x**2 ( EAX = 128 = 80h )
 ; �������� ��������� � ECX
 mov ECX, EAX ; (x*y - 2) + x^2 -> ECX ( ECX = 128 = 80h )
 ; ��������� ����������� �����
 inc EBX ; EBX = y + 1 ( EBX = 4 = 04h )
 mov EAX, EBX ; (y+1) -> EAX ( EAX = 4 = 04h )
 mul EAX ; EAX = (y+1)**2 ( EAX = 16 = 10h )
 mul EBX ; EAX = (y+1)**2 * (y+1) ( EAX = 64 = 40h )
 ; ���������� � �������. �������� ����������� � EBX
 mov EBX, EAX ; (y+1)**3 -> EBX ( EBX = 64 = 40h )
 ; �������� ��������� � EAX
 mov EAX, ECX ; (x*y - 2) + x**2 -> EAX ( EAX = 128 = 80h )
 ; ������� ������� ����� �������� (��. ������ ������� �������)
 mov EDX, 0 ; 0 -> EDX ( EDX = 0 = 00h )
 div EBX ; EAX = EAX / EBX ( EAX = 2 = 02h )
 ; �������� ���� �����
 neg EAX ; -EAX ( EAX = -2 = FFFFFFFEh )
 ;
 mov z, EAX ; EAX -> Z
 ; ����� �� ���������
quit:
 mov eax, 0
 invoke ExitProcess, eax
end main
