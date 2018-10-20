title	Molar mass calculator (com)	;�ᯮ������ MASM 6.11
codesg	segment	para 'code'			; � DOSBox 0.74
		assume	cs:codesg, ds:codesg, ss:codesg, es:codesg
		org		100h
begin:	jmp		main
;-----------------------------------------------------------
		db	?	;��ࠢ������� ����樨 �� �࠭��� ᫮��

		;����饭�� ������������ ����⮢:
el		db	'H ','He','Li','Be','B ','C ','N ','O ','F '
		db	'Ne','Na','Mg','Al','Si','P ','S ','Cl','Ar'
		db	'K ','Ca','Sc','Ti','V ','Cr','Mn','Fe','Co'
		db	'Ni','Cu','Zn','Ga','Ge','As','Se','Br','Kr'
		db	'Rb','Sr','Y ','Zr','Nb','Mo','Tc','Ru','Rh'
		db	'Pd','Ag','Cd','In','Sn','Sb','Te','I ','Xe'
		db	'Cs','Ba','La','Ce','Pr','Nd','Pm','Sm','Eu'
		db	'Gd','Tb','Dy','Ho','Er','Tm','Yb','Lu','Hf'
		db	'Ta','W ','Re','Os','Ir','Pt','Au','Hg','Tl'
		db	'Pb','Bi','Po','At','Rn','Fr','Ra','Ac','Th'
		db	'Pa','U ','Np','Pu','Am','Cm','Bk','Cf','Es'
		db	'Fm','Md','No','Lr','Rf','Db','Sg','Bh','Hs'
		db	'Mt','Ds','Rg','Cn','Nh','Fl','Mc','Lv','Ts'
		db	'Og'

		;����訥 ࠧ��� �⮬��� ����� (*10^-6):
ma		dw	06167h,0132Ah,050CCh,083D7h,0003Ch,04468h,0BA47h
		dw	021A8h,0E483h,0EAF4h,0CBC9h,0DF5Ch,0B4A3h,08B08h
		dw	09F42h,04FACh,0F26Ch,08EE0h,097BCh,08AB0h,0F904h
		dw	06478h,04E3Ch,065C4h,049BCh,02088h,03FCAh,09718h
		dw	0A290h,09EA0h,0E378h,03EF0h,0367Bh,00078h,03D00h
		dw	0A7F0h,02298h,0F9A0h,09870h,0F7C0h,0A382h,014B0h
		dw	05C80h,034B0h,0369Ch,0D720h,0F028h,04D30h,0FBD0h
		dw	05EF0h,0E900h,00580h,06896h,05F48h,0F9ECh,07198h
		dw	0877Eh,00020h,0148Ch,0F550h,08640h,04FC0h,0C960h
		dw	071D0h,00226h,08DA0h,0A31Ah,02B78h,0BB4Ch,09830h
		dw	0C810h,08A90h,00BA8h,02D00h,04B18h,0ADF0h,0FFA8h
		dw	0BEE0h,078A9h,0CA80h,0A50Ch,09F00h,0C9B0h,01640h
		dw	05880h,07380h,0B5C0h,07C80h,0BEC0h,09D44h,053E8h
		dw	0086Eh,05540h,02500h,0E2C0h,0EBC0h,0EBC0h,0F4C0h
		dw	03700h,08240h,0C480h,006C0h,0CD80h,018C0h,05B00h
		dw	021C0h,06400h,0DF80h,06D00h,0B840h,07600h,0C140h
		dw	07F00h,0CA40h,08800h,0D340h,09100h,01580h

		;���訥 ࠧ��� �⮬��� ����� (*10^-6):
md		dw	0Fh,03Dh,06Ah,089h,0A5h,0B7h,0D5h,0F4h,0121h
		dw	0133h,015Eh,0172h,019Bh,01ACh,01D8h,01E9h,021Ch
		dw	0261h,0254h,0263h,02ADh,02DAh,0309h,0319h,0346h
		dw	0354h,0383h,037Fh,03C9h,03E5h,0427h,0454h,0477h
		dw	04B5h,04C3h,04FEh,0518h,0538h,054Ch,056Fh,0589h
		dw	05B8h,05D7h,0606h,0622h,0657h,066Dh,06B3h,06D7h
		dw	0713h,0741h,079Bh,0790h,07D3h,07EBh,082Fh,0847h
		dw	085Ah,0866h,0898h,08A4h,08F6h,090Eh,095Fh,0979h
		dw	09AFh,09D4h,09F8h,0A11h,0A50h,0A6Dh,0AA3h,0AC9h
		dw	0AF5h,0B19h,0B56h,0B74h,0BA0h,0BBDh,0BF4h,0C2Eh
		dw	0C59h,0C74h,0C75h,0C84h,0D3Bh,0D4Ah,0D78h,0D87h
		dw	0DD4h,0DC5h,0E30h,0E20h,0E8Bh,0E7Bh,0EB8h,0EB8h
		dw	0EF5h,0F05h,0F51h,0F60h,0F70h,0F9Dh,0FEAh,0FF9h
		dw	01027h,01036h,01017h,01073h,010BFh,010B0h,010FCh
		dw	010EDh,01139h,0112Ah,01176h,01167h,01186h

		;��筮��� �⮬��� ����� (���-�� ������ ��᫥ ����⮩):
ac		dw	6,6,4,6,4,4,6,4,6,4,6,4,6,3,6,4,4,3,4,3,6,3,4,4
		dw	6,3,6,4,3,2,3,2,6,3,3,3,4,2,5,3,5,2,0,2,5,2,4,3
		dw	3,3,3,2,5,3,6,3,5,3,5,3,0,2,3,2,5,3,5,3,5,3,4,2
		dw	5,2,3,2,3,3,6,3,4,1,5,0,0,0,0,0,0,4,5,5,0,0,0,0
		dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

		;����� ������������ ����⮢:
Nm		db	'Hydrogen     ','Helium       ','Lithium      '
		db	'Beryllium    ','Boron        ','Carbon       '
		db	'Nitrogen     ','Oxygen       ','Fluorine     '
		db	'Neon         ','Natrium      ','Magnesium    '
		db	'Aluminum     ','Silicon      ','Phosphorus   '
		db	'Sulfur       ','Chlorine     ','Argon        '
		db	'Kalium       ','Calcium      ','Scandium     '
		db	'Titanium     ','Vanadium     ','Chromium     '
		db	'Manganese    ','Ferrum       ','Cobalt       '
		db	'Nickel       ','Cuprum       ','Zinc         '
		db	'Gallium      ','Germanium    ','Arsenic      '
		db	'Selenium     ','Bromine      ','Krypton      '
		db	'Rubidium     ','Strontium    ','Yttrium      '
		db	'Zirconium    ','Niobium      ','Molybdenum   '
		db	'Technetium   ','Ruthenium    ','Rhodium      '
		db	'Palladium    ','Argentum     ','Cadmium      '
		db	'Indium       ','Stannum      ','Stibium      '
		db	'Tellurium    ','Iodine       ','Xenon        '
		db	'Cesium       ','Barium       ','Lanthanum    '
		db	'Cerium       ','Praseodymium ','Neodymium    '
		db	'Promethium   ','Samarium     ','Europium     '
		db	'Gadolinium   ','Terbium      ','Dysprosium   '
		db	'Holmium      ','Erbium       ','Thulium      '
		db	'Ytterbium    ','Lutetium     ','Hafnium      '
		db	'Tantalum     ','Wolfram      ','Rhenium      '
		db	'Osmium       ','Iridium      ','Platinum     '
		db	'Aurum        ','Hydragyrum   ','Thallium     '
		db	'Plumbum      ','Bismuth      ','Polonium     '
		db	'Astatine     ','Radon        ','Francium     '
		db	'Radium       ','Actinium     ','Thorium      '
		db	'Protactinium ','Uranium      ','Neptunium    '
		db	'Plutonium    ','Americium    ','Curium       '
		db	'Berkelium    ','Californium  ','Einsteinium  '
		db	'Fermium      ','Mendelevium  ','Nobelium     '
		db	'Lawrencium   ','Rutherfordium','Dubnium      '
		db	'Seaborgium   ','Bohrium      ','Hassium      '
		db	'Meitnerium   ','Darmstadtium ','Roentgentium '
		db	'Copernicum   ','Nihonium     ','Flerovium    '
		db	'Moscovium    ','Livermorium  ','Tennessine   '
		db	'Oganesson    '
nmx		db	'other        '	;��稥 ������

		;������ ��४���஢�� ᨬ����� � ��㫥
xlt		db	40  dup(00)
		db	05, 04, 06		;������� (, ), *
		db	5   dup(00)
		db	10  dup(01)		;����� 0-9
		db	7   dup(00)
		db	26  dup(03)		;�������� �㪢�
		db	05, 00, 04		;������� [, \, ]
		db	3   dup(00)
		db	26  dup(02)		;����� �㪢�
		db	133 dup(00)		;��⠫�� ᨬ����

		db	?				;��ࠢ������� �� �࠭��� ᫮��

		;��᫮�� ����⠭��
ten		dw	10				;����⮪
pp100	dw	10000			;100,00 %

		;��६����
stk		dw	?,?				;���� ��� �࠭���� 㪠��⥫�� �⥪�
mult	dw	?				;�����⥫� �����樥��
ord		dw	?				;���冷� ࠧ�鸞
cycle	dw	?				;���稪 横��� (� �.�. ᤢ���)
elp		dw	?				;��᫥���� �. � pnt
eln		dw	?				;���饭�� ���. �.
pmmasc	dw	?				;�����⥫� �� ���. ᨬ��� �����
fml		db	80  dup(?)		;������� ���� (ASCII)
nn		dw	80	dup(?)		;����� ����⮢ (ᬥ饭��)
coe		dw	80	dup(?)		;�����樥���
nn2		dw	48 	dup(?)		;����� ����⮢ (��㯯.)
coe2	dw	48	dup(?)		;�����樥��� (�㬬.)
elm		dw	144 dup(?)		;��. ���� �����

		;��६����, �������騥 ����
v_bg	label	word
pnt		dw	48 	dup(0)		;���冷� �����
masd	dw	48 	dup(0)		;���ᮢ� ���� * 100%
mold	dw	48 	dup(0)		;������ ���� * 100%
bkt		dw	0				;�ਧ��� ᮢ������� ����. � ���. ᪮���
melc	dw	0				;���ᨬ��쭠� �筮���
scoe	dw	2 	dup(0)		;�㬬� �����樥�⮢
scoes	dw	2	dup(0)		;�㬬� �����樥�⮢ (ᤢ�����)
mm		dw	3 	dup(0)		;�������ୠ� ����
mml		dw	3 	dup(0)		;�������ୠ� ���� (ᤢ�����)
delim	dw	4 	dup(0)		;�������
lenmm	dw	0				;����� ��ப� ����� (ASCII)
v_end	label	word

		;�ᥢ������
elx		equ ma-el			;���� ���� ����⮢
mcoe	equ	mold-coe2
parlen	equ	(v_end-v_bg)/2	;������ ������ � ��६���묨
tb		equ	09 				;�������
cr		equ	0dh				;������ ���⪨
lf		equ	0ah				;��ॢ�� (�����) ��ப�
rowp	equ	30				;���饭�� �ம�� ����⮢

info	db	cr,lf
		db	' Molar mass calculator 1.0 (20.05.2018). Created by V.A. Markov.'
		db	cr,lf

		;�뢮� ����୮� �����
prompt	db	cr,lf
		db	' Enter the molecular formula, e.g., Ca[Cr(NH3)2(NCS)4]2*2H2O:'
		db	cr,lf
resmm	db	cr,lf,' Molar mass: '	;����饭�� �뢮�� �����
mmasc0	db	24 dup(20h)			;����ୠ� ���� � ASCII-�ଠ�
gmol	db	' g/mol.',cr,lf	;�����୮���

		;��������� ⠡����
head	db	cr,lf,' Element       Number   Atomic mass g/mol'
		db	'   Number of atoms   Mole %   Weight % '

		;��ப� ⠡����		���ࠢ����� ����� ��ப
row		db	1	dup(20h)
sym		db	3	dup(20h)	;	 >			������ �����
elnm	db	16	dup(20h)	;	 >			������������ �����
num		db	20	dup(20h)	;	<			���浪��� ����� �����
atm		db	18	dup(20h)	;	<			�⮬��� ���� �����
atn		db	9	dup(20h)	;	<			������⢮ �⮬�� �����
molp	db	11 	dup(20h)	;	<			����ୠ� ���� �����, %
wgtp	db	2 	dup(20h)	;	<			���ᮢ�� ���� �����, %

ppt		db	'100,00'		;100 %

		;����饭�� �� �訡���
err0	db	cr,lf,tb,'Invalid character',cr,lf
err1	db	cr,lf,tb,'The index can not be equal 0 or greater than 65535',cr,lf
err2	db	cr,lf,tb,'Incorrect chemical element symbol',cr,lf
err3	db	cr,lf,tb,'Missing opening/closing bracket',cr,lf
err4	db	cr,lf,tb,'The total number of atoms of one element '
		db	'can not be more than 65535: ';,cr,lf,tb,tb
errel	db	'  ',cr,lf			;������ ����� � �訡���
err5	db	cr,lf,tb,'At least one element must be entered',cr,lf
err6	db	cr,lf,tb,'The total number of atoms must be reduced',cr,lf
errc	db	tb,'Error at Column: '
col		db	'  ',cr,lf			;������ ���ࠢ��쭮�� ᨬ����
;-----------------------------------------------------------
;				������� ��楤��:
;				--------------------------------------------
main	proc	near
		mov		cx,68				;����� ��ப�
		mov		dx,offset info		;���� ��ப� � �ਣ���.
		call	dd10out				;�뢥�� �ਣ��襭��
c15:
		call	k10keyb		;���� ����
		js		a90			;��祣� �� �������? - ��室
		call	c10coef		;����� �����樥�⮢
		call	f10agrc		;�⮣��� �����樥���
		call	g10elms		;����� ����� ����⮢
		jz		a20			;������ 1 �����? - ���室
		call	h10sort		;����஢�� �� ����
		call	j10mold		;���᫨�� ���. ����
		call	o10masd		;���᫨�� ����. ����
a20:
		call	mm10dis		;�뢥�� ������� �����
		call	tt10tab		;�뢥�� ⠡����
a80:
		call	cc10cln		;������ ��६����
		jmp		c15			;�������
a90:
		ret
main	endp
;				���� ���� � ����������:
;				--------------------------------------------
k10keyb	proc	near
		mov		cx,67				;����� ��ப�
		mov		dx,offset prompt	;���� ��ப� � �ਣ���.
		call	dd10out				;�뢥�� �ਣ��襭��
		mov		ah,3fh				;����� �����
		mov		bx,00				;���ன�⢮ (0 - ���������)
		mov		cx,80				;����. ����� ������ (� �����)
		mov		dx,offset fml		;���� ������ ��� ����� �����
		int		21h					;�맮� DOS
		cmp		ax,cx				;���᫥��� ᬥ饭�� ��᫥�����
		jb		k20					;	ᨬ���� � ��⮬ ������塞��
		mov		bx,dx				;	� ����� ᨬ����� 0ah � 0dh
		add		bx,cx
		dec		bx
		mov		cl,0ah
		cmp		cl,[bx]
		jz		k20
		mov		cl,0dh
		cmp		cl,[bx]
		jz		k30
		jmp		k40
k20:
		dec		ax
k30:
		dec		ax
k40:
		dec		ax
		ret
k10keyb	endp
;				����� �����樥�⮢:
;				--------------------------------------------
c10coef	proc	near
		call	d10prep			;�����⮢�� ��ࢮ�� ᨬ���� � �⥪�
		push	di					;�������� �㫥��� ������ � �⥪
		push	di					;�������� ������� � ����
c11:
		test	al,al			;����饭�� ᨬ���?
		jnz		c20					;	�� - �த������, ��� - ���室
		mov		cx,22				;����� ᮮ�饭�� �� �訡��
		mov		dx,offset err0		;���� ��ப� � ᮮ�饭��� �� �訡��
		call	rr10err				;�������� ��ࠡ��稪 �訡��
c20:
		cmp		al,01			;����?
		jnz		c30					;	�� - �த������, ��� - ���室
		call	i10ind				;�������� ������ � ��࠭��� ��� � CX
c30:
		cmp		al,02			;���筠� �㪢�?
		jnz		c31					;	�� - �த������, ��� - ���室
		mov		ah,[si]				;�������� ������
		dec		si					;������騩 ������
		jmp		c32					;��३� � �஢�થ
c31:
		cmp		al,03			;��������� �㪢�?
		jnz		c40					;	�� - �த������, ��� - ���室
		mov		ah,20h				;�������� �஡��
c32:
		call	e10elm				;�஢���� � ���� ����� �����
		jmp		c80
c40:
		cmp		al,04			;�ࠢ�� ᪮���?
		jnz		c50					;	�� - �த������, ��� - ���室
		inc		bkt					;+1 � �ਧ���� ����஫� ᪮���
		push	cx					;�������� ������ � ����
		push	di					;�������� ������� � ����
		mov		cx,1				;�������� 1 � ������
		jmp		c80
c50:
		cmp		al,05			;����� ᪮���?
		jnz		c60					;	�� - �த������, ��� - ���室
		dec		bkt					;-1 � �ਧ���� ����஫� ᪮���
		js		c85					;�� 墠⠥� �ࠢ�� ᪮���? - �訡��
c51:
		call	b10mulc				;���᫥��� �����樥�⮢
		pop		dx					;������� ᫮�� �� ���� (�������)
		pop		dx					;������� ᫮�� �� ���� (������)
		test	dx,dx				;������ (�⥪) �� ࠢ�� 0?
		jz		c51					;	�� - ���室, ��� - �த������
		jmp		c80
c60:
		cmp		al,06			;��񧤮窠?
		jnz		c80					;	�� - �த������, ��� - ���室
		call	s10star				;�஢�ઠ ᫥�. ������� � �����⮢��
c60a:
		call	b10mulc				;���᫥��� �����樥�⮢
		mov		ax,[bp+4]			;����㧨�� ������ �� �⥪�
		test	ax,ax				;������ (�⥪) ࠢ�� ��� (�뫠 ������窠)?
		jnz		c61					;	�� - �த������, ��� - ���室
		mov		[bp+2],di			;��⠭����� ����� ������� � �⥪
		jmp		c80
c61:
		xor		ax,ax
		push	ax					;�������� �㫥��� ������ � �⥪
		push	di					;�������� ������� � ����
c80:
		dec		si					;������騩 ������
		mov		al,[si]
		xlat
		cmp		si,offset fml	;��᫥���� ᨬ���?
		jnb		c11					;	��ࠡ���� ᫥���騩 ᨬ���
		cmp		cx,1				;��᫥���� ᨬ��� - �����樥��?
		ja		c60a				;	�������� �� �����樥��
		mov		ax,bkt				;�஢�ઠ �� ᮢ������� ������⢠
		test	ax,ax				;	����. � ���. ᪮���
		jz		c90 				;
c85:
		mov		cx,36				;����� ᮮ�饭�� �� �訡��
		mov		dx,offset err3		;���� ��ப� � ᮮ�饭��� �� �訡��
		call	rr10err				;�������� ��ࠡ��稪 �訡��
c90:
		test	di,di				;�� �� ������ ��� �� 1 �����?
		jnz		c95					;	� �����襭��
		mov		cx,41				;����� ᮮ�饭�� �� �訡��
		mov		dx,offset err5		;���� ��ப� � ᮮ�饭��� �� �訡��
		call	rr10err				;�������� ��ࠡ��稪 �訡��
c95:
		mov		sp,stk				;����⠭����� 㪠��⥫� �⥪�
		ret
c10coef	endp
;				�����⮢�� �⥪� � ��ࢮ�� ᨬ����:
;				--------------------------------------------
d10prep	proc	near
		mov		di,sp				;���࠭��� 㪠��⥫� �⥪�
		inc		di
		inc		di
		mov		stk,di
		mov		si,offset fml		;��⠭����� ���� ������
		add		si,ax
		mov		bx,offset xlt		;�����⮢��� ������
		mov		al,[si]				;	� �஢�થ
		xlat
		xor		di,di				;��砫쭠� �������/������
		mov		cx,1				;��⠭����� 1 � ������
		mov		ord,cx				;
		ret
d10prep	endp
;				���᫥��� ������:
;				--------------------------------------------
i10ind	proc	near
		xor		cx,cx				;���㫨�� ������
i20:
		mov		al,[si]				;�८�ࠧ����� ������ � �����
		and		al,0Fh
		mov		ah,0
		mul		ord					;�������� ����� �� �������
		jc		i70err				;�᫨ ��७��, �訡��
		add		cx,ax				;�ਡ����� ����� � ������
		jc		i70err					;�᫨ ��७��, �訡��
		dec		si					;������騩 ������
		mov		al,[si]				;�஢���� ������
		xlat
		cmp		al,01				;�᫨ ������ �� ᮤ�ন� ����,
		jnz		i80					;	��室
		mov		ax,ord				;�������� ������� � 10 ࠧ
		mul		ten
		jc		i70err					;�᫨ ��७��, �訡��
		mov		ord,ax
		jmp		i20					;������� ��� ᫥�. ᨬ����
i70err:
		dec		si					;���᫨�� ᨬ���, � ���ண�
		mov		al,[si]				;	��稭����� �訡��
		xlat
		cmp		al,01
		jz		i70err
		inc		si
		mov		cx,55				;����� ᮮ�饭�� �� �訡��
		mov		dx,offset err1		;���� ��ப� � ᮮ�饭��� �� �訡��
		call	rr10err				;�������� ��ࠡ��稪 �訡��
i80:
		test	cx,cx				;������ ࠢ��?
		jz		i70err				;	�訡��
		mov		ord,1				;�������� 1 � ���冷�
		ret							;��室
i10ind	endp
;				�஢�ઠ � ���� ����� �����:
;				--------------------------------------------
e10elm	proc	near
		push	bx					;���࠭��� ���� XLT
		push	cx					;���࠭��� ������
		push	di					;���࠭��� �������
		std							;����� ���ࠢ�
		mov		cx,118
		mov		di,offset el+234
		mov		al,[si]
		repne scasw					;���� ����� �����
		jnz		e30err				;�᫨ ����� �� ������, �訡��
		shl		cx,1				;���᫨�� ����� �����
		pop		di					;����⠭����� �������
		mov		bx,offset nn		;�������� ����� ����� � �����+�������
		mov		[bx+di],cx
		pop		cx					;����⠭����� ������
		mov		bx,offset coe		;�������� ������ � ����+�������
		mov		[bx+di],cx
		mov		cx,1				;�������� 1 � ������
		inc		di					;�������� �������
		inc		di
		pop		bx
e20:
		ret
e30err:
		mov		cx,38				;����� ᮮ�饭�� �� �訡��
		mov		dx,offset err2		;���� ��ப� � ᮮ�饭��� �� �訡��
		call	rr10err				;�������� ��ࠡ��稪 �訡��
e10elm	endp
;				���᫥��� �����樥�⮢:
;				--------------------------------------------
b10mulc	proc	near
		mov		bp,sp
		mov		ax,[bp+4]			;����㧨�� ������ �� �⥪�
		test	ax,ax				;������ (�⥪) ࠢ�� ��� (�뫠 ������窠)?
		jnz		b20					;	�� - �த������, ��� - ���室
		cmp		cx,1				;�����⥫� K ࠢ�� 1?
		jz		b50					;	�� - ���室, ��� - �த������
		mov		mult,cx				;�����⮢��� �����⥫� K
		jmp		b40
b20:
		cmp		dl,06				;�뫠 ������窠?
		jnz		b21					;	�� - �த������, ��� - ���室
		mov		ax,1		
b21:
		cmp		cx,1				;�����⥫� ࠢ�� 1?
		jz		b25					;	�� - ���室, ��� - �த������
		mul		cx
		jc		b50err				;��७��? - �訡��
		jmp		b30
b25:
		cmp		ax,1				;������ (�⥪) ࠢ�� 1?
		jnz		b30					;	�� - �த������, ��� - ���室
		test	ax,ax				;������ 䫠� ZF
		jmp		b50					;� �����襭��
b30:
		mov		mult,ax				;�������� ����+4 � ����
b40:
		push	di					;�������� ������� � ����
		call	m10mul				;���᫨�� �����樥���
		pop		di					;������� ������� �� ����
b50:
		ret
b50err:
		mov		cx,76				;����� ᮮ�饭�� �� �訡��
		mov		dx,offset err4		;���� ��ப� � ᮮ�饭��� �� �訡��
		mov		si,[nn+di]			;������� ᨬ��� ����� � �訡���
		mov		ax,word ptr [el+si]
		mov		word ptr errel,ax
		call	rr10err				;�������� ��ࠡ��稪 �訡��
b10mulc	endp
;				���᫥��� �����樥��:
;				--------------------------------------------
m10mul	proc	near
		push	bx
		mov		cx,di
		sub		cx,[bp+2]			;������ ���� �� �������
		shr		cx,1				;	� �������� १���� � ���
		jcxz	m80					;�᫨ ��� ࠢ�� 0, ��室
		mov		bx,offset coe
m20:
		dec		di					;�।���� �������
		dec		di
		mov		ax,[bx+di]			;�������� ����+������� �� ����
		mul		mult
		mov		[bx+di],ax
		jc		m90err				;�᫨ ��७��, �訡��
		loop	m20					;������� ������
		mov		cx,1				;��⠭����� 1 � ������
m80:
		pop		bx
		ret
m90err:
		mov		cx,76				;����� ᮮ�饭�� �� �訡��
		mov		dx,offset err4		;���� ��ப� � ᮮ�饭��� �� �訡��
		mov		si,[nn+di]			;������� ᨬ��� ����� � �訡���
		mov		ax,word ptr [el+si]
		mov		word ptr errel,ax
		call	rr10err				;�������� ��ࠡ��稪 �訡��
m10mul	endp
;				�஢�ઠ ������窨 � �����⮢��:
;				--------------------------------------------
s10star	proc	near
		push	ax
		cmp		si,offset fml		;������窠 - ���� ᨬ���?
		jz		s31err				;	�� - �訡��, ��� - �த������
		mov		al,[si-1]
		xlat					;�஢�ઠ ᨬ���� ��। '*'
		cmp		al,05				;����� ᪮���?
		jz		s30err				;	�� - �訡��, ��� - �த������
		cmp		al,06				;��񧤮窠?
		jz		s30err				;	�� - �訡��, ��� - �த������
		cmp		al,00				;���� ᨬ���?
		jz		s30err				;	�� - �訡��, ��� - �த������
s20:
		pop		dx
		ret
s30err:
		dec		si					;���᫨�� ���� �訡��
s31err:
		mov		cx,22				;����� ᮮ�饭�� �� �訡��
		mov		dx,offset err0		;���� ��ப� � ᮮ�饭��� �� �訡��
		call	rr10err				;�������� ��ࠡ��稪 �訡��
s10star	endp
;				�⮣��� �����樥��� (��ॣ��� �� ����⠬):
;				--------------------------------------------
f10agrc	proc	near
		mov		ax,offset pnt
		mov		elp,ax
		xor		si,si
		xor		bx,bx
		cld
		shr		di,1
		mov		cx,di			;����� ���� nn
		mov		bp,offset nn
f20:						;���� �����⮩ ����樨
		mov		di,bp
		mov		ax,0ffh
		repz scasw				;������� ������ �������?
		jz		f90				; ���: ��室
		push	cx
		push	di				; ��
		mov		bp,di			;  ���࠭��� ᫥�. ������
		sub		di,offset nn+2
		mov		dx,[coe+di]		;  ���࠭��� �����樥��
		mov		ax,[nn+di]		;  ���࠭��� �����
f30:						;���� ᮢ�������
		pop		di				;����⠭����� ������
		jcxz	f31
		repnz scasw				;���������� �. �������?
		jnz		f31
		push	di				; ��
		sub		di,offset nn+2
		add		dx,[coe+di]		;  �ਡ����� �����樥��
		jc		f92err			;��७��? - �訡��
		push	ax
		mov		ax,0ffh
		mov		[nn+di],ax
		pop		ax
		jmp		f30
f31:							; ���
		mov		[nn2+si],ax		;  ���࠭��� �����
		mov		[coe2+si],dx	;  ���࠭��� �����樥��
		add		scoe+2,dx			;  �ਡ����� ����. � �㬬�
		adc		scoe,0
		mov		[pnt+si],bx	;  ���࠭��� ���冷� �.
		pop		cx
		jcxz	f91
		inc		bx
		inc		bx
		inc		si
		inc		si
		jmp		f20
f90:
		dec		si
		dec		si				;���࠭��� 㪠���.
f91:							; ��᫥�. �����
		add		elp,si			; ��� ���஢��
		mov		eln,si
		ret
f92err:
		mov		cx,76				;����� ᮮ�饭�� �� �訡��
		mov		dx,offset err4		;���� ��ப� � ᮮ�饭��� �� �訡��
		mov		si,ax				;������� ᨬ��� ����� � �訡���
		mov		ax,word ptr [el+si]
		mov		word ptr errel,ax
		call	rr10err				;�������� ��ࠡ��稪 �訡��
f10agrc	endp
;				����� ����� ����⮢:
;				--------------------------------------------
g10elms	proc	near
		mov		di,[nn2+si]			;����㧨�� ����� �����
		mov		cx,[coe2+si]		;����㧨�� �����樥��
		mov		ax,[ac+di]			;���࠭��� �筮��� �����
		cmp		melc,ax				;����. �筮���
		jae		g30
		mov		melc,ax
g30:	;����� ����襩 ���
		mov		ax,[ma+di]
		mul		cx
		mov		bx,ax
		mov		bp,dx
		;����� ���襩 ���
		mov		ax,[md+di]
		mul		cx
		;�㬬� ����襩 � ���襩 ��⥩ bp:bx:dx
		add		bp,ax
		adc		dx,0
		mov		cx,dx
		;���࠭���� १����
		mov		di,3
		mov		ax,si
		mul		di
		mov		di,ax				;���饭�� �����
		mov		[elm+di+4],bx
		mov		[elm+di+2],bp
		mov		[elm+di],cx
		add		mm+4,bx				;�������� � ���. ����
		adc		mm+2,bp
		adc		mm,cx
		dec		si
		dec		si
		jns		g10elms	;(���室, �᫨ ����⥫쭮)
		mov		ax,eln				;�஢�ઠ ������⢠
		test	ax,ax				; ��������� ����⮢
		ret
g10elms	endp
;				����஢�� �� ���� (����쪮���):
;				--------------------------------------------
h10sort	proc	near
		mov		cl,3				;�����⥫�
		mov		bp,offset elm		;���� ��砫� ���浪��
h11:
		mov		bx,offset pnt		;�����⥫� �� ���浪�
		sub		ch,ch				;�ਧ��� ����⠭����
h20:	;�ࠢ����� ����:
		mov		si,[bx]				;�����⥫� �� n-� �����
		mov		di,[bx+2]			;�����⥫� �� n+1-� �����
		push	bx					;��१�ࢨ஢��� ॣ�����
		push	si
		push	di
		mov		bx,bp			;���� ⠡���� ����
		mov		ax,si				;���� ����� n-��� �����
		mul		cl
		mov		si,ax
		mov		ax,di				;���� ����� n+1-��� �����
		mul		cl
		mov		di,ax
h30:
		mov		dx,[bx+si]			;�ࠢ����� 4-� ࠧ�冷� ����
		cmp		dx,[bx+di]			;������ ࠢ��?
		jnz		h31
		inc		si
		inc		si
		inc		di
		inc		di					; �� - �஢����
		jmp		h30					;   ᫥���騥 4 ࠧ�鸞
h31:								; ��� - ����⠭����� ॣ�����
		pop		di
		pop		si
		pop		bx					;���� n >= ����� n+1
		jae		h40					; �� - ��३� � ᫥�. ���浪�
		mov		[bx],di				; ��� - ����⠭����
		mov		[bx+2],si
		mov		ch,cl				;��⠭����� �ਧ�. ����⠭.
h40:
		inc		bx
		inc		bx
		cmp		bx,elp				;��᫥���� �����?
		jnz		h20					; ��� - �ࠢ���� ᫥�. ������
		test	ch,ch				; �� - �ਧ�. �����. ����?
		jnz		h11					;  ��� - ����� ���஢�� ᭠砫�
h50:
		mov		si,eln				;32
		cmp		si,rowp				;������⢮ ����⮢ <= 17?
		jbe		h60					; �ய����� ��ॣ�஢���� ���� ��.
		call	ag10agr				;��ॣ�஢��� ��稥 ������
h60:
		ret							;  �� - ��室
h10sort	endp
;				��ॣ�஢���� ���� ����⮢:
;				--------------------------------------------
ag10agr	proc	near				;���࠭��� 㪠��⥫� �⥪�
		mov		stk+2,sp
		xor		cx,cx				;�㬬� �����樥�⮢ cx
		xor		dx,dx				;�㬬� ����:
		xor		sp,sp
		xor		bp,bp				;  dx:sp:bp
		mov		bl,3				;�����⥫�
ag20:
		mov		di,[pnt+si]
		add		cx,[coe2+di]		;�ਡ����� �����樥��
		jc		ag90err				;��९�������? -�訡��
		mov		ax,di
		mul		bl
		mov		di,ax
		add		bp,[di+elm+4]		;�ਡ����� �����
		adc		sp,[di+elm+2]
		adc		dx,[di+elm+0]
		dec		si
		dec		si
		cmp		si,rowp				;��᫥���� �. �� �ன���?
		jae		ag20				;	������� ᫮�����
		mov		[di+elm+4],bp		;���࠭��� �����
		mov		[di+elm+2],sp
		mov		[di+elm+0],dx
		mov		di,[si+pnt+2]
		mov		[di+coe2],cx		;���࠭��� �����樥��
		mov		ax,elx
		mov		[di+nn2],ax			;�������� 㪠���. �� ���. �.
		mov		sp,stk+2			;����⠭����� 㪠��⥫� �⥪�
		add		si,offset pnt+2		;										+		
		mov		elp,si
		ret							;��室
ag90err:
		mov		cx,46				;����� ᮮ�饭�� �� �訡��
		mov		dx,offset err6		;���� ��ப� � ᮮ�饭��� �� �訡��
		mov		sp,stk				;����⠭����� 㪠��⥫� �⥪�
		call	rr10err				;�������� ��ࠡ��稪 �訡��
ag10agr	endp
;				���᫥��� ����୮� ����:
;				--------------------------------------------
j10mold	proc	near
		call	l10div			;�����⮢�� ����⥫� bp:di
		mov		bx,offset mold	;���� ��ࢮ� ����
		mov		si,eln			;���饭�� ��᫥�. ����.
j11:							;�����⮢�� ��������,
		mov		ax,[bx+si-mcoe]	; (����.*100%) �
		mul		pp100			; ax:dx
j12:
		test	dh,dh			;�������� �������
		js		j13				; ��� ����� �����
		shl		ax,1
		rcl		dx,1
		dec		cx
		jmp		j12
j13:
		cmp		cx,0ffffh		;������� ᫨誮 ����?
		jl		j30				; �������� ��ࠡ���
		cmp		cx,0
		jl		j14
		jz		j15	
		call	n10div			; ����㯨�� � �������
j14:
		shl		ax,1			;���४�஢�� �筮��
		rcl		dx,1			;�������� ����. >= �����.?
j15:
		cmp		dx,di
		ja		j20
		jb		j30
		cmp		ax,bp
		jb		j30				; ��� - �� ���४�஢���
j20:							; �� - 
		inc		word ptr [bx+si];  +1 � 1-� ��� ��⭮��
j30:
		mov		di,scoes		;����⠭����� ����⥫�
		mov		bp,scoes+2
		mov		cx,cycle		;����⠭����� ���稪
		dec		si
		dec		si
		jns		j11
		ret
j10mold	endp
;				�����⮢�� ����⥫�:
;				--------------------------------------------
l10div	proc	near
		mov		dh,byte ptr scoe+0
		mov		dl,byte ptr scoe+3
		mov		ah,byte ptr scoe+2
		xor		al,al
		mov		cx,4	;������⢮ 横��� ᤢ��� ����⥫�
l11:
		shl		ax,1
		rcl		dx,1
		loop	l11
		mov		cx,12	;���稪 ᤢ��� �� �������
l20:
		test	dh,dh
		js		l21
		inc		cx		;�������� ���稪 ᤢ���
		shl		ax,1
		rcl		dx,1
		jmp		l20
l21:
		mov		bp,ax				;����⥫� �
		mov		di,dx				; bp:di
		mov		scoes,di
		mov		scoes+2,bp
		mov		cycle,cx
		ret
l10div	endp
;				������� � �⮫���:
;				--------------------------------------------
n10div	proc	near
		cmp		dx,di			;������� 1 > ����⥫� 1?
		ja		n30				; �� - ������, ��� - �த���
		jb		n21
		cmp		ax,bp
		jae		n30
n21:
		shr		di,1			;�������� ����⥫�
		rcr		bp,1			;  �� 1 ��� ��ࠢ�
		shl		word ptr [bx+si],1;�������� ��⭮�
		loop	n10div			;  �� 1 ��� �����
		jmp		n40
n30:
		sub		ax,bp			;������ ����⥫� �� �����.
		sbb		dx,di
		inc		word ptr [bx+si];+1 � 1-� ��� ��⭮��
		jmp		n10div
n40:
		ret
n10div	endp
;				���᫥��� ���ᮢ�� ����:
;				--------------------------------------------
o10masd	proc	near
		call	p10div1			;�����⮢�� ����⥫� � mml
		mov		bx,offset masd	;���� ��ࢮ� ����
		mov		si,eln			;���饭��
o11:
		call	r10div2			;�����⮢�� ��������
		cmp		cx,0ffffh		;������� ᫨誮 ����?
		jl		o30				; �������� ��ࠡ���
		mov		ax,[mml+0]		;����㧨�� ����⥫�
		mov		dx,[mml+2]		; � ax:dx:bp:di
		mov		bp,[mml+4]
		xor		di,di
		cmp		cx,di
		jl		o14
		jz		o15
		call	t10div3			;����㯨�� � �������
o14:
		shl		[delim+6],1		;���४�஢�� �筮��
		rcl		[delim+4],1
		rcl		[delim+2],1
		rcl		[delim+0],1
o15:
		cmp		[delim+0],ax
		ja		o20
		jb		o30
		cmp		[delim+2],dx		
		ja		o20
		jb		o30
		cmp		[delim+4],bp
		ja		o20
		jb		o30
		cmp		[delim+6],di
		jb		o30
o20:
		inc		word ptr [bx+si];  +1 � 1-� ��� ��⭮��
o30:
		mov		di,offset delim	;����� �������
		mov		cx,4
		xor		ax,ax
		cld
		rep stosw
		mov		cx,cycle		;����⠭����� ���稪
		dec		si
		dec		si
		jns		o11
		ret
o10masd	endp
;				�����⮢�� ����⥫�:
;				--------------------------------------------
p10div1	proc	near
		mov		bp,mm+0
		mov		dx,mm+2
		mov		ax,mm+4
		mov		cx,16		;���稪 (ࠧ��� � ����
p20:						; ����� ����⥫�� � ������ Z
		test	bp,bp
		js		p21
		inc		cx			;�������� ���稪 ᤢ���
		shl		ax,1		; �� Y
		rcl		dx,1
		rcl		bp,1
		jmp		p20			;����⥫� �
p21:						; ax:dx:bp
		mov		mml+0,bp	;���࠭��� ����⥫�
		mov		mml+2,dx
		mov		mml+4,ax
		mov		cycle,cx	;���࠭��� ���稪
		ret
p10div1	endp
;				�����⮢�� ��������:
;				--------------------------------------------
r10div2	proc	near
		push	bx
		push	si
		mov		bx,offset elm+4
		mov		ax,3
		mul		si
		mov		di,ax
		mov		si,6
r20:
		mov		ax,[bx+di]
		mul		pp100
		add		[delim+si],ax
		dec		si
		dec		si
		adc		[delim+si],dx
		dec		di
		dec		di
		test	si,si
		jnz		r20
		mov		ah,80h
r30:
		test	[delim+0],ax	;�������� �������
		js		r40				; ��� ����� ����� �� X ���
		shl		[delim+6],1		; �⮣� (Y+Z)-X � CX
		rcl		[delim+4],1
		rcl		[delim+2],1
		rcl		[delim+0],1
		dec		cx
		jmp		r30
r40:
		pop		si
		pop		bx
		ret
r10div2	endp
;				������� � �⮫���:
;				--------------------------------------------
t10div3	proc	near
		cmp		[delim+0],ax
		ja		t30
		jb		t21
		cmp		[delim+2],dx		
		ja		t30
		jb		t21
		cmp		[delim+4],bp
		ja		t30
		jb		t21
		cmp		[delim+6],di
		jae		t30
t21:
		shr		ax,1			;�������� ����⥫�
		rcr		dx,1			;  �� 1 ��� ��ࠢ�
		rcr		bp,1
		rcr		di,1
		shl		word ptr [bx+si],1;�������� ��⭮�
		loop	t10div3			;  �� 1 ��� �����
		jmp		t40
t30:
		sub		[delim+6],di	;������ ����⥫� �� �����.
		sbb		[delim+4],bp
		sbb		[delim+2],dx
		sbb		[delim+0],ax
		inc		word ptr [bx+si];+1 � 1-� ��� ��⭮��
		jmp		t10div3
t40:
		ret
t10div3	endp
;				�뢮� ����୮� ����� � ASCII-�ଠ�
;				--------------------------------------------
mm10dis	proc	near
		mov		ax,offset mmasc0+15
		mov		pmmasc,ax
		mov		ax,[mm+0]
		mov		bx,[mm+2]
		mov		dx,[mm+4]
mm20:
		call	mc10dv1		;�����⮢��� �����. � �����.
		call	md10dv2		;������
		call	me10asc		;�८�ࠧ����� � ASCII-�ଠ�
		test	ax,ax		;���⭮� ����� 10?
		jnz		mm20
		test	bx,bx
		jnz		mm20
		test	dx,dx
		jnz		mm20		; ������� �������
		call	mv10mov			;��६����� � ���㣫���
		mov		cx,di			;�����⮢�� � �뢮��
		mov		dx,offset resmm	;	����_ᮮ�饭��
		sub		cx,dx			;	�����_ᮮ�饭��
		call	dd10out			;�뢥�� १���� �� �࠭
		ret
mm10dis	endp
;				�����⮢�� ��������:
;				--------------------------------------------
mc10dv1	proc	near
		mov		cl,44		;������⢮ ᤢ���� �� �������
		mov		ch,cl
mc20:
		test	ax,ax		;�������� �������
		js		mc30		; ��� ����� �����
		shl		dx,1
		rcl		bx,1
		rcl		ax,1
		dec		cl
		test	cl,cl
		jz		mc30
		jmp		mc20
mc30:
		mov		[mm+0],ax
		mov		[mm+2],bx
		mov		[mm+4],dx
		xor		ax,ax		;���⭮� - ax:bx:dx
		xor		bx,bx
		xor		dx,dx
		mov		bp,0a000h	;����㧨�� �����.(10) � bp:si:di
		xor		si,si
		xor		di,di
		sub		ch,cl		;���࠭��� ������⢮ ᤢ����
		ret
mc10dv1	endp
;				�������	� �⮫���
;				--------------------------------------------
md10dv2	proc	near
		cmp		[mm+0],bp
		ja		md30
		jb		md20
		cmp		[mm+2],si
		ja		md30
		jb		md20
		cmp		[mm+4],di
		jb		md20
md30:
		sub		[mm+4],di	;������ ����⥫� �� �����.
		sbb		[mm+2],si
		sbb		[mm+0],bp
		inc		dx			;�ਡ����� 1 � ��⭮��
md20:
		test	cl,cl
		jz		md40
		dec		cl
		shr		bp,1		;�������� ����⥫� ��ࠢ�
		rcr		si,1
		rcr		di,1
		shl		dx,1		;�������� ��⭮� �����
		rcl		bx,1
		rcl		ax,1
		jmp		md10dv2
md40:
		ret
md10dv2	endp
;				�८�ࠧ������ � ASCII-�ଠ�
;				--------------------------------------------
me10asc	proc	near
		test	ch,ch	;������� ���⮪ ���⭮ ��ࠢ�
		jz		me20
me11:
		shr		[mm+0],1
		rcr		[mm+2],1
		rcr		[mm+4],1
		dec		ch
		jnz		me11
me20:
		mov		ch,byte ptr [mm+4]	;�८�ࠧ����� ᨬ���
		or		ch,30h
		mov		si,pmmasc
		mov		[si],ch
		dec		si
		mov		pmmasc,si
		inc		lenmm				;+1 � ���稪� ᨬ�����
		ret
me10asc	endp
;				��६�饭�� � 㤠����� ��譨� �㫥�:
;				--------------------------------------------
mv10mov	proc	near
		inc		si
		mov		di,offset mmasc0
		mov		cx,lenmm
		sub		cx,6
		cld
		rep	movsb
		cmp		melc,cx			;��筮��� ࠢ�� 0?
		jz		mv30			;	���室
		mov		ax,','			;�������� �������
		mov		[di],ax
		inc		di
		mov		cx,melc			;�������� ����� ��᫥ ����⮩
		rep	movsb
mv30:
		mov		cx,9			; � ⥪�� ' g/mol.'
		mov		si,offset gmol
		rep	movsb
		ret
mv10mov	endp
;				����஥��� ⠡����:
;				--------------------------------------------
tt10tab	proc	near
		mov		cx,82				;�뢮� ��������� ⠡����:
		mov		dx,offset head
		call	dd10out
		mov		bx,offset pnt
tt20:
		mov		si,[bx]
		mov		di,[si+nn2]
		mov		cx,10				;����⥫� ��� ��ॢ��� � ASCII
		call	y10name				;������������ ����⮢
		cmp		di,elx				;��稥 ������?
		jnz		tt30
		mov		al,'-'
		mov		num,al
		mov		atm,al
		jmp		tt40
tt30:
		call	v10eln				;������ � ����� �����
		call	z10atm				;�⮬��� ����
tt40:
		call	w10num				;������⢮ �⮬��
		call	x10pp				;������ � ���ᮢ� ����
		mov		cx,80				;�뢮� ��ப� ⠡����:
		mov		dx,offset row
		push	bx
		call	dd10out
		pop		bx					;�����⮢�� � �뢮�� ᫥���饩 ��ப�
		inc		bx
		inc		bx
		mov		di,offset row		;���⪠ ��ப�
		mov		al,20h
		cld
		rep stosb
		cmp		bx,elp
		jbe		tt20
		ret
tt10tab	endp
;				����祭�� ASCII ����������� �����:
;				--------------------------------------------
y10name	proc	near
		push	cx
		push	di
		push	si
		shr		di,1
		mov		ax,di
		mov		cx,13
		mul		cl
		add		ax,offset nm
		mov		si,ax
		mov		di,offset elnm
		cld
		rep movsb
		pop		si
		pop		di
		pop		cx
		ret
y10name	endp
;				����祭�� ASCII ᨬ���� � ����� �����:
;				--------------------------------------------
v10eln	proc	near
		mov		ax,word ptr [di+el]	;������ �����
		mov		word ptr sym,ax
		mov		ax,di				;����� �����
		xor		di,di
		shr		ax,1
		inc		ax
v20:
		mov		ah,0
		div		cl
		or		ah,30h
		mov		[di+num],ah
		dec		di
		test	al,al
		jnz		v20
		ret
v10eln	endp
;				����祭�� ASCII ������⢠ �⮬��:
;				--------------------------------------------
w10num	proc	near
		xor		di,di
		mov		ax,[si+coe2]
w20:
		xor		dx,dx
		div		cx
		or		dl,30h
		mov		[di+atn],dl
		dec		di
		test	ax,ax
		jnz		w20
		ret
w10num	endp
;				����祭�� ASCII �⮬��� �����:
;				--------------------------------------------
z10atm	proc	near
		push	bx
		push	cx
		push	si
		mov		ax,offset atm
		mov		pmmasc,ax
		mov		di,[si+nn2]
		mov		ax,[di+ac]
		mov		bp,6
		sub		bp,ax			;���稪 ��譨� �㫥�
		mov		melc,ax			;��筮��� �⮬��� �����
		mov		ax,[di+md]		;�⮬��� ���� ax:dx
		mov		dx,[di+ma]
z20:
		push	bp
		call	zk10dv1			;����⥫� � �������
		call	zm10dv2			;�������
		pop		bp
		cmp		bp,0
		jg		z30
		call	zn10asc			;�८�ࠧ������
z30:
		dec		bp
		test	ax,ax		;���⭮� ����� 10?
		jnz		z20
		test	dx,dx
		jnz		z20			; ������� �������
		pop		si
		pop		cx
		pop		bx
		ret
z10atm	endp
;				�����⮢�� ����⥫� � ��������:
;				--------------------------------------------
zk10dv1	proc	near
		mov		cl,28		;������⢮ ᤢ���� �� �������
		mov		ch,cl
zk20:
		test	ax,ax		;�������� �������
		js		zk30		; ��� ����� �����
		shl		dx,1
		rcl		ax,1
		dec		cl
		test	cl,cl
		jz		zk30
		jmp		zk20
zk30:
		mov		si,ax
		mov		bx,dx
		xor		ax,ax		;���⭮� - ax:dx
		xor		dx,dx
		mov		bp,0a000h	;����㧨�� �����.(10) � bp:di
		xor		di,di
		sub		ch,cl		;���࠭��� ������⢮ ᤢ����
		ret
zk10dv1	endp
;				�������	� �⮫���
;				--------------------------------------------
zm10dv2	proc	near
		cmp		si,bp
		ja		zm30
		jb		zm20
		cmp		bx,di
		jb		zm20
zm30:
		sub		bx,di		;������ ����⥫� �� �����.
		sbb		si,bp
		inc		dx			;�ਡ����� 1 � ��⭮��
zm20:
		test	cl,cl
		jz		zm40
		dec		cl
		shr		bp,1		;�������� ����⥫� ��ࠢ�
		rcr		di,1
		shl		dx,1		;�������� ��⭮� �����
		rcl		ax,1
		jmp		zm10dv2
zm40:
		ret
zm10dv2	endp
;				�८�ࠧ������ � ASCII-�ଠ�
;				--------------------------------------------
zn10asc	proc	near
		test	ch,ch	;�������� ���⮪ ���⭮ ��ࠢ�
		jz		zn20
zn11:
		shr		si,1
		rcr		bx,1
		dec		ch
		jnz		zn11
zn20:
		mov		ch,byte ptr bl		;�८�ࠧ����� ᨬ���
		or		ch,30h
		mov		si,pmmasc
		mov		[si],ch
		dec		si
		mov		pmmasc,si
		mov		cl,byte ptr melc
		cmp		cl,1
		jnz		zn30
		mov		ch,','
		mov		[si],ch
		dec		pmmasc
zn30:
		dec		byte ptr melc
		ret
zn10asc	endp
;				����祭�� ASCII ������� � ���ᮢ�� �����:
;				--------------------------------------------
x10pp	proc	near
		mov		ax,eln
		test	ax,ax				;������ ⮫쪮 1 �����?
		jz		x50					; �ய����� ����
		push	bx
		mov		ax,[si+mold]
		mov		bx,offset molp
x15:
		xor		di,di
		mov		bp,3			;���稪 ��������� ����⮩
x20:
		xor		dx,dx
		div		cx
		or		dl,30h
x25:
		mov		[bx+di],dl
		dec		di
		dec		bp
		cmp		bp,1
		jnz		x30
		mov		dl,','
		jmp		x25
x30:
		cmp		bp,0
		jge		x20
		test	ax,ax
		jnz		x20
		cmp		bx,offset wgtp
		jz		x40
		mov		ax,[si+masd]
		mov		bx,offset wgtp
		jmp		x15
x40:
		pop		bx
		ret
x50:			;�������� 100,00 %
		std
		mov		si,offset ppt+5
		mov		di,offset molp
		mov		cx,6
		rep movsb
		mov		si,offset ppt+5
		mov		di,offset wgtp
		mov		cx,6
		rep movsb
		ret
x10pp	endp
;				��ࠡ�⪠ �訡��:
;				--------------------------------------------
rr10err	proc	near
		call	dd10out				;�뢥�� ᮮ�饭��
		cmp		dx,offset err3		;������ �訡. ᨬ���� �� �ॡ����?
		jae		rr30				; �ய����� ���� ����樨
		mov		di,offset col+1		;�������� ������ �訡��
		sub		si,offset fml
		inc		si
		mov		ax,si
		div		byte ptr ten
		or		ah,30h
		mov		[di],ah
		test	al,al
		jz		rr20
		dec		di
		or		al,30h
		mov		[di],al
rr20:
		mov		cx,22				;����� ��ப� � ᮮ��.
		mov		dx,offset errc		;���� ��ப� � ᮮ��.
		call	dd10out				;�뢥�� ᮮ�饭��
rr30:
		mov		bp,stk				;�ਣ�⮢����� � �������
		mov		sp,offset a80		; � ������� ��楤���
		mov		[bp],sp
		mov		sp,bp
		ret							;������ � ������� ��楤���
rr10err	endp
;				�뢮� �� �࠭:
;				--------------------------------------------
dd10out	proc	near
		mov		ah,40h
		mov		bx,1
		int		21h
		ret
dd10out	endp
;				���� ���祭�� ��६�����:
;				--------------------------------------------
cc10cln	proc	near
		cld
		mov		di,offset v_bg	;���� ��砫� ��६�����
		mov		cx,parlen		;����� ����� ��६�����
		xor		ax,ax
		rep	stosw
		ret
cc10cln	endp
codesg	ends
		end		begin