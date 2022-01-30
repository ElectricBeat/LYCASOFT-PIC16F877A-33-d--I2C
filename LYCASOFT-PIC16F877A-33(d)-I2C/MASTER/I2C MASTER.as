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
	FNCALL	_main,_start
	FNCALL	_main,_send
	FNCALL	_main,_stop
	FNROOT	_main
	global	_k
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\MASTER\I2C MASTER.c"
	line	6

;initializer for _k
	retlw	053h
	retlw	054h
	retlw	052h
	retlw	049h
	retlw	04Eh
	retlw	047h
	retlw	0
	global	_PORTC
_PORTC	set	7
	global	_SSPBUF
_SSPBUF	set	19
	global	_SSPCON
_SSPCON	set	20
	global	_CARRY
_CARRY	set	24
	global	_GIE
_GIE	set	95
	global	_SSPIF
_SSPIF	set	99
	global	_SSPADD
_SSPADD	set	147
	global	_SSPCON2
_SSPCON2	set	145
	global	_SSPSTAT
_SSPSTAT	set	148
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
	file	"I2C MASTER.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\MASTER\I2C MASTER.c"
_k:
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
	global	?_send
?_send:	; 0 bytes @ 0x0
	global	??_send
??_send:	; 0 bytes @ 0x0
	global	?_stop
?_stop:	; 0 bytes @ 0x0
	global	??_stop
??_stop:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 0 bytes @ 0x0
	ds	3
	global	send@m
send@m:	; 1 bytes @ 0x3
	ds	1
	global	??_main
??_main:	; 0 bytes @ 0x4
	ds	3
	global	main@i
main@i:	; 2 bytes @ 0x7
	ds	2
;;Data sizes: Strings 0, constant 0, data 7, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      9       9
;; BANK0           80      0       7
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   _main->_send
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
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 5     5      0      90
;;                                              4 COMMON     5     5      0
;;                              _start
;;                               _send
;;                               _stop
;; ---------------------------------------------------------------------------------
;; (1) _stop                                                 3     3      0       0
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; (1) _send                                                 4     4      0      22
;;                                              0 COMMON     4     4      0
;; ---------------------------------------------------------------------------------
;; (1) _start                                                3     3      0       0
;;                                              0 COMMON     3     3      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _start
;;   _send
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
;;DATA                 0      0      11      12        0.0%
;;ABS                  0      0      10       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       1       2        0.0%
;;BANK0               50      0       7       5        8.8%
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
;;		line 8 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\MASTER\I2C MASTER.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               2    7[COMMON] int 
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
;;      Locals:         2       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         5       0       0       0       0
;;Total ram usage:        5 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_start
;;		_send
;;		_stop
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\MASTER\I2C MASTER.c"
	line	8
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1+pclath+cstack]
	line	10
	
l2690:	
;I2C MASTER.c: 9: int i;
;I2C MASTER.c: 10: TRISC3=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1083/8)^080h,(1083)&7
	line	11
;I2C MASTER.c: 11: TRISC4=1;
	bsf	(1084/8)^080h,(1084)&7
	line	12
	
l2692:	
;I2C MASTER.c: 12: PORTC=0X00;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	clrf	(7)	;volatile
	line	13
	
l2694:	
;I2C MASTER.c: 13: SSPSTAT=0X80;
	movlw	(080h)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(148)^080h	;volatile
	line	14
	
l2696:	
;I2C MASTER.c: 14: SSPCON=0XA8;
	movlw	(0A8h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(20)	;volatile
	line	15
;I2C MASTER.c: 15: SSPCON2=0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(145)^080h	;volatile
	line	16
	
l2698:	
;I2C MASTER.c: 16: SSPADD=7;
	movlw	(07h)
	movwf	(147)^080h	;volatile
	goto	l2700
	line	18
;I2C MASTER.c: 18: while(1)
	
l695:	
	line	20
	
l2700:	
;I2C MASTER.c: 19: {
;I2C MASTER.c: 20: start();
	fcall	_start
	line	21
	
l2702:	
;I2C MASTER.c: 21: send(0X24);
	movlw	(024h)
	fcall	_send
	line	22
	
l2704:	
;I2C MASTER.c: 22: if(ACKSTAT==0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1166/8)^080h,(1166)&7
	goto	u2291
	goto	u2290
u2291:
	goto	l696
u2290:
	line	24
	
l2706:	
;I2C MASTER.c: 23: {
;I2C MASTER.c: 24: for(i=0;i<6;i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l2708:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2305
	movlw	low(06h)
	subwf	(main@i),w
u2305:

	skipc
	goto	u2301
	goto	u2300
u2301:
	goto	l2712
u2300:
	goto	l696
	
l2710:	
	goto	l696
	line	25
	
l697:	
	line	26
	
l2712:	
;I2C MASTER.c: 25: {
;I2C MASTER.c: 26: send(k[i]);
	movf	(main@i),w
	addlw	_k&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	fcall	_send
	line	27
	
l2714:	
;I2C MASTER.c: 27: _delay((unsigned long)((10)*(20000000/4000.0)));
	opt asmopt_off
movlw	65
movwf	((??_main+0)+0+1),f
	movlw	238
movwf	((??_main+0)+0),f
u2347:
	decfsz	((??_main+0)+0),f
	goto	u2347
	decfsz	((??_main+0)+0+1),f
	goto	u2347
	clrwdt
opt asmopt_on

	line	24
	
l2716:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l2718:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(06h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2315
	movlw	low(06h)
	subwf	(main@i),w
u2315:

	skipc
	goto	u2311
	goto	u2310
u2311:
	goto	l2712
u2310:
	goto	l696
	
l698:	
	line	29
	
l696:	
	line	30
;I2C MASTER.c: 28: }
;I2C MASTER.c: 29: }
;I2C MASTER.c: 30: if(ACKSTAT==0)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	btfsc	(1166/8)^080h,(1166)&7
	goto	u2321
	goto	u2320
u2321:
	goto	l2700
u2320:
	goto	l700
	line	32
	
l2720:	
;I2C MASTER.c: 31: {
;I2C MASTER.c: 32: while(SSPIF==0);
	goto	l700
	
l701:	
	
l700:	
	bcf	status, 5	;RP0=0, select bank0
	btfss	(99/8),(99)&7
	goto	u2331
	goto	u2330
u2331:
	goto	l700
u2330:
	
l702:	
	line	33
;I2C MASTER.c: 33: SSPIF=0;
	bcf	(99/8),(99)&7
	line	34
	
l2722:	
;I2C MASTER.c: 34: stop();
	fcall	_stop
	line	35
	
l2724:	
;I2C MASTER.c: 35: _delay((unsigned long)((500)*(20000000/4000.0)));
	opt asmopt_off
movlw  13
movwf	((??_main+0)+0+2),f
movlw	175
movwf	((??_main+0)+0+1),f
	movlw	193
movwf	((??_main+0)+0),f
u2357:
	decfsz	((??_main+0)+0),f
	goto	u2357
	decfsz	((??_main+0)+0+1),f
	goto	u2357
	decfsz	((??_main+0)+0+2),f
	goto	u2357
	clrwdt
opt asmopt_on

	goto	l2700
	line	36
	
l699:	
	goto	l2700
	line	38
	
l703:	
	line	18
	goto	l2700
	
l704:	
	line	39
	
l705:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,88
	global	_stop
psect	text149,local,class=CODE,delta=2
global __ptext149
__ptext149:

;; *************** function _stop *****************
;; Defined at:
;;		line 50 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\MASTER\I2C MASTER.c"
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
psect	text149
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\MASTER\I2C MASTER.c"
	line	50
	global	__size_of_stop
	__size_of_stop	equ	__end_of_stop-_stop
	
_stop:	
	opt	stack 7
; Regs used in _stop: [wreg]
	line	51
	
l2684:	
;I2C MASTER.c: 51: _delay((unsigned long)((500)*(20000000/4000.0)));
	opt asmopt_off
movlw  13
movwf	((??_stop+0)+0+2),f
movlw	175
movwf	((??_stop+0)+0+1),f
	movlw	193
movwf	((??_stop+0)+0),f
u2367:
	decfsz	((??_stop+0)+0),f
	goto	u2367
	decfsz	((??_stop+0)+0+1),f
	goto	u2367
	decfsz	((??_stop+0)+0+2),f
	goto	u2367
	clrwdt
opt asmopt_on

	line	52
	
l2686:	
;I2C MASTER.c: 52: PEN=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1162/8)^080h,(1162)&7
	line	53
	
l2688:	
;I2C MASTER.c: 53: SSPIF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	56
	
l711:	
	return
	opt stack 0
GLOBAL	__end_of_stop
	__end_of_stop:
;; =============== function _stop ends ============

	signat	_stop,88
	global	_send
psect	text150,local,class=CODE,delta=2
global __ptext150
__ptext150:

;; *************** function _send *****************
;; Defined at:
;;		line 58 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\MASTER\I2C MASTER.c"
;; Parameters:    Size  Location     Type
;;  m               1    wreg     unsigned char 
;; Auto vars:     Size  Location     Type
;;  m               1    3[COMMON] unsigned char 
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
psect	text150
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\MASTER\I2C MASTER.c"
	line	58
	global	__size_of_send
	__size_of_send	equ	__end_of_send-_send
	
_send:	
	opt	stack 7
; Regs used in _send: [wreg]
;send@m stored from wreg
	movwf	(send@m)
	line	59
	
l2680:	
;I2C MASTER.c: 59: while(SSPIF==0);
	goto	l714
	
l715:	
	
l714:	
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	btfss	(99/8),(99)&7
	goto	u2281
	goto	u2280
u2281:
	goto	l714
u2280:
	
l716:	
	line	60
;I2C MASTER.c: 60: SSPIF=0;
	bcf	(99/8),(99)&7
	line	61
	
l2682:	
;I2C MASTER.c: 61: SSPBUF=m;
	movf	(send@m),w
	movwf	(19)	;volatile
	line	62
;I2C MASTER.c: 62: _delay((unsigned long)((500)*(20000000/4000.0)));
	opt asmopt_off
movlw  13
movwf	((??_send+0)+0+2),f
movlw	175
movwf	((??_send+0)+0+1),f
	movlw	193
movwf	((??_send+0)+0),f
u2377:
	decfsz	((??_send+0)+0),f
	goto	u2377
	decfsz	((??_send+0)+0+1),f
	goto	u2377
	decfsz	((??_send+0)+0+2),f
	goto	u2377
	clrwdt
opt asmopt_on

	line	63
	
l717:	
	return
	opt stack 0
GLOBAL	__end_of_send
	__end_of_send:
;; =============== function _send ends ============

	signat	_send,4216
	global	_start
psect	text151,local,class=CODE,delta=2
global __ptext151
__ptext151:

;; *************** function _start *****************
;; Defined at:
;;		line 41 in file "E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\MASTER\I2C MASTER.c"
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
psect	text151
	file	"E:\02-CODING\05-LYCASOFT CODING\02-CODING\01-PIC16F877A\33-NEW I2C\MASTER\I2C MASTER.c"
	line	41
	global	__size_of_start
	__size_of_start	equ	__end_of_start-_start
	
_start:	
	opt	stack 7
; Regs used in _start: [wreg]
	line	43
	
l2674:	
;I2C MASTER.c: 43: _delay((unsigned long)((500)*(20000000/4000.0)));
	opt asmopt_off
movlw  13
movwf	((??_start+0)+0+2),f
movlw	175
movwf	((??_start+0)+0+1),f
	movlw	193
movwf	((??_start+0)+0),f
u2387:
	decfsz	((??_start+0)+0),f
	goto	u2387
	decfsz	((??_start+0)+0+1),f
	goto	u2387
	decfsz	((??_start+0)+0+2),f
	goto	u2387
	clrwdt
opt asmopt_on

	line	44
	
l2676:	
;I2C MASTER.c: 44: SEN=1;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bsf	(1160/8)^080h,(1160)&7
	line	45
	
l2678:	
;I2C MASTER.c: 45: SSPIF=0;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bcf	(99/8),(99)&7
	line	48
	
l708:	
	return
	opt stack 0
GLOBAL	__end_of_start
	__end_of_start:
;; =============== function _start ends ============

	signat	_start,88
psect	text152,local,class=CODE,delta=2
global __ptext152
__ptext152:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
