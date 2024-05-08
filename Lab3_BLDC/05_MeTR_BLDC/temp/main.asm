;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Wed May 08 17:21:51 2024                                *
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

	.global	_PWMD
_PWMD:	.usect	.far,4,4
	.global	_PWMH
_PWMH:	.usect	.far,4,4
	.global	_PWML
_PWML:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_hallCount+0,32
	.field  	-1,32			; _hallCount @ 0
	.sect	".text"
	.global	_hallCount
_hallCount:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_prevHall+0,32
	.field  	0,32			; _prevHall @ 0
	.sect	".text"
	.global	_prevHall
_prevHall:	.usect	.far,4,4
	.global	_currHall
_currHall:	.usect	.far,4,4
	.global	_currAngle
_currAngle:	.usect	.far,4,4
	.global	_refAngle
_refAngle:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI18716_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI18716_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
	.sect	".text"
	.global	_InitEXINTF

;******************************************************************************
;* FUNCTION NAME: _InitEXINTF                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A3,A4,B4,B5,B6                                    *
;*   Regs Used         : A0,A3,A4,B3,B4,B5,B6                                 *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_InitEXINTF:
;** --------------------------------------------------------------------------*
           ZERO    .D1     A0                ; |18| 
           MVKH    .S1     0x1800000,A0      ; |18| 
           LDW     .D1T1   *A0,A4            ; |18| 
           MVKL    .S2     0x1800008,B5      ; |21| 
           MVKL    .S2     0x21520521,B6     ; |33| 
           B       .S2     B3                ; |43| 

           MVKL    .S2     0x1800010,B4      ; |33| 
||         MVKL    .S1     0xd00321,A3       ; |21| 

           CLR     .S1     A4,3,5,A4         ; |18| 
||         MVKH    .S2     0x1800008,B5      ; |21| 

           STW     .D1T1   A4,*A0            ; |18| 
||         MVKH    .S2     0x21520521,B6     ; |33| 
||         MVKH    .S1     0xd00321,A3       ; |21| 

           STW     .D2T1   A3,*B5            ; |21| 
||         MVKH    .S2     0x1800010,B4      ; |33| 

           STW     .D2T2   B6,*B4            ; |33| 
           ; BRANCH OCCURS                   ; |43| 


	.sect	".text"
	.global	_InitTimer

;******************************************************************************
;* FUNCTION NAME: _InitTimer                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A3,B4,B5                                          *
;*   Regs Used         : A0,A3,B3,B4,B5                                       *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_InitTimer:
;** --------------------------------------------------------------------------*
           ZERO    .D2     B4                ; |48| 
           MVKH    .S2     0x1940000,B4      ; |48| 
           LDW     .D2T2   *B4,B5            ; |48| 
           MVKL    .S1     0x1940004,A0      ; |51| 
           MVKH    .S1     0x1940004,A0      ; |51| 
           ZERO    .D1     A3                ; |54| 
           MVKH    .S1     0x1940000,A3      ; |54| 
           SET     .S2     B5,8,9,B5         ; |48| 

           MVK     .S2     20000,B4          ; |51| 
||         STW     .D2T2   B5,*B4            ; |48| 

           STW     .D1T2   B4,*A0            ; |51| 
           LDW     .D1T1   *A3,A0            ; |54| 
           B       .S2     B3                ; |55| 
           NOP             3
           SET     .S1     A0,6,7,A0         ; |54| 
           STW     .D1T1   A0,*A3            ; |54| 
           ; BRANCH OCCURS                   ; |55| 


	.sect	".text"
	.global	_InitINT

;******************************************************************************
;* FUNCTION NAME: _InitINT                                                    *
;*                                                                            *
;*   Regs Modified     : A0,B4                                                *
;*   Regs Used         : A0,B3,B4                                             *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_InitINT:
;** --------------------------------------------------------------------------*
           MVC     .S2     IER,B4            ; |60| 
           MVK     .S1     16450,A0          ; |60| 
           OR      .S2X    A0,B4,B4          ; |60| 
           MVC     .S2     B4,IER            ; |60| 
           B       .S2     B3                ; |61| 
           NOP             5
           ; BRANCH OCCURS                   ; |61| 


	.sect	".text"
	.global	_GIE

;******************************************************************************
;* FUNCTION NAME: _GIE                                                        *
;*                                                                            *
;*   Regs Modified     : B4                                                   *
;*   Regs Used         : B3,B4                                                *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_GIE:
;** --------------------------------------------------------------------------*
           MVC     .S2     CSR,B4            ; |66| 
           OR      .S2     1,B4,B4           ; |66| 
           MVC     .S2     B4,CSR            ; |66| 
           B       .S2     B3                ; |67| 
           NOP             5
           ; BRANCH OCCURS                   ; |67| 


	.sect	".text"
	.global	_delay_us

;******************************************************************************
;* FUNCTION NAME: _delay_us                                                   *
;*                                                                            *
;*   Regs Modified     : B0,B4,B5,B6,SP                                       *
;*   Regs Used         : A4,B0,B3,B4,B5,B6,SP                                 *
;*   Local Frame Size  : 0 Args + 4 Auto + 0 Save = 4 byte                    *
;******************************************************************************
_delay_us:
;** --------------------------------------------------------------------------*
           MV      .S2X    A4,B4             ; |71| 
           SHL     .S2     B4,4,B5           ; |74| 

           ZERO    .S2     B4                ; |74| 
||         SUBAH   .D2     B5,B4,B5          ; |74| 

           CMPLTU  .L2     B4,B5,B0          ; |74| 
   [!B0]   B       .S1     L2                ; |74| 
           SUB     .D2     SP,8,SP           ; |71| 
           STW     .D2T1   A4,*+SP(4)        ; |71| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |74| 
           NOP             2
           ; BRANCH OCCURS                   ; |74| 
;** --------------------------------------------------------------------------*
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L1:    
           SHL     .S2     B5,4,B6           ; |74| 

           SUBAH   .D2     B6,B5,B5          ; |74| 
||         ADD     .S2     1,B4,B4           ; |74| 

           CMPLTU  .L2     B4,B5,B0          ; |74| 
   [ B0]   B       .S1     L1                ; |74| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |74| 
           NOP             4
           ; BRANCH OCCURS                   ; |74| 
;** --------------------------------------------------------------------------*
L2:    
           B       .S2     B3                ; |75| 
           ADD     .D2     8,SP,SP           ; |75| 
           NOP             4
           ; BRANCH OCCURS                   ; |75| 


	.sect	".text"
	.global	_delay_ms

;******************************************************************************
;* FUNCTION NAME: _delay_ms                                                   *
;*                                                                            *
;*   Regs Modified     : A4,B0,B3,B4,B5,B6,B7,B9,SP                           *
;*   Regs Used         : A4,B0,B3,B4,B5,B6,B7,B9,SP                           *
;*   Local Frame Size  : 0 Args + 4 Auto + 0 Save = 4 byte                    *
;******************************************************************************
_delay_ms:
;** --------------------------------------------------------------------------*
           ZERO    .D2     B7                ; |82| 
           CMPLTU  .L2X    B7,A4,B0
   [!B0]   B       .S1     L4                ; |82| 
           SUB     .D2     SP,8,SP           ; |79| 
           STW     .D2T1   A4,*+SP(4)        ; |79| 
           MV      .L2     B3,B9             ; |79| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |83| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |83| 
           ; BRANCH OCCURS                   ; |82| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L3:    
           B       .S2     B4                ; |83| 
           MVKL    .S2     RL0,B3            ; |83| 
           MVKH    .S2     RL0,B3            ; |83| 
           MVK     .S1     0x3e8,A4          ; |83| 
           NOP             2
RL0:       ; CALL OCCURS                     ; |83| 
           LDW     .D2T2   *+SP(4),B4        ; |84| 
           ADD     .D2     1,B7,B7           ; |84| 
           NOP             3
           CMPLTU  .L2     B7,B4,B0          ; |84| 
   [ B0]   B       .S1     L3                ; |84| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |83| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |83| 
           NOP             3
           ; BRANCH OCCURS                   ; |84| 
;** --------------------------------------------------------------------------*
L4:    
           B       .S2     B9                ; |85| 
           ADD     .D2     8,SP,SP           ; |85| 
           NOP             4
           ; BRANCH OCCURS                   ; |85| 


	.sect	".text"
	.global	_WaitTFlag

;******************************************************************************
;* FUNCTION NAME: _WaitTFlag                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3                                             *
;*   Regs Used         : A0,A1,A3,B3                                          *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_WaitTFlag:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _TFlag,A0         ; |90| 
           MVKH    .S1     _TFlag,A0         ; |90| 
           LDW     .D1T1   *A0,A1            ; |90| 
           NOP             4
   [ A1]   B       .S1     L6                ; |90| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |90| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |90| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |90| 
           NOP             2
           ; BRANCH OCCURS                   ; |90| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L5:    
           NOP             2
   [!A1]   B       .S1     L5                ; |90| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |90| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |90| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |90| 
           NOP             2
           ; BRANCH OCCURS                   ; |90| 
;** --------------------------------------------------------------------------*
L6:    
           B       .S2     B3                ; |92| 
           MVKL    .S1     _TFlag,A0         ; |91| 
           MVKH    .S1     _TFlag,A0         ; |91| 
           ZERO    .D1     A3                ; |91| 
           STW     .D1T1   A3,*A0            ; |91| 
           NOP             1
           ; BRANCH OCCURS                   ; |92| 


	.sect	".text"
	.global	_WaitTFlagCnt

;******************************************************************************
;* FUNCTION NAME: _WaitTFlagCnt                                               *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,B0,B3,B4,B5,B9,SP                           *
;*   Regs Used         : A0,A1,A3,A4,B0,B3,B4,B5,B9,SP                        *
;*   Local Frame Size  : 0 Args + 8 Auto + 0 Save = 8 byte                    *
;******************************************************************************
_WaitTFlagCnt:
;** --------------------------------------------------------------------------*

           SUB     .D2     SP,8,SP           ; |96| 
||         MVKL    .S1     _TFlag,A0         ; |99| 

           STW     .D2T1   A4,*+SP(4)        ; |96| 
||         MVKH    .S1     _TFlag,A0         ; |99| 
||         ZERO    .D1     A3                ; |99| 

           STW     .D1T1   A3,*A0            ; |99| 
           LDW     .D2T2   *+SP(4),B5        ; |101| 
           ZERO    .D2     B4                ; |101| 
           STW     .D2T2   B4,*+SP(8)        ; |101| 
           MV      .S2     B3,B9             ; |96| 
           NOP             1
           CMPLTU  .L2     B4,B5,B0          ; |101| 
   [!B0]   B       .S1     L8                ; |101| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |102| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |102| 
           NOP             3
           ; BRANCH OCCURS                   ; |101| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L7:    
           B       .S2X    A0                ; |102| 
           MVKL    .S2     RL2,B3            ; |102| 
           MVKH    .S2     RL2,B3            ; |102| 
           NOP             3
RL2:       ; CALL OCCURS                     ; |102| 
           LDW     .D2T2   *+SP(8),B4        ; |103| 
           LDW     .D2T2   *+SP(4),B5        ; |103| 
           NOP             3
           ADD     .D2     1,B4,B4           ; |103| 
           CMPLTU  .L2     B4,B5,B0          ; |103| 
   [ B0]   B       .S1     L7                ; |103| 
           STW     .D2T2   B4,*+SP(8)        ; |103| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |102| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |102| 
           NOP             2
           ; BRANCH OCCURS                   ; |103| 
;** --------------------------------------------------------------------------*
L8:    
           B       .S2     B9                ; |104| 
           ADD     .D2     8,SP,SP           ; |104| 
           NOP             4
           ; BRANCH OCCURS                   ; |104| 


	.sect	".text"
	.global	_PWMOut

;******************************************************************************
;* FUNCTION NAME: _PWMOut                                                     *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 8 Auto + 4 Save = 12 byte                   *
;******************************************************************************
_PWMOut:
;** --------------------------------------------------------------------------*
           ZERO    .D1     A3                ; |115| 

           MVKH    .S1     0x42c80000,A3     ; |115| 
||         ZERO    .D1     A0                ; |115| 

           MVKH    .S1     0x42c80000,A0     ; |115| 
||         STW     .D2T2   B3,*SP--(16)      ; |111| 
||         MV      .S2X    A4,B4             ; |111| 

           CMPGTSP .S1X    B4,A3,A1          ; |115| 
||         STW     .D2T1   A4,*+SP(4)        ; |111| 

   [ A1]   STW     .D2T1   A0,*+SP(4)        ; |115| 
           LDW     .D2T2   *+SP(4),B4        ; |116| 
           ZERO    .D1     A0                ; |116| 
           MVKL    .S2     RL4,B3            ; |119| 
           ZERO    .D2     B5                ; |119| 
           MVKH    .S2     0x40590000,B5     ; |119| 

           ZERO    .D2     B4                ; |116| 
||         CMPLTSP .S2X    B4,A0,B0          ; |116| 

   [ B0]   STW     .D2T2   B4,*+SP(4)        ; |116| 
           LDW     .D2T2   *+SP(4),B4        ; |119| 
           MVKL    .S1     0x44ffe000,A0     ; |119| 
           MVKH    .S1     0x44ffe000,A0     ; |119| 
           MVKH    .S2     RL4,B3            ; |119| 
           NOP             1
           MPYSP   .M2X    A0,B4,B4          ; |119| 
           MVKL    .S2     __divd,B6         ; |119| 
           MVKH    .S2     __divd,B6         ; |119| 
           B       .S2     B6                ; |119| 
           SPDP    .S2     B4,B9:B8          ; |119| 
           ZERO    .D2     B4                ; |119| 
           NOP             1
           MV      .S1X    B9,A5             ; |119| 
           MV      .S1X    B8,A4             ; |119| 
RL4:       ; CALL OCCURS                     ; |119| 
           DPSP    .L1     A5:A4,A0          ; |119| 
           NOP             3
           MV      .S2X    A0,B4             ; |119| 
           SPTRUNC .L2     B4,B5             ; |122| 
           STW     .D2T1   A0,*+SP(8)        ; |119| 
           MVKL    .S1     _PWMD,A0          ; |122| 

           MVKH    .S1     _PWMD,A0          ; |122| 
||         MVKL    .S2     _PWMD,B4          ; |123| 

           STW     .D1T2   B5,*A0            ; |122| 
||         MVKH    .S2     _PWMD,B4          ; |123| 

           LDW     .D2T2   *B4,B4            ; |123| 
           MVKL    .S1     _PWMH,A0          ; |123| 
           MVKH    .S1     _PWMH,A0          ; |123| 
           MVKL    .S2     _PWMD,B5          ; |124| 
           MVKH    .S2     _PWMD,B5          ; |124| 
           ADDK    .S2     2048,B4           ; |123| 
           STW     .D1T2   B4,*A0            ; |123| 
           LDW     .D2T2   *B5,B4            ; |124| 
           MVKL    .S1     _PWML,A0          ; |124| 
           MVK     .S2     2048,B5           ; |124| 
           MVKH    .S1     _PWML,A0          ; |124| 
           NOP             1
           SUB     .D2     B5,B4,B4          ; |124| 
           STW     .D1T2   B4,*A0            ; |124| 
           LDW     .D2T2   *++SP(16),B3      ; |125| 
           NOP             4
           B       .S2     B3                ; |125| 
           NOP             5
           ; BRANCH OCCURS                   ; |125| 


	.sect	".text"
	.global	_angleFromHallCount

;******************************************************************************
;* FUNCTION NAME: _angleFromHallCount                                         *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 4 Auto + 4 Save = 8 byte                    *
;******************************************************************************
_angleFromHallCount:
;** --------------------------------------------------------------------------*
           MV      .S2X    A4,B4             ; |128| 
           INTDP   .L2     B4,B5:B4          ; |129| 
           NOP             2
           MVKL    .S1     0x40768000,A1     ; |129| 

           MVKH    .S1     0x40768000,A1     ; |129| 
||         STW     .D2T2   B3,*SP--(8)       ; |128| 
||         ZERO    .D1     A0                ; |129| 

           MPYDP   .M1X    A1:A0,B5:B4,A5:A4 ; |129| 
||         STW     .D2T1   A4,*+SP(4)        ; |128| 

           NOP             1
           MVKL    .S2     __divd,B6         ; |129| 
           MVKH    .S2     __divd,B6         ; |129| 
           B       .S2     B6                ; |129| 
           NOP             1
           MVKL    .S2     RL6,B3            ; |129| 
           MVKH    .S2     RL6,B3            ; |129| 
           MVKL    .S2     0x40744000,B5     ; |129| 

           MVKH    .S2     0x40744000,B5     ; |129| 
||         ZERO    .D2     B4                ; |129| 

RL6:       ; CALL OCCURS                     ; |129| 
           LDW     .D2T2   *++SP(8),B3       ; |130| 
           NOP             4
           B       .S2     B3                ; |130| 
           NOP             1
           DPSP    .L1     A5:A4,A4          ; |129| 
           NOP             3
           ; BRANCH OCCURS                   ; |130| 


	.sect	".text"
	.global	_BLDCDrive

;******************************************************************************
;* FUNCTION NAME: _BLDCDrive                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 4 Auto + 4 Save = 8 byte                    *
;******************************************************************************
_BLDCDrive:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _PWMOut,A0        ; |139| 
           MVKH    .S1     _PWMOut,A0        ; |139| 
           B       .S2X    A0                ; |139| 
           STW     .D2T2   B3,*SP--(8)       ; |136| 
           STW     .D2T1   A4,*+SP(4)        ; |136| 
           NOP             1
           MVKL    .S2     RL8,B3            ; |139| 
           MVKH    .S2     RL8,B3            ; |139| 
RL8:       ; CALL OCCURS                     ; |139| 
           MVKL    .S1     0x2000208,A0      ; |142| 
           MVKH    .S1     0x2000208,A0      ; |142| 
           LDW     .D1T1   *A0,A0            ; |142| 
           MVKL    .S2     _currHall,B4      ; |142| 
           MVKL    .S2     _prevHall,B5      ; |145| 
           MVKL    .S2     _currHall,B6      ; |145| 
           MVKH    .S2     _currHall,B4      ; |142| 
           AND     .S1     7,A0,A0           ; |142| 

           MVKH    .S2     _prevHall,B5      ; |145| 
||         STW     .D2T1   A0,*B4            ; |142| 

           MVKH    .S2     _currHall,B6      ; |145| 
||         LDW     .D2T2   *B5,B7            ; |145| 

           LDW     .D2T2   *B6,B4            ; |145| 
           LDW     .D2T2   *+SP(4),B5        ; |146| 
           ZERO    .D2     B6                ; |146| 
           NOP             2
           CMPEQ   .L2     B4,B7,B1          ; |145| 
   [ B1]   B       .S1     L16               ; |145| 
           CMPGTSP .S2     B5,B6,B0          ; |146| 
           NOP             4
           ; BRANCH OCCURS                   ; |145| 
;** --------------------------------------------------------------------------*

           MVKL    .S2     _hallCount,B4     ; |146| 
||         MVKL    .S1     _hallCount,A0     ; |147| 

           MVKH    .S2     _hallCount,B4     ; |146| 
||         MVKH    .S1     _hallCount,A0     ; |147| 

   [ B0]   LDW     .D2T2   *B4,B5            ; |146| 
|| [!B0]   LDW     .D1T1   *A0,A3            ; |147| 

           B       .S1     L16               ; |151| 
           NOP             3

   [!B0]   SUB     .D1     A3,1,A3           ; |147| 
|| [ B0]   ADD     .D2     1,B5,B5           ; |146| 

   [!B0]   STW     .D1T1   A3,*A0            ; |147| 
|| [ B0]   STW     .D2T2   B5,*B4            ; |146| 

           ; BRANCH OCCURS                   ; |151| 
;** --------------------------------------------------------------------------*
L9:    
           LDW     .D2T2   *B8,B4            ; |154| 
           NOP             4
           STW     .D2T2   B4,*B7            ; |154| 
           LDW     .D1T1   *A3,A0            ; |155| 
;** --------------------------------------------------------------------------*
L10:    
           B       .S1     L20               ; |155| 
           MVKL    .S2     _currHall,B4      ; |185| 
           MVKH    .S2     _currHall,B4      ; |185| 
           NOP             2
           STW     .D1T1   A0,*A4            ; |155| 
           ; BRANCH OCCURS                   ; |155| 
;** --------------------------------------------------------------------------*
L11:    
           STW     .D2T2   B5,*B6            ; |158| 
           LDW     .D1T1   *A0,A0            ; |159| 
           B       .S1     L18               ; |160| 
           NOP             3
           STW     .D1T1   A0,*A5            ; |159| 
           STW     .D2T2   B1,*B4            ; |160| 
           ; BRANCH OCCURS                   ; |160| 
;** --------------------------------------------------------------------------*
L12:    
           NOP             4
           STW     .D2T2   B4,*B9            ; |163| 
           STW     .D2T2   B1,*B6            ; |164| 

           LDW     .D1T1   *A0,A0            ; |165| 
||         B       .S1     L19               ; |165| 

           MVKL    .S2     _currHall,B4      ; |185| 
           NOP             3
           STW     .D1T1   A0,*A5            ; |165| 
           ; BRANCH OCCURS                   ; |165| 
;** --------------------------------------------------------------------------*
L13:    
           LDW     .D2T2   *B9,B4            ; |169| 
           NOP             4
           STW     .D2T2   B4,*B6            ; |169| 

           LDW     .D1T1   *A0,A0            ; |170| 
||         B       .S1     L19               ; |170| 

           MVKL    .S2     _currHall,B4      ; |185| 
           NOP             3
           STW     .D1T1   A0,*A3            ; |170| 
           ; BRANCH OCCURS                   ; |170| 
;** --------------------------------------------------------------------------*
L14:    
           NOP             4
           STW     .D2T2   B4,*B8            ; |173| 
           LDW     .D1T1   *A7,A0            ; |174| 
           B       .S1     L19               ; |175| 
           MVKL    .S2     _currHall,B4      ; |185| 
           NOP             2
           STW     .D1T1   A0,*A4            ; |174| 
           STW     .D2T2   B2,*B5            ; |175| 
           ; BRANCH OCCURS                   ; |175| 
;** --------------------------------------------------------------------------*
L15:    
           B       .S1     L10               ; |180| 
           STW     .D2T2   B4,*B0            ; |178| 
           STW     .D2T2   B5,*B8            ; |179| 
           LDW     .D1T1   *A5,A0            ; |180| 
           NOP             2
           ; BRANCH OCCURS                   ; |180| 
;** --------------------------------------------------------------------------*
L16:    

           MVKL    .S2     0x2000098,B5      ; |175| 
||         MVKL    .S1     _currHall,A0      ; |180| 

           MVKL    .S2     0x20000a0,B8      ; |173| 
||         MVKH    .S1     _currHall,A0      ; |180| 

           LDW     .D1T1   *A0,A6            ; |180| 
||         MVKL    .S2     _PWML,B7          ; |173| 

           MVKL    .S2     0x200009c,B6      ; |169| 
           MVKL    .S2     _PWMH,B9          ; |169| 

           MVKL    .S2     0x20000a0,B4      ; |168| 
||         MVKL    .S1     0x2000098,A3      ; |170| 

           MVK     .S2     2048,B2           ; |175| 
||         MVKL    .S1     0x200009c,A4      ; |174| 

           CMPGT   .L1     A6,4,A1           ; |180| 
||         MVK     .S2     2048,B1           ; |168| 
||         MVKL    .S1     _PWMH,A7          ; |174| 

   [ A1]   B       .S1     L17               ; |180| 
||         MVKH    .S2     0x2000098,B5      ; |175| 

           MVKH    .S2     0x20000a0,B8      ; |173| 
||         MVKH    .S1     0x2000098,A3      ; |170| 

           MVKH    .S2     _PWML,B7          ; |173| 
||         MVKH    .S1     0x200009c,A4      ; |174| 

           MVKH    .S1     _PWMH,A7          ; |174| 
||         MVKH    .S2     0x200009c,B6      ; |169| 

           MVKL    .S1     _PWML,A0          ; |170| 
||         MVKH    .S2     _PWMH,B9          ; |169| 

           MVKH    .S1     _PWML,A0          ; |170| 
||         CMPEQ   .L1     A6,5,A2           ; |180| 
||         CMPEQ   .L2X    A6,4,B0           ; |180| 
||         MVKH    .S2     0x20000a0,B4      ; |168| 

           ; BRANCH OCCURS                   ; |180| 
;** --------------------------------------------------------------------------*

   [ B0]   B       .S1     L14               ; |180| 
||         MVKL    .S2     0x20000a0,B9      ; |163| 

           MVKL    .S2     0x200009c,B6      ; |164| 

           MVKL    .S2     _PWMH,B4          ; |163| 
||         MVKL    .S1     0x2000098,A5      ; |165| 

           MVKH    .S2     0x20000a0,B9      ; |163| 
||         MVKL    .S1     _PWML,A0          ; |165| 

           MVKH    .S1     0x2000098,A5      ; |165| 
||         MVKH    .S2     0x200009c,B6      ; |164| 

           MVKH    .S2     _PWMH,B4          ; |163| 
||         MVKH    .S1     _PWML,A0          ; |165| 
||         CMPEQ   .L1     A6,1,A1           ; |180| 
|| [ B0]   LDW     .D2T2   *B7,B4            ; |173| 

           ; BRANCH OCCURS                   ; |180| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _PWML,B8          ; |154| 

   [ A1]   B       .S1     L12               ; |180| 
||         MVKL    .S2     0x200009c,B7      ; |154| 

           MVKL    .S2     0x20000a0,B5      ; |153| 

           MVK     .S2     2048,B0           ; |153| 
||         MVKL    .S1     0x2000098,A4      ; |155| 

           MVKH    .S2     _PWML,B8          ; |154| 
||         MVKL    .S1     _PWMH,A3          ; |155| 

           MVKH    .S1     0x2000098,A4      ; |155| 
||         MVKH    .S2     0x200009c,B7      ; |154| 

           MVKH    .S2     0x20000a0,B5      ; |153| 
||         MVKH    .S1     _PWMH,A3          ; |155| 
||         CMPEQ   .L1     A6,2,A2           ; |180| 
|| [ A1]   LDW     .D2T2   *B4,B4            ; |163| 

           ; BRANCH OCCURS                   ; |180| 
;** --------------------------------------------------------------------------*

   [ A2]   B       .S1     L9                ; |180| 
||         MVKL    .S2     _PWMH,B9          ; |158| 

           MVKL    .S2     0x2000098,B4      ; |160| 

           MVKL    .S2     0x20000a0,B6      ; |158| 
||         MVKL    .S1     0x200009c,A5      ; |159| 

           MVKH    .S2     _PWMH,B9          ; |158| 
||         MVKL    .S1     _PWML,A0          ; |159| 

           MVKH    .S2     0x2000098,B4      ; |160| 
||         MVKH    .S1     0x200009c,A5      ; |159| 

           MVKH    .S1     _PWML,A0          ; |159| 
||         MVKH    .S2     0x20000a0,B6      ; |158| 
||         CMPEQ   .L1     A6,3,A1           ; |180| 
|| [ A2]   STW     .D2T2   B0,*B5            ; |153| 

           ; BRANCH OCCURS                   ; |180| 
;** --------------------------------------------------------------------------*
   [ A1]   B       .S1     L11               ; |180| 
   [ A1]   LDW     .D2T2   *B9,B5            ; |158| 
           NOP             4
           ; BRANCH OCCURS                   ; |180| 
;** --------------------------------------------------------------------------*
           B       .S1     L21               ; |180| 
           MVKL    .S2     _currHall,B4      ; |185| 
           MVKH    .S2     _currHall,B4      ; |185| 
           LDW     .D2T2   *B4,B5            ; |185| 
           MVKL    .S1     _prevHall,A3      ; |185| 
           NOP             1
           ; BRANCH OCCURS                   ; |180| 
;** --------------------------------------------------------------------------*
L17:    
           MVKL    .S2     0x20000a0,B0      ; |178| 

   [ A2]   B       .S1     L13               ; |180| 
||         MVKL    .S2     0x200009c,B8      ; |179| 

           MVKL    .S2     _PWML,B7          ; |178| 

           MVK     .S2     2048,B5           ; |179| 
||         MVKL    .S1     0x2000098,A4      ; |180| 

           MVKH    .S2     0x20000a0,B0      ; |178| 
||         MVKL    .S1     _PWMH,A5          ; |180| 

           MVKH    .S1     0x2000098,A4      ; |180| 
||         MVKH    .S2     0x200009c,B8      ; |179| 

           MVKH    .S2     _PWML,B7          ; |178| 
||         MVKH    .S1     _PWMH,A5          ; |180| 
||         CMPEQ   .L1     A6,6,A1           ; |180| 
|| [ A2]   STW     .D2T2   B1,*B4            ; |168| 

           ; BRANCH OCCURS                   ; |180| 
;** --------------------------------------------------------------------------*
   [ A1]   B       .S1     L15               ; |180| 
   [ A1]   LDW     .D2T2   *B7,B4            ; |178| 
           NOP             4
           ; BRANCH OCCURS                   ; |180| 
;** --------------------------------------------------------------------------*
L18:    
           MVKL    .S2     _currHall,B4      ; |185| 
;** --------------------------------------------------------------------------*
L19:    
           MVKH    .S2     _currHall,B4      ; |185| 
;** --------------------------------------------------------------------------*
L20:    
           LDW     .D2T2   *B4,B5            ; |185| 
           MVKL    .S1     _prevHall,A3      ; |185| 
           NOP             1
;** --------------------------------------------------------------------------*
L21:    

           MVKL    .S2     _angleFromHallCount,B4 ; |188| 
||         MVKL    .S1     _hallCount,A0     ; |188| 

           MVKH    .S2     _angleFromHallCount,B4 ; |188| 
||         MVKH    .S1     _prevHall,A3      ; |185| 

           B       .S2     B4                ; |188| 
||         STW     .D1T2   B5,*A3            ; |185| 
||         MVKH    .S1     _hallCount,A0     ; |188| 

           LDW     .D1T1   *A0,A4            ; |188| 
           MVKL    .S2     RL10,B3           ; |188| 
           MVKH    .S2     RL10,B3           ; |188| 
           NOP             2
RL10:      ; CALL OCCURS                     ; |188| 
           MVKL    .S2     _currAngle,B4     ; |188| 
           MVKH    .S2     _currAngle,B4     ; |188| 
           STW     .D2T1   A4,*B4            ; |188| 
           LDW     .D2T2   *++SP(8),B3       ; |189| 
           NOP             4
           B       .S2     B3                ; |189| 
           NOP             5
           ; BRANCH OCCURS                   ; |189| 


	.sect	".text"
	.global	_main

;******************************************************************************
;* FUNCTION NAME: _main                                                       *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 16 Args + 0 Auto + 4 Save = 20 byte                  *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _InitEXINTF,A0    ; |194| 
           MVKH    .S1     _InitEXINTF,A0    ; |194| 
           B       .S2X    A0                ; |194| 
           STW     .D2T2   B3,*SP--(24)      ; |193| 
           MVKL    .S2     RL12,B3           ; |194| 
           MVKH    .S2     RL12,B3           ; |194| 
           NOP             2
RL12:      ; CALL OCCURS                     ; |194| 
           MVKL    .S1     _InitTimer,A0     ; |195| 
           MVKH    .S1     _InitTimer,A0     ; |195| 
           B       .S2X    A0                ; |195| 
           MVKL    .S2     RL14,B3           ; |195| 
           MVKH    .S2     RL14,B3           ; |195| 
           NOP             3
RL14:      ; CALL OCCURS                     ; |195| 
           MVKL    .S2     _InitUART,B4      ; |196| 
           MVKH    .S2     _InitUART,B4      ; |196| 
           B       .S2     B4                ; |196| 
           MVKL    .S2     RL16,B3           ; |196| 
           MVKH    .S2     RL16,B3           ; |196| 
           NOP             3
RL16:      ; CALL OCCURS                     ; |196| 
           MVKL    .S1     _InitINT,A0       ; |197| 
           MVKH    .S1     _InitINT,A0       ; |197| 
           B       .S2X    A0                ; |197| 
           MVKL    .S2     RL18,B3           ; |197| 
           MVKH    .S2     RL18,B3           ; |197| 
           NOP             3
RL18:      ; CALL OCCURS                     ; |197| 
           MVKL    .S1     _InitUSBMon,A0    ; |198| 
           MVKH    .S1     _InitUSBMon,A0    ; |198| 
           B       .S2X    A0                ; |198| 
           MVKL    .S2     RL20,B3           ; |198| 
           MVKH    .S2     RL20,B3           ; |198| 
           NOP             3
RL20:      ; CALL OCCURS                     ; |198| 
           MVKL    .S1     _sprintf,A0       ; |200| 

           MVKH    .S1     _sprintf,A0       ; |200| 
||         MVKL    .S2     _tmp_string,B5    ; |200| 

           B       .S2X    A0                ; |200| 
           MVKL    .S2     RL22,B3           ; |200| 
           MVKH    .S2     _tmp_string,B5    ; |200| 
           MVKL    .S2     SL1+0,B4          ; |200| 
           MVKH    .S2     SL1+0,B4          ; |200| 

           MVKH    .S2     RL22,B3           ; |200| 
||         MV      .S1X    B5,A4             ; |200| 
||         STW     .D2T2   B4,*+SP(4)        ; |200| 

RL22:      ; CALL OCCURS                     ; |200| 
           MVKL    .S1     _Report,A0        ; |200| 
           MVKH    .S1     _Report,A0        ; |200| 
           B       .S2X    A0                ; |200| 
           MVKL    .S2     RL24,B3           ; |200| 
           MVKH    .S2     RL24,B3           ; |200| 
           NOP             3
RL24:      ; CALL OCCURS                     ; |200| 
           MVK     .S1     2024,A0           ; |201| 

           MVKL    .S1     _sprintf,A0       ; |201| 
||         STW     .D2T1   A0,*+SP(8)        ; |201| 

           MVKH    .S1     _sprintf,A0       ; |201| 
||         MVKL    .S2     SL2+0,B4          ; |201| 

           B       .S2X    A0                ; |201| 
           MVKH    .S2     SL2+0,B4          ; |201| 
           MVKL    .S2     _tmp_string,B5    ; |201| 
           MVKH    .S2     _tmp_string,B5    ; |201| 
           MVKL    .S2     RL26,B3           ; |201| 

           STW     .D2T2   B4,*+SP(4)        ; |201| 
||         MVKH    .S2     RL26,B3           ; |201| 
||         MV      .S1X    B5,A4             ; |201| 

RL26:      ; CALL OCCURS                     ; |201| 
           MVKL    .S1     _Report,A0        ; |201| 
           MVKH    .S1     _Report,A0        ; |201| 
           B       .S2X    A0                ; |201| 
           MVKL    .S2     RL28,B3           ; |201| 
           MVKH    .S2     RL28,B3           ; |201| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |201| 
           MVKL    .S2     SL3+0,B4          ; |202| 
           MVKL    .S2     0x20003fc,B5      ; |202| 
           MVKH    .S2     SL3+0,B4          ; |202| 

           MVKH    .S2     0x20003fc,B5      ; |202| 
||         STW     .D2T2   B4,*+SP(4)        ; |202| 

           LDW     .D2T2   *B5,B4            ; |202| 
           MVKL    .S1     0x20003fc,A0      ; |202| 
           MVKH    .S1     0x20003fc,A0      ; |202| 
           MVKL    .S1     _tmp_string,A4    ; |202| 
           MVKL    .S2     RL30,B3           ; |202| 
           EXTU    .S2     B4,16,24,B4       ; |202| 
           STW     .D2T2   B4,*+SP(8)        ; |202| 

           MVKL    .S1     _sprintf,A0       ; |202| 
||         LDW     .D1T1   *A0,A3            ; |202| 

           MVKH    .S1     _sprintf,A0       ; |202| 
           B       .S2X    A0                ; |202| 
           MVKH    .S2     RL30,B3           ; |202| 
           MVKH    .S1     _tmp_string,A4    ; |202| 
           NOP             1
           EXTU    .S1     A3,24,24,A3       ; |202| 
           STW     .D2T1   A3,*+SP(12)       ; |202| 
RL30:      ; CALL OCCURS                     ; |202| 
           MVKL    .S1     _Report,A0        ; |202| 
           MVKH    .S1     _Report,A0        ; |202| 
           B       .S2X    A0                ; |202| 
           MVKL    .S2     RL32,B3           ; |202| 
           MVKH    .S2     RL32,B3           ; |202| 
           NOP             3
RL32:      ; CALL OCCURS                     ; |202| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |206| 
           MVKH    .S1     _GIE,A0           ; |206| 
           B       .S2X    A0                ; |206| 
           MVKL    .S2     _TFlag,B4         ; |204| 
           MVKL    .S2     RL34,B3           ; |206| 
           MVKH    .S2     _TFlag,B4         ; |204| 
           ZERO    .D2     B5                ; |204| 

           STW     .D2T2   B5,*B4            ; |204| 
||         MVKH    .S2     RL34,B3           ; |206| 

RL34:      ; CALL OCCURS                     ; |206| 
           MVKL    .S2     _WaitTFlagCnt,B5  ; |210| 
           MVKH    .S2     _WaitTFlagCnt,B5  ; |210| 
           B       .S2     B5                ; |210| 
           MVKL    .S2     0x2000094,B4      ; |208| 
           MVKL    .S2     RL36,B3           ; |210| 
           MVKH    .S2     0x2000094,B4      ; |208| 
           MVK     .S1     1,A0              ; |208| 

           STW     .D2T1   A0,*B4            ; |208| 
||         MVKH    .S2     RL36,B3           ; |210| 
||         MVK     .S1     0x64,A4           ; |210| 

RL36:      ; CALL OCCURS                     ; |210| 

           ZERO    .D2     B4                ; |212| 
||         MVKL    .S1     _refAngle,A0      ; |212| 

           MVKH    .S2     0x43b40000,B4     ; |212| 
||         MVKH    .S1     _refAngle,A0      ; |212| 

           STW     .D1T2   B4,*A0            ; |212| 
           MVKL    .S2     _BLDCDrive,B4     ; |215| 

           MVKH    .S2     _BLDCDrive,B4     ; |215| 
||         MVKL    .S1     _uControlInput,A0 ; |215| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L22:    

           B       .S2     B4                ; |215| 
||         MVKH    .S1     _uControlInput,A0 ; |215| 

           LDW     .D1T1   *A0,A4            ; |215| 
           MVKL    .S2     RL38,B3           ; |215| 
           MVKH    .S2     RL38,B3           ; |215| 
           NOP             2
RL38:      ; CALL OCCURS                     ; |215| 
           B       .S1     L22               ; |216| 
           MVKL    .S2     _BLDCDrive,B4     ; |215| 
           MVKL    .S1     _uControlInput,A0 ; |215| 
           MVKH    .S2     _BLDCDrive,B4     ; |215| 
           NOP             2
           ; BRANCH OCCURS                   ; |216| 


;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
SL1:	.string	13,10,13,10,0
SL2:	.string	"Mechatronics Course %d",13,10,0
SL3:	.string	"FPGA Ver%2x.%02x",13,10,0
;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_sprintf
	.global	_InitUART
	.global	_Report
	.global	_InitUSBMon
	.global	_tmp_string
	.global	_TFlag
	.global	_uControlInput
	.global	__divd
