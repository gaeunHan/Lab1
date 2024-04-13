;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Sat Apr 13 22:09:00 2024                                *
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

	.global	_currPhaseIdx
_currPhaseIdx:	.usect	.far,4,4
	.global	_delayCntArr
_delayCntArr:	.usect	.far,800,4

	.sect	".const"
	.align 4
_$T0$1:
	.field  	2,32			; _$T0$1[0] @ 0
	.field  	8,32			; _$T0$1[1] @ 32
	.field  	1,32			; _$T0$1[2] @ 64
	.field  	4,32			; _$T0$1[3] @ 96
	.sect	".text"
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI1664_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI1664_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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

           MVK     .S2     200,B4            ; |51| 
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
	.global	_OneStepMove

;******************************************************************************
;* FUNCTION NAME: _OneStepMove                                                *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,A4,B0,B1,B3,B4,B5,B6,B7,B8,B9,SP            *
;*   Regs Used         : A0,A1,A3,A4,B0,B1,B3,B4,B5,B6,B7,B8,B9,SP            *
;*   Local Frame Size  : 0 Args + 32 Auto + 0 Save = 32 byte                  *
;******************************************************************************
_OneStepMove:
;** --------------------------------------------------------------------------*

           ADDK    .S2     -32,SP            ; |108| 
||         MV      .S1X    B4,A0             ; |108| 

           STW     .D2T1   A0,*+SP(8)        ; |108| 
||         MVKL    .S2     _$T0$1,B4         ; |109| 
||         MV      .L2X    A4,B5             ; |108| 

           STW     .D2T2   B5,*+SP(4)        ; |108| 
||         MVKH    .S2     _$T0$1,B4         ; |109| 

           LDW     .D2T2   *B4,B7            ; |109| 
           LDW     .D2T2   *+B4(8),B6        ; |109| 
           LDW     .D2T2   *+B4(4),B5        ; |109| 
           LDW     .D2T2   *+B4(12),B4       ; |109| 
           ADD     .S1X    12,SP,A0          ; |109| 
           STW     .D1T2   B7,*A0            ; |109| 
           STW     .D1T2   B6,*+A0(8)        ; |109| 
           STW     .D1T2   B5,*+A0(4)        ; |109| 
           STW     .D1T2   B4,*+A0(12)       ; |109| 
           LDW     .D2T2   *+SP(4),B5        ; |124| 
           MVKL    .S1     _currPhaseIdx,A3  ; |113| 
           MVKH    .S1     _currPhaseIdx,A3  ; |113| 
           LDW     .D1T1   *A3,A3            ; |113| 
           MV      .S2     B3,B8             ; |108| 
           MV      .S1X    B5,A1             ; |124| 
   [ A1]   B       .S1     L9                ; |116| 
           CMPEQ   .L2     B5,1,B1           ; |124| 
           MV      .S2X    A3,B5             ; |124| 
           ADDAW   .D2     SP,B5,B4          ; |117| 
           CMPEQ   .L2X    A3,3,B0

           STW     .D2T1   A3,*+SP(28)       ; |113| 
||         MV      .S1X    B4,A0             ; |119| 

           ; BRANCH OCCURS                   ; |116| 
;** --------------------------------------------------------------------------*
           MVK     .S2     -1,B4             ; |119| 

   [ B0]   STW     .D2T2   B4,*+SP(28)       ; |119| 
||         LDW     .D1T1   *+A0(12),A0       ; |117| 

           B       .S1     L10               ; |121| 
||         LDW     .D2T2   *+SP(28),B4       ; |120| 

           NOP             4

           STW     .D2T1   A0,*+SP(32)       ; |125| 
||         ADD     .S2     1,B4,B4           ; |120| 

           ; BRANCH OCCURS                   ; |121| 
;** --------------------------------------------------------------------------*
L9:    
   [!B1]   B       .S1     L11               ; |124| 
           MV      .S2X    A3,B4
           ADDAW   .D2     SP,B4,B4          ; |125| 

           MV      .S1X    B4,A0             ; |125| 
||         MV      .S2X    A3,B0
|| [!B1]   LDW     .D2T2   *+SP(28),B5       ; |132| 

   [ B1]   MVK     .S2     4,B4              ; |127| 
           NOP             1
           ; BRANCH OCCURS                   ; |124| 
;** --------------------------------------------------------------------------*

   [!B0]   STW     .D2T2   B4,*+SP(28)       ; |127| 
||         LDW     .D1T1   *+A0(12),A0       ; |125| 

           LDW     .D2T2   *+SP(28),B4       ; |128| 
           NOP             4
           SUB     .D2     B4,1,B4           ; |128| 
           STW     .D2T1   A0,*+SP(32)       ; |125| 
;** --------------------------------------------------------------------------*
L10:    
           STW     .D2T2   B4,*+SP(28)       ; |128| 
           LDW     .D2T2   *+SP(28),B5       ; |132| 
           NOP             2
;** --------------------------------------------------------------------------*
L11:    
           MVKL    .S2     _currPhaseIdx,B4  ; |132| 
           MVKH    .S2     _currPhaseIdx,B4  ; |132| 
           STW     .D2T2   B5,*B4            ; |132| 
           LDW     .D2T2   *+SP(32),B4       ; |135| 
           MVKL    .S1     0x2000090,A0      ; |135| 
           MVKH    .S1     0x2000090,A0      ; |135| 
           MVKL    .S2     RL4,B3            ; |136| 
           MVKH    .S2     RL4,B3            ; |136| 

           MVKL    .S1     _WaitTFlagCnt,A0  ; |136| 
||         STW     .D1T2   B4,*A0            ; |135| 

           MVKH    .S1     _WaitTFlagCnt,A0  ; |136| 
           B       .S2X    A0                ; |136| 
           LDW     .D2T1   *+SP(8),A4        ; |136| 
           NOP             4
RL4:       ; CALL OCCURS                     ; |136| 
           B       .S2     B8                ; |137| 
           ADDK    .S2     32,SP             ; |137| 
           NOP             4
           ; BRANCH OCCURS                   ; |137| 


	.sect	".text"
	.global	_MakeVelProfile

;******************************************************************************
;* FUNCTION NAME: _MakeVelProfile                                             *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,SP                                *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,SP                                *
;*   Local Frame Size  : 0 Args + 28 Auto + 12 Save = 40 byte                 *
;******************************************************************************
_MakeVelProfile:
;** --------------------------------------------------------------------------*
           STW     .D2T1   A11,*SP--(40)     ; |144| 

           STW     .D2T2   B4,*+SP(8)        ; |144| 
||         MV      .S2X    A4,B5

           SPDP    .S2     B4,B5:B4          ; |153| 
||         STW     .D2T2   B5,*+SP(4)        ; |144| 
||         MPYSP   .M2X    A4,B5,B6
||         ZERO    .D1     A1                ; |153| 

           MVKH    .S1     0x40000000,A1     ; |153| 
||         ZERO    .D1     A0                ; |153| 

           MPYDP   .M2X    B5:B4,A1:A0,B5:B4 ; |153| 
           NOP             1
           MVKL    .S2     __divd,B8         ; |153| 
           MVKH    .S2     __divd,B8         ; |153| 
           B       .S2     B8                ; |153| 
           NOP             1
           SPDP    .S2     B6,B7:B6          ; |153| 
           STW     .D2T2   B3,*+SP(36)       ; |144| 

           MVK     .S1     1,A0              ; |151| 
||         MV      .L1X    B7,A5             ; |153| 
||         MVKL    .S2     RL8,B3            ; |153| 
||         STW     .D2T1   A10,*+SP(32)      ; |144| 

           STW     .D2T1   A0,*+SP(12)       ; |151| 
||         MV      .S1X    B6,A4             ; |153| 
||         MVKH    .S2     RL8,B3            ; |153| 

RL8:       ; CALL OCCURS                     ; |153| 
           DPSP    .L1     A5:A4,A0          ; |153| 
           NOP             3

           MVKL    .S1     __divf,A0         ; |154| 
||         MV      .D1     A0,A4
||         STW     .D2T1   A0,*+SP(16)       ; |153| 

           MVKH    .S1     __divf,A0         ; |154| 
           B       .S2X    A0                ; |154| 
           NOP             1
           MVKL    .S2     RL10,B3           ; |154| 
           MVKL    .S2     0x3fe66666,B4     ; |154| 
           MVKH    .S2     RL10,B3           ; |154| 
           MVKH    .S2     0x3fe66666,B4     ; |154| 
RL10:      ; CALL OCCURS                     ; |154| 
           SPTRUNC .L1     A4,A3             ; |154| 
           NOP             1
           MVK     .S1     1,A0              ; |157| 
           MV      .S2X    A0,B5             ; |154| 
           CMPGTU  .L2X    B5,A3,B0
   [ B0]   B       .S1     L13               ; |157| 
           NOP             3
           STW     .D2T1   A3,*+SP(20)       ; |154| 

           ZERO    .D1     A10               ; |159| 
||         STW     .D2T1   A0,*+SP(12)       ; |157| 

           ; BRANCH OCCURS                   ; |157| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L12:    
           LDW     .D2T2   *+SP(8),B4        ; |158| 
           LDW     .D2T2   *+SP(12),B5       ; |158| 
           NOP             2
           ZERO    .D1     A0                ; |158| 
           MVKH    .S1     0x40000000,A0     ; |158| 

           INTSPU  .L2     B5,B4             ; |158| 
||         MPYSP   .M2X    B4,A0,B7          ; |158| 
||         MVKL    .S2     __divf,B6         ; |158| 

           MVKH    .S2     __divf,B6         ; |158| 
           B       .S2     B6                ; |158| 
           NOP             1

           MPYSP   .M2     B4,B7,B4          ; |158| 
||         MVKL    .S2     RL14,B3           ; |158| 

           MVKL    .S2     0x3fe66666,B5     ; |158| 
           MVKH    .S2     0x3fe66666,B5     ; |158| 

           MV      .S1X    B5,A4             ; |158| 
||         MVKH    .S2     RL14,B3           ; |158| 

RL14:      ; CALL OCCURS                     ; |158| 
           MVKL    .S1     _sqrt,A0          ; |158| 
           MVKH    .S1     _sqrt,A0          ; |158| 
           B       .S2X    A0                ; |158| 
           NOP             3

           SPDP    .S1     A4,A5:A4          ; |158| 
||         MVKL    .S2     RL16,B3           ; |158| 

           MVKH    .S2     RL16,B3           ; |158| 
RL16:      ; CALL OCCURS                     ; |158| 
           DPSP    .L1     A5:A4,A0          ; |158| 
           NOP             3
           MV      .S2X    A0,B4             ; |158| 

           SPDP    .S2     B4,B5:B4          ; |159| 
||         MVKL    .S1     0x40f86a00,A11    ; |159| 

           MVKH    .S1     0x40f86a00,A11    ; |159| 

           MPYDP   .M1X    B5:B4,A11:A10,A1:A0 ; |159| 
||         STW     .D2T1   A0,*+SP(24)       ; |158| 

           NOP             9
           DPSP    .L1     A1:A0,A0          ; |159| 
           NOP             3

           LDW     .D2T2   *+SP(12),B6       ; |160| 
||         MV      .S2X    A0,B4             ; |159| 

           SPTRUNC .L2     B4,B4             ; |160| 
           NOP             1
           MVKL    .S2     _delayCntArr,B5   ; |160| 

           MVKH    .S2     _delayCntArr,B5   ; |160| 
||         STW     .D2T1   A0,*+SP(28)       ; |159| 

           STW     .D2T2   B4,*+B5[B6]       ; |160| 
           LDW     .D2T2   *+SP(12),B4       ; |161| 
           NOP             4
           ADD     .D2     1,B4,B4           ; |161| 
           STW     .D2T2   B4,*+SP(12)       ; |161| 
           LDW     .D2T2   *+SP(12),B5       ; |161| 
           LDW     .D2T2   *+SP(20),B4       ; |161| 
           NOP             4
           CMPGTU  .L2     B5,B4,B0          ; |161| 
   [!B0]   B       .S1     L12               ; |161| 
           NOP             5
           ; BRANCH OCCURS                   ; |161| 
;** --------------------------------------------------------------------------*
L13:    
           LDW     .D2T2   *+SP(36),B3       ; |164| 
           LDW     .D2T1   *+SP(32),A10      ; |164| 
           LDW     .D2T1   *+SP(20),A4       ; |163| 
           LDW     .D2T1   *++SP(40),A11     ; |164| 
           NOP             1
           B       .S2     B3                ; |164| 
           NOP             5
           ; BRANCH OCCURS                   ; |164| 


	.sect	".text"
	.global	_StepMoveVP

;******************************************************************************
;* FUNCTION NAME: _StepMoveVP                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 36 Auto + 4 Save = 40 byte                  *
;******************************************************************************
_StepMoveVP:
;** --------------------------------------------------------------------------*
           MVKL    .S1     __divf,A0         ; |175| 
           MVKH    .S1     __divf,A0         ; |175| 
           B       .S2X    A0                ; |175| 
           STW     .D2T2   B3,*SP--(40)      ; |167| 
           STW     .D2T2   B4,*+SP(8)        ; |167| 
           MVKL    .S1     0x3fe66666,A3     ; |175| 

           STW     .D2T1   A6,*+SP(12)       ; |167| 
||         MVKH    .S1     0x3fe66666,A3     ; |175| 
||         MVKL    .S2     RL18,B3           ; |175| 

           MV      .L2X    A3,B4             ; |175| 
||         STW     .D2T1   A4,*+SP(4)        ; |167| 
||         MVKH    .S2     RL18,B3           ; |175| 

RL18:      ; CALL OCCURS                     ; |175| 

           LDW     .D2T2   *+SP(4),B5        ; |176| 
||         MVKL    .S2     _MakeVelProfile,B6 ; |180| 

           MVKH    .S2     _MakeVelProfile,B6 ; |180| 

           B       .S2     B6                ; |180| 
||         LDW     .D2T2   *+SP(12),B4       ; |180| 
||         SPTRUNC .L1     A4,A3             ; |175| 

           LDW     .D2T1   *+SP(8),A4        ; |180| 
           ZERO    .D1     A0                ; |176| 
           CMPGTSP .S1X    B5,A0,A1          ; |176| 

   [!A1]   MVK     .S1     0x1,A0            ; |176| 
||         STW     .D2T1   A3,*+SP(16)       ; |175| 
||         MVKL    .S2     RL20,B3           ; |180| 

           STW     .D2T1   A0,*+SP(20)       ; |176| 
||         MVKH    .S2     RL20,B3           ; |180| 

RL20:      ; CALL OCCURS                     ; |180| 
           MVK     .S2     1,B4              ; |184| 
           STW     .D2T2   B4,*+SP(36)       ; |184| 
           LDW     .D2T2   *+SP(36),B5       ; |184| 
           LDW     .D2T2   *+SP(16),B4       ; |184| 
           STW     .D2T1   A4,*+SP(24)       ; |180| 
           NOP             3
           CMPGT   .L2     B5,B4,B0          ; |184| 
   [ B0]   B       .S1     L16               ; |184| 
           ZERO    .S2     B6                ; |183| 
           STW     .D2T2   B6,*+SP(32)       ; |183| 
   [ B0]   LDW     .D2T2   *++SP(40),B3      ; |204| 
           NOP             2
           ; BRANCH OCCURS                   ; |184| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(24),B4       ; |186| 
           LDW     .D2T2   *+SP(36),B5       ; |186| 
           NOP             3
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L14:    
           NOP             1
           CMPGTU  .L2     B5,B4,B0          ; |186| 
   [!B0]   LDW     .D2T2   *+SP(32),B6       ; |187| 
   [!B0]   MVKL    .S2     _delayCntArr,B4   ; |187| 
   [!B0]   LDW     .D2T2   *+SP(32),B5       ; |188| 
   [!B0]   MVKH    .S2     _delayCntArr,B4   ; |187| 
   [!B0]   MVKL    .S1     _OneStepMove,A0   ; |202| 

   [!B0]   B       .S1     L15               ; |189| 
|| [!B0]   LDW     .D2T2   *+B4[B6],B4       ; |187| 

           NOP             2
   [!B0]   ADD     .D2     1,B5,B5           ; |188| 
   [!B0]   STW     .D2T2   B5,*+SP(32)       ; |188| 
   [!B0]   STW     .D2T2   B4,*+SP(28)       ; |187| 
           ; BRANCH OCCURS                   ; |189| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(24),B4       ; |191| 
           LDW     .D2T2   *+SP(36),B5       ; |191| 
           NOP             4
           CMPGTU  .L2     B5,B4,B0          ; |191| 
   [ B0]   LDW     .D2T2   *+SP(24),B6       ; |191| 
   [ B0]   LDW     .D2T2   *+SP(16),B4       ; |191| 
   [ B0]   LDW     .D2T2   *+SP(36),B5       ; |191| 
           NOP             3
   [ B0]   SUB     .D2     B4,B6,B4          ; |191| 
   [ B0]   CMPGTU  .L2     B5,B4,B4          ; |191| 
   [ B0]   XOR     .S2     1,B4,B0           ; |191| 
   [ B0]   LDW     .D2T2   *+SP(24),B5       ; |192| 
   [ B0]   MVKL    .S2     _delayCntArr,B4   ; |192| 
   [ B0]   MVKH    .S2     _delayCntArr,B4   ; |192| 
   [ B0]   MVKL    .S1     _OneStepMove,A0   ; |202| 
           NOP             1

   [ B0]   LDW     .D2T2   *+B4[B5],B4       ; |192| 
|| [ B0]   B       .S1     L15               ; |193| 

           NOP             4
   [ B0]   STW     .D2T2   B4,*+SP(28)       ; |192| 
           ; BRANCH OCCURS                   ; |193| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(24),B4       ; |196| 
           LDW     .D2T2   *+SP(16),B5       ; |196| 
           LDW     .D2T2   *+SP(36),B6       ; |196| 
           MVKL    .S1     _OneStepMove,A0   ; |202| 
           NOP             2
           SUB     .D2     B5,B4,B4          ; |196| 
           CMPGTU  .L2     B6,B4,B0          ; |196| 
   [ B0]   LDW     .D2T2   *+SP(36),B5       ; |196| 
   [ B0]   LDW     .D2T2   *+SP(16),B4       ; |196| 
           NOP             4
   [ B0]   CMPGT   .L2     B5,B4,B4          ; |196| 
   [ B0]   XOR     .S2     1,B4,B0           ; |196| 
   [ B0]   LDW     .D2T2   *+SP(32),B6       ; |197| 
   [ B0]   LDW     .D2T2   *+SP(32),B4       ; |198| 
   [ B0]   MVKL    .S2     _delayCntArr,B5   ; |197| 
   [ B0]   MVKH    .S2     _delayCntArr,B5   ; |197| 
           NOP             1
   [ B0]   LDW     .D2T2   *+B5[B6],B5       ; |197| 
   [ B0]   SUB     .D2     B4,1,B4           ; |198| 
   [ B0]   STW     .D2T2   B4,*+SP(32)       ; |198| 
           NOP             2
   [ B0]   STW     .D2T2   B5,*+SP(28)       ; |197| 
;** --------------------------------------------------------------------------*
L15:    
           MVKH    .S1     _OneStepMove,A0   ; |202| 

           B       .S2X    A0                ; |202| 
||         LDW     .D2T1   *+SP(20),A4

           LDW     .D2T2   *+SP(28),B4       ; |202| 
           MVKL    .S2     RL22,B3           ; |202| 
           MVKH    .S2     RL22,B3           ; |202| 
           NOP             2
RL22:      ; CALL OCCURS                     ; |202| 
           LDW     .D2T2   *+SP(36),B4       ; |203| 
           NOP             4
           ADD     .D2     1,B4,B4           ; |203| 
           STW     .D2T2   B4,*+SP(36)       ; |203| 
           LDW     .D2T2   *+SP(36),B5       ; |203| 
           LDW     .D2T2   *+SP(16),B4       ; |203| 
           NOP             4
           CMPGT   .L2     B5,B4,B0          ; |203| 
   [!B0]   B       .S1     L14               ; |203| 
   [!B0]   LDW     .D2T2   *+SP(24),B4       ; |186| 
   [!B0]   LDW     .D2T2   *+SP(36),B5       ; |186| 
   [ B0]   LDW     .D2T2   *++SP(40),B3      ; |204| 
           NOP             2
           ; BRANCH OCCURS                   ; |203| 
;** --------------------------------------------------------------------------*
L16:    
           NOP             2
           B       .S2     B3                ; |204| 
           NOP             5
           ; BRANCH OCCURS                   ; |204| 


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
           MVKL    .S1     _InitEXINTF,A0    ; |209| 
           MVKH    .S1     _InitEXINTF,A0    ; |209| 
           B       .S2X    A0                ; |209| 
           STW     .D2T2   B3,*SP--(24)      ; |208| 
           MVKL    .S2     RL24,B3           ; |209| 
           MVKH    .S2     RL24,B3           ; |209| 
           NOP             2
RL24:      ; CALL OCCURS                     ; |209| 
           MVKL    .S1     _InitTimer,A0     ; |210| 
           MVKH    .S1     _InitTimer,A0     ; |210| 
           B       .S2X    A0                ; |210| 
           MVKL    .S2     RL26,B3           ; |210| 
           MVKH    .S2     RL26,B3           ; |210| 
           NOP             3
RL26:      ; CALL OCCURS                     ; |210| 
           MVKL    .S2     _InitUART,B4      ; |211| 
           MVKH    .S2     _InitUART,B4      ; |211| 
           B       .S2     B4                ; |211| 
           MVKL    .S2     RL28,B3           ; |211| 
           MVKH    .S2     RL28,B3           ; |211| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |211| 
           MVKL    .S1     _InitINT,A0       ; |212| 
           MVKH    .S1     _InitINT,A0       ; |212| 
           B       .S2X    A0                ; |212| 
           MVKL    .S2     RL30,B3           ; |212| 
           MVKH    .S2     RL30,B3           ; |212| 
           NOP             3
RL30:      ; CALL OCCURS                     ; |212| 
           MVKL    .S1     _InitUSBMon,A0    ; |213| 
           MVKH    .S1     _InitUSBMon,A0    ; |213| 
           B       .S2X    A0                ; |213| 
           MVKL    .S2     RL32,B3           ; |213| 
           MVKH    .S2     RL32,B3           ; |213| 
           NOP             3
RL32:      ; CALL OCCURS                     ; |213| 
           MVKL    .S1     _sprintf,A0       ; |215| 

           MVKH    .S1     _sprintf,A0       ; |215| 
||         MVKL    .S2     SL1+0,B5          ; |215| 

           B       .S2X    A0                ; |215| 
           MVKL    .S2     RL34,B3           ; |215| 
           MVKH    .S2     SL1+0,B5          ; |215| 
           MVKL    .S2     _tmp_string,B4    ; |215| 
           MVKH    .S2     _tmp_string,B4    ; |215| 

           MVKH    .S2     RL34,B3           ; |215| 
||         STW     .D2T2   B5,*+SP(4)        ; |215| 
||         MV      .S1X    B4,A4             ; |215| 

RL34:      ; CALL OCCURS                     ; |215| 
           MVKL    .S1     _Report,A0        ; |215| 
           MVKH    .S1     _Report,A0        ; |215| 
           B       .S2X    A0                ; |215| 
           MVKL    .S2     RL36,B3           ; |215| 
           MVKH    .S2     RL36,B3           ; |215| 
           NOP             3
RL36:      ; CALL OCCURS                     ; |215| 
           MVK     .S1     2024,A0           ; |216| 

           MVKL    .S1     _sprintf,A0       ; |216| 
||         STW     .D2T1   A0,*+SP(8)        ; |216| 

           MVKH    .S1     _sprintf,A0       ; |216| 
||         MVKL    .S2     _tmp_string,B5    ; |216| 

           B       .S2X    A0                ; |216| 
           MVKL    .S2     SL2+0,B4          ; |216| 
           MVKH    .S2     _tmp_string,B5    ; |216| 
           MVKH    .S2     SL2+0,B4          ; |216| 
           MVKL    .S2     RL38,B3           ; |216| 

           MVKH    .S2     RL38,B3           ; |216| 
||         STW     .D2T2   B4,*+SP(4)        ; |216| 
||         MV      .S1X    B5,A4             ; |216| 

RL38:      ; CALL OCCURS                     ; |216| 
           MVKL    .S1     _Report,A0        ; |216| 
           MVKH    .S1     _Report,A0        ; |216| 
           B       .S2X    A0                ; |216| 
           MVKL    .S2     RL40,B3           ; |216| 
           MVKH    .S2     RL40,B3           ; |216| 
           NOP             3
RL40:      ; CALL OCCURS                     ; |216| 
           MVKL    .S2     SL3+0,B4          ; |217| 
           MVKL    .S2     0x20003fc,B5      ; |217| 
           MVKH    .S2     SL3+0,B4          ; |217| 

           STW     .D2T2   B4,*+SP(4)        ; |217| 
||         MVKH    .S2     0x20003fc,B5      ; |217| 

           LDW     .D2T2   *B5,B4            ; |217| 
           MVKL    .S1     0x20003fc,A0      ; |217| 
           MVKH    .S1     0x20003fc,A0      ; |217| 
           MVKL    .S1     _tmp_string,A4    ; |217| 
           MVKL    .S2     RL42,B3           ; |217| 
           EXTU    .S2     B4,16,24,B4       ; |217| 
           STW     .D2T2   B4,*+SP(8)        ; |217| 

           MVKL    .S1     _sprintf,A0       ; |217| 
||         LDW     .D1T1   *A0,A3            ; |217| 

           MVKH    .S1     _sprintf,A0       ; |217| 
           B       .S2X    A0                ; |217| 
           MVKH    .S1     _tmp_string,A4    ; |217| 
           MVKH    .S2     RL42,B3           ; |217| 
           NOP             1
           EXTU    .S1     A3,24,24,A3       ; |217| 
           STW     .D2T1   A3,*+SP(12)       ; |217| 
RL42:      ; CALL OCCURS                     ; |217| 
           MVKL    .S1     _Report,A0        ; |217| 
           MVKH    .S1     _Report,A0        ; |217| 
           B       .S2X    A0                ; |217| 
           MVKL    .S2     RL44,B3           ; |217| 
           MVKH    .S2     RL44,B3           ; |217| 
           NOP             3
RL44:      ; CALL OCCURS                     ; |217| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _GIE,B4           ; |220| 
           MVKH    .S2     _GIE,B4           ; |220| 
           B       .S2     B4                ; |220| 
           MVKL    .S2     RL46,B3           ; |220| 
           ZERO    .D1     A3                ; |219| 
           MVKL    .S1     _TFlag,A0         ; |219| 
           MVKH    .S1     _TFlag,A0         ; |219| 

           STW     .D1T1   A3,*A0            ; |219| 
||         MVKH    .S2     RL46,B3           ; |220| 

RL46:      ; CALL OCCURS                     ; |220| 
           MVKL    .S1     _WaitTFlagCnt,A0  ; |226| 
           MVKH    .S1     _WaitTFlagCnt,A0  ; |226| 
           B       .S2X    A0                ; |226| 
           MVKL    .S2     0x200004c,B4      ; |222| 
           MVK     .S1     1,A4              ; |222| 

           MVKH    .S2     0x200004c,B4      ; |222| 
||         MVKL    .S1     _currPhaseIdx,A3  ; |224| 

           ZERO    .L2     B4                ; |224| 
||         STW     .D2T1   A4,*B4            ; |222| 
||         MVKL    .S2     RL48,B3           ; |226| 
||         MVKH    .S1     _currPhaseIdx,A3  ; |224| 

           STW     .D1T2   B4,*A3            ; |224| 
||         MVK     .S1     0x2710,A4         ; |226| 
||         MVKH    .S2     RL48,B3           ; |226| 

RL48:      ; CALL OCCURS                     ; |226| 
           MVKL    .S2     _StepMoveVP,B5    ; |230| 
           MVKH    .S2     _StepMoveVP,B5    ; |230| 
           B       .S2     B5                ; |230| 
           MVKL    .S2     RL50,B3           ; |230| 
           ZERO    .D2     B4                ; |230| 
           ZERO    .D1     A6                ; |230| 

           MVKH    .S2     0x43340000,B4     ; |230| 
||         ZERO    .D1     A4                ; |230| 
||         MVKH    .S1     0x44e10000,A6     ; |230| 

           MVKH    .S2     RL50,B3           ; |230| 
||         MVKH    .S1     0x43b40000,A4     ; |230| 

RL50:      ; CALL OCCURS                     ; |230| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L17:    
           B       .S1     L17               ; |232| 
           NOP             5
           ; BRANCH OCCURS                   ; |232| 


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
	.global	_sqrt
	.global	_sprintf
	.global	_InitUART
	.global	_Report
	.global	_InitUSBMon
	.global	_tmp_string
	.global	_TFlag
	.global	__divf
	.global	__divd
