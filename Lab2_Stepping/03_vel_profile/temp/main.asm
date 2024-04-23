;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Tue Apr 23 13:18:46 2024                                *
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
	.global	_currDIR
_currDIR:	.usect	.far,4,4
	.global	_prevDIR
_prevDIR:	.usect	.far,4,4
	.global	_delayCntArr
_delayCntArr:	.usect	.far,800,4
	.global	_USBposition
_USBposition:	.usect	.far,4,4
	.global	_USBvelocity
_USBvelocity:	.usect	.far,4,4
	.global	_USBvelPrev
_USBvelPrev:	.usect	.far,4,4
	.global	_USBcelCurr
_USBcelCurr:	.usect	.far,4,4
	.global	_USBacc
_USBacc:	.usect	.far,4,4
	.global	_USBdelayCnt
_USBdelayCnt:	.usect	.far,4,4
	.global	_totalStep
_totalStep:	.usect	.far,4,4

	.sect	".const"
	.align 4
_$T0$1:
	.field  	2,32			; _$T0$1[0] @ 0
	.field  	8,32			; _$T0$1[1] @ 32
	.field  	1,32			; _$T0$1[2] @ 64
	.field  	4,32			; _$T0$1[3] @ 96
	.sect	".text"
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI14420_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI14420_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
;*   Regs Modified     : A0,A1,A3,A4,A5,B0,B3,B4,B5,B6,B7,B8,B9,SP            *
;*   Regs Used         : A0,A1,A3,A4,A5,B0,B3,B4,B5,B6,B7,B8,B9,SP            *
;*   Local Frame Size  : 0 Args + 32 Auto + 0 Save = 32 byte                  *
;******************************************************************************
_OneStepMove:
;** --------------------------------------------------------------------------*

           ADDK    .S2     -32,SP            ; |109| 
||         MV      .S1X    B4,A0             ; |109| 

           STW     .D2T1   A0,*+SP(8)        ; |109| 
||         MVKL    .S2     _$T0$1,B4         ; |110| 
||         MV      .L2X    A4,B5             ; |109| 

           STW     .D2T2   B5,*+SP(4)        ; |109| 
||         MVKH    .S2     _$T0$1,B4         ; |110| 

           LDW     .D2T2   *B4,B7            ; |110| 
           LDW     .D2T2   *+B4(8),B6        ; |110| 
           LDW     .D2T2   *+B4(4),B5        ; |110| 
           LDW     .D2T2   *+B4(12),B4       ; |110| 
           ADD     .S1X    12,SP,A0          ; |110| 
           STW     .D1T2   B7,*A0            ; |110| 
           STW     .D1T2   B6,*+A0(8)        ; |110| 
           STW     .D1T2   B5,*+A0(4)        ; |110| 
           STW     .D1T2   B4,*+A0(12)       ; |110| 
           LDW     .D2T1   *+SP(4),A5        ; |114| 
           MVKL    .S1     _currDIR,A4       ; |114| 
           MVKH    .S1     _currDIR,A4       ; |114| 
           MVKL    .S1     _currPhaseIdx,A3  ; |115| 
           MVKH    .S1     _currPhaseIdx,A3  ; |115| 
           STW     .D1T1   A5,*A4            ; |114| 
           LDW     .D2T2   *+SP(4),B4        ; |131| 
           LDW     .D1T1   *A3,A5            ; |115| 
           MVKL    .S1     _currDIR,A4       ; |119| 
           MVKL    .S1     _prevDIR,A3       ; |119| 
           MVKH    .S1     _currDIR,A4       ; |119| 
           MV      .L1X    B4,A1             ; |131| 
   [ A1]   B       .S1     L10               ; |118| 
           STW     .D2T1   A5,*+SP(28)       ; |115| 
           MVKH    .S1     _prevDIR,A3       ; |119| 
           CMPEQ   .L2     B4,1,B0           ; |131| 
           MV      .S2     B3,B8             ; |109| 
           NOP             1
           ; BRANCH OCCURS                   ; |118| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A3,A0            ; |119| 
           LDW     .D1T1   *A4,A3            ; |119| 
           CMPEQ   .L2X    A5,3,B0
           NOP             3
           CMPEQ   .L1     A3,A0,A1          ; |119| 
   [ A1]   B       .S1     L9                ; |119| 

   [ A1]   LDW     .D2T2   *+SP(28),B5       ; |124| 
|| [!A1]   MVK     .S2     -1,B4             ; |120| 

           NOP             4
           ; BRANCH OCCURS                   ; |119| 
;** --------------------------------------------------------------------------*
   [ B0]   STW     .D2T2   B4,*+SP(28)       ; |120| 
           LDW     .D2T2   *+SP(28),B4       ; |121| 
           NOP             4
           ADD     .D2     1,B4,B4           ; |121| 
           STW     .D2T2   B4,*+SP(28)       ; |121| 
           LDW     .D2T2   *+SP(28),B5       ; |124| 
           NOP             4
;** --------------------------------------------------------------------------*
L9:    

           ADDAW   .D2     SP,B5,B5          ; |124| 
||         CMPEQ   .L2     B5,3,B0

           LDW     .D2T2   *+B5(12),B5       ; |124| 
||         MVK     .S2     -1,B4             ; |126| 

   [ B0]   STW     .D2T2   B4,*+SP(28)       ; |126| 

           B       .S1     L12               ; |128| 
||         LDW     .D2T2   *+SP(28),B4       ; |127| 

           NOP             4

           STW     .D2T2   B5,*+SP(32)       ; |124| 
||         ADD     .S2     1,B4,B4           ; |127| 

           ; BRANCH OCCURS                   ; |128| 
;** --------------------------------------------------------------------------*
L10:    
   [!B0]   B       .S1     L13               ; |131| 
           MVKL    .S1     _prevDIR,A0       ; |132| 
           MVKH    .S1     _prevDIR,A0       ; |132| 
           NOP             1
           MVKL    .S2     _currDIR,B4       ; |132| 

   [!B0]   LDW     .D2T2   *+SP(28),B4       ; |144| 
||         MVKH    .S2     _currDIR,B4       ; |132| 

           ; BRANCH OCCURS                   ; |131| 
;** --------------------------------------------------------------------------*

           LDW     .D2T2   *B4,B4            ; |132| 
||         LDW     .D1T1   *A0,A0            ; |132| 

           MV      .L2X    A5,B0             ; |132| 
           NOP             3
           CMPEQ   .L1X    B4,A0,A1          ; |132| 
   [ A1]   B       .S1     L11               ; |132| 
   [ A1]   LDW     .D2T2   *+SP(28),B4       ; |137| 
   [!A1]   MVK     .S2     4,B4              ; |133| 
           NOP             3
           ; BRANCH OCCURS                   ; |132| 
;** --------------------------------------------------------------------------*
   [!B0]   STW     .D2T2   B4,*+SP(28)       ; |133| 
           LDW     .D2T2   *+SP(28),B4       ; |134| 
           NOP             4
           SUB     .D2     B4,1,B4           ; |134| 
           STW     .D2T2   B4,*+SP(28)       ; |134| 
           LDW     .D2T2   *+SP(28),B4       ; |137| 
;** --------------------------------------------------------------------------*
L11:    
           MVK     .S2     4,B5              ; |139| 
           NOP             3

           ADDAW   .D2     SP,B4,B4          ; |137| 
||         MV      .S2     B4,B0             ; |137| 

           LDW     .D2T2   *+B4(12),B4       ; |137| 
   [!B0]   STW     .D2T2   B5,*+SP(28)       ; |139| 
           LDW     .D2T2   *+SP(28),B5       ; |140| 
           NOP             4

           SUB     .S2     B5,1,B4           ; |140| 
||         STW     .D2T2   B4,*+SP(32)       ; |137| 

;** --------------------------------------------------------------------------*
L12:    
           STW     .D2T2   B4,*+SP(28)       ; |140| 
           LDW     .D2T2   *+SP(28),B4       ; |144| 
;** --------------------------------------------------------------------------*
L13:    
           MVKL    .S1     _currPhaseIdx,A0  ; |144| 
           MVKH    .S1     _currPhaseIdx,A0  ; |144| 
           MVKL    .S2     RL4,B3            ; |149| 
           MVKH    .S2     RL4,B3            ; |149| 
           STW     .D1T2   B4,*A0            ; |144| 
           LDW     .D2T2   *+SP(4),B5        ; |145| 
           MVKL    .S2     _prevDIR,B4       ; |145| 
           MVKH    .S2     _prevDIR,B4       ; |145| 
           MVKL    .S1     0x2000090,A0      ; |148| 
           MVKH    .S1     0x2000090,A0      ; |148| 
           STW     .D2T2   B5,*B4            ; |145| 
           LDW     .D2T2   *+SP(32),B5       ; |148| 
           MVKL    .S2     _WaitTFlagCnt,B4  ; |149| 
           MVKH    .S2     _WaitTFlagCnt,B4  ; |149| 
           NOP             2

           B       .S2     B4                ; |149| 
||         STW     .D1T2   B5,*A0            ; |148| 

           LDW     .D2T1   *+SP(8),A4        ; |149| 
           NOP             4
RL4:       ; CALL OCCURS                     ; |149| 
           B       .S2     B8                ; |150| 
           ADDK    .S2     32,SP             ; |150| 
           NOP             4
           ; BRANCH OCCURS                   ; |150| 


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
           STW     .D2T1   A11,*SP--(40)     ; |157| 

           STW     .D2T2   B4,*+SP(8)        ; |157| 
||         MV      .S2X    A4,B5

           SPDP    .S2     B4,B5:B4          ; |166| 
||         STW     .D2T2   B5,*+SP(4)        ; |157| 
||         MPYSP   .M2X    A4,B5,B6
||         ZERO    .D1     A1                ; |166| 

           MVKH    .S1     0x40000000,A1     ; |166| 
||         ZERO    .D1     A0                ; |166| 

           MPYDP   .M2X    B5:B4,A1:A0,B5:B4 ; |166| 
           NOP             1
           MVKL    .S2     __divd,B8         ; |166| 
           MVKH    .S2     __divd,B8         ; |166| 
           B       .S2     B8                ; |166| 
           NOP             1
           SPDP    .S2     B6,B7:B6          ; |166| 
           STW     .D2T2   B3,*+SP(36)       ; |157| 

           MVK     .S1     1,A0              ; |164| 
||         MV      .L1X    B7,A5             ; |166| 
||         MVKL    .S2     RL8,B3            ; |166| 
||         STW     .D2T1   A10,*+SP(32)      ; |157| 

           STW     .D2T1   A0,*+SP(12)       ; |164| 
||         MV      .S1X    B6,A4             ; |166| 
||         MVKH    .S2     RL8,B3            ; |166| 

RL8:       ; CALL OCCURS                     ; |166| 
           DPSP    .L1     A5:A4,A0          ; |166| 
           NOP             3

           MVKL    .S1     __divf,A0         ; |167| 
||         MV      .D1     A0,A4
||         STW     .D2T1   A0,*+SP(16)       ; |166| 

           MVKH    .S1     __divf,A0         ; |167| 
           B       .S2X    A0                ; |167| 
           NOP             1
           MVKL    .S2     RL10,B3           ; |167| 
           MVKL    .S2     0x3fe66666,B4     ; |167| 
           MVKH    .S2     RL10,B3           ; |167| 
           MVKH    .S2     0x3fe66666,B4     ; |167| 
RL10:      ; CALL OCCURS                     ; |167| 
           SPTRUNC .L1     A4,A3             ; |167| 
           NOP             1
           MVK     .S1     1,A0              ; |170| 
           MV      .S2X    A0,B5             ; |167| 
           CMPGTU  .L2X    B5,A3,B0
   [ B0]   B       .S1     L15               ; |170| 
           NOP             3
           STW     .D2T1   A3,*+SP(20)       ; |167| 

           ZERO    .D1     A10               ; |171| 
||         STW     .D2T1   A0,*+SP(12)       ; |170| 

           ; BRANCH OCCURS                   ; |170| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L14:    
           LDW     .D2T2   *+SP(8),B4        ; |171| 
           NOP             4

           SPDP    .S2     B4,B5:B4          ; |171| 
||         ZERO    .D1     A11               ; |171| 

           MVKH    .S1     0x40000000,A11    ; |171| 

           LDW     .D2T2   *+SP(12),B4       ; |171| 
||         MPYDP   .M1X    B5:B4,A11:A10,A1:A0 ; |171| 

           NOP             4
           INTDPU  .L2     B4,B5:B4          ; |171| 
           NOP             4
           MPYDP   .M2X    B5:B4,A1:A0,B5:B4 ; |171| 
           NOP             2
           MVKL    .S1     __divd,A0         ; |171| 
           MVKH    .S1     __divd,A0         ; |171| 
           B       .S2X    A0                ; |171| 
           NOP             1
           MVKL    .S1     0xcccccccd,A4     ; |171| 
           MVKL    .S1     0x3ffccccc,A5     ; |171| 

           MVKH    .S1     0xcccccccd,A4     ; |171| 
||         MVKL    .S2     RL14,B3           ; |171| 

           MVKH    .S2     RL14,B3           ; |171| 
||         MVKH    .S1     0x3ffccccc,A5     ; |171| 

RL14:      ; CALL OCCURS                     ; |171| 
           MVKL    .S2     _sqrt,B4          ; |171| 
           MVKH    .S2     _sqrt,B4          ; |171| 
           B       .S2     B4                ; |171| 
           NOP             3
           MVKL    .S2     RL16,B3           ; |171| 
           MVKH    .S2     RL16,B3           ; |171| 
RL16:      ; CALL OCCURS                     ; |171| 
           DPSP    .L1     A5:A4,A0          ; |171| 
           NOP             1
           MVKL    .S2     0x47c35000,B4     ; |172| 
           MVKH    .S2     0x47c35000,B4     ; |172| 
           MPYSP   .M2X    A0,B4,B4
           NOP             2
           LDW     .D2T2   *+SP(12),B6       ; |173| 

           SPTRUNC .L2     B4,B4             ; |173| 
||         STW     .D2T2   B4,*+SP(28)       ; |172| 

           NOP             1
           MVKL    .S2     _delayCntArr,B5   ; |173| 

           STW     .D2T1   A0,*+SP(24)       ; |171| 
||         MVKH    .S2     _delayCntArr,B5   ; |173| 

           STW     .D2T2   B4,*+B5[B6]       ; |173| 
           LDW     .D2T2   *+SP(12),B4       ; |174| 
           NOP             4
           ADD     .D2     1,B4,B4           ; |174| 
           STW     .D2T2   B4,*+SP(12)       ; |174| 
           LDW     .D2T2   *+SP(20),B4       ; |174| 
           LDW     .D2T2   *+SP(12),B5       ; |174| 
           NOP             4
           CMPGTU  .L2     B5,B4,B0          ; |174| 
   [!B0]   B       .S1     L14               ; |174| 
           NOP             5
           ; BRANCH OCCURS                   ; |174| 
;** --------------------------------------------------------------------------*
L15:    
           LDW     .D2T2   *+SP(36),B3       ; |177| 
           LDW     .D2T1   *+SP(32),A10      ; |177| 
           LDW     .D2T1   *+SP(20),A4       ; |176| 
           LDW     .D2T1   *++SP(40),A11     ; |177| 
           NOP             1
           B       .S2     B3                ; |177| 
           NOP             5
           ; BRANCH OCCURS                   ; |177| 


	.sect	".text"
	.global	_StepMoveVP

;******************************************************************************
;* FUNCTION NAME: _StepMoveVP                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,B10,B11,B12,SP                          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,B10,B11,B12,SP                          *
;*   Local Frame Size  : 0 Args + 40 Auto + 16 Save = 56 byte                 *
;******************************************************************************
_StepMoveVP:
;** --------------------------------------------------------------------------*
           STW     .D2T2   B12,*SP--(56)     ; |188| 

           STW     .D2T1   A4,*+SP(4)        ; |188| 
||         MVKL    .S1     __divf,A5         ; |199| 

           STW     .D2T2   B3,*+SP(44)       ; |188| 
||         MVKH    .S1     __divf,A5         ; |199| 
||         MV      .S2X    A4,B6             ; |188| 

           B       .S2X    A5                ; |199| 
||         STW     .D2T2   B11,*+SP(52)      ; |188| 
||         ZERO    .D1     A3                ; |197| 

           STW     .D2T2   B10,*+SP(48)      ; |188| 
||         CMPGTSP .S1X    B6,A3,A1          ; |197| 

           STW     .D2T1   A6,*+SP(12)       ; |188| 
||         MVKL    .S1     0x3fe66666,A4     ; |199| 
||         MV      .L1X    B4,A0             ; |188| 
||         MV      .S2X    A4,B5             ; |188| 

           STW     .D2T1   A0,*+SP(8)        ; |188| 
||         MVKH    .S1     0x3fe66666,A4     ; |199| 
||         ABSSP   .S2     B5,B4             ; |198| 

           STW     .D2T2   B4,*+SP(4)        ; |198| 
|| [!A1]   MVK     .S1     0x1,A3            ; |197| 
||         MV      .L2     B4,B5             ; |199| 
||         MVKL    .S2     RL18,B3           ; |199| 

           MV      .S1X    B5,A4             ; |199| 
||         MV      .L2X    A4,B4             ; |199| 
||         STW     .D2T1   A3,*+SP(16)       ; |197| 
||         MVKH    .S2     RL18,B3           ; |199| 

RL18:      ; CALL OCCURS                     ; |199| 
           SPTRUNC .L1     A4,A3             ; |199| 
           NOP             1
           MVKL    .S1     _totalStep,A0     ; |199| 
           MVKH    .S1     _totalStep,A0     ; |199| 
           STW     .D1T1   A3,*A0            ; |199| 
           LDW     .D2T2   *+SP(12),B4       ; |202| 
           NOP             4
           SPDP    .S2     B4,B5:B4          ; |202| 
           ZERO    .D2     B7                ; |202| 

           ZERO    .D2     B6                ; |202| 
||         MVKH    .S2     0x40000000,B7     ; |202| 

           MPYDP   .M2     B5:B4,B7:B6,B5:B4 ; |202| 
           NOP             1
           LDW     .D2T2   *+SP(8),B6        ; |202| 
           NOP             4

           MPYSP   .M2     B6,B6,B6
||         MVKL    .S1     __divd,A0         ; |202| 

           MVKH    .S1     __divd,A0         ; |202| 
           B       .S2X    A0                ; |202| 
           NOP             1
           SPDP    .S2     B6,B7:B6          ; |202| 
           NOP             1

           MV      .S1X    B7,A5             ; |202| 
||         MVKL    .S2     RL20,B3           ; |202| 

           MV      .S1X    B6,A4             ; |202| 
||         MVKH    .S2     RL20,B3           ; |202| 

RL20:      ; CALL OCCURS                     ; |202| 
           MVKL    .S2     _MakeVelProfile,B5 ; |203| 
           MVKH    .S2     _MakeVelProfile,B5 ; |203| 

           B       .S2     B5                ; |203| 
||         LDW     .D2T2   *+SP(12),B4       ; |203| 

           LDW     .D2T1   *+SP(8),A4        ; |203| 
||         DPSP    .L1     A5:A4,A0          ; |202| 

           NOP             2
           MVKL    .S2     RL22,B3           ; |203| 

           MVKH    .S2     RL22,B3           ; |203| 
||         STW     .D2T1   A0,*+SP(20)       ; |202| 

RL22:      ; CALL OCCURS                     ; |203| 
           LDW     .D2T2   *+SP(4),B6        ; |208| 
           NOP             1
           LDW     .D2T2   *+SP(20),B4       ; |207| 
           NOP             1
           MVK     .S2     1,B5              ; |206| 

           SPDP    .S2     B6,B7:B6          ; |208| 
||         ZERO    .D1     A0                ; |207| 
||         STW     .D2T2   B5,*+SP(36)       ; |206| 
||         MV      .L2     B6,B8             ; |207| 

           MVKH    .S1     0x40000000,A0     ; |207| 
||         ZERO    .D2     B5                ; |208| 

           MPYSP   .M1X    B4,A0,A3          ; |207| 
||         MVKH    .S2     0x40000000,B5     ; |208| 

           MVKL    .S2     __divd,B9         ; |208| 
           MVKL    .S2     __divd,B10        ; |208| 
           MVK     .S2     1,B0              ; |236| 

           MVK     .S2     1,B12             ; |209| 
||         CMPGTSP .S1X    B8,A3,A1          ; |207| 

   [ A1]   B       .S1     L17               ; |207| 
||         MVKL    .S2     _totalStep,B11    ; |209| 

           MVKH    .S2     __divd,B9         ; |208| 
           MVKH    .S2     __divd,B10        ; |208| 
           MVKH    .S2     _totalStep,B11    ; |209| 

           MV      .L1X    B6,A4             ; |208| 
||         MVKL    .S2     RL26,B3           ; |208| 
||         MV      .D1     A4,A0             ; |203| 
||         MVKL    .S1     _totalStep,A6     ; |236| 

           MV      .L1X    B7,A5             ; |208| 
||         MVKH    .S2     RL26,B3           ; |208| 
||         MVKH    .S1     _totalStep,A6     ; |236| 
||         STW     .D2T1   A0,*+SP(24)       ; |203| 
||         ZERO    .L2     B4                ; |208| 

           ; BRANCH OCCURS                   ; |207| 
;** --------------------------------------------------------------------------*
           B       .S2     B9                ; |208| 
           NOP             5
RL26:      ; CALL OCCURS                     ; |208| 
           MVKL    .S2     RL28,B3           ; |208| 
           B       .S2     B10               ; |208| 
           MVKL    .S2     0x3ffccccc,B5     ; |208| 
           MVKL    .S2     0xcccccccd,B4     ; |208| 
           MVKH    .S2     RL28,B3           ; |208| 
           MVKH    .S2     0x3ffccccc,B5     ; |208| 
           MVKH    .S2     0xcccccccd,B4     ; |208| 
RL28:      ; CALL OCCURS                     ; |208| 
           DPTRUNC .L1     A5:A4,A0          ; |208| 
           STW     .D2T2   B12,*+SP(40)      ; |209| 
           NOP             2
           STW     .D2T1   A0,*+SP(28)       ; |208| 
           LDW     .D2T2   *B11,B5           ; |209| 
           NOP             4
           CMPGT   .L2     B12,B5,B0
   [ B0]   B       .S1     L21               ; |209| 
   [ B0]   MVKL    .S2     _USBposition,B4   ; |268| 

   [ B0]   ZERO    .D2     B5                ; |268| 
|| [ B0]   MVKL    .S1     _USBacc,A0        ; |269| 
|| [ B0]   MVKH    .S2     _USBposition,B4   ; |268| 

   [ B0]   MVKL    .S2     _USBvelPrev,B5    ; |270| 
|| [ B0]   ZERO    .D1     A3                ; |269| 
|| [ B0]   MVKH    .S1     _USBacc,A0        ; |269| 
|| [ B0]   STW     .D2T2   B5,*B4            ; |268| 

   [ B0]   MVKL    .S1     _USBdelayCnt,A0   ; |271| 
|| [ B0]   MVKH    .S2     _USBvelPrev,B5    ; |270| 
|| [ B0]   ZERO    .D2     B4                ; |270| 
|| [ B0]   STW     .D1T1   A3,*A0            ; |269| 

   [ B0]   MVKH    .S1     _USBdelayCnt,A0   ; |271| 
|| [ B0]   STW     .D2T2   B4,*B5            ; |270| 

           ; BRANCH OCCURS                   ; |209| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(28),B4       ; |211| 
           LDW     .D2T2   *+SP(40),B5       ; |211| 
           NOP             3
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L16:    
           MVKL    .S1     _OneStepMove,A0   ; |221| 
           CMPGTU  .L2     B5,B4,B0          ; |211| 
   [ B0]   LDW     .D2T2   *+SP(36),B4       ; |217| 
   [!B0]   LDW     .D2T2   *+SP(36),B5       ; |212| 
           MVKH    .S1     _OneStepMove,A0   ; |221| 
           MVKL    .S2     RL30,B3           ; |221| 
           MVKH    .S2     RL30,B3           ; |221| 
   [ B0]   SUB     .S2     B4,1,B4           ; |217| 
   [ B0]   STW     .D2T2   B4,*+SP(36)       ; |217| 
   [ B0]   LDW     .D2T2   *+SP(36),B5       ; |218| 
   [!B0]   MVKL    .S2     _delayCntArr,B4   ; |212| 
   [!B0]   MVKH    .S2     _delayCntArr,B4   ; |212| 

   [!B0]   LDW     .D2T2   *+B4[B5],B6       ; |212| 
|| [ B0]   MVKL    .S2     _delayCntArr,B4   ; |218| 

   [ B0]   MVKH    .S2     _delayCntArr,B4   ; |218| 
   [ B0]   LDW     .D2T2   *+B4[B5],B4       ; |218| 
   [!B0]   LDW     .D2T2   *+SP(36),B4       ; |213| 
           LDW     .D2T2   *+SP(16),B5       ; |221| 
   [!B0]   STW     .D2T2   B6,*+SP(32)       ; |212| 
           NOP             1

           B       .S2X    A0                ; |221| 
|| [ B0]   STW     .D2T2   B4,*+SP(32)       ; |218| 

           LDW     .D2T2   *+SP(32),B4       ; |221| 
|| [!B0]   ADD     .S2     1,B4,B6           ; |213| 

           MV      .S1X    B5,A4             ; |221| 
   [!B0]   STW     .D2T2   B6,*+SP(36)       ; |213| 
           NOP             2
RL30:      ; CALL OCCURS                     ; |221| 
           LDW     .D2T2   *+SP(16),B0       ; |224| 
           MVKL    .S1     0x47c35000,A3     ; |226| 
           MVKH    .S1     0x47c35000,A3     ; |226| 
           MVKL    .S2     RL34,B3           ; |226| 
           MVKH    .S2     RL34,B3           ; |226| 
   [!B0]   LDW     .D2T2   *+SP(40),B4       ; |224| 
   [ B0]   LDW     .D2T2   *+SP(40),B4       ; |225| 
   [!B0]   MVKL    .S1     _USBposition,A0   ; |224| 
           NOP             2
   [!B0]   INTSP   .L2     B4,B5             ; |224| 

   [ B0]   INTSP   .L2     B4,B5             ; |225| 
|| [!B0]   MVKL    .S2     0x3fe66666,B4     ; |224| 

   [!B0]   MVKH    .S2     0x3fe66666,B4     ; |224| 
   [ B0]   MVKL    .S2     0xbfe66666,B4     ; |225| 

   [!B0]   MPYSP   .M2     B5,B4,B4          ; |224| 
|| [ B0]   MVKH    .S2     0xbfe66666,B4     ; |225| 

   [ B0]   MPYSP   .M2     B5,B4,B4          ; |225| 
   [!B0]   MVKH    .S1     _USBposition,A0   ; |224| 
   [ B0]   MVKL    .S1     _USBposition,A0   ; |225| 

   [!B0]   STW     .D1T2   B4,*A0            ; |224| 
|| [ B0]   MVKH    .S1     _USBposition,A0   ; |225| 

   [ B0]   STW     .D1T2   B4,*A0            ; |225| 
           LDW     .D2T2   *+SP(32),B4       ; |226| 
           MVKL    .S1     __divf,A0         ; |226| 
           MVKH    .S1     __divf,A0         ; |226| 
           NOP             2

           INTSPU  .L2     B4,B4             ; |226| 
||         B       .S2X    A0                ; |226| 

           NOP             3
           MV      .L1X    B4,A4             ; |226| 
           MV      .L2X    A3,B4             ; |226| 
RL34:      ; CALL OCCURS                     ; |226| 
           MVKL    .S2     __divf,B5         ; |226| 
           MVKH    .S2     __divf,B5         ; |226| 
           B       .S2     B5                ; |226| 
           MVKL    .S2     0x3fe66666,B6     ; |226| 
           MVKH    .S2     0x3fe66666,B6     ; |226| 
           MVKL    .S2     RL36,B3           ; |226| 
           MV      .L2X    A4,B4             ; |226| 

           MVKH    .S2     RL36,B3           ; |226| 
||         MV      .S1X    B6,A4             ; |226| 

RL36:      ; CALL OCCURS                     ; |226| 
           MVKL    .S2     _USBvelocity,B4   ; |226| 
           MVKH    .S2     _USBvelocity,B4   ; |226| 
           STW     .D2T1   A4,*B4            ; |226| 
           LDW     .D2T2   *+SP(32),B4       ; |227| 
           MVKL    .S1     __divf,A0         ; |227| 
           MVKH    .S1     __divf,A0         ; |227| 
           MVKL    .S2     RL40,B3           ; |227| 
           B       .S2X    A0                ; |227| 
           INTSPU  .L2     B4,B5             ; |227| 
           MVKH    .S2     RL40,B3           ; |227| 
           MVKL    .S2     0x47c35000,B4     ; |227| 
           MVKH    .S2     0x47c35000,B4     ; |227| 
           MV      .S1X    B5,A4             ; |227| 
RL40:      ; CALL OCCURS                     ; |227| 
           MVKL    .S1     _USBvelocity,A0   ; |227| 
           MVKL    .S1     _USBvelPrev,A3    ; |227| 
           MVKH    .S1     _USBvelPrev,A3    ; |227| 

           MVKH    .S1     _USBvelocity,A0   ; |227| 
||         LDW     .D1T1   *A3,A3            ; |227| 

           LDW     .D1T1   *A0,A0            ; |227| 
           MVKL    .S2     RL42,B3           ; |227| 
           MVKH    .S2     RL42,B3           ; |227| 
           MV      .L2X    A4,B4
           NOP             1

           MVKL    .S1     __divf,A3         ; |227| 
||         SUBSP   .L1     A0,A3,A0          ; |227| 

           MVKH    .S1     __divf,A3         ; |227| 
           B       .S2X    A3                ; |227| 
           NOP             4
           MV      .D1     A0,A4             ; |227| 
RL42:      ; CALL OCCURS                     ; |227| 
           MVKL    .S1     _USBacc,A0        ; |227| 
           MVKH    .S1     _USBacc,A0        ; |227| 
           MVKL    .S1     _USBvelocity,A3   ; |228| 

           STW     .D1T1   A4,*A0            ; |227| 
||         MVKH    .S1     _USBvelocity,A3   ; |228| 

           LDW     .D1T1   *A3,A0            ; |228| 
           MVKL    .S2     _USBvelPrev,B4    ; |228| 
           MVKH    .S2     _USBvelPrev,B4    ; |228| 
           NOP             2
           STW     .D2T1   A0,*B4            ; |228| 
           LDW     .D2T2   *+SP(32),B4       ; |229| 
           MVKL    .S1     _USBdelayCnt,A0   ; |229| 
           MVKH    .S1     _USBdelayCnt,A0   ; |229| 
           NOP             2
           STW     .D1T2   B4,*A0            ; |229| 
           LDW     .D2T2   *+SP(40),B4       ; |233| 
           NOP             4

           MVKL    .S2     _totalStep,B4     ; |233| 
||         ADD     .D2     1,B4,B5           ; |233| 

           STW     .D2T2   B5,*+SP(40)       ; |233| 
||         MVKH    .S2     _totalStep,B4     ; |233| 

           LDW     .D2T2   *B4,B4            ; |233| 
           NOP             4
           CMPGT   .L2     B5,B4,B0          ; |233| 
   [!B0]   B       .S1     L16               ; |233| 
   [!B0]   LDW     .D2T2   *+SP(28),B4       ; |211| 
   [!B0]   LDW     .D2T2   *+SP(40),B5       ; |211| 
           NOP             3
           ; BRANCH OCCURS                   ; |233| 
;** --------------------------------------------------------------------------*
           B       .S1     L21               ; |234| 
           MVKL    .S2     _USBposition,B4   ; |268| 

           MVKH    .S2     _USBposition,B4   ; |268| 
||         MVKL    .S1     _USBacc,A0        ; |269| 
||         ZERO    .D2     B5                ; |268| 

           MVKL    .S2     _USBvelPrev,B5    ; |270| 
||         STW     .D2T2   B5,*B4            ; |268| 
||         MVKH    .S1     _USBacc,A0        ; |269| 
||         ZERO    .D1     A3                ; |269| 

           MVKL    .S1     _USBdelayCnt,A0   ; |271| 
||         STW     .D1T1   A3,*A0            ; |269| 
||         ZERO    .D2     B4                ; |270| 
||         MVKH    .S2     _USBvelPrev,B5    ; |270| 

           STW     .D2T2   B4,*B5            ; |270| 
||         MVKH    .S1     _USBdelayCnt,A0   ; |271| 

           ; BRANCH OCCURS                   ; |234| 
;** --------------------------------------------------------------------------*
L17:    
           STW     .D2T2   B0,*+SP(40)       ; |236| 
           LDW     .D1T1   *A6,A0            ; |236| 
           NOP             4
           CMPGT   .L1X    B0,A0,A1
   [ A1]   B       .S1     L21               ; |236| 
   [ A1]   MVKL    .S2     _USBposition,B4   ; |268| 

   [ A1]   ZERO    .D2     B5                ; |268| 
|| [ A1]   MVKL    .S1     _USBacc,A0        ; |269| 
|| [ A1]   MVKH    .S2     _USBposition,B4   ; |268| 

   [ A1]   MVKL    .S2     _USBvelPrev,B5    ; |270| 
|| [ A1]   ZERO    .D1     A3                ; |269| 
|| [ A1]   MVKH    .S1     _USBacc,A0        ; |269| 
|| [ A1]   STW     .D2T2   B5,*B4            ; |268| 

   [ A1]   MVKL    .S1     _USBdelayCnt,A0   ; |271| 
|| [ A1]   MVKH    .S2     _USBvelPrev,B5    ; |270| 
|| [ A1]   ZERO    .D2     B4                ; |270| 
|| [ A1]   STW     .D1T1   A3,*A0            ; |269| 

   [ A1]   MVKH    .S1     _USBdelayCnt,A0   ; |271| 
|| [ A1]   STW     .D2T2   B4,*B5            ; |270| 

           ; BRANCH OCCURS                   ; |236| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(24),B4       ; |238| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L18:    
           LDW     .D2T2   *+SP(40),B5       ; |238| 
           NOP             4
           CMPGTU  .L2     B5,B4,B0          ; |238| 
   [!B0]   LDW     .D2T2   *+SP(36),B6       ; |239| 
   [!B0]   MVKL    .S2     _delayCntArr,B4   ; |239| 
   [!B0]   LDW     .D2T2   *+SP(36),B5       ; |240| 
   [!B0]   MVKH    .S2     _delayCntArr,B4   ; |239| 
   [!B0]   MVKL    .S1     _OneStepMove,A0   ; |254| 

   [!B0]   B       .S1     L20               ; |241| 
|| [!B0]   LDW     .D2T2   *+B4[B6],B4       ; |239| 

           NOP             2
   [!B0]   ADD     .D2     1,B5,B5           ; |240| 
   [!B0]   STW     .D2T2   B5,*+SP(36)       ; |240| 
   [!B0]   STW     .D2T2   B4,*+SP(32)       ; |239| 
           ; BRANCH OCCURS                   ; |241| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(24),B4       ; |243| 
           LDW     .D2T2   *+SP(40),B5       ; |243| 
           NOP             4
           CMPGTU  .L2     B5,B4,B0          ; |243| 
   [ B0]   MVKL    .S1     _totalStep,A0     ; |243| 
   [ B0]   MVKH    .S1     _totalStep,A0     ; |243| 

   [ B0]   LDW     .D2T2   *+SP(24),B5       ; |243| 
|| [ B0]   LDW     .D1T1   *A0,A0            ; |243| 

   [ B0]   LDW     .D2T2   *+SP(40),B4       ; |243| 
   [!B0]   MV      .L1X    B0,A1             ; |243| 
           NOP             2
   [ B0]   SUB     .L1X    A0,B5,A0          ; |243| 
   [ B0]   CMPGTU  .L1X    B4,A0,A0          ; |243| 
   [ B0]   XOR     .S1     1,A0,A1           ; |243| 
   [ A1]   LDW     .D2T2   *+SP(24),B4       ; |244| 
   [!A1]   MVKL    .S1     _totalStep,A0     ; |249| 
           NOP             3
   [ A1]   STW     .D2T2   B4,*+SP(36)       ; |244| 
   [ A1]   LDW     .D2T2   *+SP(36),B5       ; |245| 
   [ A1]   MVKL    .S2     _delayCntArr,B4   ; |245| 
   [ A1]   MVKH    .S2     _delayCntArr,B4   ; |245| 
           NOP             2

   [ A1]   B       .S1     L19               ; |246| 
|| [ A1]   LDW     .D2T2   *+B4[B5],B4       ; |245| 

           NOP             4
   [ A1]   STW     .D2T2   B4,*+SP(32)       ; |245| 
           ; BRANCH OCCURS                   ; |246| 
;** --------------------------------------------------------------------------*
           MVKH    .S1     _totalStep,A0     ; |249| 

           LDW     .D1T1   *A0,A0            ; |249| 
||         LDW     .D2T2   *+SP(24),B5       ; |249| 

           LDW     .D2T2   *+SP(40),B4       ; |249| 
           NOP             3
           SUB     .L1X    A0,B5,A0          ; |249| 
           CMPGTU  .L1X    B4,A0,A1          ; |249| 
   [ A1]   MVKL    .S1     _totalStep,A0     ; |249| 
   [ A1]   MVKH    .S1     _totalStep,A0     ; |249| 

   [ A1]   LDW     .D2T2   *+SP(40),B4       ; |249| 
|| [ A1]   LDW     .D1T1   *A0,A0            ; |249| 

           NOP             4
   [ A1]   CMPGT   .L1X    B4,A0,A0          ; |249| 
   [ A1]   XOR     .S1     1,A0,A1           ; |249| 
   [ A1]   LDW     .D2T2   *+SP(36),B6       ; |250| 
   [ A1]   MVKL    .S2     _delayCntArr,B4   ; |250| 
   [ A1]   LDW     .D2T2   *+SP(36),B5       ; |251| 
   [ A1]   MVKH    .S2     _delayCntArr,B4   ; |250| 
           NOP             1
   [ A1]   LDW     .D2T2   *+B4[B6],B4       ; |250| 
           NOP             4

   [ A1]   STW     .D2T2   B4,*+SP(32)       ; |250| 
|| [ A1]   SUB     .S2     B5,1,B5           ; |251| 

   [ A1]   STW     .D2T2   B5,*+SP(36)       ; |251| 
;** --------------------------------------------------------------------------*
L19:    
           MVKL    .S1     _OneStepMove,A0   ; |254| 
;** --------------------------------------------------------------------------*
L20:    
           MVKH    .S1     _OneStepMove,A0   ; |254| 

           B       .S2X    A0                ; |254| 
||         LDW     .D2T2   *+SP(16),B5       ; |254| 

           LDW     .D2T2   *+SP(32),B4       ; |254| 
           MVKL    .S2     RL44,B3           ; |254| 
           MVKH    .S2     RL44,B3           ; |254| 
           NOP             1
           MV      .S1X    B5,A4             ; |254| 
RL44:      ; CALL OCCURS                     ; |254| 
           LDW     .D2T2   *+SP(16),B0       ; |257| 
           MVKL    .S1     0x47c35000,A3     ; |259| 
           MVKH    .S1     0x47c35000,A3     ; |259| 
           MVKL    .S2     RL48,B3           ; |259| 
           MVKH    .S2     RL48,B3           ; |259| 
   [!B0]   LDW     .D2T2   *+SP(40),B4       ; |257| 
   [ B0]   LDW     .D2T2   *+SP(40),B4       ; |258| 
   [!B0]   MVKL    .S1     _USBposition,A0   ; |257| 
           NOP             2
   [!B0]   INTSP   .L2     B4,B5             ; |257| 

   [ B0]   INTSP   .L2     B4,B5             ; |258| 
|| [!B0]   MVKL    .S2     0x3fe66666,B4     ; |257| 

   [ B0]   MVKL    .S2     0xbfe66666,B4     ; |258| 
   [!B0]   MVKH    .S2     0x3fe66666,B4     ; |257| 

   [ B0]   MVKH    .S2     0xbfe66666,B4     ; |258| 
|| [!B0]   MPYSP   .M2     B5,B4,B4          ; |257| 

   [ B0]   MPYSP   .M2     B5,B4,B4          ; |258| 
   [ B0]   MVKL    .S1     _USBposition,A0   ; |258| 
   [!B0]   MVKH    .S1     _USBposition,A0   ; |257| 

   [ B0]   MVKH    .S1     _USBposition,A0   ; |258| 
|| [!B0]   STW     .D1T2   B4,*A0            ; |257| 

   [ B0]   STW     .D1T2   B4,*A0            ; |258| 
           LDW     .D2T2   *+SP(32),B4       ; |259| 
           MVKL    .S1     __divf,A0         ; |259| 
           MVKH    .S1     __divf,A0         ; |259| 
           NOP             1
           B       .S2X    A0                ; |259| 
           INTSPU  .L2     B4,B5             ; |259| 
           MV      .L2X    A3,B4             ; |259| 
           NOP             2
           MV      .S1X    B5,A4             ; |259| 
RL48:      ; CALL OCCURS                     ; |259| 
           MVKL    .S2     __divf,B5         ; |259| 
           MVKH    .S2     __divf,B5         ; |259| 
           B       .S2     B5                ; |259| 
           MVKL    .S2     0x3fe66666,B6     ; |259| 
           MVKH    .S2     0x3fe66666,B6     ; |259| 
           MVKL    .S2     RL50,B3           ; |259| 
           MVKH    .S2     RL50,B3           ; |259| 

           MV      .L2X    A4,B4             ; |259| 
||         MV      .S1X    B6,A4             ; |259| 

RL50:      ; CALL OCCURS                     ; |259| 
           MVKL    .S2     _USBvelocity,B4   ; |259| 
           MVKH    .S2     _USBvelocity,B4   ; |259| 
           STW     .D2T1   A4,*B4            ; |259| 
           LDW     .D2T2   *+SP(32),B4       ; |260| 
           MVKL    .S1     __divf,A0         ; |260| 
           MVKH    .S1     __divf,A0         ; |260| 
           MVKL    .S2     RL54,B3           ; |260| 
           B       .S2X    A0                ; |260| 
           INTSPU  .L2     B4,B5             ; |260| 
           MVKL    .S2     0x47c35000,B4     ; |260| 
           MVKH    .S2     0x47c35000,B4     ; |260| 
           MVKH    .S2     RL54,B3           ; |260| 
           MV      .S1X    B5,A4             ; |260| 
RL54:      ; CALL OCCURS                     ; |260| 
           MVKL    .S1     _USBvelPrev,A3    ; |260| 
           MVKL    .S1     _USBvelocity,A0   ; |260| 
           MVKH    .S1     _USBvelocity,A0   ; |260| 

           LDW     .D1T1   *A0,A0            ; |260| 
||         MVKH    .S1     _USBvelPrev,A3    ; |260| 

           LDW     .D1T1   *A3,A3            ; |260| 
           MVKL    .S2     __divf,B5         ; |260| 
           MVKH    .S2     __divf,B5         ; |260| 
           MVKL    .S2     RL56,B3           ; |260| 
           B       .S2     B5                ; |260| 
           SUBSP   .L1     A0,A3,A0          ; |260| 
           MV      .L2X    A4,B4             ; |260| 
           MVKH    .S2     RL56,B3           ; |260| 
           NOP             1
           MV      .D1     A0,A4             ; |260| 
RL56:      ; CALL OCCURS                     ; |260| 
           MVKL    .S1     _USBacc,A0        ; |260| 

           MVKL    .S2     _USBvelocity,B4   ; |261| 
||         MVKH    .S1     _USBacc,A0        ; |260| 

           MVKH    .S2     _USBvelocity,B4   ; |261| 
||         STW     .D1T1   A4,*A0            ; |260| 

           LDW     .D2T1   *B4,A0            ; |261| 
           MVKL    .S1     _USBvelPrev,A3    ; |261| 
           MVKH    .S1     _USBvelPrev,A3    ; |261| 
           MVKL    .S2     _totalStep,B5     ; |266| 
           MVKH    .S2     _totalStep,B5     ; |266| 
           STW     .D1T1   A0,*A3            ; |261| 
           LDW     .D2T2   *+SP(32),B4       ; |262| 
           MVKL    .S1     _USBdelayCnt,A0   ; |262| 
           MVKH    .S1     _USBdelayCnt,A0   ; |262| 
           NOP             2
           STW     .D1T2   B4,*A0            ; |262| 
           LDW     .D2T2   *+SP(40),B4       ; |266| 
           NOP             4
           ADD     .D2     1,B4,B4           ; |266| 
           STW     .D2T2   B4,*+SP(40)       ; |266| 
           LDW     .D2T2   *B5,B4            ; |266| 
           LDW     .D2T2   *+SP(40),B5       ; |266| 
           NOP             4
           CMPGT   .L2     B5,B4,B0          ; |266| 
   [!B0]   B       .S1     L18               ; |266| 
   [!B0]   LDW     .D2T2   *+SP(24),B4       ; |238| 
           NOP             4
           ; BRANCH OCCURS                   ; |266| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _USBposition,B4   ; |268| 

           MVKH    .S2     _USBposition,B4   ; |268| 
||         MVKL    .S1     _USBacc,A0        ; |269| 
||         ZERO    .D2     B5                ; |268| 

           MVKL    .S2     _USBvelPrev,B5    ; |270| 
||         STW     .D2T2   B5,*B4            ; |268| 
||         MVKH    .S1     _USBacc,A0        ; |269| 
||         ZERO    .D1     A3                ; |269| 

           MVKL    .S1     _USBdelayCnt,A0   ; |271| 
||         STW     .D1T1   A3,*A0            ; |269| 
||         ZERO    .D2     B4                ; |270| 
||         MVKH    .S2     _USBvelPrev,B5    ; |270| 

           STW     .D2T2   B4,*B5            ; |270| 
||         MVKH    .S1     _USBdelayCnt,A0   ; |271| 

;** --------------------------------------------------------------------------*
L21:    
           STW     .D1T1   A3,*A0            ; |271| 
           LDW     .D2T2   *+SP(44),B3       ; |273| 
           LDW     .D2T2   *+SP(48),B10      ; |273| 
           LDW     .D2T2   *+SP(52),B11      ; |273| 
           LDW     .D2T2   *++SP(56),B12     ; |273| 
           NOP             1
           B       .S2     B3                ; |273| 
           NOP             5
           ; BRANCH OCCURS                   ; |273| 


	.sect	".text"
	.global	_main

;******************************************************************************
;* FUNCTION NAME: _main                                                       *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 16 Args + 12 Auto + 4 Save = 32 byte                 *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _InitEXINTF,A0    ; |282| 
           MVKH    .S1     _InitEXINTF,A0    ; |282| 
           B       .S2X    A0                ; |282| 
           STW     .D2T2   B3,*SP--(32)      ; |277| 
           MVKL    .S2     RL58,B3           ; |282| 
           MVKH    .S2     RL58,B3           ; |282| 
           NOP             2
RL58:      ; CALL OCCURS                     ; |282| 
           MVKL    .S1     _InitTimer,A0     ; |283| 
           MVKH    .S1     _InitTimer,A0     ; |283| 
           B       .S2X    A0                ; |283| 
           MVKL    .S2     RL60,B3           ; |283| 
           MVKH    .S2     RL60,B3           ; |283| 
           NOP             3
RL60:      ; CALL OCCURS                     ; |283| 
           MVKL    .S2     _InitUART,B4      ; |284| 
           MVKH    .S2     _InitUART,B4      ; |284| 
           B       .S2     B4                ; |284| 
           MVKL    .S2     RL62,B3           ; |284| 
           MVKH    .S2     RL62,B3           ; |284| 
           NOP             3
RL62:      ; CALL OCCURS                     ; |284| 
           MVKL    .S1     _InitINT,A0       ; |285| 
           MVKH    .S1     _InitINT,A0       ; |285| 
           B       .S2X    A0                ; |285| 
           MVKL    .S2     RL64,B3           ; |285| 
           MVKH    .S2     RL64,B3           ; |285| 
           NOP             3
RL64:      ; CALL OCCURS                     ; |285| 
           MVKL    .S1     _InitUSBMon,A0    ; |286| 
           MVKH    .S1     _InitUSBMon,A0    ; |286| 
           B       .S2X    A0                ; |286| 
           MVKL    .S2     RL66,B3           ; |286| 
           MVKH    .S2     RL66,B3           ; |286| 
           NOP             3
RL66:      ; CALL OCCURS                     ; |286| 
           MVKL    .S1     _sprintf,A0       ; |288| 

           MVKH    .S1     _sprintf,A0       ; |288| 
||         MVKL    .S2     _tmp_string,B5    ; |288| 

           B       .S2X    A0                ; |288| 
           MVKL    .S2     RL68,B3           ; |288| 
           MVKH    .S2     _tmp_string,B5    ; |288| 
           MVKL    .S2     SL1+0,B4          ; |288| 
           MVKH    .S2     SL1+0,B4          ; |288| 

           MVKH    .S2     RL68,B3           ; |288| 
||         MV      .S1X    B5,A4             ; |288| 
||         STW     .D2T2   B4,*+SP(4)        ; |288| 

RL68:      ; CALL OCCURS                     ; |288| 
           MVKL    .S1     _Report,A0        ; |288| 
           MVKH    .S1     _Report,A0        ; |288| 
           B       .S2X    A0                ; |288| 
           MVKL    .S2     RL70,B3           ; |288| 
           MVKH    .S2     RL70,B3           ; |288| 
           NOP             3
RL70:      ; CALL OCCURS                     ; |288| 
           MVK     .S1     2024,A0           ; |289| 

           MVKL    .S1     _sprintf,A0       ; |289| 
||         STW     .D2T1   A0,*+SP(8)        ; |289| 

           MVKH    .S1     _sprintf,A0       ; |289| 
||         MVKL    .S2     SL2+0,B4          ; |289| 

           B       .S2X    A0                ; |289| 
           MVKH    .S2     SL2+0,B4          ; |289| 
           MVKL    .S2     _tmp_string,B5    ; |289| 
           MVKH    .S2     _tmp_string,B5    ; |289| 
           MVKL    .S2     RL72,B3           ; |289| 

           STW     .D2T2   B4,*+SP(4)        ; |289| 
||         MVKH    .S2     RL72,B3           ; |289| 
||         MV      .S1X    B5,A4             ; |289| 

RL72:      ; CALL OCCURS                     ; |289| 
           MVKL    .S1     _Report,A0        ; |289| 
           MVKH    .S1     _Report,A0        ; |289| 
           B       .S2X    A0                ; |289| 
           MVKL    .S2     RL74,B3           ; |289| 
           MVKH    .S2     RL74,B3           ; |289| 
           NOP             3
RL74:      ; CALL OCCURS                     ; |289| 
           MVKL    .S2     SL3+0,B4          ; |290| 
           MVKL    .S2     0x20003fc,B5      ; |290| 
           MVKH    .S2     SL3+0,B4          ; |290| 

           MVKH    .S2     0x20003fc,B5      ; |290| 
||         STW     .D2T2   B4,*+SP(4)        ; |290| 

           LDW     .D2T2   *B5,B4            ; |290| 
           MVKL    .S1     0x20003fc,A0      ; |290| 
           MVKH    .S1     0x20003fc,A0      ; |290| 
           MVKL    .S1     _tmp_string,A4    ; |290| 
           MVKL    .S2     RL76,B3           ; |290| 
           EXTU    .S2     B4,16,24,B4       ; |290| 
           STW     .D2T2   B4,*+SP(8)        ; |290| 

           MVKL    .S1     _sprintf,A0       ; |290| 
||         LDW     .D1T1   *A0,A3            ; |290| 

           MVKH    .S1     _sprintf,A0       ; |290| 
           B       .S2X    A0                ; |290| 
           MVKH    .S2     RL76,B3           ; |290| 
           MVKH    .S1     _tmp_string,A4    ; |290| 
           NOP             1
           EXTU    .S1     A3,24,24,A3       ; |290| 
           STW     .D2T1   A3,*+SP(12)       ; |290| 
RL76:      ; CALL OCCURS                     ; |290| 
           MVKL    .S1     _Report,A0        ; |290| 
           MVKH    .S1     _Report,A0        ; |290| 
           B       .S2X    A0                ; |290| 
           MVKL    .S2     RL78,B3           ; |290| 
           MVKH    .S2     RL78,B3           ; |290| 
           NOP             3
RL78:      ; CALL OCCURS                     ; |290| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _GIE,B4           ; |293| 
           MVKH    .S2     _GIE,B4           ; |293| 
           B       .S2     B4                ; |293| 
           MVKL    .S2     RL80,B3           ; |293| 
           ZERO    .D2     B5                ; |292| 
           MVKL    .S1     _TFlag,A0         ; |292| 
           MVKH    .S1     _TFlag,A0         ; |292| 

           STW     .D1T2   B5,*A0            ; |292| 
||         MVKH    .S2     RL80,B3           ; |293| 

RL80:      ; CALL OCCURS                     ; |293| 
           MVKL    .S1     _WaitTFlagCnt,A5  ; |301| 
           MVKL    .S1     _currPhaseIdx,A3  ; |297| 
           MVKL    .S1     _currDIR,A4       ; |298| 
           MVKH    .S1     _WaitTFlagCnt,A5  ; |301| 
           MVKL    .S1     _prevDIR,A6       ; |299| 

           B       .S2X    A5                ; |301| 
||         MVKL    .S1     0x200004c,A0      ; |295| 

           MVK     .S2     1,B4              ; |295| 
||         MVKH    .S1     0x200004c,A0      ; |295| 

           STW     .D1T2   B4,*A0            ; |295| 
||         MVKH    .S1     _currPhaseIdx,A3  ; |297| 

           ZERO    .D2     B4                ; |298| 
||         STW     .D1T2   B4,*A3            ; |297| 
||         MVKH    .S1     _currDIR,A4       ; |298| 

           STW     .D1T2   B4,*A4            ; |298| 
||         ZERO    .L1     A0                ; |299| 
||         MVKL    .S2     RL82,B3           ; |301| 
||         MVKH    .S1     _prevDIR,A6       ; |299| 

           STW     .D1T1   A0,*A6            ; |299| 
||         MVK     .S1     0x2710,A4         ; |301| 
||         MVKH    .S2     RL82,B3           ; |301| 

RL82:      ; CALL OCCURS                     ; |301| 
           MVK     .S2     2450,B6           ; |305| 

           MVK     .S2     360,B4            ; |305| 
||         MVK     .S1     1,A5              ; |307| 

           MVKL    .S2     0x33450,B4        ; |305| 
||         STW     .D2T2   B4,*+SP(20)       ; |305| 
||         CMPGT   .L1X    B4,0,A1
||         MVKL    .S1     _currPhaseIdx,A3  ; |306| 

           MVKH    .S2     0x33450,B4        ; |305| 
||         STW     .D2T2   B6,*+SP(24)       ; |305| 
||         MVKL    .S1     _currPhaseIdx,A0  ; |307| 

           STW     .D2T2   B4,*+SP(28)       ; |305| 
||         MVKH    .S1     _currPhaseIdx,A0  ; |307| 

   [!A1]   STW     .D1T1   A5,*A0            ; |307| 
||         ZERO    .L1     A4                ; |306| 
||         MVKH    .S1     _currPhaseIdx,A3  ; |306| 

   [ A1]   STW     .D1T1   A4,*A3            ; |306| 
           LDW     .D2T2   *+SP(24),B8       ; |309| 
           LDW     .D2T2   *+SP(28),B4       ; |309| 
           LDW     .D2T2   *+SP(20),B6       ; |309| 
           MVKL    .S2     _StepMoveVP,B5    ; |309| 
           MVKH    .S2     _StepMoveVP,B5    ; |309| 
           B       .S2     B5                ; |309| 
           INTSP   .L2     B4,B7             ; |309| 

           INTSP   .L1X    B6,A4             ; |309| 
||         INTSP   .L2     B8,B4             ; |309| 

           MVKL    .S2     RL84,B3           ; |309| 
           MVKH    .S2     RL84,B3           ; |309| 
           MV      .S1X    B7,A6             ; |309| 
RL84:      ; CALL OCCURS                     ; |309| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L22:    
           B       .S1     L22               ; |311| 
           NOP             5
           ; BRANCH OCCURS                   ; |311| 


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
	.global	__divd
	.global	__divf
