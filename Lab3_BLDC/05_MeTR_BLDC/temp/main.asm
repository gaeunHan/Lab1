;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Tue May 14 12:18:59 2024                                *
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
	.global	_uSat
_uSat:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_hallCount+0,32
	.field  	0,32			; _hallCount @ 0
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
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI19740_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI19740_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
           ZERO    .D1     A3                ; |116| 

           MVKH    .S1     0x42c80000,A3     ; |116| 
||         ZERO    .D1     A0                ; |116| 
||         STW     .D2T2   B3,*SP--(16)      ; |112| 
||         MV      .S2X    A4,B4             ; |112| 

           CMPGTSP .S2X    B4,A3,B0          ; |116| 
||         STW     .D2T1   A4,*+SP(4)        ; |112| 
||         MVKH    .S1     0x42c80000,A0     ; |116| 

   [ B0]   STW     .D2T1   A0,*+SP(4)        ; |116| 
           LDW     .D2T2   *+SP(4),B5        ; |117| 
           ZERO    .D2     B4                ; |117| 
           ZERO    .D1     A0                ; |117| 
           MVKH    .S2     0xc2c80000,B4     ; |117| 
           MVKH    .S1     0xc2c80000,A0     ; |117| 
           CMPLTSP .S2     B5,B4,B0          ; |117| 
   [ B0]   STW     .D2T1   A0,*+SP(4)        ; |117| 
           LDW     .D2T2   *+SP(4),B4        ; |120| 
           MVKL    .S1     0x44ffe000,A0     ; |120| 
           MVKH    .S1     0x44ffe000,A0     ; |120| 
           MVKL    .S2     RL4,B3            ; |120| 
           ZERO    .D2     B5                ; |120| 
           MPYSP   .M2X    A0,B4,B4          ; |120| 
           MVKL    .S2     __divd,B8         ; |120| 
           MVKH    .S2     __divd,B8         ; |120| 
           B       .S2     B8                ; |120| 
           SPDP    .S2     B4,B7:B6          ; |120| 
           ZERO    .D2     B4                ; |120| 
           MV      .S1X    B6,A4             ; |120| 

           MVKH    .S2     RL4,B3            ; |120| 
||         MV      .S1X    B7,A5             ; |120| 

           MVKH    .S2     0x40590000,B5     ; |120| 
RL4:       ; CALL OCCURS                     ; |120| 
           DPSP    .L1     A5:A4,A0          ; |120| 
           MVKL    .S1     _PWMD,A4          ; |125| 
           MVKH    .S1     _PWMD,A4          ; |125| 
           MVK     .S2     2048,B5           ; |125| 
           MV      .S2X    A0,B4             ; |120| 
           SPTRUNC .L2     B4,B4             ; |123| 
           MVKL    .S1     _PWMD,A3          ; |124| 

           MVKL    .S1     _PWMD,A0          ; |123| 
||         STW     .D2T1   A0,*+SP(8)        ; |120| 

           MVKH    .S1     _PWMD,A0          ; |123| 

           MVKH    .S1     _PWMD,A3          ; |124| 
||         STW     .D1T2   B4,*A0            ; |123| 

           LDW     .D1T1   *A3,A0            ; |124| 
           MVKL    .S1     _PWMH,A3          ; |124| 
           MVKH    .S1     _PWMH,A3          ; |124| 
           MVKL    .S2     _PWML,B4          ; |125| 
           MVKH    .S2     _PWML,B4          ; |125| 
           ADDK    .S1     2048,A0           ; |124| 
           STW     .D1T1   A0,*A3            ; |124| 
           LDW     .D1T1   *A4,A0            ; |125| 
           NOP             4
           SUB     .L2X    B5,A0,B5          ; |125| 
           STW     .D2T2   B5,*B4            ; |125| 
           LDW     .D2T2   *+SP(4),B5        ; |127| 
           MVKL    .S2     _uSat,B4          ; |127| 
           MVKH    .S2     _uSat,B4          ; |127| 
           NOP             2
           STW     .D2T2   B5,*B4            ; |127| 
           LDW     .D2T2   *++SP(16),B3      ; |128| 
           NOP             4
           B       .S2     B3                ; |128| 
           NOP             5
           ; BRANCH OCCURS                   ; |128| 


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
           MV      .S2X    A4,B4             ; |131| 
           INTDP   .L2     B4,B5:B4          ; |132| 
           NOP             2
           MVKL    .S1     0x40768000,A1     ; |132| 

           MVKH    .S1     0x40768000,A1     ; |132| 
||         STW     .D2T2   B3,*SP--(8)       ; |131| 
||         ZERO    .D1     A0                ; |132| 

           MPYDP   .M1X    A1:A0,B5:B4,A5:A4 ; |132| 
||         STW     .D2T1   A4,*+SP(4)        ; |131| 

           NOP             1
           MVKL    .S2     __divd,B6         ; |132| 
           MVKH    .S2     __divd,B6         ; |132| 
           B       .S2     B6                ; |132| 
           NOP             1
           MVKL    .S2     RL6,B3            ; |132| 
           MVKH    .S2     RL6,B3            ; |132| 
           MVKL    .S2     0x40744000,B5     ; |132| 

           MVKH    .S2     0x40744000,B5     ; |132| 
||         ZERO    .D2     B4                ; |132| 

RL6:       ; CALL OCCURS                     ; |132| 
           LDW     .D2T2   *++SP(8),B3       ; |133| 
           NOP             4
           B       .S2     B3                ; |133| 
           NOP             1
           DPSP    .L1     A5:A4,A4          ; |132| 
           NOP             3
           ; BRANCH OCCURS                   ; |133| 


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
           MVKL    .S1     _PWMOut,A0        ; |142| 
           MVKH    .S1     _PWMOut,A0        ; |142| 
           B       .S2X    A0                ; |142| 
           STW     .D2T2   B3,*SP--(8)       ; |139| 
           STW     .D2T1   A4,*+SP(4)        ; |139| 
           NOP             1
           MVKL    .S2     RL8,B3            ; |142| 
           MVKH    .S2     RL8,B3            ; |142| 
RL8:       ; CALL OCCURS                     ; |142| 
           MVKL    .S1     0x2000208,A0      ; |145| 
           MVKH    .S1     0x2000208,A0      ; |145| 
           LDW     .D1T1   *A0,A0            ; |145| 
           MVKL    .S2     _currHall,B4      ; |145| 
           MVKL    .S2     _prevHall,B5      ; |148| 
           MVKL    .S2     _currHall,B6      ; |148| 
           MVKH    .S2     _currHall,B4      ; |145| 
           AND     .S1     7,A0,A0           ; |145| 

           MVKH    .S2     _prevHall,B5      ; |148| 
||         STW     .D2T1   A0,*B4            ; |145| 

           MVKH    .S2     _currHall,B6      ; |148| 
||         LDW     .D2T2   *B5,B7            ; |148| 

           LDW     .D2T2   *B6,B4            ; |148| 
           LDW     .D2T2   *+SP(4),B5        ; |149| 
           ZERO    .D2     B6                ; |149| 
           NOP             2
           CMPEQ   .L2     B4,B7,B1          ; |148| 
   [ B1]   B       .S1     L16               ; |148| 
           CMPGTSP .S2     B5,B6,B0          ; |149| 
   [!B1]   MVKL    .S1     _hallCount,A0     ; |149| 
           NOP             3
           ; BRANCH OCCURS                   ; |148| 
;** --------------------------------------------------------------------------*
           MVKH    .S1     _hallCount,A0     ; |149| 
   [ B0]   LDW     .D1T1   *A0,A3            ; |149| 
   [ B0]   B       .S1     L16               ; |149| 
           MV      .S2     B5,B4             ; |149| 
           ZERO    .D2     B5                ; |150| 
           CMPLTSP .S2     B4,B5,B1          ; |150| 
   [ B0]   ADD     .D1     1,A3,A3           ; |149| 

   [ B0]   STW     .D1T1   A3,*A0            ; |149| 
|| [!B0]   MVKL    .S1     _hallCount,A0     ; |150| 

           ; BRANCH OCCURS                   ; |149| 
;** --------------------------------------------------------------------------*
           MVKH    .S1     _hallCount,A0     ; |150| 
   [ B1]   LDW     .D1T1   *A0,A3            ; |150| 
           B       .S1     L16               ; |154| 
           NOP             3
   [ B1]   SUB     .D1     A3,1,A3           ; |150| 
   [ B1]   STW     .D1T1   A3,*A0            ; |150| 
           ; BRANCH OCCURS                   ; |154| 
;** --------------------------------------------------------------------------*
L9:    
           LDW     .D2T2   *B8,B4            ; |157| 
           NOP             4
           STW     .D2T2   B4,*B7            ; |157| 
           LDW     .D1T1   *A3,A0            ; |158| 
;** --------------------------------------------------------------------------*
L10:    
           B       .S1     L20               ; |158| 
           MVKL    .S2     _currHall,B4      ; |188| 
           MVKH    .S2     _currHall,B4      ; |188| 
           NOP             2
           STW     .D1T1   A0,*A4            ; |158| 
           ; BRANCH OCCURS                   ; |158| 
;** --------------------------------------------------------------------------*
L11:    
           STW     .D2T2   B5,*B6            ; |161| 
           LDW     .D1T1   *A0,A0            ; |162| 
           B       .S1     L18               ; |163| 
           NOP             3
           STW     .D1T1   A0,*A5            ; |162| 
           STW     .D2T2   B1,*B4            ; |163| 
           ; BRANCH OCCURS                   ; |163| 
;** --------------------------------------------------------------------------*
L12:    
           NOP             4
           STW     .D2T2   B4,*B9            ; |166| 
           STW     .D2T2   B1,*B6            ; |167| 

           LDW     .D1T1   *A0,A0            ; |168| 
||         B       .S1     L19               ; |168| 

           MVKL    .S2     _currHall,B4      ; |188| 
           NOP             3
           STW     .D1T1   A0,*A5            ; |168| 
           ; BRANCH OCCURS                   ; |168| 
;** --------------------------------------------------------------------------*
L13:    
           LDW     .D2T2   *B9,B4            ; |172| 
           NOP             4
           STW     .D2T2   B4,*B6            ; |172| 

           LDW     .D1T1   *A0,A0            ; |173| 
||         B       .S1     L19               ; |173| 

           MVKL    .S2     _currHall,B4      ; |188| 
           NOP             3
           STW     .D1T1   A0,*A3            ; |173| 
           ; BRANCH OCCURS                   ; |173| 
;** --------------------------------------------------------------------------*
L14:    
           NOP             4
           STW     .D2T2   B4,*B8            ; |176| 
           LDW     .D1T1   *A7,A0            ; |177| 
           B       .S1     L19               ; |178| 
           MVKL    .S2     _currHall,B4      ; |188| 
           NOP             2
           STW     .D1T1   A0,*A4            ; |177| 
           STW     .D2T2   B2,*B5            ; |178| 
           ; BRANCH OCCURS                   ; |178| 
;** --------------------------------------------------------------------------*
L15:    
           B       .S1     L10               ; |183| 
           STW     .D2T2   B4,*B0            ; |181| 
           STW     .D2T2   B5,*B8            ; |182| 
           LDW     .D1T1   *A5,A0            ; |183| 
           NOP             2
           ; BRANCH OCCURS                   ; |183| 
;** --------------------------------------------------------------------------*
L16:    

           MVKL    .S2     0x2000098,B5      ; |178| 
||         MVKL    .S1     _currHall,A0      ; |183| 

           MVKL    .S2     0x20000a0,B8      ; |176| 
||         MVKH    .S1     _currHall,A0      ; |183| 

           LDW     .D1T1   *A0,A6            ; |183| 
||         MVKL    .S2     _PWML,B7          ; |176| 

           MVKL    .S2     0x200009c,B6      ; |172| 
           MVKL    .S2     _PWMH,B9          ; |172| 

           MVKL    .S2     0x20000a0,B4      ; |171| 
||         MVKL    .S1     0x2000098,A3      ; |173| 

           MVK     .S2     2048,B2           ; |178| 
||         MVKL    .S1     0x200009c,A4      ; |177| 

           CMPGT   .L1     A6,4,A1           ; |183| 
||         MVK     .S2     2048,B1           ; |171| 
||         MVKL    .S1     _PWMH,A7          ; |177| 

   [ A1]   B       .S1     L17               ; |183| 
||         MVKH    .S2     0x2000098,B5      ; |178| 

           MVKH    .S2     0x20000a0,B8      ; |176| 
||         MVKH    .S1     0x2000098,A3      ; |173| 

           MVKH    .S2     _PWML,B7          ; |176| 
||         MVKH    .S1     0x200009c,A4      ; |177| 

           MVKH    .S1     _PWMH,A7          ; |177| 
||         MVKH    .S2     0x200009c,B6      ; |172| 

           MVKL    .S1     _PWML,A0          ; |173| 
||         MVKH    .S2     _PWMH,B9          ; |172| 

           MVKH    .S1     _PWML,A0          ; |173| 
||         CMPEQ   .L1     A6,5,A2           ; |183| 
||         CMPEQ   .L2X    A6,4,B0           ; |183| 
||         MVKH    .S2     0x20000a0,B4      ; |171| 

           ; BRANCH OCCURS                   ; |183| 
;** --------------------------------------------------------------------------*

   [ B0]   B       .S1     L14               ; |183| 
||         MVKL    .S2     0x20000a0,B9      ; |166| 

           MVKL    .S2     0x200009c,B6      ; |167| 

           MVKL    .S2     _PWMH,B4          ; |166| 
||         MVKL    .S1     0x2000098,A5      ; |168| 

           MVKH    .S2     0x20000a0,B9      ; |166| 
||         MVKL    .S1     _PWML,A0          ; |168| 

           MVKH    .S1     0x2000098,A5      ; |168| 
||         MVKH    .S2     0x200009c,B6      ; |167| 

           MVKH    .S2     _PWMH,B4          ; |166| 
||         MVKH    .S1     _PWML,A0          ; |168| 
||         CMPEQ   .L1     A6,1,A1           ; |183| 
|| [ B0]   LDW     .D2T2   *B7,B4            ; |176| 

           ; BRANCH OCCURS                   ; |183| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _PWML,B8          ; |157| 

   [ A1]   B       .S1     L12               ; |183| 
||         MVKL    .S2     0x200009c,B7      ; |157| 

           MVKL    .S2     0x20000a0,B5      ; |156| 

           MVK     .S2     2048,B0           ; |156| 
||         MVKL    .S1     0x2000098,A4      ; |158| 

           MVKH    .S2     _PWML,B8          ; |157| 
||         MVKL    .S1     _PWMH,A3          ; |158| 

           MVKH    .S1     0x2000098,A4      ; |158| 
||         MVKH    .S2     0x200009c,B7      ; |157| 

           MVKH    .S2     0x20000a0,B5      ; |156| 
||         MVKH    .S1     _PWMH,A3          ; |158| 
||         CMPEQ   .L1     A6,2,A2           ; |183| 
|| [ A1]   LDW     .D2T2   *B4,B4            ; |166| 

           ; BRANCH OCCURS                   ; |183| 
;** --------------------------------------------------------------------------*

   [ A2]   B       .S1     L9                ; |183| 
||         MVKL    .S2     _PWMH,B9          ; |161| 

           MVKL    .S2     0x2000098,B4      ; |163| 

           MVKL    .S2     0x20000a0,B6      ; |161| 
||         MVKL    .S1     0x200009c,A5      ; |162| 

           MVKH    .S2     _PWMH,B9          ; |161| 
||         MVKL    .S1     _PWML,A0          ; |162| 

           MVKH    .S2     0x2000098,B4      ; |163| 
||         MVKH    .S1     0x200009c,A5      ; |162| 

           MVKH    .S1     _PWML,A0          ; |162| 
||         MVKH    .S2     0x20000a0,B6      ; |161| 
||         CMPEQ   .L1     A6,3,A1           ; |183| 
|| [ A2]   STW     .D2T2   B0,*B5            ; |156| 

           ; BRANCH OCCURS                   ; |183| 
;** --------------------------------------------------------------------------*
   [ A1]   B       .S1     L11               ; |183| 
   [ A1]   LDW     .D2T2   *B9,B5            ; |161| 
           NOP             4
           ; BRANCH OCCURS                   ; |183| 
;** --------------------------------------------------------------------------*
           B       .S1     L21               ; |183| 
           MVKL    .S2     _currHall,B4      ; |188| 
           MVKH    .S2     _currHall,B4      ; |188| 
           LDW     .D2T2   *B4,B5            ; |188| 
           MVKL    .S1     _prevHall,A3      ; |188| 
           NOP             1
           ; BRANCH OCCURS                   ; |183| 
;** --------------------------------------------------------------------------*
L17:    
           MVKL    .S2     0x20000a0,B0      ; |181| 

   [ A2]   B       .S1     L13               ; |183| 
||         MVKL    .S2     0x200009c,B8      ; |182| 

           MVKL    .S2     _PWML,B7          ; |181| 

           MVK     .S2     2048,B5           ; |182| 
||         MVKL    .S1     0x2000098,A4      ; |183| 

           MVKH    .S2     0x20000a0,B0      ; |181| 
||         MVKL    .S1     _PWMH,A5          ; |183| 

           MVKH    .S1     0x2000098,A4      ; |183| 
||         MVKH    .S2     0x200009c,B8      ; |182| 

           MVKH    .S2     _PWML,B7          ; |181| 
||         MVKH    .S1     _PWMH,A5          ; |183| 
||         CMPEQ   .L1     A6,6,A1           ; |183| 
|| [ A2]   STW     .D2T2   B1,*B4            ; |171| 

           ; BRANCH OCCURS                   ; |183| 
;** --------------------------------------------------------------------------*
   [ A1]   B       .S1     L15               ; |183| 
   [ A1]   LDW     .D2T2   *B7,B4            ; |181| 
           NOP             4
           ; BRANCH OCCURS                   ; |183| 
;** --------------------------------------------------------------------------*
L18:    
           MVKL    .S2     _currHall,B4      ; |188| 
;** --------------------------------------------------------------------------*
L19:    
           MVKH    .S2     _currHall,B4      ; |188| 
;** --------------------------------------------------------------------------*
L20:    
           LDW     .D2T2   *B4,B5            ; |188| 
           MVKL    .S1     _prevHall,A3      ; |188| 
           NOP             1
;** --------------------------------------------------------------------------*
L21:    

           MVKL    .S2     _angleFromHallCount,B4 ; |191| 
||         MVKL    .S1     _hallCount,A0     ; |191| 

           MVKH    .S2     _angleFromHallCount,B4 ; |191| 
||         MVKH    .S1     _prevHall,A3      ; |188| 

           B       .S2     B4                ; |191| 
||         STW     .D1T2   B5,*A3            ; |188| 
||         MVKH    .S1     _hallCount,A0     ; |191| 

           LDW     .D1T1   *A0,A4            ; |191| 
           MVKL    .S2     RL10,B3           ; |191| 
           MVKH    .S2     RL10,B3           ; |191| 
           NOP             2
RL10:      ; CALL OCCURS                     ; |191| 
           MVKL    .S2     _currAngle,B4     ; |191| 
           MVKH    .S2     _currAngle,B4     ; |191| 
           STW     .D2T1   A4,*B4            ; |191| 
           LDW     .D2T2   *++SP(8),B3       ; |192| 
           NOP             4
           B       .S2     B3                ; |192| 
           NOP             5
           ; BRANCH OCCURS                   ; |192| 


	.sect	".text"
	.global	_main

;******************************************************************************
;* FUNCTION NAME: _main                                                       *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,B10,SP                                  *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,B10,SP                                  *
;*   Local Frame Size  : 16 Args + 4 Auto + 8 Save = 28 byte                  *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _InitEXINTF,A0    ; |198| 
           MVKH    .S1     _InitEXINTF,A0    ; |198| 
           B       .S2X    A0                ; |198| 
           NOP             2
           STW     .D2T2   B10,*SP--(32)     ; |196| 

           MVKL    .S2     RL12,B3           ; |198| 
||         STW     .D2T2   B3,*+SP(28)       ; |196| 

           MVKH    .S2     RL12,B3           ; |198| 
RL12:      ; CALL OCCURS                     ; |198| 
           MVKL    .S1     _InitTimer,A0     ; |199| 
           MVKH    .S1     _InitTimer,A0     ; |199| 
           B       .S2X    A0                ; |199| 
           MVKL    .S2     RL14,B3           ; |199| 
           MVKH    .S2     RL14,B3           ; |199| 
           NOP             3
RL14:      ; CALL OCCURS                     ; |199| 
           MVKL    .S2     _InitUART,B4      ; |200| 
           MVKH    .S2     _InitUART,B4      ; |200| 
           B       .S2     B4                ; |200| 
           MVKL    .S2     RL16,B3           ; |200| 
           MVKH    .S2     RL16,B3           ; |200| 
           NOP             3
RL16:      ; CALL OCCURS                     ; |200| 
           MVKL    .S1     _InitINT,A0       ; |201| 
           MVKH    .S1     _InitINT,A0       ; |201| 
           B       .S2X    A0                ; |201| 
           MVKL    .S2     RL18,B3           ; |201| 
           MVKH    .S2     RL18,B3           ; |201| 
           NOP             3
RL18:      ; CALL OCCURS                     ; |201| 
           MVKL    .S1     _InitUSBMon,A0    ; |202| 
           MVKH    .S1     _InitUSBMon,A0    ; |202| 
           B       .S2X    A0                ; |202| 
           MVKL    .S2     RL20,B3           ; |202| 
           MVKH    .S2     RL20,B3           ; |202| 
           NOP             3
RL20:      ; CALL OCCURS                     ; |202| 
           MVKL    .S1     _sprintf,A0       ; |204| 

           MVKH    .S1     _sprintf,A0       ; |204| 
||         MVKL    .S2     SL1+0,B4          ; |204| 

           B       .S2X    A0                ; |204| 
           MVKH    .S2     SL1+0,B4          ; |204| 
           MVKL    .S2     _tmp_string,B5    ; |204| 
           MVKL    .S2     RL22,B3           ; |204| 
           MVKH    .S2     _tmp_string,B5    ; |204| 

           STW     .D2T2   B4,*+SP(4)        ; |204| 
||         MVKH    .S2     RL22,B3           ; |204| 
||         MV      .S1X    B5,A4             ; |204| 

RL22:      ; CALL OCCURS                     ; |204| 
           MVKL    .S1     _Report,A0        ; |204| 
           MVKH    .S1     _Report,A0        ; |204| 
           B       .S2X    A0                ; |204| 
           MVKL    .S2     RL24,B3           ; |204| 
           MVKH    .S2     RL24,B3           ; |204| 
           NOP             3
RL24:      ; CALL OCCURS                     ; |204| 
           MVK     .S1     2024,A0           ; |205| 

           MVKL    .S1     _sprintf,A0       ; |205| 
||         STW     .D2T1   A0,*+SP(8)        ; |205| 

           MVKH    .S1     _sprintf,A0       ; |205| 
||         MVKL    .S2     _tmp_string,B5    ; |205| 

           B       .S2X    A0                ; |205| 
           MVKH    .S2     _tmp_string,B5    ; |205| 
           MVKL    .S2     SL2+0,B4          ; |205| 
           MVKL    .S2     RL26,B3           ; |205| 
           MVKH    .S2     SL2+0,B4          ; |205| 

           MVKH    .S2     RL26,B3           ; |205| 
||         STW     .D2T2   B4,*+SP(4)        ; |205| 
||         MV      .S1X    B5,A4             ; |205| 

RL26:      ; CALL OCCURS                     ; |205| 
           MVKL    .S1     _Report,A0        ; |205| 
           MVKH    .S1     _Report,A0        ; |205| 
           B       .S2X    A0                ; |205| 
           MVKL    .S2     RL28,B3           ; |205| 
           MVKH    .S2     RL28,B3           ; |205| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |205| 
           MVKL    .S2     SL3+0,B4          ; |206| 
           MVKL    .S2     0x20003fc,B5      ; |206| 
           MVKH    .S2     SL3+0,B4          ; |206| 

           MVKH    .S2     0x20003fc,B5      ; |206| 
||         STW     .D2T2   B4,*+SP(4)        ; |206| 

           LDW     .D2T2   *B5,B4            ; |206| 
           MVKL    .S1     0x20003fc,A0      ; |206| 
           MVKH    .S1     0x20003fc,A0      ; |206| 
           MVKL    .S1     _tmp_string,A4    ; |206| 
           MVKL    .S2     RL30,B3           ; |206| 
           EXTU    .S2     B4,16,24,B4       ; |206| 
           STW     .D2T2   B4,*+SP(8)        ; |206| 

           MVKL    .S1     _sprintf,A0       ; |206| 
||         LDW     .D1T1   *A0,A3            ; |206| 

           MVKH    .S1     _sprintf,A0       ; |206| 
           B       .S2X    A0                ; |206| 
           MVKH    .S1     _tmp_string,A4    ; |206| 
           MVKH    .S2     RL30,B3           ; |206| 
           NOP             1
           EXTU    .S1     A3,24,24,A3       ; |206| 
           STW     .D2T1   A3,*+SP(12)       ; |206| 
RL30:      ; CALL OCCURS                     ; |206| 
           MVKL    .S1     _Report,A0        ; |206| 
           MVKH    .S1     _Report,A0        ; |206| 
           B       .S2X    A0                ; |206| 
           MVKL    .S2     RL32,B3           ; |206| 
           MVKH    .S2     RL32,B3           ; |206| 
           NOP             3
RL32:      ; CALL OCCURS                     ; |206| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |210| 
           MVKH    .S1     _GIE,A0           ; |210| 
           B       .S2X    A0                ; |210| 
           MVKL    .S2     _TFlag,B4         ; |208| 
           MVKL    .S2     RL34,B3           ; |210| 
           MVKH    .S2     _TFlag,B4         ; |208| 
           ZERO    .D2     B5                ; |208| 

           STW     .D2T2   B5,*B4            ; |208| 
||         MVKH    .S2     RL34,B3           ; |210| 

RL34:      ; CALL OCCURS                     ; |210| 
           MVKL    .S2     _WaitTFlagCnt,B5  ; |214| 
           MVKH    .S2     _WaitTFlagCnt,B5  ; |214| 
           B       .S2     B5                ; |214| 
           MVKL    .S2     0x2000094,B4      ; |212| 
           MVKL    .S2     RL36,B3           ; |214| 
           MVKH    .S2     0x2000094,B4      ; |212| 
           MVK     .S1     1,A0              ; |212| 

           STW     .D2T1   A0,*B4            ; |212| 
||         MVKH    .S2     RL36,B3           ; |214| 
||         MVK     .S1     0x64,A4           ; |214| 

RL36:      ; CALL OCCURS                     ; |214| 

           ZERO    .D2     B4                ; |216| 
||         MVKL    .S1     _refAngle,A0      ; |216| 

           MVKH    .S2     0x43340000,B4     ; |216| 
||         MVKH    .S1     _refAngle,A0      ; |216| 

           STW     .D1T2   B4,*A0            ; |216| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L22
;** --------------------------------------------------------------------------*
L22:    

           ZERO    .D2     B4                ; |219| 
||         MVK     .S2     10000,B5          ; |219| 

           CMPLT   .L2     B4,B5,B0          ; |219| 
   [!B0]   B       .S1     L24               ; |219| 

           STW     .D2T2   B4,*+SP(20)       ; |219| 
||         MVK     .S2     10000,B10         ; |221| 

   [!B0]   MVKL    .S2     SL4+0,B4          ; |222| 

   [!B0]   MVKH    .S2     SL4+0,B4          ; |222| 
|| [!B0]   MVKL    .S1     _currAngle,A0     ; |222| 

   [!B0]   STW     .D2T2   B4,*+SP(4)        ; |222| 
|| [!B0]   MVKH    .S1     _currAngle,A0     ; |222| 

   [!B0]   LDW     .D1T1   *A0,A0            ; |222| 
           ; BRANCH OCCURS                   ; |219| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L23:    
           MVKL    .S2     _BLDCDrive,B4     ; |220| 

           MVKH    .S2     _BLDCDrive,B4     ; |220| 
||         MVKL    .S1     _uControlInput,A0 ; |220| 

           B       .S2     B4                ; |220| 
||         MVKH    .S1     _uControlInput,A0 ; |220| 

           LDW     .D1T1   *A0,A4            ; |220| 
           MVKL    .S2     RL38,B3           ; |220| 
           MVKH    .S2     RL38,B3           ; |220| 
           NOP             2
RL38:      ; CALL OCCURS                     ; |220| 
           LDW     .D2T2   *+SP(20),B4       ; |221| 
           NOP             4
           ADD     .D2     1,B4,B4           ; |221| 
           CMPLT   .L2     B4,B10,B0         ; |221| 
   [ B0]   B       .S1     L23               ; |221| 
           NOP             4
           STW     .D2T2   B4,*+SP(20)       ; |221| 
           ; BRANCH OCCURS                   ; |221| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     SL4+0,B4          ; |222| 

           MVKH    .S2     SL4+0,B4          ; |222| 
||         MVKL    .S1     _currAngle,A0     ; |222| 

           STW     .D2T2   B4,*+SP(4)        ; |222| 
||         MVKH    .S1     _currAngle,A0     ; |222| 

           LDW     .D1T1   *A0,A0            ; |222| 
;** --------------------------------------------------------------------------*
L24:    
           MVKL    .S2     RL40,B3           ; |222| 
           MVKL    .S2     _tmp_string,B4    ; |222| 
           MVKH    .S2     _tmp_string,B4    ; |222| 
           MV      .S1X    B4,A4             ; |222| 
           SPDP    .S1     A0,A1:A0          ; |222| 
           MVKH    .S2     RL40,B3           ; |222| 

           MVKL    .S1     _sprintf,A0       ; |222| 
||         STW     .D2T1   A0,*+SP(8)        ; |222| 

           MVKH    .S1     _sprintf,A0       ; |222| 
           B       .S2X    A0                ; |222| 
           STW     .D2T1   A1,*+SP(12)       ; |222| 
           NOP             4
RL40:      ; CALL OCCURS                     ; |222| 
           MVKL    .S2     _Report,B4        ; |222| 
           MVKH    .S2     _Report,B4        ; |222| 
           B       .S2     B4                ; |222| 
           MVKL    .S2     RL42,B3           ; |222| 
           MVKH    .S2     RL42,B3           ; |222| 
           NOP             3
RL42:      ; CALL OCCURS                     ; |222| 
           B       .S1     L22               ; |223| 
           NOP             5
           ; BRANCH OCCURS                   ; |223| 


;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
SL1:	.string	13,10,13,10,0
SL2:	.string	"Mechatronics Course %d",13,10,0
SL3:	.string	"FPGA Ver%2x.%02x",13,10,0
SL4:	.string	"currAngle: %.2f",13,10,13,10,0
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
