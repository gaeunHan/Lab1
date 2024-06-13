;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Wed Jun 05 12:31:22 2024                                *
;******************************************************************************

;******************************************************************************
;* GLOBAL FILE PARAMETERS                                                     *
;*                                                                            *
;*   Architecture      : TMS320C670x                                          *
;*   Optimization      : Disabled                                             *
;*   Optimizing for    : Compile time, Ease of Development                    *
;*                       Based on options: no -o, no -ms                      *
;*   Endian            : Little                                               *
;*   Interrupt Thrshld : Disabled                                             *
;*   Memory Model      : Large                                                *
;*   Calls to RTS      : Far                                                  *
;*   Pipelining        : Disabled                                             *
;*   Memory Aliases    : Presume are aliases (pessimistic)                    *
;*   Debug Info        : No Debug Info                                        *
;*                                                                            *
;******************************************************************************

	.asg	A15, FP
	.asg	B14, DP
	.asg	B15, SP
	.global	$bss


	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_TFlag+0,32
	.field  	0,32			; _TFlag @ 0
	.sect	".text"
	.global	_TFlag
_TFlag:	.usect	.far,4,4
_refer$1:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_sum_error$2+0,32
	.word	000000000h		; _sum_error$2 @ 0
	.sect	".text"
_sum_error$2:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_prev_error$3+0,32
	.word	000000000h		; _prev_error$3 @ 0
	.sect	".text"
_prev_error$3:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_refer_d$4+0,32
	.word	000000000h		; _refer_d$4 @ 0
	.sect	".text"
_refer_d$4:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_sum_error_d$5+0,32
	.word	000000000h		; _sum_error_d$5 @ 0
	.sect	".text"
_sum_error_d$5:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_prev_error_d$6+0,32
	.word	000000000h		; _prev_error_d$6 @ 0
	.sect	".text"
_prev_error_d$6:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\user\AppData\Local\Temp\TI7048_2 --template_info_file C:\Users\user\AppData\Local\Temp\TI7048_3 --object_file interrupt.obj --opt_shell 9 interrupt.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 interrupt.c 
	.sect	".text"
	.global	_ISRextint4

;******************************************************************************
;* FUNCTION NAME: _ISRextint4                                                 *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_ISRextint4:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |11| 
           NOP             5
           ; BRANCH OCCURS                   ; |11| 


	.sect	".text"
	.global	_ISRextint5

;******************************************************************************
;* FUNCTION NAME: _ISRextint5                                                 *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_ISRextint5:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |17| 
           NOP             5
           ; BRANCH OCCURS                   ; |17| 


	.sect	".text"
	.global	_c_int08

;******************************************************************************
;* FUNCTION NAME: _c_int08                                                    *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_c_int08:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |29| 
           NOP             5
           ; BRANCH OCCURS                   ; |29| 


	.sect	".text"
	.global	_c_int09

;******************************************************************************
;* FUNCTION NAME: _c_int09                                                    *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_c_int09:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |35| 
           NOP             5
           ; BRANCH OCCURS                   ; |35| 


	.sect	".text"
	.global	_ISRNMI

;******************************************************************************
;* FUNCTION NAME: _ISRNMI                                                     *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_ISRNMI:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |30| 
           NOP             5
           ; BRANCH OCCURS                   ; |30| 


	.sect	".text"
	.global	_ISRextint6

;******************************************************************************
;* FUNCTION NAME: _ISRextint6                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 4 Auto + 84 Save = 88 byte                  *
;******************************************************************************
_ISRextint6:
;** --------------------------------------------------------------------------*
           STW     .D2T2   B9,*SP--(88)      ; |33| 
           STW     .D2T1   A0,*+SP(12)       ; |33| 
           STW     .D2T2   B7,*+SP(80)       ; |33| 
           STW     .D2T2   B6,*+SP(76)       ; |33| 
           STW     .D2T2   B5,*+SP(72)       ; |33| 
           STW     .D2T2   B4,*+SP(68)       ; |33| 
           STW     .D2T2   B3,*+SP(64)       ; |33| 
           STW     .D2T2   B2,*+SP(60)       ; |33| 
           STW     .D2T2   B1,*+SP(56)       ; |33| 
           STW     .D2T2   B0,*+SP(52)       ; |33| 
           STW     .D2T1   A9,*+SP(48)       ; |33| 
           STW     .D2T1   A8,*+SP(44)       ; |33| 
           STW     .D2T1   A7,*+SP(40)       ; |33| 
           STW     .D2T1   A6,*+SP(36)       ; |33| 
           STW     .D2T1   A5,*+SP(32)       ; |33| 
           STW     .D2T1   A4,*+SP(28)       ; |33| 
           STW     .D2T1   A3,*+SP(24)       ; |33| 
           STW     .D2T1   A2,*+SP(20)       ; |33| 

           STW     .D2T1   A1,*+SP(16)       ; |33| 
||         MVKL    .S1     0x2000008,A0      ; |36| 

           MVKH    .S1     0x2000008,A0      ; |36| 
||         STW     .D2T2   B8,*+SP(84)       ; |33| 

           LDW     .D1T1   *A0,A0            ; |36| 
           NOP             4
           AND     .S1     15,A0,A0          ; |36| 
           CMPEQ   .L1     A0,1,A1           ; |36| 
   [ A1]   B       .S1     L8                ; |36| 
           STW     .D2T1   A0,*+SP(4)        ; |36| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |70| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |70| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |70| 
   [ A1]   LDW     .D2T2   *+SP(68),B4       ; |70| 
           ; BRANCH OCCURS                   ; |36| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(4),B4        ; |37| 
           NOP             3
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L1
;** --------------------------------------------------------------------------*
L1:    
           NOP             1
           CMPEQ   .L2     B4,4,B0           ; |37| 
   [!B0]   B       .S1     L3                ; |37| 

   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |49| 
|| [ B0]   MVKL    .S1     0x2000014,A0      ; |38| 

   [ B0]   MVKH    .S1     0x2000014,A0      ; |38| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |38| 
           NOP             2
           ; BRANCH OCCURS                   ; |37| 
;** --------------------------------------------------------------------------*
           NOP             2
           AND     .S1     1,A0,A1           ; |38| 
   [!A1]   B       .S1     L7                ; |38| 
   [!A1]   MVKL    .S1     0x2000008,A0      ; |69| 
   [!A1]   MVKH    .S1     0x2000008,A0      ; |69| 

   [ A1]   ZERO    .D2     B4                ; |39| 
|| [ A1]   MVKL    .S2     _compacket+124,B5 ; |39| 
|| [!A1]   LDW     .D1T1   *A0,A0            ; |69| 

   [ A1]   MVKH    .S2     0x2000000,B4      ; |39| 

   [ A1]   MVKH    .S2     _compacket+124,B5 ; |39| 
|| [ A1]   LDW     .D2T2   *B4,B4            ; |39| 

           ; BRANCH OCCURS                   ; |38| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *B5,B5            ; |39| 
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L2:    
           MVKL    .S1     _compacket+124,A0 ; |40| 
           MVKH    .S1     _compacket+124,A0 ; |40| 
           EXTU    .S2     B4,24,24,B4       ; |39| 
           STB     .D2T2   B4,*B5            ; |39| 
           LDW     .D1T1   *A0,A3            ; |40| 
           MVKL    .S1     _SendByte,A0      ; |40| 
           MVKH    .S1     _SendByte,A0      ; |40| 
           MVKL    .S2     RL0,B3            ; |40| 
           B       .S2X    A0                ; |40| 
           LDB     .D1T1   *A3,A4            ; |40| 
           MVKH    .S2     RL0,B3            ; |40| 
           NOP             3
RL0:       ; CALL OCCURS                     ; |40| 
           MVKL    .S2     _compacket+124,B4 ; |41| 
           MVKH    .S2     _compacket+124,B4 ; |41| 
           LDW     .D2T2   *B4,B4            ; |41| 
           MVKL    .S1     _compacket+99,A0  ; |41| 
           MVKH    .S1     _compacket+99,A0  ; |41| 
           NOP             2
           CMPEQ   .L1X    B4,A0,A1          ; |41| 
   [!A1]   MVKL    .S2     _compacket+124,B4 ; |45| 
   [!A1]   MVKH    .S2     _compacket+124,B4 ; |45| 
   [!A1]   LDW     .D2T2   *B4,B5            ; |45| 
   [ A1]   MVKL    .S2     _compacket+124,B4 ; |42| 
   [ A1]   MVKL    .S1     _compacket,A0     ; |42| 
   [ A1]   MVKH    .S2     _compacket+124,B4 ; |42| 
   [ A1]   MVKH    .S1     _compacket,A0     ; |42| 

           MVKL    .S2     0x2000014,B5      ; |47| 
|| [!A1]   ADD     .D2     1,B5,B6           ; |45| 

   [!A1]   STW     .D2T2   B6,*B4            ; |45| 

   [ A1]   STW     .D2T1   A0,*B4            ; |42| 
||         MVKH    .S2     0x2000014,B5      ; |47| 

           LDW     .D2T2   *B5,B4            ; |47| 
           NOP             4
           AND     .S2     1,B4,B0           ; |47| 
   [ B0]   B       .S1     L2                ; |47| 

   [ B0]   ZERO    .D2     B4                ; |39| 
|| [ B0]   MVKL    .S2     _compacket+124,B5 ; |39| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |39| 

   [ B0]   MVKH    .S2     _compacket+124,B5 ; |39| 
|| [ B0]   LDW     .D2T2   *B4,B4            ; |39| 

   [ B0]   LDW     .D2T2   *B5,B5            ; |39| 
           NOP             1
           ; BRANCH OCCURS                   ; |47| 
;** --------------------------------------------------------------------------*
           B       .S1     L7                ; |48| 
           MVKL    .S1     0x2000008,A0      ; |69| 
           MVKH    .S1     0x2000008,A0      ; |69| 
           LDW     .D1T1   *A0,A0            ; |69| 
           NOP             2
           ; BRANCH OCCURS                   ; |48| 
;** --------------------------------------------------------------------------*
L3:    
           CMPEQ   .L2     B4,2,B0           ; |49| 
   [!B0]   B       .S1     L4                ; |49| 
   [ B0]   MVKL    .S2     _respacket+200,B4 ; |50| 
           NOP             3
   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |58| 
           ; BRANCH OCCURS                   ; |49| 
;** --------------------------------------------------------------------------*
           MVKH    .S2     _respacket+200,B4 ; |50| 
           LDW     .D2T2   *B4,B5            ; |50| 
           NOP             4
           CMPGT   .L2     B5,0,B0           ; |50| 

   [ B0]   MVKL    .S1     _respacket+204,A0 ; |51| 
||         SUB     .D2     B5,1,B5           ; |50| 

   [ B0]   MVKH    .S1     _respacket+204,A0 ; |51| 
||         STW     .D2T2   B5,*B4            ; |50| 

   [ B0]   LDW     .D1T1   *A0,A3            ; |51| 
   [ B0]   MVKL    .S1     _respacket,A4     ; |51| 
   [ B0]   MVKH    .S1     _respacket,A4     ; |51| 
   [!B0]   MVKL    .S1     0x2000004,A0      ; |54| 
   [!B0]   MVKL    .S2     _respacket+208,B4 ; |55| 
   [ B0]   ADD     .D1     1,A3,A5           ; |51| 
   [ B0]   STW     .D1T1   A5,*A0            ; |51| 

           B       .S1     L6                ; |57| 
|| [ B0]   LDB     .D1T1   *+A3[A4],A0       ; |51| 

   [!B0]   MVKH    .S1     0x2000004,A0      ; |54| 
   [!B0]   MVK     .S2     1,B5              ; |54| 

   [!B0]   ZERO    .D2     B5                ; |55| 
|| [ B0]   ZERO    .L2     B4                ; |51| 
|| [!B0]   MVKH    .S2     _respacket+208,B4 ; |55| 
|| [!B0]   STW     .D1T2   B5,*A0            ; |54| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |51| 
|| [!B0]   STW     .D2T2   B5,*B4            ; |55| 

   [ B0]   STW     .D2T1   A0,*B4            ; |51| 
           ; BRANCH OCCURS                   ; |57| 
;** --------------------------------------------------------------------------*
L4:    
           NOP             4
           CMPEQ   .L2     B4,12,B0          ; |58| 
   [!B0]   B       .S1     L6                ; |58| 
           NOP             2
   [ B0]   MVKL    .S1     0x2000014,A0      ; |59| 
   [ B0]   MVKH    .S1     0x2000014,A0      ; |59| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |59| 
           ; BRANCH OCCURS                   ; |58| 
;** --------------------------------------------------------------------------*
           NOP             4
           AND     .S1     1,A0,A1           ; |59| 
   [!A1]   B       .S1     L6                ; |59| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |60| 
           ; BRANCH OCCURS                   ; |59| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L5:    

           MVKH    .S2     0x2000000,B4      ; |60| 
||         MVKL    .S1     _compacket+124,A0 ; |60| 

           LDW     .D2T2   *B4,B4            ; |60| 
||         MVKH    .S1     _compacket+124,A0 ; |60| 

           LDW     .D1T1   *A0,A3            ; |60| 
           MVKL    .S1     _compacket+124,A0 ; |61| 
           MVKH    .S1     _compacket+124,A0 ; |61| 
           NOP             1
           EXTU    .S2     B4,24,24,B4       ; |60| 
           STB     .D1T2   B4,*A3            ; |60| 
           LDW     .D1T1   *A0,A0            ; |61| 
           MVKL    .S2     _compacket+99,B4  ; |61| 
           MVKH    .S2     _compacket+99,B4  ; |61| 
           NOP             2
           CMPEQ   .L2X    A0,B4,B0          ; |61| 
   [!B0]   MVKL    .S1     _compacket+124,A0 ; |65| 
   [!B0]   MVKH    .S1     _compacket+124,A0 ; |65| 
   [!B0]   MV      .D1     A0,A4             ; |65| 
   [!B0]   LDW     .D1T1   *A4,A0            ; |65| 
   [ B0]   MVKL    .S1     _compacket+124,A0 ; |62| 
   [ B0]   MVKL    .S2     _compacket,B4     ; |62| 
   [ B0]   MVKH    .S1     _compacket+124,A0 ; |62| 
   [ B0]   MVKH    .S2     _compacket,B4     ; |62| 

           MVKL    .S1     0x2000014,A0      ; |67| 
|| [!B0]   ADD     .L1     1,A0,A3           ; |65| 
|| [ B0]   STW     .D1T2   B4,*A0            ; |62| 

           MVKH    .S1     0x2000014,A0      ; |67| 
|| [!B0]   STW     .D1T1   A3,*A4            ; |65| 

           LDW     .D1T1   *A0,A0            ; |67| 
           NOP             4
           AND     .S1     1,A0,A1           ; |67| 
   [ A1]   B       .S1     L5                ; |67| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |60| 
           ; BRANCH OCCURS                   ; |67| 
;** --------------------------------------------------------------------------*
L6:    
           MVKL    .S1     0x2000008,A0      ; |69| 
           MVKH    .S1     0x2000008,A0      ; |69| 
           LDW     .D1T1   *A0,A0            ; |69| 
           NOP             2
;** --------------------------------------------------------------------------*
L7:    
           NOP             2
           AND     .S1     15,A0,A0          ; |69| 
           CMPEQ   .L1     A0,1,A1           ; |69| 
   [!A1]   B       .S1     L1                ; |69| 
           STW     .D2T1   A0,*+SP(4)        ; |69| 
   [!A1]   LDW     .D2T2   *+SP(4),B4        ; |37| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |70| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |70| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |70| 
           ; BRANCH OCCURS                   ; |69| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(68),B4       ; |70| 
;** --------------------------------------------------------------------------*
L8:    
           LDW     .D2T2   *+SP(64),B3       ; |70| 
           LDW     .D2T2   *+SP(60),B2       ; |70| 
           LDW     .D2T2   *+SP(56),B1       ; |70| 
           LDW     .D2T2   *+SP(52),B0       ; |70| 
           LDW     .D2T1   *+SP(48),A9       ; |70| 
           LDW     .D2T1   *+SP(44),A8       ; |70| 
           LDW     .D2T1   *+SP(40),A7       ; |70| 
           LDW     .D2T1   *+SP(36),A6       ; |70| 
           LDW     .D2T1   *+SP(32),A5       ; |70| 
           LDW     .D2T1   *+SP(28),A4       ; |70| 
           LDW     .D2T1   *+SP(24),A3       ; |70| 
           LDW     .D2T1   *+SP(20),A2       ; |70| 
           LDW     .D2T1   *+SP(16),A1       ; |70| 
           LDW     .D2T1   *+SP(12),A0       ; |70| 

           B       .S2     IRP               ; |70| 
||         LDW     .D2T2   *+SP(84),B8       ; |70| 

           LDW     .D2T2   *++SP(88),B9      ; |70| 
           NOP             4
           ; BRANCH OCCURS                   ; |70| 


	.sect	".text"
	.global	_ISRtimer0

;******************************************************************************
;* FUNCTION NAME: _ISRtimer0                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,B12,B13,SP                *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,B12,B13,SP                *
;*   Local Frame Size  : 0 Args + 8 Auto + 108 Save = 116 byte                *
;******************************************************************************
_ISRtimer0:
;** --------------------------------------------------------------------------*
           STW     .D2T2   B13,*SP--(120)    ; |75| 
           STW     .D2T2   B5,*+SP(88)       ; |75| 
           STW     .D2T1   A0,*+SP(20)       ; |75| 
           STW     .D2T2   B4,*+SP(84)       ; |75| 
           STW     .D2T2   B6,*+SP(92)       ; |75| 
           STW     .D2T1   A3,*+SP(32)       ; |75| 
           STW     .D2T2   B7,*+SP(96)       ; |75| 
           STW     .D2T1   A1,*+SP(24)       ; |75| 
           STW     .D2T1   A2,*+SP(28)       ; |75| 
           STW     .D2T1   A4,*+SP(36)       ; |75| 
           STW     .D2T1   A5,*+SP(40)       ; |75| 
           STW     .D2T1   A6,*+SP(44)       ; |75| 
           STW     .D2T1   A7,*+SP(48)       ; |75| 
           STW     .D2T1   A8,*+SP(52)       ; |75| 
           STW     .D2T1   A9,*+SP(56)       ; |75| 
           STW     .D2T1   A10,*+SP(60)      ; |75| 
           STW     .D2T1   A11,*+SP(64)      ; |75| 
           STW     .D2T2   B0,*+SP(68)       ; |75| 
           STW     .D2T2   B1,*+SP(72)       ; |75| 
           STW     .D2T2   B2,*+SP(76)       ; |75| 
           STW     .D2T2   B3,*+SP(80)       ; |75| 
           STW     .D2T2   B8,*+SP(100)      ; |75| 
           STW     .D2T2   B9,*+SP(104)      ; |75| 
           STW     .D2T2   B10,*+SP(108)     ; |75| 
           STW     .D2T2   B11,*+SP(112)     ; |75| 

           STW     .D2T2   B12,*+SP(116)     ; |75| 
||         MVKL    .S2     _angle_d,B5       ; |89| 
||         ZERO    .D1     A0                ; |77| 

           MVKL    .S1     _con_input_d,A0   ; |88| 
||         STW     .D2T1   A0,*+SP(4)        ; |77| 
||         MVKL    .S2     _con_input,B4     ; |90| 
||         ZERO    .L2     B6                ; |84| 

           MVKH    .S1     _con_input_d,A0   ; |88| 
||         STW     .D2T2   B6,*+SP(8)        ; |84| 
||         MVKH    .S2     _angle_d,B5       ; |89| 
||         ZERO    .D1     A3                ; |88| 

           STW     .D1T1   A3,*A0            ; |88| 
||         MVKH    .S2     _con_input,B4     ; |90| 
||         ZERO    .D2     B7                ; |89| 

           ZERO    .L2     B5                ; |90| 
||         STW     .D2T2   B7,*B5            ; |89| 
||         MVKL    .S1     _error,A0         ; |91| 
||         MVKL    .S2     _angle,B6         ; |92| 

           STW     .D2T2   B5,*B4            ; |90| 
||         MVKH    .S1     _error,A0         ; |91| 
||         MVKH    .S2     _angle,B6         ; |92| 

           STW     .D1T1   A3,*A0            ; |91| 
||         MVKL    .S2     0x2000040,B4      ; |96| 

           STW     .D2T2   B5,*B6            ; |92| 
||         MVKH    .S2     0x2000040,B4      ; |96| 

           LDW     .D2T2   *B4,B4            ; |96| 
           MVKL    .S1     0x2000040,A4      ; |96| 
           MVKH    .S1     0x2000040,A4      ; |96| 
           MVKL    .S1     _TFlag,A3         ; |97| 
           MVKH    .S1     _TFlag,A3         ; |97| 
           CMPEQ   .L2     B4,0,B4           ; |96| 

           MVK     .S2     1,B4              ; |97| 
||         STW     .D1T2   B4,*A4            ; |96| 
||         MVKL    .S1     _TINTCnt,A0       ; |99| 

           STW     .D1T2   B4,*A3            ; |97| 
||         MVKH    .S1     _TINTCnt,A0       ; |99| 

           LDW     .D1T1   *A0,A3            ; |99| 
           MVKL    .S2     RL2,B3            ; |103| 
           MVKL    .S2     _refer$1,B4       ; |102| 
           ZERO    .D1     A4                ; |102| 
           MVKH    .S2     _refer$1,B4       ; |102| 

           MVKL    .S1     _GetAngle,A3      ; |103| 
||         ADD     .D1     1,A3,A5           ; |99| 

           MVKH    .S1     _GetAngle,A3      ; |103| 
           B       .S2X    A3                ; |103| 
           MVKH    .S1     0x43340000,A4     ; |102| 
           MVKH    .S2     RL2,B3            ; |103| 
           NOP             1
           STW     .D1T1   A5,*A0            ; |99| 
           STW     .D2T1   A4,*B4            ; |102| 
RL2:       ; CALL OCCURS                     ; |103| 
           MVKL    .S2     _angle,B4         ; |103| 

           MVKH    .S2     _angle,B4         ; |103| 
||         MVKL    .S1     _angle,A0         ; |105| 

           STW     .D2T1   A4,*B4            ; |103| 
||         MVKH    .S1     _angle,A0         ; |105| 

           MVKL    .S2     _refer$1,B4       ; |105| 
||         LDW     .D1T1   *A0,A0            ; |105| 

           MVKH    .S2     _refer$1,B4       ; |105| 
           LDW     .D2T2   *B4,B4            ; |105| 
           MVKL    .S2     RL4,B3            ; |111| 
           MVKH    .S2     RL4,B3            ; |111| 
           SPDP    .S1     A0,A1:A0          ; |105| 
           NOP             1

           ABSDP   .S1     A1:A0,A1:A0       ; |105| 
||         SPDP    .S2     B4,B5:B4          ; |105| 

           NOP             1
           SUBDP   .L2X    B5:B4,A1:A0,B5:B4 ; |105| 
           NOP             6
           DPSP    .L2     B5:B4,B4          ; |105| 
           MVKL    .S1     _error,A0         ; |105| 
           MVKH    .S1     _error,A0         ; |105| 
           MVKL    .S1     _angle,A3         ; |106| 

           STW     .D1T2   B4,*A0            ; |105| 
||         MVKH    .S1     _angle,A3         ; |106| 

           LDW     .D1T1   *A3,A4            ; |106| 
           MVKL    .S1     _error,A0         ; |107| 
           ZERO    .D1     A3                ; |106| 
           MVKH    .S1     _error,A0         ; |107| 
           ZERO    .D2     B4                ; |107| 
           CMPGTSP .S1     A4,A3,A1          ; |106| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |107| 
           MVKH    .S2     0xbf800000,B4     ; |107| 
           NOP             3

           MVKL    .S2     _GetAngleDist,B4  ; |111| 
|| [ A1]   MPYSP   .M2X    B4,A3,B5          ; |107| 

           MVKH    .S2     _GetAngleDist,B4  ; |111| 
           B       .S2     B4                ; |111| 
           NOP             2
           MVKL    .S1     _refer_d$4,A3     ; |110| 

           ZERO    .D2     B5                ; |110| 
||         MVKH    .S1     _refer_d$4,A3     ; |110| 
|| [ A1]   STW     .D1T2   B5,*A0            ; |107| 

           STW     .D1T2   B5,*A3            ; |110| 
RL4:       ; CALL OCCURS                     ; |111| 
           MVKL    .S1     _angle_d,A0       ; |113| 
           MVKL    .S1     _angle_d,A3       ; |111| 

           MVKL    .S2     _refer_d$4,B4     ; |113| 
||         MVKH    .S1     _angle_d,A3       ; |111| 

           MVKH    .S2     _refer_d$4,B4     ; |113| 
||         STW     .D1T1   A4,*A3            ; |111| 
||         MVKH    .S1     _angle_d,A0       ; |113| 

           LDW     .D2T2   *B4,B4            ; |113| 
||         LDW     .D1T1   *A0,A0            ; |113| 

           MVKL    .S1     0x4065e000,A1     ; |118| 
           MVKL    .S2     0xc59c4000,B13    ; |120| 
           MVKH    .S1     0x4065e000,A1     ; |118| 
           MVKL    .S2     _sum_error_d$5,B12 ; |121| 
           SUBSP   .L2X    B4,A0,B4          ; |113| 
           ZERO    .D1     A0                ; |118| 
           MVKL    .S2     _startFlag,B6     ; |118| 
           MVKH    .S2     _startFlag,B6     ; |118| 

           ZERO    .S2     B4                ; |115| 
||         STW     .D2T2   B4,*+SP(8)        ; |113| 
||         MV      .L2     B4,B5             ; |113| 

           MVKH    .S2     0xbf800000,B4     ; |115| 
           MPYSP   .M2     B4,B5,B5          ; |115| 
           MVKL    .S2     _angle,B4         ; |118| 
           MVKH    .S2     _angle,B4         ; |118| 
           MVKH    .S2     0xc59c4000,B13    ; |120| 
           STW     .D2T2   B5,*+SP(8)        ; |115| 
           LDW     .D2T2   *B4,B4            ; |118| 
           MVKH    .S2     _sum_error_d$5,B12 ; |121| 
           MVKL    .S2     _startFlag,B0     ; |124| 
           MVKL    .S2     _con_input,B8     ; |126| 
           MVK     .S1     1,A6              ; |119| 
           SPDP    .S2     B4,B5:B4          ; |118| 
           ZERO    .D2     B2                ; |129| 
           ABSDP   .S2     B5:B4,B5:B4       ; |118| 
           MVKL    .S1     _sum_error_d$5,A8 ; |129| 
           CMPLTDP .S1X    B5:B4,A1:A0,A0    ; |118| 
           MVKL    .S2     _prev_error$3,B1  ; |126| 
           XOR     .S1     1,A0,A1           ; |118| 
   [ A1]   LDW     .D2T2   *B6,B5            ; |118| 
           ZERO    .D2     B6                ; |126| 
           MVKH    .S2     0x40a00000,B6     ; |126| 
           MVKL    .S1     _startFlag,A0     ; |119| 
           MVKH    .S1     _startFlag,A0     ; |119| 

   [ A1]   CMPEQ   .L1X    B5,0,A1           ; |118| 
||         MVKL    .S2     _sum_error$2,B3   ; |120| 

           MVKH    .S2     _sum_error$2,B3   ; |120| 
|| [ A1]   STW     .D1T1   A6,*A0            ; |119| 

           MVKL    .S2     _con_input,B9     ; |130| 
|| [ A1]   STW     .D2T2   B13,*B3           ; |120| 
||         ZERO    .D1     A0                ; |121| 

           MVKL    .S2     0x3e19999a,B11    ; |129| 
|| [ A1]   STW     .D2T1   A0,*B12           ; |121| 

           MVKL    .S2     _PWMOut,B10       ; |131| 
||         ZERO    .D1     A1                ; |126| 

           MVKH    .S1     0x3f000000,A1     ; |126| 
||         MVKH    .S2     _startFlag,B0     ; |124| 

           MVKH    .S2     0x3e800000,B2     ; |129| 

           MVKH    .S2     _con_input,B8     ; |126| 
||         MVKL    .S1     _sum_error$2,A9   ; |126| 

           MVKH    .S2     _prev_error$3,B1  ; |126| 
||         MVKL    .S1     _con_input_d,A7   ; |130| 

           LDW     .D2T2   *B0,B0            ; |124| 
||         MVKH    .S2     _con_input,B9     ; |130| 
||         MVKH    .S1     _sum_error_d$5,A8 ; |129| 

           MVKH    .S1     _sum_error$2,A9   ; |126| 
||         MVKH    .S2     0x3e19999a,B11    ; |129| 

           MVKH    .S2     _PWMOut,B10       ; |131| 
||         MVKH    .S1     _con_input_d,A7   ; |130| 
||         ZERO    .D1     A2                ; |126| 

           MVKH    .S1     0x41c80000,A2     ; |126| 
||         MVKL    .S2     _prev_error_d$6,B7 ; |129| 

           MVKH    .S2     _prev_error_d$6,B7 ; |129| 
||         MVKL    .S1     _error,A6         ; |126| 

           MVKH    .S1     _error,A6         ; |126| 
||         CMPEQ   .L2     B0,1,B0           ; |124| 
||         MVKL    .S2     RL6,B3            ; |131| 

   [!B0]   B       .S2     L9                ; |124| 
||         MVKL    .S1     _error,A5         ; |126| 

           MVKL    .S1     _sum_error$2,A4   ; |125| 
||         MVKH    .S2     RL6,B3            ; |131| 

           MVKH    .S1     _error,A5         ; |126| 
||         MVKL    .S2     _error,B5         ; |125| 

           MVKL    .S1     _con_input_d,A3   ; |129| 
||         MVKL    .S2     _sum_error_d$5,B4 ; |128| 

           MVKH    .S1     _sum_error$2,A4   ; |125| 
||         MVKH    .S2     _sum_error_d$5,B4 ; |128| 

           MVKH    .S1     _con_input_d,A3   ; |129| 
||         MVKH    .S2     _error,B5         ; |125| 
||         MV      .L1X    B4,A0             ; |128| 
||         ZERO    .D1     A10               ; |129| 

           ; BRANCH OCCURS                   ; |124| 
;** --------------------------------------------------------------------------*

           LDW     .D2T2   *B5,B4            ; |125| 
||         LDW     .D1T1   *A4,A11           ; |125| 

           NOP             4
           ADDSP   .L2X    B4,A11,B4         ; |125| 
           NOP             3
           STW     .D1T2   B4,*A4            ; |125| 
           LDW     .D1T1   *A6,A4            ; |126| 
           LDW     .D1T1   *A5,A5            ; |126| 

           LDW     .D1T1   *A9,A6            ; |126| 
||         LDW     .D2T2   *B1,B4            ; |126| 

           NOP             3
           MPYSP   .M1     A4,A2,A4          ; |126| 

           MPYSP   .M1     A6,A1,A5          ; |126| 
||         SUBSP   .L2X    A5,B4,B4          ; |126| 

           NOP             3

           ADDSP   .L1     A5,A4,A4          ; |126| 
||         MPYSP   .M2     B4,B6,B4          ; |126| 

           NOP             3
           ADDSP   .L2X    B4,A4,B4          ; |126| 
           NOP             3
           STW     .D2T2   B4,*B8            ; |126| 

           LDW     .D2T2   *+SP(8),B4        ; |128| 
||         LDW     .D1T1   *A0,A4            ; |128| 

           NOP             4
           ADDSP   .L1X    B4,A4,A4          ; |128| 
           NOP             3
           STW     .D1T1   A4,*A0            ; |128| 
           LDW     .D2T2   *+SP(8),B4        ; |129| 

           LDW     .D1T1   *A8,A0            ; |129| 
||         LDW     .D2T2   *B7,B6            ; |129| 

           NOP             3
           MV      .D2     B4,B5             ; |129| 

           MPYSP   .M1     A0,A10,A0         ; |129| 
||         SUBSP   .L2     B5,B6,B4          ; |129| 
||         MPYSP   .M2     B4,B2,B5          ; |129| 

           NOP             3

           ADDSP   .L1X    A0,B5,A0          ; |129| 
||         MPYSP   .M2     B4,B11,B4         ; |129| 

           NOP             3
           ADDSP   .L1X    B4,A0,A0          ; |129| 
           NOP             3
           STW     .D1T1   A0,*A3            ; |129| 

           LDW     .D2T2   *B9,B4            ; |130| 
||         LDW     .D1T1   *A7,A0            ; |130| 

           NOP             3
           B       .S2     B10               ; |131| 
           SUBSP   .L2X    B4,A0,B4          ; |130| 
           NOP             3

           STW     .D2T2   B4,*+SP(4)        ; |130| 
||         MV      .S1X    B4,A4             ; |130| 

RL6:       ; CALL OCCURS                     ; |131| 
;** --------------------------------------------------------------------------*
L9:    
           MVKL    .S1     _error,A0         ; |134| 
           MVKH    .S1     _error,A0         ; |134| 
           LDW     .D1T1   *A0,A0            ; |134| 
           MVKL    .S2     _prev_error$3,B4  ; |134| 
           MVKH    .S2     _prev_error$3,B4  ; |134| 
           MVKL    .S2     _prev_error$3,B7  ; |137| 
           MVKL    .S2     _UMAddData,B5     ; |137| 
           STW     .D2T1   A0,*B4            ; |134| 
           LDW     .D2T2   *+SP(8),B6        ; |135| 
           MVKL    .S1     _prev_error_d$6,A3 ; |135| 

           MVKH    .S2     _prev_error$3,B7  ; |137| 
||         MVKL    .S1     _angle_d,A4       ; |137| 

           MVKH    .S2     _UMAddData,B5     ; |137| 
||         MVKH    .S1     _prev_error_d$6,A3 ; |135| 

           MVKL    .S2     _error,B4         ; |137| 
||         MVKH    .S1     _angle_d,A4       ; |137| 

           STW     .D1T2   B6,*A3            ; |135| 
||         MVKL    .S1     _sum_error$2,A0   ; |137| 
||         MVKH    .S2     _error,B4         ; |137| 

           B       .S2     B5                ; |137| 
||         LDW     .D1T2   *A4,B6            ; |137| 
||         LDW     .D2T1   *B7,A6            ; |137| 
||         MVKH    .S1     _sum_error$2,A0   ; |137| 

           LDW     .D1T2   *A0,B4            ; |137| 
||         LDW     .D2T1   *B4,A4            ; |137| 

           MVKL    .S2     RL8,B3            ; |137| 
           MVKH    .S2     RL8,B3            ; |137| 
           NOP             2
RL8:       ; CALL OCCURS                     ; |137| 
           LDW     .D2T2   *+SP(116),B12     ; |140| 
           LDW     .D2T2   *+SP(112),B11     ; |140| 
           LDW     .D2T2   *+SP(108),B10     ; |140| 
           LDW     .D2T2   *+SP(104),B9      ; |140| 
           LDW     .D2T2   *+SP(100),B8      ; |140| 
           LDW     .D2T2   *+SP(76),B2       ; |140| 
           LDW     .D2T2   *+SP(72),B1       ; |140| 
           LDW     .D2T2   *+SP(68),B0       ; |140| 
           LDW     .D2T1   *+SP(64),A11      ; |140| 
           LDW     .D2T1   *+SP(60),A10      ; |140| 
           LDW     .D2T1   *+SP(56),A9       ; |140| 
           LDW     .D2T1   *+SP(52),A8       ; |140| 
           LDW     .D2T1   *+SP(48),A7       ; |140| 
           LDW     .D2T1   *+SP(40),A5       ; |140| 
           LDW     .D2T1   *+SP(28),A2       ; |140| 
           LDW     .D2T1   *+SP(24),A1       ; |140| 
           LDW     .D2T2   *+SP(88),B5       ; |140| 
           LDW     .D2T1   *+SP(32),A3       ; |140| 
           LDW     .D2T2   *+SP(96),B7       ; |140| 
           LDW     .D2T1   *+SP(20),A0       ; |140| 
           LDW     .D2T2   *+SP(80),B3       ; |140| 
           LDW     .D2T2   *+SP(84),B4       ; |140| 
           LDW     .D2T1   *+SP(44),A6       ; |140| 
           LDW     .D2T1   *+SP(36),A4       ; |140| 

           LDW     .D2T2   *+SP(92),B6       ; |140| 
||         B       .S2     IRP               ; |140| 

           LDW     .D2T2   *++SP(120),B13    ; |140| 
           NOP             4
           ; BRANCH OCCURS                   ; |140| 


;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_SendByte
	.global	_GetAngle
	.global	_GetAngleDist
	.global	_PWMOut
	.global	_UMAddData
	.global	_compacket
	.global	_respacket
	.global	_TINTCnt
	.global	_angle
	.global	_error
	.global	_angle_d
	.global	_startFlag
	.global	_con_input_d
	.global	_con_input
