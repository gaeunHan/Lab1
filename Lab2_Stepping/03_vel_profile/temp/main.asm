;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Sat Apr 20 13:05:44 2024                                *
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

	.sect	".const"
	.align 4
_$T0$1:
	.field  	2,32			; _$T0$1[0] @ 0
	.field  	8,32			; _$T0$1[1] @ 32
	.field  	1,32			; _$T0$1[2] @ 64
	.field  	4,32			; _$T0$1[3] @ 96
	.sect	".text"
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI3992_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI3992_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
;*                           B7,B8,B9,B10,B11,SP                              *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,B10,B11,SP                              *
;*   Local Frame Size  : 16 Args + 44 Auto + 12 Save = 72 byte                *
;******************************************************************************
_StepMoveVP:
;** --------------------------------------------------------------------------*
           MVKL    .S1     __divf,A3         ; |190| 

           MVKH    .S1     __divf,A3         ; |190| 
||         STW     .D2T2   B11,*SP--(72)     ; |180| 

           MVKL    .S1     0x3fe66666,A4     ; |190| 
||         STW     .D2T1   A4,*+SP(20)       ; |180| 

           B       .S2X    A3                ; |190| 
||         MVKH    .S1     0x3fe66666,A4     ; |190| 

           LDW     .D2T1   *+SP(20),A4
||         MV      .S2X    A4,B4             ; |190| 
||         MV      .S1X    B4,A0             ; |180| 

           STW     .D2T2   B3,*+SP(64)       ; |180| 
           STW     .D2T2   B10,*+SP(68)      ; |180| 

           STW     .D2T1   A6,*+SP(28)       ; |180| 
||         MVKL    .S2     RL18,B3           ; |190| 

           MVKH    .S2     RL18,B3           ; |190| 
||         STW     .D2T1   A0,*+SP(24)       ; |180| 

RL18:      ; CALL OCCURS                     ; |190| 
           LDW     .D2T2   *+SP(24),B7       ; |194| 
           LDW     .D2T2   *+SP(28),B4       ; |194| 
           NOP             4

           SPDP    .S2     B4,B7:B6          ; |194| 
||         MPYSP   .M2     B7,B7,B8

           ZERO    .D2     B5                ; |194| 

           ZERO    .D2     B4                ; |194| 
||         MVKH    .S2     0x40000000,B5     ; |194| 

           MPYDP   .M2     B7:B6,B5:B4,B5:B4 ; |194| 
           NOP             2

           LDW     .D2T2   *+SP(20),B7       ; |191| 
||         MVKL    .S2     __divd,B6         ; |194| 

           MVKH    .S2     __divd,B6         ; |194| 

           B       .S2     B6                ; |194| 
||         SPTRUNC .L1     A4,A0             ; |190| 

           SPDP    .S2     B8,B9:B8          ; |194| 
           ZERO    .D1     A3                ; |191| 

           ZERO    .D2     B7                ; |191| 
||         CMPGTSP .S1X    B7,A3,A1          ; |191| 
||         MVKL    .S2     RL20,B3           ; |194| 

   [!A1]   MVK     .S2     0x1,B7            ; |191| 
||         MV      .S1X    B9,A5             ; |194| 
||         STW     .D2T1   A0,*+SP(48)       ; |190| 

           STW     .D2T2   B7,*+SP(32)       ; |191| 
||         MV      .S1X    B8,A4             ; |194| 
||         MVKH    .S2     RL20,B3           ; |194| 

RL20:      ; CALL OCCURS                     ; |194| 
           MVKL    .S1     _MakeVelProfile,A0 ; |195| 
           MVKH    .S1     _MakeVelProfile,A0 ; |195| 

           B       .S2X    A0                ; |195| 
||         LDW     .D2T2   *+SP(28),B4       ; |195| 

           LDW     .D2T1   *+SP(24),A4       ; |195| 
||         DPSP    .L1     A5:A4,A3          ; |194| 

           NOP             2
           MVKL    .S2     RL22,B3           ; |195| 

           MVKH    .S2     RL22,B3           ; |195| 
||         STW     .D2T1   A3,*+SP(36)       ; |194| 

RL22:      ; CALL OCCURS                     ; |195| 
           LDW     .D2T2   *+SP(20),B4       ; |200| 
           LDW     .D2T2   *+SP(36),B5       ; |199| 
           NOP             2
           ZERO    .D1     A3                ; |199| 

           SPDP    .S2     B4,B7:B6          ; |200| 
||         MVKH    .S1     0x40000000,A3     ; |199| 

           MPYSP   .M1X    B5,A3,A3          ; |199| 
           MVKL    .S2     __divd,B10        ; |200| 
           MVKL    .S2     __divd,B9         ; |200| 
           MVK     .S2     1,B8              ; |198| 

           MVK     .S2     1,B0              ; |218| 
||         CMPGTSP .S1X    B4,A3,A1          ; |199| 
||         MV      .D1     A4,A0             ; |195| 

   [ A1]   B       .S1     L17               ; |199| 
||         MVKL    .S2     RL26,B3           ; |200| 
||         MV      .L1X    B6,A4             ; |200| 

           MVK     .S2     1,B11             ; |201| 
||         LDW     .D2T2   *+SP(48),B6       ; |218| 

           MVKH    .S2     __divd,B10        ; |200| 
           MVKH    .S2     __divd,B9         ; |200| 

           MVKH    .S2     RL26,B3           ; |200| 
||         ZERO    .L2     B5                ; |200| 
||         STW     .D2T1   A0,*+SP(40)       ; |195| 

           MVKH    .S2     0x40000000,B5     ; |200| 
||         ZERO    .L2     B4                ; |200| 
||         MV      .S1X    B7,A5             ; |200| 
||         STW     .D2T2   B8,*+SP(56)       ; |198| 

           ; BRANCH OCCURS                   ; |199| 
;** --------------------------------------------------------------------------*
           B       .S2     B9                ; |200| 
           NOP             5
RL26:      ; CALL OCCURS                     ; |200| 
           MVKL    .S2     RL28,B3           ; |200| 
           B       .S2     B10               ; |200| 
           MVKL    .S2     0x3ffccccc,B5     ; |200| 
           MVKL    .S2     0xcccccccd,B4     ; |200| 
           MVKH    .S2     RL28,B3           ; |200| 
           MVKH    .S2     0x3ffccccc,B5     ; |200| 
           MVKH    .S2     0xcccccccd,B4     ; |200| 
RL28:      ; CALL OCCURS                     ; |200| 
           LDW     .D2T2   *+SP(48),B4       ; |201| 
           STW     .D2T2   B11,*+SP(60)      ; |201| 
           NOP             3
           CMPGT   .L2     B11,B4,B0
   [ B0]   B       .S1     L20               ; |201| 
           DPTRUNC .L1     A5:A4,A0          ; |200| 
           NOP             3
           STW     .D2T1   A0,*+SP(44)       ; |200| 
           ; BRANCH OCCURS                   ; |201| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(44),B4       ; |203| 
           LDW     .D2T2   *+SP(60),B5       ; |203| 
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L16:    
           LDW     .D2T1   *+SP(32),A4
           MVKL    .S1     _OneStepMove,A0   ; |213| 
           CMPGTU  .L2     B5,B4,B0          ; |203| 
   [ B0]   LDW     .D2T2   *+SP(56),B4       ; |209| 
   [!B0]   LDW     .D2T2   *+SP(56),B5       ; |204| 
   [!B0]   LDW     .D2T2   *+SP(56),B6       ; |205| 
           MVKH    .S1     _OneStepMove,A0   ; |213| 
           MVKL    .S2     RL30,B3           ; |213| 
   [ B0]   SUB     .S2     B4,1,B4           ; |209| 
   [ B0]   STW     .D2T2   B4,*+SP(56)       ; |209| 
   [ B0]   LDW     .D2T2   *+SP(56),B5       ; |210| 
   [!B0]   MVKL    .S2     _delayCntArr,B4   ; |204| 
   [!B0]   MVKH    .S2     _delayCntArr,B4   ; |204| 
   [ B0]   MVKL    .S2     _delayCntArr,B4   ; |210| 

   [!B0]   LDW     .D2T2   *+B4[B5],B4       ; |204| 
|| [ B0]   MVKH    .S2     _delayCntArr,B4   ; |210| 

   [ B0]   LDW     .D2T2   *+B4[B5],B4       ; |210| 
   [!B0]   ADD     .D2     1,B6,B6           ; |205| 
   [!B0]   STW     .D2T2   B6,*+SP(56)       ; |205| 
           MVKH    .S2     RL30,B3           ; |213| 
   [!B0]   STW     .D2T2   B4,*+SP(52)       ; |204| 

           B       .S2X    A0                ; |213| 
|| [ B0]   STW     .D2T2   B4,*+SP(52)       ; |210| 

           LDW     .D2T2   *+SP(52),B4       ; |213| 
           NOP             4
RL30:      ; CALL OCCURS                     ; |213| 
           MVKL    .S2     _sprintf,B4       ; |214| 

           MVKH    .S2     _sprintf,B4       ; |214| 
||         LDW     .D2T2   *+SP(60),B6       ; |214| 

           LDW     .D2T2   *+SP(52),B5       ; |214| 
||         B       .S2     B4                ; |214| 

           MVKL    .S1     SL1+0,A0          ; |214| 
           MVKH    .S1     SL1+0,A0          ; |214| 
           STW     .D2T1   A0,*+SP(4)        ; |214| 

           MVKL    .S2     RL32,B3           ; |214| 
||         MVKL    .S1     _tmp_string,A4    ; |214| 
||         STW     .D2T2   B6,*+SP(8)        ; |214| 

           MVKH    .S1     _tmp_string,A4    ; |214| 
||         MVKH    .S2     RL32,B3           ; |214| 
||         STW     .D2T2   B5,*+SP(12)       ; |214| 

RL32:      ; CALL OCCURS                     ; |214| 
           MVKL    .S1     _Report,A0        ; |214| 
           MVKH    .S1     _Report,A0        ; |214| 
           B       .S2X    A0                ; |214| 
           MVKL    .S2     RL34,B3           ; |214| 
           MVKH    .S2     RL34,B3           ; |214| 
           NOP             3
RL34:      ; CALL OCCURS                     ; |214| 
           LDW     .D2T2   *+SP(60),B4       ; |215| 
           LDW     .D2T2   *+SP(48),B5       ; |215| 
           NOP             3
           ADD     .D2     1,B4,B4           ; |215| 
           CMPGT   .L2     B4,B5,B0          ; |215| 
   [!B0]   B       .S1     L16               ; |215| 
           STW     .D2T2   B4,*+SP(60)       ; |215| 
   [!B0]   LDW     .D2T2   *+SP(44),B4       ; |203| 
   [!B0]   LDW     .D2T2   *+SP(60),B5       ; |203| 
           NOP             2
           ; BRANCH OCCURS                   ; |215| 
;** --------------------------------------------------------------------------*
           B       .S1     L21               ; |216| 
           LDW     .D2T2   *+SP(64),B3       ; |240| 
           NOP             4
           ; BRANCH OCCURS                   ; |216| 
;** --------------------------------------------------------------------------*
L17:    

           CMPGT   .L2     B0,B6,B0
||         STW     .D2T2   B0,*+SP(60)       ; |218| 

   [ B0]   B       .S1     L21               ; |218| 
   [ B0]   LDW     .D2T2   *+SP(64),B3       ; |240| 
           NOP             4
           ; BRANCH OCCURS                   ; |218| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(40),B4       ; |220| 
           LDW     .D2T2   *+SP(60),B5       ; |220| 
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L18:    
           NOP             2
           CMPGTU  .L2     B5,B4,B0          ; |220| 
   [!B0]   LDW     .D2T2   *+SP(56),B5       ; |221| 
   [!B0]   MVKL    .S2     _delayCntArr,B4   ; |221| 
   [!B0]   MVKH    .S2     _delayCntArr,B4   ; |221| 
   [!B0]   LDW     .D2T2   *+SP(56),B6       ; |222| 
   [!B0]   MVKL    .S1     _OneStepMove,A0   ; |236| 
   [!B0]   LDW     .D2T2   *+B4[B5],B4       ; |221| 
   [!B0]   B       .S1     L19               ; |223| 
           NOP             3

   [!B0]   ADD     .S2     1,B6,B5           ; |222| 
|| [!B0]   STW     .D2T2   B4,*+SP(52)       ; |221| 

   [!B0]   STW     .D2T2   B5,*+SP(56)       ; |222| 
           ; BRANCH OCCURS                   ; |223| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(40),B4       ; |225| 
           LDW     .D2T2   *+SP(60),B5       ; |225| 
           NOP             4
           CMPGTU  .L2     B5,B4,B0          ; |225| 
   [ B0]   LDW     .D2T2   *+SP(48),B6       ; |225| 
   [ B0]   LDW     .D2T2   *+SP(40),B4       ; |225| 
   [ B0]   LDW     .D2T2   *+SP(60),B5       ; |225| 
           NOP             3
   [ B0]   SUB     .D2     B6,B4,B4          ; |225| 
   [ B0]   CMPGTU  .L2     B5,B4,B4          ; |225| 
   [ B0]   XOR     .S2     1,B4,B0           ; |225| 
   [ B0]   LDW     .D2T2   *+SP(40),B4       ; |226| 
   [ B0]   MVKL    .S1     _OneStepMove,A0   ; |236| 
           NOP             3
   [ B0]   STW     .D2T2   B4,*+SP(56)       ; |226| 
   [ B0]   LDW     .D2T2   *+SP(56),B5       ; |227| 
   [ B0]   MVKL    .S2     _delayCntArr,B4   ; |227| 
   [ B0]   MVKH    .S2     _delayCntArr,B4   ; |227| 
           NOP             2

   [ B0]   B       .S1     L19               ; |228| 
|| [ B0]   LDW     .D2T2   *+B4[B5],B4       ; |227| 

           NOP             4
   [ B0]   STW     .D2T2   B4,*+SP(52)       ; |227| 
           ; BRANCH OCCURS                   ; |228| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(40),B6       ; |231| 
           LDW     .D2T2   *+SP(48),B5       ; |231| 
           LDW     .D2T2   *+SP(60),B4       ; |231| 
           MVKL    .S1     _OneStepMove,A0   ; |236| 
           NOP             2
           SUB     .D2     B5,B6,B5          ; |231| 
           CMPGTU  .L2     B4,B5,B0          ; |231| 
   [ B0]   LDW     .D2T2   *+SP(48),B4       ; |231| 
   [ B0]   LDW     .D2T2   *+SP(60),B5       ; |231| 
           NOP             4
   [ B0]   CMPGT   .L2     B5,B4,B4          ; |231| 
   [ B0]   XOR     .S2     1,B4,B0           ; |231| 
   [ B0]   LDW     .D2T2   *+SP(56),B6       ; |232| 
   [ B0]   LDW     .D2T2   *+SP(56),B4       ; |233| 
   [ B0]   MVKL    .S2     _delayCntArr,B5   ; |232| 
   [ B0]   MVKH    .S2     _delayCntArr,B5   ; |232| 
           NOP             1
   [ B0]   LDW     .D2T2   *+B5[B6],B5       ; |232| 
   [ B0]   SUB     .D2     B4,1,B4           ; |233| 
   [ B0]   STW     .D2T2   B4,*+SP(56)       ; |233| 
           NOP             2
   [ B0]   STW     .D2T2   B5,*+SP(52)       ; |232| 
;** --------------------------------------------------------------------------*
L19:    
           MVKH    .S1     _OneStepMove,A0   ; |236| 

           B       .S2X    A0                ; |236| 
||         LDW     .D2T1   *+SP(32),A4

           LDW     .D2T2   *+SP(52),B4       ; |236| 
           MVKL    .S2     RL36,B3           ; |236| 
           MVKH    .S2     RL36,B3           ; |236| 
           NOP             2
RL36:      ; CALL OCCURS                     ; |236| 
           MVKL    .S2     _sprintf,B4       ; |237| 

           MVKH    .S2     _sprintf,B4       ; |237| 
||         LDW     .D2T2   *+SP(60),B5       ; |237| 

           LDW     .D2T2   *+SP(52),B7       ; |237| 
||         B       .S2     B4                ; |237| 

           MVKL    .S1     SL1+0,A0          ; |237| 

           MVKL    .S2     _tmp_string,B6    ; |237| 
||         MVKH    .S1     SL1+0,A0          ; |237| 

           MVKH    .S2     _tmp_string,B6    ; |237| 
||         STW     .D2T1   A0,*+SP(4)        ; |237| 

           MVKL    .S2     RL38,B3           ; |237| 
||         STW     .D2T2   B5,*+SP(8)        ; |237| 

           MVKH    .S2     RL38,B3           ; |237| 
||         MV      .S1X    B6,A4             ; |237| 
||         STW     .D2T2   B7,*+SP(12)       ; |237| 

RL38:      ; CALL OCCURS                     ; |237| 
           MVKL    .S1     _Report,A0        ; |237| 
           MVKH    .S1     _Report,A0        ; |237| 
           B       .S2X    A0                ; |237| 
           MVKL    .S2     RL40,B3           ; |237| 
           MVKH    .S2     RL40,B3           ; |237| 
           NOP             3
RL40:      ; CALL OCCURS                     ; |237| 
           LDW     .D2T2   *+SP(60),B4       ; |238| 
           LDW     .D2T2   *+SP(48),B5       ; |238| 
           NOP             3
           ADD     .D2     1,B4,B4           ; |238| 
           CMPGT   .L2     B4,B5,B0          ; |238| 
   [!B0]   B       .S1     L18               ; |238| 
           STW     .D2T2   B4,*+SP(60)       ; |238| 
   [!B0]   LDW     .D2T2   *+SP(40),B4       ; |220| 
   [!B0]   LDW     .D2T2   *+SP(60),B5       ; |220| 
           NOP             2
           ; BRANCH OCCURS                   ; |238| 
;** --------------------------------------------------------------------------*
L20:    
           LDW     .D2T2   *+SP(64),B3       ; |240| 
           NOP             4
;** --------------------------------------------------------------------------*
L21:    

           B       .S2     B3                ; |240| 
||         LDW     .D2T2   *+SP(68),B10      ; |240| 

           LDW     .D2T2   *++SP(72),B11     ; |240| 
           NOP             4
           ; BRANCH OCCURS                   ; |240| 


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
           MVKL    .S1     _InitEXINTF,A0    ; |245| 
           MVKH    .S1     _InitEXINTF,A0    ; |245| 
           B       .S2X    A0                ; |245| 
           STW     .D2T2   B3,*SP--(24)      ; |244| 
           MVKL    .S2     RL42,B3           ; |245| 
           MVKH    .S2     RL42,B3           ; |245| 
           NOP             2
RL42:      ; CALL OCCURS                     ; |245| 
           MVKL    .S1     _InitTimer,A0     ; |246| 
           MVKH    .S1     _InitTimer,A0     ; |246| 
           B       .S2X    A0                ; |246| 
           MVKL    .S2     RL44,B3           ; |246| 
           MVKH    .S2     RL44,B3           ; |246| 
           NOP             3
RL44:      ; CALL OCCURS                     ; |246| 
           MVKL    .S2     _InitUART,B4      ; |247| 
           MVKH    .S2     _InitUART,B4      ; |247| 
           B       .S2     B4                ; |247| 
           MVKL    .S2     RL46,B3           ; |247| 
           MVKH    .S2     RL46,B3           ; |247| 
           NOP             3
RL46:      ; CALL OCCURS                     ; |247| 
           MVKL    .S1     _InitINT,A0       ; |248| 
           MVKH    .S1     _InitINT,A0       ; |248| 
           B       .S2X    A0                ; |248| 
           MVKL    .S2     RL48,B3           ; |248| 
           MVKH    .S2     RL48,B3           ; |248| 
           NOP             3
RL48:      ; CALL OCCURS                     ; |248| 
           MVKL    .S1     _InitUSBMon,A0    ; |249| 
           MVKH    .S1     _InitUSBMon,A0    ; |249| 
           B       .S2X    A0                ; |249| 
           MVKL    .S2     RL50,B3           ; |249| 
           MVKH    .S2     RL50,B3           ; |249| 
           NOP             3
RL50:      ; CALL OCCURS                     ; |249| 
           MVKL    .S1     _sprintf,A0       ; |251| 

           MVKH    .S1     _sprintf,A0       ; |251| 
||         MVKL    .S2     SL2+0,B5          ; |251| 

           B       .S2X    A0                ; |251| 
           MVKL    .S2     RL52,B3           ; |251| 
           MVKH    .S2     SL2+0,B5          ; |251| 
           MVKL    .S2     _tmp_string,B4    ; |251| 
           MVKH    .S2     _tmp_string,B4    ; |251| 

           MVKH    .S2     RL52,B3           ; |251| 
||         STW     .D2T2   B5,*+SP(4)        ; |251| 
||         MV      .S1X    B4,A4             ; |251| 

RL52:      ; CALL OCCURS                     ; |251| 
           MVKL    .S1     _Report,A0        ; |251| 
           MVKH    .S1     _Report,A0        ; |251| 
           B       .S2X    A0                ; |251| 
           MVKL    .S2     RL54,B3           ; |251| 
           MVKH    .S2     RL54,B3           ; |251| 
           NOP             3
RL54:      ; CALL OCCURS                     ; |251| 
           MVK     .S1     2024,A0           ; |252| 

           MVKL    .S1     _sprintf,A0       ; |252| 
||         STW     .D2T1   A0,*+SP(8)        ; |252| 

           MVKH    .S1     _sprintf,A0       ; |252| 
||         MVKL    .S2     _tmp_string,B5    ; |252| 

           B       .S2X    A0                ; |252| 
           MVKL    .S2     SL3+0,B4          ; |252| 
           MVKH    .S2     _tmp_string,B5    ; |252| 
           MVKH    .S2     SL3+0,B4          ; |252| 
           MVKL    .S2     RL56,B3           ; |252| 

           MVKH    .S2     RL56,B3           ; |252| 
||         STW     .D2T2   B4,*+SP(4)        ; |252| 
||         MV      .S1X    B5,A4             ; |252| 

RL56:      ; CALL OCCURS                     ; |252| 
           MVKL    .S1     _Report,A0        ; |252| 
           MVKH    .S1     _Report,A0        ; |252| 
           B       .S2X    A0                ; |252| 
           MVKL    .S2     RL58,B3           ; |252| 
           MVKH    .S2     RL58,B3           ; |252| 
           NOP             3
RL58:      ; CALL OCCURS                     ; |252| 
           MVKL    .S2     SL4+0,B5          ; |253| 
           MVKH    .S2     SL4+0,B5          ; |253| 
           MVKL    .S2     0x20003fc,B4      ; |253| 

           STW     .D2T2   B5,*+SP(4)        ; |253| 
||         MVKH    .S2     0x20003fc,B4      ; |253| 

           LDW     .D2T2   *B4,B4            ; |253| 
           MVKL    .S1     0x20003fc,A0      ; |253| 
           MVKH    .S1     0x20003fc,A0      ; |253| 
           MVKL    .S1     _tmp_string,A4    ; |253| 
           MVKL    .S2     RL60,B3           ; |253| 
           EXTU    .S2     B4,16,24,B4       ; |253| 
           STW     .D2T2   B4,*+SP(8)        ; |253| 

           MVKL    .S1     _sprintf,A0       ; |253| 
||         LDW     .D1T1   *A0,A3            ; |253| 

           MVKH    .S1     _sprintf,A0       ; |253| 
           B       .S2X    A0                ; |253| 
           MVKH    .S1     _tmp_string,A4    ; |253| 
           MVKH    .S2     RL60,B3           ; |253| 
           EXTU    .S1     A3,24,24,A3       ; |253| 
           STW     .D2T1   A3,*+SP(12)       ; |253| 
           NOP             1
RL60:      ; CALL OCCURS                     ; |253| 
           MVKL    .S1     _Report,A0        ; |253| 
           MVKH    .S1     _Report,A0        ; |253| 
           B       .S2X    A0                ; |253| 
           MVKL    .S2     RL62,B3           ; |253| 
           MVKH    .S2     RL62,B3           ; |253| 
           NOP             3
RL62:      ; CALL OCCURS                     ; |253| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _GIE,B4           ; |256| 
           MVKH    .S2     _GIE,B4           ; |256| 
           B       .S2     B4                ; |256| 
           MVKL    .S2     RL64,B3           ; |256| 
           ZERO    .D1     A3                ; |255| 
           MVKL    .S1     _TFlag,A0         ; |255| 
           MVKH    .S1     _TFlag,A0         ; |255| 

           STW     .D1T1   A3,*A0            ; |255| 
||         MVKH    .S2     RL64,B3           ; |256| 

RL64:      ; CALL OCCURS                     ; |256| 
           MVKL    .S1     _WaitTFlagCnt,A0  ; |264| 

           MVKL    .S2     0x200004c,B4      ; |258| 
||         MVKH    .S1     _WaitTFlagCnt,A0  ; |264| 

           B       .S2X    A0                ; |264| 
||         MVK     .S1     1,A5              ; |258| 

           MVKH    .S2     0x200004c,B4      ; |258| 
||         MVKL    .S1     _currPhaseIdx,A4  ; |260| 

           MVKL    .S2     _currDIR,B4       ; |261| 
||         ZERO    .D1     A5                ; |260| 
||         STW     .D2T1   A5,*B4            ; |258| 
||         MVKH    .S1     _currPhaseIdx,A4  ; |260| 

           STW     .D1T1   A5,*A4            ; |260| 
||         MVKH    .S2     _currDIR,B4       ; |261| 
||         MVKL    .S1     _prevDIR,A3       ; |262| 
||         ZERO    .D2     B5                ; |261| 

           ZERO    .L2     B4                ; |262| 
||         STW     .D2T2   B5,*B4            ; |261| 
||         MVKL    .S2     RL66,B3           ; |264| 
||         MVKH    .S1     _prevDIR,A3       ; |262| 

           STW     .D1T2   B4,*A3            ; |262| 
||         MVK     .S1     0x2710,A4         ; |264| 
||         MVKH    .S2     RL66,B3           ; |264| 

RL66:      ; CALL OCCURS                     ; |264| 
           MVKL    .S2     _StepMoveVP,B5    ; |268| 
           MVKH    .S2     _StepMoveVP,B5    ; |268| 
           B       .S2     B5                ; |268| 
           MVKL    .S2     RL68,B3           ; |268| 
           ZERO    .D2     B4                ; |268| 
           ZERO    .D1     A6                ; |268| 

           MVKH    .S2     0x43340000,B4     ; |268| 
||         ZERO    .D1     A4                ; |268| 
||         MVKH    .S1     0x44e10000,A6     ; |268| 

           MVKH    .S2     RL68,B3           ; |268| 
||         MVKH    .S1     0x43b40000,A4     ; |268| 

RL68:      ; CALL OCCURS                     ; |268| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L22:    
           B       .S1     L22               ; |270| 
           NOP             5
           ; BRANCH OCCURS                   ; |270| 


;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
SL1:	.string	"intCnt on %d_th step: %d",13,10,13,10,0
SL2:	.string	13,10,13,10,0
SL3:	.string	"Mechatronics Course %d",13,10,0
SL4:	.string	"FPGA Ver%2x.%02x",13,10,0
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
