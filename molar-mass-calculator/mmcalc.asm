title	Molar mass calculator (com)	;Используется MASM 6.11
codesg	segment	para 'code'			; и DOSBox 0.74
		assume	cs:codesg, ds:codesg, ss:codesg, es:codesg
		org		100h
begin:	jmp		main
;-----------------------------------------------------------
		db	?	;выравнивание адресации на границу слова

		;Сокращенные наименования элементов:
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

		;Младшие разряды атомной массы (*10^-6):
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

		;Старшие разряды атомной массы (*10^-6):
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

		;Точность атомной массы (кол-во знаков после запятой):
ac		dw	6,6,4,6,4,4,6,4,6,4,6,4,6,3,6,4,4,3,4,3,6,3,4,4
		dw	6,3,6,4,3,2,3,2,6,3,3,3,4,2,5,3,5,2,0,2,5,2,4,3
		dw	3,3,3,2,5,3,6,3,5,3,5,3,0,2,3,2,5,3,5,3,5,3,4,2
		dw	5,2,3,2,3,3,6,3,4,1,5,0,0,0,0,0,0,4,5,5,0,0,0,0
		dw	0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0

		;Полные наименования элементов:
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
nmx		db	'other        '	;Прочие элементы

		;Таблица перекодировки символов в формуле
xlt		db	40  dup(00)
		db	05, 04, 06		;Символы (, ), *
		db	5   dup(00)
		db	10  dup(01)		;Цифры 0-9
		db	7   dup(00)
		db	26  dup(03)		;Заглавные буквы
		db	05, 00, 04		;Символы [, \, ]
		db	3   dup(00)
		db	26  dup(02)		;Строчные буквы
		db	133 dup(00)		;Остальные символы

		db	?				;Выравнивание на границу слова

		;Числовые константы
ten		dw	10				;Десяток
pp100	dw	10000			;100,00 %

		;Переменные
stk		dw	?,?				;Поле для хранения указателей стека
mult	dw	?				;Множитель коэффициента
ord		dw	?				;Порядок разряда
cycle	dw	?				;Счетчик циклов (в т.ч. сдвига)
elp		dw	?				;Последний эл. в pnt
eln		dw	?				;Смещение посл. эл.
pmmasc	dw	?				;Указатель на посл. символ массы
fml		db	80  dup(?)		;Область формулы (ASCII)
nn		dw	80	dup(?)		;Номера элементов (смещения)
coe		dw	80	dup(?)		;Коэффициенты
nn2		dw	48 	dup(?)		;Номера элементов (групп.)
coe2	dw	48	dup(?)		;Коэффициенты (сумм.)
elm		dw	144 dup(?)		;Сум. масса элемента

		;Переменные, подлежащие сбросу
v_bg	label	word
pnt		dw	48 	dup(0)		;Порядок элемента
masd	dw	48 	dup(0)		;Массовые доли * 100%
mold	dw	48 	dup(0)		;Молярные доли * 100%
bkt		dw	0				;Признак совпадения закр. и откр. скобок
melc	dw	0				;Максимальная точность
scoe	dw	2 	dup(0)		;Сумма коэффициентов
scoes	dw	2	dup(0)		;Сумма коэффициентов (сдвинутая)
mm		dw	3 	dup(0)		;Молекулярная масса
mml		dw	3 	dup(0)		;Молекулярная масса (сдвинутая)
delim	dw	4 	dup(0)		;Делимое
lenmm	dw	0				;Длина строки массы (ASCII)
v_end	label	word

		;Псевдонимы
elx		equ ma-el			;Адрес прочих элементов
mcoe	equ	mold-coe2
parlen	equ	(v_end-v_bg)/2	;Размер области с переменными
tb		equ	09 				;Табуляция
cr		equ	0dh				;Возврат каретки
lf		equ	0ah				;Перевод (конец) строки
rowp	equ	30				;Смещение проочих элементов

info	db	cr,lf
		db	' Molar mass calculator 1.0 (20.05.2018). Created by V.A. Markov.'
		db	cr,lf

		;Вывод молярной массы
prompt	db	cr,lf
		db	' Enter the molecular formula, e.g., Ca[Cr(NH3)2(NCS)4]2*2H2O:'
		db	cr,lf
resmm	db	cr,lf,' Molar mass: '	;Сообщение вывода массы
mmasc0	db	24 dup(20h)			;Молярная масса в ASCII-формате
gmol	db	' g/mol.',cr,lf	;Размерность

		;Заголовок таблицы
head	db	cr,lf,' Element       Number   Atomic mass g/mol'
		db	'   Number of atoms   Mole %   Weight % '

		;Строка таблицы		Направление записи строк
row		db	1	dup(20h)
sym		db	3	dup(20h)	;	 >			Символ элемента
elnm	db	16	dup(20h)	;	 >			Наименование элемента
num		db	20	dup(20h)	;	<			Порядковый номер элемента
atm		db	18	dup(20h)	;	<			Атомная масса элемента
atn		db	9	dup(20h)	;	<			Количество атомов элемента
molp	db	11 	dup(20h)	;	<			Молярная доля элемента, %
wgtp	db	2 	dup(20h)	;	<			Массовая доля элемента, %

ppt		db	'100,00'		;100 %

		;Сообщения об ошибках
err0	db	cr,lf,tb,'Invalid character',cr,lf
err1	db	cr,lf,tb,'The index can not be equal 0 or greater than 65535',cr,lf
err2	db	cr,lf,tb,'Incorrect chemical element symbol',cr,lf
err3	db	cr,lf,tb,'Missing opening/closing bracket',cr,lf
err4	db	cr,lf,tb,'The total number of atoms of one element '
		db	'can not be more than 65535: ';,cr,lf,tb,tb
errel	db	'  ',cr,lf			;Символ элемента с ошибкой
err5	db	cr,lf,tb,'At least one element must be entered',cr,lf
err6	db	cr,lf,tb,'The total number of atoms must be reduced',cr,lf
errc	db	tb,'Error at Column: '
col		db	'  ',cr,lf			;Позиция неправильного символа
;-----------------------------------------------------------
;				Главная процедура:
;				--------------------------------------------
main	proc	near
		mov		cx,68				;Длина строки
		mov		dx,offset info		;Адрес строки с приглаш.
		call	dd10out				;Вывести приглашение
c15:
		call	k10keyb		;Ввод формулы
		js		a90			;Ничего не введено? - выход
		call	c10coef		;Расчет коэффициентов
		call	f10agrc		;Итоговые коэффициенты
		call	g10elms		;Расчет массы элементов
		jz		a20			;Введен 1 элемент? - переход
		call	h10sort		;Сортировка по массе
		call	j10mold		;Вычислить мол. долю
		call	o10masd		;Вычислить масс. долю
a20:
		call	mm10dis		;Вывести молярную массу
		call	tt10tab		;Вывести таблицу
a80:
		call	cc10cln		;Сбросить переменные
		jmp		c15			;Повторить
a90:
		ret
main	endp
;				Ввод формулы с клавиатуры:
;				--------------------------------------------
k10keyb	proc	near
		mov		cx,67				;Длина строки
		mov		dx,offset prompt	;Адрес строки с приглаш.
		call	dd10out				;Вывести приглашение
		mov		ah,3fh				;Запрос ввода
		mov		bx,00				;Устройство (0 - клавиатура)
		mov		cx,80				;Макс. длина данных (в байтах)
		mov		dx,offset fml		;Адрес области для записи ввода
		int		21h					;Вызов DOS
		cmp		ax,cx				;Вычисление смещения последнего
		jb		k20					;	символа с учетом добавляемых
		mov		bx,dx				;	в конец символов 0ah и 0dh
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
;				Расчет коэффициентов:
;				--------------------------------------------
c10coef	proc	near
		call	d10prep			;Подготовка первого символа и стека
		push	di					;Поместить нулевой ИНДЕКС в стек
		push	di					;Поместить ПОЗИЦИЯ в СТЕК
c11:
		test	al,al			;Запрещенный символ?
		jnz		c20					;	да - продолжить, нет - переход
		mov		cx,22				;Длина сообщения об ошибке
		mov		dx,offset err0		;Адрес строки с сообщением об ошибке
		call	rr10err				;Запустить обработчик ошибок
c20:
		cmp		al,01			;Цифра?
		jnz		c30					;	да - продолжить, нет - переход
		call	i10ind				;Рассчитать индекс и сохранить его в CX
c30:
		cmp		al,02			;Строчная буква?
		jnz		c31					;	да - продолжить, нет - переход
		mov		ah,[si]				;Поместить СИМВОЛ
		dec		si					;Следующий СИМВОЛ
		jmp		c32					;Перейти к проверке
c31:
		cmp		al,03			;Заглавная буква?
		jnz		c40					;	да - продолжить, нет - переход
		mov		ah,20h				;Поместить пробел
c32:
		call	e10elm				;Проверить и найти номер элемента
		jmp		c80
c40:
		cmp		al,04			;Правая скобка?
		jnz		c50					;	да - продолжить, нет - переход
		inc		bkt					;+1 к признаку контроля скобок
		push	cx					;Поместить ИНДЕКС в СТЕК
		push	di					;Поместить ПОЗИЦИЯ в СТЕК
		mov		cx,1				;Поместить 1 в ИНДЕКС
		jmp		c80
c50:
		cmp		al,05			;Левая скобка?
		jnz		c60					;	да - продолжить, нет - переход
		dec		bkt					;-1 к признаку контроля скобок
		js		c85					;Не хватает правой скобки? - ошибка
c51:
		call	b10mulc				;Вычисление коэффициентов
		pop		dx					;Удалить слово из СТЕК (ПОЗИЦИЯ)
		pop		dx					;Удалить слово из СТЕК (ИНДЕКС)
		test	dx,dx				;ИНДЕКС (стек) был равен 0?
		jz		c51					;	да - переход, нет - продолжить
		jmp		c80
c60:
		cmp		al,06			;Звёздочка?
		jnz		c80					;	да - продолжить, нет - переход
		call	s10star				;Проверка след. СИМВОЛа и подготовка
c60a:
		call	b10mulc				;Вычисление коэффициентов
		mov		ax,[bp+4]			;Загрузить ИНДЕКС из стека
		test	ax,ax				;Индекс (стек) равен нулю (была звездочка)?
		jnz		c61					;	да - продолжить, нет - переход
		mov		[bp+2],di			;Установить новую ПОЗИЦИЮ в стек
		jmp		c80
c61:
		xor		ax,ax
		push	ax					;Поместить нулевой ИНДЕКС в стек
		push	di					;Поместить ПОЗИЦИЯ в СТЕК
c80:
		dec		si					;Следующий СИМВОЛ
		mov		al,[si]
		xlat
		cmp		si,offset fml	;Последний символ?
		jnb		c11					;	обработать следующий символ
		cmp		cx,1				;Последний символ - коэффициент?
		ja		c60a				;	Умножить на коэффициент
		mov		ax,bkt				;Проверка на совпадение количества
		test	ax,ax				;	закр. и откр. скобок
		jz		c90 				;
c85:
		mov		cx,36				;Длина сообщения об ошибке
		mov		dx,offset err3		;Адрес строки с сообщением об ошибке
		call	rr10err				;Запустить обработчик ошибок
c90:
		test	di,di				;Был ли введен хотя бы 1 элемент?
		jnz		c95					;	К завершению
		mov		cx,41				;Длина сообщения об ошибке
		mov		dx,offset err5		;Адрес строки с сообщением об ошибке
		call	rr10err				;Запустить обработчик ошибок
c95:
		mov		sp,stk				;Восстановить указатель стека
		ret
c10coef	endp
;				Подготовка стека и первого символа:
;				--------------------------------------------
d10prep	proc	near
		mov		di,sp				;Сохранить указатель стека
		inc		di
		inc		di
		mov		stk,di
		mov		si,offset fml		;Установить адрес СИМВОЛ
		add		si,ax
		mov		bx,offset xlt		;Подготовить СИМВОЛ
		mov		al,[si]				;	к проверке
		xlat
		xor		di,di				;Начальная ПОЗИЦИЯ/ИНДЕКС
		mov		cx,1				;Установить 1 в ИНДЕКС
		mov		ord,cx				;
		ret
d10prep	endp
;				Вычисление индекса:
;				--------------------------------------------
i10ind	proc	near
		xor		cx,cx				;Обнулить ИНДЕКС
i20:
		mov		al,[si]				;Преобразовать СИМВОЛ в ДВОИЧ
		and		al,0Fh
		mov		ah,0
		mul		ord					;Умножить ДВОИЧ на ПОРЯДОК
		jc		i70err				;Если перенос, ошибка
		add		cx,ax				;Прибавить ДВОИЧ к ИНДЕКС
		jc		i70err					;Если перенос, ошибка
		dec		si					;Следующий СИМВОЛ
		mov		al,[si]				;Проверить СИМВОЛ
		xlat
		cmp		al,01				;Если СИМВОЛ не содержит цифру,
		jnz		i80					;	выход
		mov		ax,ord				;Увеличить ПОРЯДОК в 10 раз
		mul		ten
		jc		i70err					;Если перенос, ошибка
		mov		ord,ax
		jmp		i20					;Повторить для след. символа
i70err:
		dec		si					;Вычислить символ, с которого
		mov		al,[si]				;	начинается ошибка
		xlat
		cmp		al,01
		jz		i70err
		inc		si
		mov		cx,55				;Длина сообщения об ошибке
		mov		dx,offset err1		;Адрес строки с сообщением об ошибке
		call	rr10err				;Запустить обработчик ошибок
i80:
		test	cx,cx				;Индекс равен?
		jz		i70err				;	ошибка
		mov		ord,1				;Поместить 1 в порядок
		ret							;Выход
i10ind	endp
;				Проверка и поиск номера элемента:
;				--------------------------------------------
e10elm	proc	near
		push	bx					;Сохранить адрес XLT
		push	cx					;Сохранить ИНДЕКС
		push	di					;Сохранить ПОЗИЦИЯ
		std							;Слева направо
		mov		cx,118
		mov		di,offset el+234
		mov		al,[si]
		repne scasw					;Найти номер элемента
		jnz		e30err				;Если номер не найден, ошибка
		shl		cx,1				;Вычислить номер элемента
		pop		di					;Восстановить ПОЗИЦИЯ
		mov		bx,offset nn		;Поместить номер элемента в НОМЕР+ПОЗИЦИЯ
		mov		[bx+di],cx
		pop		cx					;Восстановить ИНДЕКС
		mov		bx,offset coe		;Поместить ИНДЕКС в КОЭФ+ПОЗИЦИЯ
		mov		[bx+di],cx
		mov		cx,1				;Поместить 1 в ИНДЕКС
		inc		di					;Следующая ПОЗИЦИЯ
		inc		di
		pop		bx
e20:
		ret
e30err:
		mov		cx,38				;Длина сообщения об ошибке
		mov		dx,offset err2		;Адрес строки с сообщением об ошибке
		call	rr10err				;Запустить обработчик ошибок
e10elm	endp
;				Вычисление коэффициентов:
;				--------------------------------------------
b10mulc	proc	near
		mov		bp,sp
		mov		ax,[bp+4]			;Загрузить ИНДЕКС из стека
		test	ax,ax				;Индекс (стек) равен нулю (была звездочка)?
		jnz		b20					;	да - продолжить, нет - переход
		cmp		cx,1				;Множитель K равен 1?
		jz		b50					;	да - переход, нет - продолжить
		mov		mult,cx				;Подготовить множитель K
		jmp		b40
b20:
		cmp		dl,06				;Была звездочка?
		jnz		b21					;	да - продолжить, нет - переход
		mov		ax,1		
b21:
		cmp		cx,1				;Множитель равен 1?
		jz		b25					;	да - переход, нет - продолжить
		mul		cx
		jc		b50err				;Перенос? - ошибка
		jmp		b30
b25:
		cmp		ax,1				;Индекс (стек) равен 1?
		jnz		b30					;	да - продолжить, нет - переход
		test	ax,ax				;Сбросить флаг ZF
		jmp		b50					;К завершению
b30:
		mov		mult,ax				;Поместить СТЕК+4 в МНОЖ
b40:
		push	di					;Поместить ПОЗИЦИЯ в СТЕК
		call	m10mul				;Вычислить коэффициенты
		pop		di					;Извлечь ПОЗИЦИЯ из СТЕК
b50:
		ret
b50err:
		mov		cx,76				;Длина сообщения об ошибке
		mov		dx,offset err4		;Адрес строки с сообщением об ошибке
		mov		si,[nn+di]			;Получить символ элемента с ошибкой
		mov		ax,word ptr [el+si]
		mov		word ptr errel,ax
		call	rr10err				;Запустить обработчик ошибок
b10mulc	endp
;				Вычисление коэффициента:
;				--------------------------------------------
m10mul	proc	near
		push	bx
		mov		cx,di
		sub		cx,[bp+2]			;Вычесть СТЕК из ПОЗИЦИЯ
		shr		cx,1				;	и поместить результат в СЧЁТ
		jcxz	m80					;Если СЧЁТ равен 0, выход
		mov		bx,offset coe
m20:
		dec		di					;Предыдущая ПОЗИЦИЯ
		dec		di
		mov		ax,[bx+di]			;Умножить КОЭФ+ПОЗИЦИЯ на МНОЖ
		mul		mult
		mov		[bx+di],ax
		jc		m90err				;Если перенос, ошибка
		loop	m20					;Повторить операцию
		mov		cx,1				;Установить 1 в ИНДЕКС
m80:
		pop		bx
		ret
m90err:
		mov		cx,76				;Длина сообщения об ошибке
		mov		dx,offset err4		;Адрес строки с сообщением об ошибке
		mov		si,[nn+di]			;Получить символ элемента с ошибкой
		mov		ax,word ptr [el+si]
		mov		word ptr errel,ax
		call	rr10err				;Запустить обработчик ошибок
m10mul	endp
;				Проверка звездочки и подготовка:
;				--------------------------------------------
s10star	proc	near
		push	ax
		cmp		si,offset fml		;Здездочка - первый символ?
		jz		s31err				;	да - ошибка, нет - продолжить
		mov		al,[si-1]
		xlat					;Проверка символа перед '*'
		cmp		al,05				;Левая скобка?
		jz		s30err				;	да - ошибка, нет - продолжить
		cmp		al,06				;Звёздочка?
		jz		s30err				;	да - ошибка, нет - продолжить
		cmp		al,00				;Иной символ?
		jz		s30err				;	да - ошибка, нет - продолжить
s20:
		pop		dx
		ret
s30err:
		dec		si					;Вычислить адрес ошибки
s31err:
		mov		cx,22				;Длина сообщения об ошибке
		mov		dx,offset err0		;Адрес строки с сообщением об ошибке
		call	rr10err				;Запустить обработчик ошибок
s10star	endp
;				Итоговые коэффициенты (агрегация по элементам):
;				--------------------------------------------
f10agrc	proc	near
		mov		ax,offset pnt
		mov		elp,ax
		xor		si,si
		xor		bx,bx
		cld
		shr		di,1
		mov		cx,di			;длина поля nn
		mov		bp,offset nn
f20:						;Поиск непустой позиции
		mov		di,bp
		mov		ax,0ffh
		repz scasw				;Непустая позиция найдена?
		jz		f90				; Нет: выход
		push	cx
		push	di				; Да
		mov		bp,di			;  Сохранить след. позицию
		sub		di,offset nn+2
		mov		dx,[coe+di]		;  Сохранить коэффициент
		mov		ax,[nn+di]		;  Сохранить элемент
f30:						;Поиск совпадений
		pop		di				;Восстановить позицию
		jcxz	f31
		repnz scasw				;Совпадение эл. найдено?
		jnz		f31
		push	di				; Да
		sub		di,offset nn+2
		add		dx,[coe+di]		;  Прибавить коэффициент
		jc		f92err			;Перенос? - ошибка
		push	ax
		mov		ax,0ffh
		mov		[nn+di],ax
		pop		ax
		jmp		f30
f31:							; Нет
		mov		[nn2+si],ax		;  Сохранить элемент
		mov		[coe2+si],dx	;  Сохранить коэффициент
		add		scoe+2,dx			;  Прибавить коэф. к сумме
		adc		scoe,0
		mov		[pnt+si],bx	;  Сохранить порядок эл.
		pop		cx
		jcxz	f91
		inc		bx
		inc		bx
		inc		si
		inc		si
		jmp		f20
f90:
		dec		si
		dec		si				;Сохранить указат.
f91:							; послед. элемента
		add		elp,si			; для сортировки
		mov		eln,si
		ret
f92err:
		mov		cx,76				;Длина сообщения об ошибке
		mov		dx,offset err4		;Адрес строки с сообщением об ошибке
		mov		si,ax				;Получить символ элемента с ошибкой
		mov		ax,word ptr [el+si]
		mov		word ptr errel,ax
		call	rr10err				;Запустить обработчик ошибок
f10agrc	endp
;				Расчет массы элементов:
;				--------------------------------------------
g10elms	proc	near
		mov		di,[nn2+si]			;Загрузить номер элемента
		mov		cx,[coe2+si]		;Загрузить коэффициент
		mov		ax,[ac+di]			;Сохранить точность массы
		cmp		melc,ax				;Макс. точность
		jae		g30
		mov		melc,ax
g30:	;Расчет младшей части
		mov		ax,[ma+di]
		mul		cx
		mov		bx,ax
		mov		bp,dx
		;Расчет старшей части
		mov		ax,[md+di]
		mul		cx
		;Сумма младшей и старшей частей bp:bx:dx
		add		bp,ax
		adc		dx,0
		mov		cx,dx
		;Сохранение результата
		mov		di,3
		mov		ax,si
		mul		di
		mov		di,ax				;Смещение массы
		mov		[elm+di+4],bx
		mov		[elm+di+2],bp
		mov		[elm+di],cx
		add		mm+4,bx				;Добавить к мол. массе
		adc		mm+2,bp
		adc		mm,cx
		dec		si
		dec		si
		jns		g10elms	;(переход, если отрицательно)
		mov		ax,eln				;Проверка количества
		test	ax,ax				; введенных элементов
		ret
g10elms	endp
;				Сортировка по массе (пузырьковая):
;				--------------------------------------------
h10sort	proc	near
		mov		cl,3				;Множитель
		mov		bp,offset elm		;Адрес начала порядков
h11:
		mov		bx,offset pnt		;Указатель на порядки
		sub		ch,ch				;Признак перестановки
h20:	;Сравнение масс:
		mov		si,[bx]				;Указатель на n-й элемент
		mov		di,[bx+2]			;Указатель на n+1-й элемент
		push	bx					;Зарезервировать регистры
		push	si
		push	di
		mov		bx,bp			;Адрес таблицы масс
		mov		ax,si				;Адрес массы n-ого элемента
		mul		cl
		mov		si,ax
		mov		ax,di				;Адрес массы n+1-ого элемента
		mul		cl
		mov		di,ax
h30:
		mov		dx,[bx+si]			;Сравнение 4-х разрядов масс
		cmp		dx,[bx+di]			;Разряды равны?
		jnz		h31
		inc		si
		inc		si
		inc		di
		inc		di					; да - проверить
		jmp		h30					;   следующие 4 разряда
h31:								; нет - восстановить регистры
		pop		di
		pop		si
		pop		bx					;Масса n >= массы n+1
		jae		h40					; да - перейти к след. порядку
		mov		[bx],di				; нет - перестановка
		mov		[bx+2],si
		mov		ch,cl				;Установить призн. перестан.
h40:
		inc		bx
		inc		bx
		cmp		bx,elp				;Последний элемент?
		jnz		h20					; нет - сравнить след. элементы
		test	ch,ch				; да - призн. перест. пуст?
		jnz		h11					;  нет - начать сортировку сначала
h50:
		mov		si,eln				;32
		cmp		si,rowp				;Количество элементов <= 17?
		jbe		h60					; Пропустить агрегирование прочих элем.
		call	ag10agr				;Агрегировать прочие элементы
h60:
		ret							;  да - выход
h10sort	endp
;				Агрегирование прочих элементов:
;				--------------------------------------------
ag10agr	proc	near				;Сохранить указатель стека
		mov		stk+2,sp
		xor		cx,cx				;Сумма коэффициентов cx
		xor		dx,dx				;Сумма масс:
		xor		sp,sp
		xor		bp,bp				;  dx:sp:bp
		mov		bl,3				;Множитель
ag20:
		mov		di,[pnt+si]
		add		cx,[coe2+di]		;Прибавить коэффициент
		jc		ag90err				;Переполнение? -ошибка
		mov		ax,di
		mul		bl
		mov		di,ax
		add		bp,[di+elm+4]		;Прибавить массу
		adc		sp,[di+elm+2]
		adc		dx,[di+elm+0]
		dec		si
		dec		si
		cmp		si,rowp				;Последний эл. не пройден?
		jae		ag20				;	Повторить сложение
		mov		[di+elm+4],bp		;Сохранить массу
		mov		[di+elm+2],sp
		mov		[di+elm+0],dx
		mov		di,[si+pnt+2]
		mov		[di+coe2],cx		;Сохранить коэффициент
		mov		ax,elx
		mov		[di+nn2],ax			;Поместить указат. на проч. эл.
		mov		sp,stk+2			;Восстановить указатель стека
		add		si,offset pnt+2		;										+		
		mov		elp,si
		ret							;Выход
ag90err:
		mov		cx,46				;Длина сообщения об ошибке
		mov		dx,offset err6		;Адрес строки с сообщением об ошибке
		mov		sp,stk				;Восстановить указатель стека
		call	rr10err				;Запустить обработчик ошибок
ag10agr	endp
;				Вычисление молярной доли:
;				--------------------------------------------
j10mold	proc	near
		call	l10div			;Подготовка делителя bp:di
		mov		bx,offset mold	;Адрес первой доли
		mov		si,eln			;Смещение послед. коэф.
j11:							;Подготовка делимого,
		mov		ax,[bx+si-mcoe]	; (коэф.*100%) в
		mul		pp100			; ax:dx
j12:
		test	dh,dh			;Сдвинуть делимое
		js		j13				; как можно левее
		shl		ax,1
		rcl		dx,1
		dec		cx
		jmp		j12
j13:
		cmp		cx,0ffffh		;Делимое слишко мало?
		jl		j30				; закончить обработку
		cmp		cx,0
		jl		j14
		jz		j15	
		call	n10div			; Приступить к делению
j14:
		shl		ax,1			;Корректировка точности
		rcl		dx,1			;Удвоенный остат. >= делит.?
j15:
		cmp		dx,di
		ja		j20
		jb		j30
		cmp		ax,bp
		jb		j30				; нет - не корректировать
j20:							; да - 
		inc		word ptr [bx+si];  +1 в 1-й бит частного
j30:
		mov		di,scoes		;Восстановить делитель
		mov		bp,scoes+2
		mov		cx,cycle		;Восстановить счетчик
		dec		si
		dec		si
		jns		j11
		ret
j10mold	endp
;				Подготовка делителя:
;				--------------------------------------------
l10div	proc	near
		mov		dh,byte ptr scoe+0
		mov		dl,byte ptr scoe+3
		mov		ah,byte ptr scoe+2
		xor		al,al
		mov		cx,4	;Количество циклов сдвига делителя
l11:
		shl		ax,1
		rcl		dx,1
		loop	l11
		mov		cx,12	;Счетчик сдвига при делении
l20:
		test	dh,dh
		js		l21
		inc		cx		;Увеличить счетчик сдвига
		shl		ax,1
		rcl		dx,1
		jmp		l20
l21:
		mov		bp,ax				;Делитель в
		mov		di,dx				; bp:di
		mov		scoes,di
		mov		scoes+2,bp
		mov		cycle,cx
		ret
l10div	endp
;				Деление в столбик:
;				--------------------------------------------
n10div	proc	near
		cmp		dx,di			;Делимое 1 > делителя 1?
		ja		n30				; да - делить, нет - продолж
		jb		n21
		cmp		ax,bp
		jae		n30
n21:
		shr		di,1			;Сдвинуть делитель
		rcr		bp,1			;  на 1 бит вправо
		shl		word ptr [bx+si],1;Сдвинуть частное
		loop	n10div			;  на 1 бит влево
		jmp		n40
n30:
		sub		ax,bp			;Вычесть делитель из делим.
		sbb		dx,di
		inc		word ptr [bx+si];+1 в 1-й бит частного
		jmp		n10div
n40:
		ret
n10div	endp
;				Вычисление массовой доли:
;				--------------------------------------------
o10masd	proc	near
		call	p10div1			;Подготовка делителя в mml
		mov		bx,offset masd	;Адрес первой доли
		mov		si,eln			;Смещение
o11:
		call	r10div2			;Подготовка делимого
		cmp		cx,0ffffh		;Делимое слишко мало?
		jl		o30				; закончить обработку
		mov		ax,[mml+0]		;Загрузить делитель
		mov		dx,[mml+2]		; в ax:dx:bp:di
		mov		bp,[mml+4]
		xor		di,di
		cmp		cx,di
		jl		o14
		jz		o15
		call	t10div3			;Приступить к делению
o14:
		shl		[delim+6],1		;Корректировка точности
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
		inc		word ptr [bx+si];  +1 в 1-й бит частного
o30:
		mov		di,offset delim	;Стереть делимое
		mov		cx,4
		xor		ax,ax
		cld
		rep stosw
		mov		cx,cycle		;Восстановить счетчик
		dec		si
		dec		si
		jns		o11
		ret
o10masd	endp
;				Подготовка делителя:
;				--------------------------------------------
p10div1	proc	near
		mov		bp,mm+0
		mov		dx,mm+2
		mov		ax,mm+4
		mov		cx,16		;Счетчик (разница в битах
p20:						; между делителем и делимым Z
		test	bp,bp
		js		p21
		inc		cx			;Увеличить счетчик сдвига
		shl		ax,1		; на Y
		rcl		dx,1
		rcl		bp,1
		jmp		p20			;Делитель в
p21:						; ax:dx:bp
		mov		mml+0,bp	;Сохранить делитель
		mov		mml+2,dx
		mov		mml+4,ax
		mov		cycle,cx	;Сохранить счетчик
		ret
p10div1	endp
;				Подготовка делимого:
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
		test	[delim+0],ax	;Сдвинуть делимое
		js		r40				; как можно левее на X бит
		shl		[delim+6],1		; Итого (Y+Z)-X в CX
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
;				Деление в столбик:
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
		shr		ax,1			;Сдвинуть делитель
		rcr		dx,1			;  на 1 бит вправо
		rcr		bp,1
		rcr		di,1
		shl		word ptr [bx+si],1;Сдвинуть частное
		loop	t10div3			;  на 1 бит влево
		jmp		t40
t30:
		sub		[delim+6],di	;Вычесть делитель из делим.
		sbb		[delim+4],bp
		sbb		[delim+2],dx
		sbb		[delim+0],ax
		inc		word ptr [bx+si];+1 в 1-й бит частного
		jmp		t10div3
t40:
		ret
t10div3	endp
;				Вывод молярной массы в ASCII-формате
;				--------------------------------------------
mm10dis	proc	near
		mov		ax,offset mmasc0+15
		mov		pmmasc,ax
		mov		ax,[mm+0]
		mov		bx,[mm+2]
		mov		dx,[mm+4]
mm20:
		call	mc10dv1		;Подготовить делит. и делим.
		call	md10dv2		;Делить
		call	me10asc		;Преобразовать в ASCII-формат
		test	ax,ax		;Частное больше 10?
		jnz		mm20
		test	bx,bx
		jnz		mm20
		test	dx,dx
		jnz		mm20		; Повторить деление
		call	mv10mov			;Переместить и округлить
		mov		cx,di			;Подготовка к выводу
		mov		dx,offset resmm	;	адрес_сообщения
		sub		cx,dx			;	длина_сообщения
		call	dd10out			;Вывести результат на экран
		ret
mm10dis	endp
;				Подготовка делимого:
;				--------------------------------------------
mc10dv1	proc	near
		mov		cl,44		;Количество сдвигов при делении
		mov		ch,cl
mc20:
		test	ax,ax		;Сдвинуть делимое
		js		mc30		; как можно левее
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
		xor		ax,ax		;Частное - ax:bx:dx
		xor		bx,bx
		xor		dx,dx
		mov		bp,0a000h	;Загрузить делит.(10) в bp:si:di
		xor		si,si
		xor		di,di
		sub		ch,cl		;Сохранить количество сдвигов
		ret
mc10dv1	endp
;				Деление	в столбик
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
		sub		[mm+4],di	;Вычесть делитель из делим.
		sbb		[mm+2],si
		sbb		[mm+0],bp
		inc		dx			;Прибавить 1 к частному
md20:
		test	cl,cl
		jz		md40
		dec		cl
		shr		bp,1		;Сдвинуть делитель вправо
		rcr		si,1
		rcr		di,1
		shl		dx,1		;Сдвинуть частное влево
		rcl		bx,1
		rcl		ax,1
		jmp		md10dv2
md40:
		ret
md10dv2	endp
;				Преобразование в ASCII-формат
;				--------------------------------------------
me10asc	proc	near
		test	ch,ch	;Сдвиуть остаток обратно вправо
		jz		me20
me11:
		shr		[mm+0],1
		rcr		[mm+2],1
		rcr		[mm+4],1
		dec		ch
		jnz		me11
me20:
		mov		ch,byte ptr [mm+4]	;Преобразовать символ
		or		ch,30h
		mov		si,pmmasc
		mov		[si],ch
		dec		si
		mov		pmmasc,si
		inc		lenmm				;+1 к счетчику символов
		ret
me10asc	endp
;				Перемещение и удаление лишних нулей:
;				--------------------------------------------
mv10mov	proc	near
		inc		si
		mov		di,offset mmasc0
		mov		cx,lenmm
		sub		cx,6
		cld
		rep	movsb
		cmp		melc,cx			;Точность равна 0?
		jz		mv30			;	Переход
		mov		ax,','			;Добавить запятую
		mov		[di],ax
		inc		di
		mov		cx,melc			;Добавить знаки после запятой
		rep	movsb
mv30:
		mov		cx,9			; и текст ' g/mol.'
		mov		si,offset gmol
		rep	movsb
		ret
mv10mov	endp
;				Построение таблицы:
;				--------------------------------------------
tt10tab	proc	near
		mov		cx,82				;Вывод заголовка таблицы:
		mov		dx,offset head
		call	dd10out
		mov		bx,offset pnt
tt20:
		mov		si,[bx]
		mov		di,[si+nn2]
		mov		cx,10				;Делитель для перевода в ASCII
		call	y10name				;Наименования элементов
		cmp		di,elx				;Прочие элементы?
		jnz		tt30
		mov		al,'-'
		mov		num,al
		mov		atm,al
		jmp		tt40
tt30:
		call	v10eln				;Символ и номер элемента
		call	z10atm				;Атомная масса
tt40:
		call	w10num				;Количество атомов
		call	x10pp				;Молярные и массовые доли
		mov		cx,80				;Вывод строки таблицы:
		mov		dx,offset row
		push	bx
		call	dd10out
		pop		bx					;Подготовка к выводу следующей строки
		inc		bx
		inc		bx
		mov		di,offset row		;Очистка строки
		mov		al,20h
		cld
		rep stosb
		cmp		bx,elp
		jbe		tt20
		ret
tt10tab	endp
;				Получение ASCII наименовани элемента:
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
;				Получение ASCII символа и номера элемента:
;				--------------------------------------------
v10eln	proc	near
		mov		ax,word ptr [di+el]	;Символ элемента
		mov		word ptr sym,ax
		mov		ax,di				;Номер элемента
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
;				Получение ASCII количества атомов:
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
;				Получение ASCII атомной массы:
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
		sub		bp,ax			;Счетчик лишних нулей
		mov		melc,ax			;Точность атомной массы
		mov		ax,[di+md]		;Атомная масса ax:dx
		mov		dx,[di+ma]
z20:
		push	bp
		call	zk10dv1			;Делитель и делимое
		call	zm10dv2			;Деление
		pop		bp
		cmp		bp,0
		jg		z30
		call	zn10asc			;Преобразование
z30:
		dec		bp
		test	ax,ax		;Частное больше 10?
		jnz		z20
		test	dx,dx
		jnz		z20			; Повторить деление
		pop		si
		pop		cx
		pop		bx
		ret
z10atm	endp
;				Подготовка делителя и делимого:
;				--------------------------------------------
zk10dv1	proc	near
		mov		cl,28		;Количество сдвигов при делении
		mov		ch,cl
zk20:
		test	ax,ax		;Сдвинуть делимое
		js		zk30		; как можно левее
		shl		dx,1
		rcl		ax,1
		dec		cl
		test	cl,cl
		jz		zk30
		jmp		zk20
zk30:
		mov		si,ax
		mov		bx,dx
		xor		ax,ax		;Частное - ax:dx
		xor		dx,dx
		mov		bp,0a000h	;Загрузить делит.(10) в bp:di
		xor		di,di
		sub		ch,cl		;Сохранить количество сдвигов
		ret
zk10dv1	endp
;				Деление	в столбик
;				--------------------------------------------
zm10dv2	proc	near
		cmp		si,bp
		ja		zm30
		jb		zm20
		cmp		bx,di
		jb		zm20
zm30:
		sub		bx,di		;Вычесть делитель из делим.
		sbb		si,bp
		inc		dx			;Прибавить 1 к частному
zm20:
		test	cl,cl
		jz		zm40
		dec		cl
		shr		bp,1		;Сдвинуть делитель вправо
		rcr		di,1
		shl		dx,1		;Сдвинуть частное влево
		rcl		ax,1
		jmp		zm10dv2
zm40:
		ret
zm10dv2	endp
;				Преобразование в ASCII-формат
;				--------------------------------------------
zn10asc	proc	near
		test	ch,ch	;Сдвинуть остаток обратно вправо
		jz		zn20
zn11:
		shr		si,1
		rcr		bx,1
		dec		ch
		jnz		zn11
zn20:
		mov		ch,byte ptr bl		;Преобразовать символ
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
;				Получение ASCII молярных и массовых долей:
;				--------------------------------------------
x10pp	proc	near
		mov		ax,eln
		test	ax,ax				;Введен только 1 элемент?
		jz		x50					; Пропустить расчет
		push	bx
		mov		ax,[si+mold]
		mov		bx,offset molp
x15:
		xor		di,di
		mov		bp,3			;Счетчик положения запятой
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
x50:			;Поместить 100,00 %
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
;				Обработка ошибок:
;				--------------------------------------------
rr10err	proc	near
		call	dd10out				;Вывести сообщение
		cmp		dx,offset err3		;Позиция ошиб. символа не требуется?
		jae		rr30				; Пропустить расчет позиции
		mov		di,offset col+1		;Рассчитать позицию ошибки
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
		mov		cx,22				;Длина строки с сообщ.
		mov		dx,offset errc		;Адрес строки с сообщ.
		call	dd10out				;Вывести сообщение
rr30:
		mov		bp,stk				;Приготовиться к возврату
		mov		sp,offset a80		; в главную процедуру
		mov		[bp],sp
		mov		sp,bp
		ret							;Возврат в главную процедуру
rr10err	endp
;				Вывод на экран:
;				--------------------------------------------
dd10out	proc	near
		mov		ah,40h
		mov		bx,1
		int		21h
		ret
dd10out	endp
;				Сброс значений переменных:
;				--------------------------------------------
cc10cln	proc	near
		cld
		mov		di,offset v_bg	;Адрес начала переменных
		mov		cx,parlen		;Длина блока переменных
		xor		ax,ax
		rep	stosw
		ret
cc10cln	endp
codesg	ends
		end		begin