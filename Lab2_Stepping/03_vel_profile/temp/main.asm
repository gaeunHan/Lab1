;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Tue Apr 16 21:05:21 2024                                *
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
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI7656_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI7656_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
;*                           B5,B6,B7,B8,B9,B10,B11,SP                        *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,B11,SP                        *
;*   Local Frame Size  : 0 Args + 28 Auto + 20 Save = 48 byte                 *
;******************************************************************************
_MakeVelProfile:
;** --------------------------------------------------------------------------*
           STW     .D2T2   B11,*SP--(48)     ; |157| 

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
           STW     .D2T2   B3,*+SP(40)       ; |157| 

           STW     .D2T1   A11,*+SP(36)      ; |157| 
||         SPDP    .S2     B6,B7:B6          ; |166| 

           STW     .D2T1   A10,*+SP(32)      ; |157| 

           MVK     .S1     1,A0              ; |164| 
||         MV      .L1X    B7,A5             ; |166| 
||         MVKL    .S2     RL8,B3            ; |166| 
||         STW     .D2T2   B10,*+SP(44)      ; |157| 

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

           ZERO    .S2     B10               ; |172| 
||         ZERO    .D1     A10               ; |171| 
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
           NOP             3
           MV      .S2X    A0,B4             ; |171| 
           SPDP    .S2     B4,B5:B4          ; |172| 
           NOP             1
           MVKL    .S2     0x40f86a00,B11    ; |172| 
           MVKH    .S2     0x40f86a00,B11    ; |172| 
           MPYDP   .M2     B5:B4,B11:B10,B5:B4 ; |172| 
           NOP             9
           DPSP    .L2     B5:B4,B4          ; |172| 
           NOP             2
           LDW     .D2T2   *+SP(12),B5       ; |173| 

           SPTRUNC .L2     B4,B4             ; |173| 
||         STW     .D2T2   B4,*+SP(28)       ; |172| 

           NOP             1
           MVKL    .S2     _delayCntArr,B6   ; |173| 

           STW     .D2T1   A0,*+SP(24)       ; |171| 
||         MVKH    .S2     _delayCntArr,B6   ; |173| 

           STW     .D2T2   B4,*+B6[B5]       ; |173| 
           LDW     .D2T2   *+SP(12),B4       ; |174| 
           NOP             4

           ADD     .D2     1,B4,B4
||         ADD     .S1X    1,B4,A0

           STW     .D2T2   B4,*+SP(12)       ; |174| 
           LDW     .D2T2   *+SP(20),B4       ; |174| 
           NOP             4
           CMPGTU  .L1X    A0,B4,A1          ; |174| 
   [!A1]   B       .S1     L14               ; |174| 
           NOP             5
           ; BRANCH OCCURS                   ; |174| 
;** --------------------------------------------------------------------------*
L15:    
           LDW     .D2T2   *+SP(40),B3       ; |177| 
           LDW     .D2T2   *+SP(44),B10      ; |177| 
           LDW     .D2T1   *+SP(36),A11      ; |177| 
           LDW     .D2T1   *+SP(32),A10      ; |177| 
           LDW     .D2T1   *+SP(20),A4       ; |176| 
           B       .S2     B3                ; |177| 
           LDW     .D2T2   *++SP(48),B11     ; |177| 
           NOP             4
           ; BRANCH OCCURS                   ; |177| 


	.sect	".text"
	.global	_StepMoveVP

;******************************************************************************
;* FUNCTION NAME: _StepMoveVP                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 40 Auto + 4 Save = 44 byte                  *
;******************************************************************************
_StepMoveVP:
;** --------------------------------------------------------------------------*
           MVKL    .S2     __divf,B6         ; |189| 
           MVKH    .S2     __divf,B6         ; |189| 
           B       .S2     B6                ; |189| 
           NOP             1
           STW     .D2T2   B3,*SP--(48)      ; |180| 

           STW     .D2T2   B4,*+SP(8)        ; |180| 
||         MVKL    .S1     0x3fe66666,A0     ; |189| 

           STW     .D2T1   A6,*+SP(12)       ; |180| 
||         MVKH    .S1     0x3fe66666,A0     ; |189| 
||         MVKL    .S2     RL18,B3           ; |189| 

           MV      .L2X    A0,B4             ; |189| 
||         STW     .D2T1   A4,*+SP(4)        ; |180| 
||         MVKH    .S2     RL18,B3           ; |189| 

RL18:      ; CALL OCCURS                     ; |189| 
           SPTRUNC .L1     A4,A0             ; |189| 
           NOP             3
           STW     .D2T1   A0,*+SP(16)       ; |189| 

           LDW     .D2T2   *+SP(4),B6        ; |190| 
||         MVKL    .S1     _MakeVelProfile,A0 ; |193| 

           MVKH    .S1     _MakeVelProfile,A0 ; |193| 

           B       .S2X    A0                ; |193| 
||         LDW     .D2T2   *+SP(12),B4       ; |193| 

           LDW     .D2T1   *+SP(8),A4        ; |193| 

           MVKL    .S2     RL20,B3           ; |193| 
||         ZERO    .D2     B5                ; |190| 

           CMPGTSP .S2     B6,B5,B0          ; |190| 
   [!B0]   MVK     .S2     0x1,B5            ; |190| 

           STW     .D2T2   B5,*+SP(24)       ; |190| 
||         MVKH    .S2     RL20,B3           ; |193| 

RL20:      ; CALL OCCURS                     ; |193| 
           MV      .S2X    A4,B4             ; |193| 
           INTSPU  .L2     B4,B6             ; |194| 
           NOP             1
           MVKL    .S2     0x3fe66666,B4     ; |194| 

           LDW     .D2T2   *+SP(4),B5        ; |194| 
||         MVKH    .S2     0x3fe66666,B4     ; |194| 

           MPYSP   .M2     B6,B4,B6          ; |194| 
           MVKL    .S1     __divf,A0         ; |194| 
           MVKH    .S1     __divf,A0         ; |194| 
           B       .S2X    A0                ; |194| 
           SUBSP   .L2     B5,B6,B5          ; |194| 
           MVKL    .S2     0x3fe66666,B4     ; |194| 
           MVKH    .S2     0x3fe66666,B4     ; |194| 

           STW     .D2T1   A4,*+SP(28)       ; |193| 
||         MVKL    .S2     RL22,B3           ; |194| 

           MVKH    .S2     RL22,B3           ; |194| 
||         MV      .S1X    B5,A4             ; |194| 

RL22:      ; CALL OCCURS                     ; |194| 
           LDW     .D2T2   *+SP(28),B4       ; |195| 
           NOP             4

           INTDPU  .L2     B4,B5:B4          ; |195| 
||         SPTRUNC .L1     A4,A0             ; |194| 

           NOP             2
           ZERO    .D1     A1                ; |195| 

           ZERO    .D1     A0                ; |195| 
||         MVKH    .S1     0x40000000,A1     ; |195| 
||         STW     .D2T1   A0,*+SP(20)       ; |194| 

           LDW     .D2T2   *+SP(20),B4       ; |195| 
||         MPYDP   .M1X    B5:B4,A1:A0,A5:A4 ; |195| 

           NOP             4
           INTDP   .L1X    B4,A1:A0          ; |195| 
           NOP             4
           ADDDP   .L1     A1:A0,A5:A4,A1:A0 ; |195| 
           NOP             6
           DPTRUNC .L1     A1:A0,A3          ; |195| 
           NOP             3

           MVK     .S1     1,A0              ; |199| 
||         MV      .S2X    A3,B4             ; |195| 

           CMPGT   .L2X    A0,B4,B0
   [ B0]   B       .S1     L18               ; |199| 
           NOP             2
           STW     .D2T1   A3,*+SP(16)       ; |195| 

           STW     .D2T1   A0,*+SP(40)       ; |199| 
||         MVK     .S2     1,B5              ; |198| 

           STW     .D2T2   B5,*+SP(36)       ; |198| 
||         MV      .S2X    A0,B6

           ; BRANCH OCCURS                   ; |199| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(28),B4       ; |201| 
           LDW     .D2T2   *+SP(40),B5       ; |201| 
           NOP             3
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L16:    
           NOP             1
           CMPGTU  .L2     B5,B4,B0          ; |201| 
   [!B0]   LDW     .D2T2   *+SP(36),B6       ; |202| 
   [!B0]   MVKL    .S2     _delayCntArr,B4   ; |202| 
   [!B0]   LDW     .D2T2   *+SP(36),B5       ; |203| 
   [!B0]   MVKH    .S2     _delayCntArr,B4   ; |202| 
   [!B0]   MVKL    .S1     _OneStepMove,A0   ; |218| 

   [!B0]   B       .S1     L17               ; |204| 
|| [!B0]   LDW     .D2T2   *+B4[B6],B4       ; |202| 

           NOP             2
   [!B0]   ADD     .D2     1,B5,B5           ; |203| 
   [!B0]   STW     .D2T2   B5,*+SP(36)       ; |203| 
   [!B0]   STW     .D2T2   B4,*+SP(32)       ; |202| 
           ; BRANCH OCCURS                   ; |204| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(28),B4       ; |206| 
           LDW     .D2T2   *+SP(40),B5       ; |206| 
           NOP             4
           CMPGTU  .L2     B5,B4,B0          ; |206| 
   [ B0]   LDW     .D2T2   *+SP(28),B4       ; |206| 
   [ B0]   LDW     .D2T2   *+SP(16),B5       ; |206| 
   [ B0]   LDW     .D2T2   *+SP(40),B6       ; |206| 
           NOP             3
   [ B0]   SUB     .D2     B5,B4,B4          ; |206| 
   [ B0]   CMPGTU  .L2     B6,B4,B4          ; |206| 
   [ B0]   XOR     .S2     1,B4,B0           ; |206| 
   [ B0]   LDW     .D2T2   *+SP(28),B4       ; |207| 
   [ B0]   MVKL    .S1     _OneStepMove,A0   ; |218| 
           NOP             3
   [ B0]   STW     .D2T2   B4,*+SP(36)       ; |207| 
   [ B0]   LDW     .D2T2   *+SP(36),B5       ; |208| 
   [ B0]   MVKL    .S2     _delayCntArr,B4   ; |208| 
   [ B0]   MVKH    .S2     _delayCntArr,B4   ; |208| 
           NOP             2

   [ B0]   B       .S1     L17               ; |209| 
|| [ B0]   LDW     .D2T2   *+B4[B5],B4       ; |208| 

           NOP             4
   [ B0]   STW     .D2T2   B4,*+SP(32)       ; |208| 
           ; BRANCH OCCURS                   ; |209| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(28),B6       ; |212| 
           LDW     .D2T2   *+SP(16),B4       ; |212| 
           LDW     .D2T2   *+SP(40),B5       ; |212| 
           MVKL    .S1     _OneStepMove,A0   ; |218| 
           NOP             2
           SUB     .D2     B4,B6,B4          ; |212| 
           CMPGTU  .L2     B5,B4,B0          ; |212| 
   [ B0]   LDW     .D2T2   *+SP(16),B5       ; |212| 
   [ B0]   LDW     .D2T2   *+SP(40),B4       ; |212| 
           NOP             4
   [ B0]   CMPGT   .L2     B4,B5,B4          ; |212| 
   [ B0]   XOR     .S2     1,B4,B0           ; |212| 
   [ B0]   LDW     .D2T2   *+SP(36),B4       ; |213| 
   [ B0]   MVKL    .S2     _delayCntArr,B5   ; |213| 
   [ B0]   LDW     .D2T2   *+SP(36),B6       ; |214| 
   [ B0]   MVKH    .S2     _delayCntArr,B5   ; |213| 
           NOP             1
   [ B0]   LDW     .D2T2   *+B5[B4],B5       ; |213| 
           NOP             4

   [ B0]   STW     .D2T2   B5,*+SP(32)       ; |213| 
|| [ B0]   SUB     .S2     B6,1,B4           ; |214| 

   [ B0]   STW     .D2T2   B4,*+SP(36)       ; |214| 
;** --------------------------------------------------------------------------*
L17:    
           MVKH    .S1     _OneStepMove,A0   ; |218| 

           B       .S2X    A0                ; |218| 
||         LDW     .D2T1   *+SP(24),A4

           LDW     .D2T2   *+SP(32),B4       ; |218| 
           MVKL    .S2     RL24,B3           ; |218| 
           MVKH    .S2     RL24,B3           ; |218| 
           NOP             2
RL24:      ; CALL OCCURS                     ; |218| 
           LDW     .D2T2   *+SP(40),B4       ; |219| 
           NOP             4
           ADD     .D2     1,B4,B4           ; |219| 
           STW     .D2T2   B4,*+SP(40)       ; |219| 
           LDW     .D2T2   *+SP(40),B5       ; |219| 
           LDW     .D2T2   *+SP(16),B4       ; |219| 
           NOP             4
           CMPGT   .L2     B5,B4,B0          ; |219| 
   [!B0]   B       .S1     L16               ; |219| 
   [!B0]   LDW     .D2T2   *+SP(28),B4       ; |201| 
   [!B0]   LDW     .D2T2   *+SP(40),B5       ; |201| 
           NOP             3
           ; BRANCH OCCURS                   ; |219| 
;** --------------------------------------------------------------------------*
L18:    
           LDW     .D2T2   *++SP(48),B3      ; |220| 
           NOP             4
           B       .S2     B3                ; |220| 
           NOP             5
           ; BRANCH OCCURS                   ; |220| 


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
           MVKL    .S1     _InitEXINTF,A0    ; |225| 
           MVKH    .S1     _InitEXINTF,A0    ; |225| 
           B       .S2X    A0                ; |225| 
           STW     .D2T2   B3,*SP--(24)      ; |224| 
           MVKL    .S2     RL26,B3           ; |225| 
           MVKH    .S2     RL26,B3           ; |225| 
           NOP             2
RL26:      ; CALL OCCURS                     ; |225| 
           MVKL    .S1     _InitTimer,A0     ; |226| 
           MVKH    .S1     _InitTimer,A0     ; |226| 
           B       .S2X    A0                ; |226| 
           MVKL    .S2     RL28,B3           ; |226| 
           MVKH    .S2     RL28,B3           ; |226| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |226| 
           MVKL    .S2     _InitUART,B4      ; |227| 
           MVKH    .S2     _InitUART,B4      ; |227| 
           B       .S2     B4                ; |227| 
           MVKL    .S2     RL30,B3           ; |227| 
           MVKH    .S2     RL30,B3           ; |227| 
           NOP             3
RL30:      ; CALL OCCURS                     ; |227| 
           MVKL    .S1     _InitINT,A0       ; |228| 
           MVKH    .S1     _InitINT,A0       ; |228| 
           B       .S2X    A0                ; |228| 
           MVKL    .S2     RL32,B3           ; |228| 
           MVKH    .S2     RL32,B3           ; |228| 
           NOP             3
RL32:      ; CALL OCCURS                     ; |228| 
           MVKL    .S1     _InitUSBMon,A0    ; |229| 
           MVKH    .S1     _InitUSBMon,A0    ; |229| 
           B       .S2X    A0                ; |229| 
           MVKL    .S2     RL34,B3           ; |229| 
           MVKH    .S2     RL34,B3           ; |229| 
           NOP             3
RL34:      ; CALL OCCURS                     ; |229| 
           MVKL    .S1     _sprintf,A0       ; |231| 

           MVKH    .S1     _sprintf,A0       ; |231| 
||         MVKL    .S2     SL1+0,B5          ; |231| 

           B       .S2X    A0                ; |231| 
           MVKL    .S2     RL36,B3           ; |231| 
           MVKH    .S2     SL1+0,B5          ; |231| 
           MVKL    .S2     _tmp_string,B4    ; |231| 
           MVKH    .S2     _tmp_string,B4    ; |231| 

           MVKH    .S2     RL36,B3           ; |231| 
||         STW     .D2T2   B5,*+SP(4)        ; |231| 
||         MV      .S1X    B4,A4             ; |231| 

RL36:      ; CALL OCCURS                     ; |231| 
           MVKL    .S1     _Report,A0        ; |231| 
           MVKH    .S1     _Report,A0        ; |231| 
           B       .S2X    A0                ; |231| 
           MVKL    .S2     RL38,B3           ; |231| 
           MVKH    .S2     RL38,B3           ; |231| 
           NOP             3
RL38:      ; CALL OCCURS                     ; |231| 
           MVK     .S1     2024,A0           ; |232| 

           MVKL    .S1     _sprintf,A0       ; |232| 
||         STW     .D2T1   A0,*+SP(8)        ; |232| 

           MVKH    .S1     _sprintf,A0       ; |232| 
||         MVKL    .S2     _tmp_string,B5    ; |232| 

           B       .S2X    A0                ; |232| 
           MVKL    .S2     SL2+0,B4          ; |232| 
           MVKH    .S2     _tmp_string,B5    ; |232| 
           MVKH    .S2     SL2+0,B4          ; |232| 
           MVKL    .S2     RL40,B3           ; |232| 

           MVKH    .S2     RL40,B3           ; |232| 
||         STW     .D2T2   B4,*+SP(4)        ; |232| 
||         MV      .S1X    B5,A4             ; |232| 

RL40:      ; CALL OCCURS                     ; |232| 
           MVKL    .S1     _Report,A0        ; |232| 
           MVKH    .S1     _Report,A0        ; |232| 
           B       .S2X    A0                ; |232| 
           MVKL    .S2     RL42,B3           ; |232| 
           MVKH    .S2     RL42,B3           ; |232| 
           NOP             3
RL42:      ; CALL OCCURS                     ; |232| 
           MVKL    .S2     SL3+0,B5          ; |233| 
           MVKH    .S2     SL3+0,B5          ; |233| 
           MVKL    .S2     0x20003fc,B4      ; |233| 

           STW     .D2T2   B5,*+SP(4)        ; |233| 
||         MVKH    .S2     0x20003fc,B4      ; |233| 

           LDW     .D2T2   *B4,B4            ; |233| 
           MVKL    .S1     0x20003fc,A0      ; |233| 
           MVKH    .S1     0x20003fc,A0      ; |233| 
           MVKL    .S1     _tmp_string,A4    ; |233| 
           MVKL    .S2     RL44,B3           ; |233| 
           EXTU    .S2     B4,16,24,B4       ; |233| 
           STW     .D2T2   B4,*+SP(8)        ; |233| 

           MVKL    .S1     _sprintf,A0       ; |233| 
||         LDW     .D1T1   *A0,A3            ; |233| 

           MVKH    .S1     _sprintf,A0       ; |233| 
           B       .S2X    A0                ; |233| 
           MVKH    .S1     _tmp_string,A4    ; |233| 
           MVKH    .S2     RL44,B3           ; |233| 
           EXTU    .S1     A3,24,24,A3       ; |233| 
           STW     .D2T1   A3,*+SP(12)       ; |233| 
           NOP             1
RL44:      ; CALL OCCURS                     ; |233| 
           MVKL    .S1     _Report,A0        ; |233| 
           MVKH    .S1     _Report,A0        ; |233| 
           B       .S2X    A0                ; |233| 
           MVKL    .S2     RL46,B3           ; |233| 
           MVKH    .S2     RL46,B3           ; |233| 
           NOP             3
RL46:      ; CALL OCCURS                     ; |233| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _GIE,B4           ; |236| 
           MVKH    .S2     _GIE,B4           ; |236| 
           B       .S2     B4                ; |236| 
           MVKL    .S2     RL48,B3           ; |236| 
           ZERO    .D1     A3                ; |235| 
           MVKL    .S1     _TFlag,A0         ; |235| 
           MVKH    .S1     _TFlag,A0         ; |235| 

           STW     .D1T1   A3,*A0            ; |235| 
||         MVKH    .S2     RL48,B3           ; |236| 

RL48:      ; CALL OCCURS                     ; |236| 
           MVKL    .S1     _WaitTFlagCnt,A0  ; |244| 

           MVKL    .S2     0x200004c,B4      ; |238| 
||         MVKH    .S1     _WaitTFlagCnt,A0  ; |244| 

           B       .S2X    A0                ; |244| 
||         MVK     .S1     1,A5              ; |238| 

           MVKH    .S2     0x200004c,B4      ; |238| 
||         MVKL    .S1     _currPhaseIdx,A4  ; |240| 

           MVKL    .S2     _currDIR,B4       ; |241| 
||         ZERO    .D1     A5                ; |240| 
||         STW     .D2T1   A5,*B4            ; |238| 
||         MVKH    .S1     _currPhaseIdx,A4  ; |240| 

           STW     .D1T1   A5,*A4            ; |240| 
||         MVKH    .S2     _currDIR,B4       ; |241| 
||         MVKL    .S1     _prevDIR,A3       ; |242| 
||         ZERO    .D2     B5                ; |241| 

           ZERO    .L2     B4                ; |242| 
||         STW     .D2T2   B5,*B4            ; |241| 
||         MVKL    .S2     RL50,B3           ; |244| 
||         MVKH    .S1     _prevDIR,A3       ; |242| 

           STW     .D1T2   B4,*A3            ; |242| 
||         MVK     .S1     0x2710,A4         ; |244| 
||         MVKH    .S2     RL50,B3           ; |244| 

RL50:      ; CALL OCCURS                     ; |244| 
           MVKL    .S2     _StepMoveVP,B5    ; |248| 
           MVKH    .S2     _StepMoveVP,B5    ; |248| 
           B       .S2     B5                ; |248| 
           MVKL    .S2     RL52,B3           ; |248| 
           ZERO    .D2     B4                ; |248| 
           ZERO    .D1     A6                ; |248| 

           MVKH    .S2     0x43340000,B4     ; |248| 
||         ZERO    .D1     A4                ; |248| 
||         MVKH    .S1     0x44e10000,A6     ; |248| 

           MVKH    .S2     RL52,B3           ; |248| 
||         MVKH    .S1     0x43b40000,A4     ; |248| 

RL52:      ; CALL OCCURS                     ; |248| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L19:    
           B       .S1     L19               ; |250| 
           NOP             5
           ; BRANCH OCCURS                   ; |250| 


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
