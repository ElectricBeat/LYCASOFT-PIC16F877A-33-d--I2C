opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 10920"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
	FNCALL	_main,_cmd
	FNCALL	_main,_start
	FNCALL	_main,_receive
	FNCALL	_main,_stop
	FNROOT	_main
	global	main@F1101
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\SLAVE\I2C SLAVE.c"
	line	21

;initializer for main@F1101
	retlw	053h
	retlw	054h
	retlw	052h
	retlw	049h
	retlw	04Eh
	retlw	047h
	retlw	0
	global	_PORTB
_PORTB	set	6
	global	_PORTC
_PORTC	set	7
	global	_PORTD
_PORTD	set	8
	global	_SSPBUF
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_CARRY
_CARRY	set	24
	global	_CKP
_CKP	set	164
	global	_GIE
_GIE	set	95
	global	_RB0
_RB0	set	48
	global	_RB1
_RB1	set	49
	global	_RB2
_RB2	set	50
	global	_SSPIF
_SSPIF	set	99
	global	_SSPADD
_SSPADD	set	147
	global	_SSPCON2
_SSPCON2	set	145
	global	_SSPSTAT
_SSPSTAT	set	148
	global	_TRISB
_TRISB	set	134
	global	_TRISD
_TRISD	set	136
	global	_ACKSTAT
_ACKSTAT	set	1166
	global	_PEN
_PEN	set	1162
	global	_SEN
_SEN	set	1160
	global	_TRISC3
_TRISC3	set	1083
	global	_TRISC4
_TRISC4	set	1084
	global	_EEADR
_EEADR	set	269
	global	_EEDATA
_EEDATA	set	268
	global	_EECON1
_EECON1	set	396
	global	_EECON2
_EECON2	set	397
	global	_RD
_RD	set	3168
	global	_WR
_WR	set	3169
	global	_WREN
_WREN	set	3170
	file	"I2C SLAVE.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\SLAVE\I2C SLAVE.c"
main@F1101:
       ds      7

global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+7)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_start
?_start:	; 0 bytes @ 0x0
	global	??_start
??_start:	; 0 bytes @ 0x0
	global	??_receive
??_receive:	; 0 bytes @ 0x0
	global	?_stop
?_stop:	; 0 bytes @ 0x0
	global	??_stop
??_stop:	; 0 bytes @ 0x0
	global	?_cmd
?_cmd:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	global	?_receive
?_receive:	; 1 bytes @ 0x0
	global	cmd@y
cmd@y:	; 1 bytes @ 0x0
	ds	1
	global	??_cmd
??_cmd:	; 0 bytes @ 0x1
	ds	2
	global	receive@s
receive@s:	; 1 bytes @ 0x3
	ds	1
	global	cmd@x
cmd@x:	; 1 bytes @ 0x4
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x5
	ds	4
psect	cstackBANK0,class=BANK0,space=1
global __pcstackBANK0
__pcstackBANK0:
	global	main@a
main@a:	; 7 bytes @ 0x0
	ds	7
	global	main@ch
main@ch:	; 1 bytes @ 0x7
	ds	1
	global	main@i_1251
main@i_1251:	; 2 bytes @ 0x8
	ds	2
;;Data sizes: Strings 0, constant 0, data 7, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9       9
;; BANK0           80     10      17
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_cmd
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 4, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                16    16      0     204
;;                                              5 COMMON     4     4      0
;;                                              0 BANK0     10    10      0
;;                                _cmd
;;                              _start
;;                            _receive
;;                               _stop
;; ---------------------------------------------------------------------------------
;; (1) _stop                                                 3     3      0       0
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _receive                                              4     4      0      23
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _start                                                3     3      0       0
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _cmd                                                  5     4      1      44
;;                                              0 COMMON     5     4      1
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _cmd
;;   _start
;;   _receive
;;   _stop
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0      1B      12        0.0%
;;ABS                  0      0      1A       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               50      A      11       5       21.3%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      9       9       1       64.3%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 18 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\SLAVE\I2C SLAVE.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    8[BANK0 ] int 
;;  a               7    0[BANK0 ] unsigned char [7]
;;  i               2    0        int 
;;  ch              1    7[BANK0 ] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0      10       0       0       0
;;      Temps:          4       0       0       0       0
;;      Totals:         4      10       0       0       0
;;Total ram usage:       14 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_cmd
;;		_start
;;		_receive
;;		_stop
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\SLAVE\I2C SLAVE.c"
	line	18
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	21
	
l2725:	
;I2C SLAVE.c: 19: int i;
;I2C SLAVE.c: 20: char ch;
;I2C SLAVE.c: 21: char a[]="STRING";
	movlw	(main@a)&0ffh
	movwf	fsr0
	movlw	low(main@F1101)
	movwf	(??_main+0)+0
	movf	fsr0,w
	movwf	((??_main+0)+0+1)
	movlw	7
	movwf	((??_main+0)+0+2)
u2310:
	movf	(??_main+0)+0,w
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	
	movf	indf,w
	movwf	((??_main+0)+0+3)
	incf	(??_main+0)+0,f
	movf	((??_main+0)+0+1),w
	movwf	fsr0
	
	movf	((??_main+0)+0+3),w
	movwf	indf
	incf	((??_main+0)+0+1),f
	decfsz	((??_main+0)+0+2),f
	goto	u2310
	line	22
	
l2727:	
;I2C SLAVE.c: 22: TRISB=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	23
	
l2729:	
;I2C SLAVE.c: 23: PORTB=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(6)	;volatile
	line	24
	
l2731:	
;I2C SLAVE.c: 24: TRISD=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(136)^080h	;volatile
	line	25
	
l2733:	
;I2C SLAVE.c: 25: PORTD=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(8)	;volatile
	line	26
	
l2735:	
;I2C SLAVE.c: 26: TRISC3=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1083/8)^080h,(1083)&7
	line	27
	
l2737:	
;I2C SLAVE.c: 27: TRISC4=1;
	bsf	(1084/8)^080h,(1084)&7
	line	28
	
l2739:	
;I2C SLAVE.c: 28: PORTC=0x00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	29
	
l2741:	
;I2C SLAVE.c: 29: cmd(0x38,0);
	clrf	(?_cmd)
	movlw	(038h)
	fcall	_cmd
	line	30
	
l2743:	
;I2C SLAVE.c: 30: cmd(0x06,0);
	clrf	(?_cmd)
	movlw	(06h)
	fcall	_cmd
	line	31
	
l2745:	
;I2C SLAVE.c: 31: cmd(0x01,0);
	clrf	(?_cmd)
	movlw	(01h)
	fcall	_cmd
	line	32
	
l2747:	
;I2C SLAVE.c: 32: cmd(0x80,0);
	clrf	(?_cmd)
	movlw	(080h)
	fcall	_cmd
	line	33
	
l2749:	
;I2C SLAVE.c: 33: cmd(0x0d,0);
	clrf	(?_cmd)
	movlw	(0Dh)
	fcall	_cmd
	line	34
	
l2751:	
;I2C SLAVE.c: 34: _delay((unsigned long)((50)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	169
movwf	((??_main+0)+0),f
u2367:
	decfsz	((??_main+0)+0),f
	goto	u2367
	decfsz	((??_main+0)+0+1),f
	goto	u2367
	decfsz	((??_main+0)+0+2),f
	goto	u2367
	nop2
opt asmopt_on

	line	35
	
l2753:	
;I2C SLAVE.c: 35: SSPSTAT=0x84;
	movlw	(084h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(148)^080h	;volatile
	line	36
	
l2755:	
;I2C SLAVE.c: 36: SSPCON=0x66;
	movlw	(066h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	37
	
l2757:	
;I2C SLAVE.c: 37: SSPCON2=0x00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(145)^080h	;volatile
	line	38
	
l2759:	
;I2C SLAVE.c: 38: SSPADD=0x24;
	movlw	(024h)
	movwf	(147)^080h	;volatile
	line	39
	
l2761:	
;I2C SLAVE.c: 39: SSPBUF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(19)	;volatile
	line	40
	
l2763:	
;I2C SLAVE.c: 40: SSPIF=0;
	bcf	(99/8),(99)&7
	goto	l2765
	line	41
;I2C SLAVE.c: 41: while(1)
	
l698:	
	line	43
	
l2765:	
;I2C SLAVE.c: 42: {
;I2C SLAVE.c: 43: start();
	fcall	_start
	line	45
	
l2767:	
;I2C SLAVE.c: 45: if(ACKSTAT==0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1166/8)^080h,(1166)&7
	goto	u2321
	goto	u2320
u2321:
	goto	l2765
u2320:
	line	48
	
l2769:	
;I2C SLAVE.c: 46: {
;I2C SLAVE.c: 48: SSPBUF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(19)	;volatile
	line	49
	
l2771:	
;I2C SLAVE.c: 49: ch=receive();
	fcall	_receive
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(main@ch)
	line	50
	
l2773:	
;I2C SLAVE.c: 50: for(int i=0;i<6;i++)
	clrf	(main@i_1251)
	clrf	(main@i_1251+1)
	
l2775:	
	movf	(main@i_1251+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2335
	movlw	low(06h)
	subwf	(main@i_1251),w
u2335:

	skipc
	goto	u2331
	goto	u2330
u2331:
	goto	l2779
u2330:
	goto	l701
	
l2777:	
	goto	l701
	line	51
	
l700:	
	line	52
	
l2779:	
;I2C SLAVE.c: 51: {
;I2C SLAVE.c: 52: if(a[i]==ch)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(main@i_1251),w
	addlw	main@a&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	xorwf	(main@ch),w
	skipz
	goto	u2341
	goto	u2340
u2341:
	goto	l2785
u2340:
	line	54
	
l2781:	
;I2C SLAVE.c: 53: {
;I2C SLAVE.c: 54: cmd(ch,1);
	clrf	(?_cmd)
	bsf	status,0
	rlf	(?_cmd),f
	movf	(main@ch),w
	fcall	_cmd
	line	55
	
l2783:	
;I2C SLAVE.c: 55: _delay((unsigned long)((70)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_main+0)+0+2),f
movlw	199
movwf	((??_main+0)+0+1),f
	movlw	136
movwf	((??_main+0)+0),f
u2377:
	decfsz	((??_main+0)+0),f
	goto	u2377
	decfsz	((??_main+0)+0+1),f
	goto	u2377
	decfsz	((??_main+0)+0+2),f
	goto	u2377
	clrwdt
opt asmopt_on

	goto	l2785
	line	56
	
l702:	
	line	50
	
l2785:	
	movlw	low(01h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	addwf	(main@i_1251),f
	skipnc
	incf	(main@i_1251+1),f
	movlw	high(01h)
	addwf	(main@i_1251+1),f
	
l2787:	
	movf	(main@i_1251+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2355
	movlw	low(06h)
	subwf	(main@i_1251),w
u2355:

	skipc
	goto	u2351
	goto	u2350
u2351:
	goto	l2779
u2350:
	
l701:	
	line	58
;I2C SLAVE.c: 56: }
;I2C SLAVE.c: 57: }
;I2C SLAVE.c: 58: CKP=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(164/8),(164)&7
	line	60
	
l2789:	
;I2C SLAVE.c: 60: stop();
	fcall	_stop
	goto	l2765
	line	61
	
l699:	
	goto	l2765
	line	63
	
l703:	
	line	41
	goto	l2765
	
l704:	
	line	64
	
l705:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_stop
psect	text173,local,class=CODE,delta=2
global __ptext173
__ptext173:

;; *************** function _stop *****************
;; Defined at:
;;		line 74 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\SLAVE\I2C SLAVE.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text173
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\SLAVE\I2C SLAVE.c"
	line	74
	global	__size_of_stop
	__size_of_stop	equ	__end_of_stop-_stop
	
_stop:	
	opt	stack 7
; Regs used in _stop: [wreg]
	line	76
	
l2721:	
;I2C SLAVE.c: 76: PEN=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1162/8)^080h,(1162)&7
	line	77
;I2C SLAVE.c: 77: SSPIF=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(99/8),(99)&7
	line	78
	
l2723:	
;I2C SLAVE.c: 78: _delay((unsigned long)((70)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_stop+0)+0+2),f
movlw	199
movwf	((??_stop+0)+0+1),f
	movlw	136
movwf	((??_stop+0)+0),f
u2387:
	decfsz	((??_stop+0)+0),f
	goto	u2387
	decfsz	((??_stop+0)+0+1),f
	goto	u2387
	decfsz	((??_stop+0)+0+2),f
	goto	u2387
	clrwdt
opt asmopt_on

	line	79
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_stop
	__end_of_stop:
;; =============== function _stop ends ============

	signat	_stop,88
	global	_receive
psect	text174,local,class=CODE,delta=2
global __ptext174
__ptext174:

;; *************** function _receive *****************
;; Defined at:
;;		line 82 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\SLAVE\I2C SLAVE.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  s               1    3[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  1    wreg      unsigned char 
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         4       0       0       0       0
;;Total ram usage:        4 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text174
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\SLAVE\I2C SLAVE.c"
	line	82
	global	__size_of_receive
	__size_of_receive	equ	__end_of_receive-_receive
	
_receive:	
	opt	stack 7
; Regs used in _receive: [wreg]
	line	84
	
l2715:	
;I2C SLAVE.c: 83: char s;
;I2C SLAVE.c: 84: SSPIF=1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(99/8),(99)&7
	line	85
	
l2717:	
;I2C SLAVE.c: 85: s=SSPBUF;
	movf	(19),w	;volatile
	movwf	(??_receive+0)+0
	movf	(??_receive+0)+0,w
	movwf	(receive@s)
	line	86
;I2C SLAVE.c: 86: _delay((unsigned long)((100)*(20000000/4000.0)));
	opt asmopt_off
movlw  3
movwf	((??_receive+0)+0+2),f
movlw	138
movwf	((??_receive+0)+0+1),f
	movlw	86
movwf	((??_receive+0)+0),f
u2397:
	decfsz	((??_receive+0)+0),f
	goto	u2397
	decfsz	((??_receive+0)+0+1),f
	goto	u2397
	decfsz	((??_receive+0)+0+2),f
	goto	u2397
	nop2
opt asmopt_on

	line	87
;I2C SLAVE.c: 87: return s;
	movf	(receive@s),w
	goto	l714
	
l2719:	
	line	88
	
l714:	
	return
	opt stack 0
GLOBAL	__end_of_receive
	__end_of_receive:
;; =============== function _receive ends ============

	signat	_receive,89
	global	_start
psect	text175,local,class=CODE,delta=2
global __ptext175
__ptext175:

;; *************** function _start *****************
;; Defined at:
;;		line 67 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\SLAVE\I2C SLAVE.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         3       0       0       0       0
;;Total ram usage:        3 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text175
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\SLAVE\I2C SLAVE.c"
	line	67
	global	__size_of_start
	__size_of_start	equ	__end_of_start-_start
	
_start:	
	opt	stack 7
; Regs used in _start: [wreg]
	line	68
	
l2711:	
;I2C SLAVE.c: 68: SEN=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	69
;I2C SLAVE.c: 69: SSPIF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	71
	
l2713:	
;I2C SLAVE.c: 71: _delay((unsigned long)((70)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_start+0)+0+2),f
movlw	199
movwf	((??_start+0)+0+1),f
	movlw	136
movwf	((??_start+0)+0),f
u2407:
	decfsz	((??_start+0)+0),f
	goto	u2407
	decfsz	((??_start+0)+0+1),f
	goto	u2407
	decfsz	((??_start+0)+0+2),f
	goto	u2407
	clrwdt
opt asmopt_on

	line	72
	
l708:	
	return
	opt stack 0
GLOBAL	__end_of_start
	__end_of_start:
;; =============== function _start ends ============

	signat	_start,88
	global	_cmd
psect	text176,local,class=CODE,delta=2
global __ptext176
__ptext176:

;; *************** function _cmd *****************
;; Defined at:
;;		line 7 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\SLAVE\I2C SLAVE.c"
;; Parameters:    Size  Location     Type
;;  x               1    wreg     unsigned char 
;;  y               1    0[COMMON] unsigned char 
;; Auto vars:     Size  Location     Type
;;  x               1    4[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         1       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text176
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\SLAVE\I2C SLAVE.c"
	line	7
	global	__size_of_cmd
	__size_of_cmd	equ	__end_of_cmd-_cmd
	
_cmd:	
	opt	stack 7
; Regs used in _cmd: [wreg]
;cmd@x stored from wreg
	movwf	(cmd@x)
	line	8
	
l2705:	
;I2C SLAVE.c: 8: RB0=y;
	btfsc	(cmd@y),0
	goto	u2291
	goto	u2290
	
u2291:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(48/8),(48)&7
	goto	u2304
u2290:
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(48/8),(48)&7
u2304:
	line	9
;I2C SLAVE.c: 9: RB1=0;
	bcf	(49/8),(49)&7
	line	10
;I2C SLAVE.c: 10: RB2=1;
	bsf	(50/8),(50)&7
	line	11
	
l2707:	
;I2C SLAVE.c: 11: PORTD=x;
	movf	(cmd@x),w
	movwf	(8)	;volatile
	line	13
	
l2709:	
;I2C SLAVE.c: 13: RB2=0;
	bcf	(50/8),(50)&7
	line	15
;I2C SLAVE.c: 15: _delay((unsigned long)((70)*(20000000/4000.0)));
	opt asmopt_off
movlw  2
movwf	((??_cmd+0)+0+2),f
movlw	199
movwf	((??_cmd+0)+0+1),f
	movlw	136
movwf	((??_cmd+0)+0),f
u2417:
	decfsz	((??_cmd+0)+0),f
	goto	u2417
	decfsz	((??_cmd+0)+0+1),f
	goto	u2417
	decfsz	((??_cmd+0)+0+2),f
	goto	u2417
	clrwdt
opt asmopt_on

	line	16
	
l693:	
	return
	opt stack 0
GLOBAL	__end_of_cmd
	__end_of_cmd:
;; =============== function _cmd ends ============

	signat	_cmd,8312
psect	text177,local,class=CODE,delta=2
global __ptext177
__ptext177:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
