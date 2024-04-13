;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Sat Apr 13 20:37:44 2024                                *
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

	.sect	".const"
	.align 4
_$T0$1:
	.field  	2,32			; _$T0$1[0] @ 0
	.field  	8,32			; _$T0$1[1] @ 32
	.field  	1,32			; _$T0$1[2] @ 64
	.field  	4,32			; _$T0$1[3] @ 96
	.sect	".text"
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI16288_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI16288_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
	.global	_StepMoveCV

;******************************************************************************
;* FUNCTION NAME: _StepMoveCV                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 28 Auto + 4 Save = 32 byte                  *
;******************************************************************************
_StepMoveCV:
;** --------------------------------------------------------------------------*
           MVKL    .S1     __divf,A0         ; |148| 
           MVKH    .S1     __divf,A0         ; |148| 
           B       .S2X    A0                ; |148| 
           NOP             2

           MVKL    .S1     0x3fe66666,A3     ; |148| 
||         STW     .D2T2   B3,*SP--(32)      ; |141| 

           STW     .D2T2   B4,*+SP(8)        ; |141| 
||         MVKH    .S1     0x3fe66666,A3     ; |148| 
||         MVKL    .S2     RL6,B3            ; |148| 

           MV      .L2X    A3,B4             ; |148| 
||         STW     .D2T1   A4,*+SP(4)        ; |141| 
||         MVKH    .S2     RL6,B3            ; |148| 

RL6:       ; CALL OCCURS                     ; |148| 

           LDW     .D2T2   *+SP(4),B5        ; |149| 
||         MVKL    .S2     __divf,B6         ; |150| 

           MVKH    .S2     __divf,B6         ; |150| 

           B       .S2     B6                ; |150| 
||         SPTRUNC .L1     A4,A0             ; |148| 

           LDW     .D2T2   *+SP(8),B4        ; |150| 
||         MVKL    .S2     0x3fe66666,B7     ; |150| 

           MVKH    .S2     0x3fe66666,B7     ; |150| 
||         ZERO    .D1     A3                ; |149| 

           ZERO    .D2     B5                ; |149| 
||         CMPGTSP .S1X    B5,A3,A1          ; |149| 
||         MVKL    .S2     RL8,B3            ; |150| 

   [!A1]   MVK     .S2     0x1,B5            ; |149| 
||         STW     .D2T1   A0,*+SP(12)       ; |148| 

           STW     .D2T2   B5,*+SP(16)       ; |149| 
||         MV      .S1X    B7,A4             ; |150| 
||         MVKH    .S2     RL8,B3            ; |150| 

RL8:       ; CALL OCCURS                     ; |150| 
           MV      .S2X    A4,B4             ; |150| 

           MVKL    .S1     0x40f86a00,A1     ; |151| 
||         SPDP    .S2     B4,B5:B4          ; |151| 

           MVKH    .S1     0x40f86a00,A1     ; |151| 
||         ZERO    .D1     A0                ; |151| 

           MPYDP   .M1X    B5:B4,A1:A0,A1:A0 ; |151| 
           NOP             2
           ZERO    .D2     B4                ; |154| 
           STW     .D2T2   B4,*+SP(28)       ; |154| 
           LDW     .D2T2   *+SP(28),B5       ; |154| 
           LDW     .D2T2   *+SP(12),B4       ; |154| 
           NOP             4
           CMPLT   .L2     B5,B4,B0          ; |154| 
   [!B0]   B       .S1     L13               ; |154| 
           DPTRUNC .L1     A1:A0,A0          ; |151| 
           NOP             2
           STW     .D2T1   A4,*+SP(20)       ; |150| 
           STW     .D2T1   A0,*+SP(24)       ; |151| 
           ; BRANCH OCCURS                   ; |154| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _OneStepMove,A0   ; |155| 
           MVKH    .S1     _OneStepMove,A0   ; |155| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L12:    

           B       .S2X    A0                ; |155| 
||         LDW     .D2T1   *+SP(16),A4

           LDW     .D2T2   *+SP(24),B4       ; |155| 
           MVKL    .S2     RL10,B3           ; |155| 
           MVKH    .S2     RL10,B3           ; |155| 
           NOP             2
RL10:      ; CALL OCCURS                     ; |155| 
           LDW     .D2T2   *+SP(28),B4       ; |156| 
           NOP             4
           ADD     .D2     1,B4,B4           ; |156| 
           STW     .D2T2   B4,*+SP(28)       ; |156| 
           LDW     .D2T2   *+SP(28),B5       ; |156| 
           LDW     .D2T2   *+SP(12),B4       ; |156| 
           NOP             4
           CMPLT   .L2     B5,B4,B0          ; |156| 
   [ B0]   B       .S1     L12               ; |156| 
   [ B0]   MVKL    .S1     _OneStepMove,A0   ; |155| 
   [ B0]   MVKH    .S1     _OneStepMove,A0   ; |155| 
           NOP             3
           ; BRANCH OCCURS                   ; |156| 
;** --------------------------------------------------------------------------*
L13:    
           LDW     .D2T2   *++SP(32),B3      ; |157| 
           NOP             4
           B       .S2     B3                ; |157| 
           NOP             5
           ; BRANCH OCCURS                   ; |157| 


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
           MVKL    .S1     _InitEXINTF,A0    ; |161| 
           MVKH    .S1     _InitEXINTF,A0    ; |161| 
           B       .S2X    A0                ; |161| 
           STW     .D2T2   B3,*SP--(24)      ; |160| 
           MVKL    .S2     RL12,B3           ; |161| 
           MVKH    .S2     RL12,B3           ; |161| 
           NOP             2
RL12:      ; CALL OCCURS                     ; |161| 
           MVKL    .S1     _InitTimer,A0     ; |162| 
           MVKH    .S1     _InitTimer,A0     ; |162| 
           B       .S2X    A0                ; |162| 
           MVKL    .S2     RL14,B3           ; |162| 
           MVKH    .S2     RL14,B3           ; |162| 
           NOP             3
RL14:      ; CALL OCCURS                     ; |162| 
           MVKL    .S2     _InitUART,B4      ; |163| 
           MVKH    .S2     _InitUART,B4      ; |163| 
           B       .S2     B4                ; |163| 
           MVKL    .S2     RL16,B3           ; |163| 
           MVKH    .S2     RL16,B3           ; |163| 
           NOP             3
RL16:      ; CALL OCCURS                     ; |163| 
           MVKL    .S1     _InitINT,A0       ; |164| 
           MVKH    .S1     _InitINT,A0       ; |164| 
           B       .S2X    A0                ; |164| 
           MVKL    .S2     RL18,B3           ; |164| 
           MVKH    .S2     RL18,B3           ; |164| 
           NOP             3
RL18:      ; CALL OCCURS                     ; |164| 
           MVKL    .S1     _InitUSBMon,A0    ; |165| 
           MVKH    .S1     _InitUSBMon,A0    ; |165| 
           B       .S2X    A0                ; |165| 
           MVKL    .S2     RL20,B3           ; |165| 
           MVKH    .S2     RL20,B3           ; |165| 
           NOP             3
RL20:      ; CALL OCCURS                     ; |165| 
           MVKL    .S1     _sprintf,A0       ; |167| 

           MVKH    .S1     _sprintf,A0       ; |167| 
||         MVKL    .S2     _tmp_string,B5    ; |167| 

           B       .S2X    A0                ; |167| 
           MVKL    .S2     RL22,B3           ; |167| 
           MVKH    .S2     _tmp_string,B5    ; |167| 
           MVKL    .S2     SL1+0,B4          ; |167| 
           MVKH    .S2     SL1+0,B4          ; |167| 

           MVKH    .S2     RL22,B3           ; |167| 
||         MV      .S1X    B5,A4             ; |167| 
||         STW     .D2T2   B4,*+SP(4)        ; |167| 

RL22:      ; CALL OCCURS                     ; |167| 
           MVKL    .S1     _Report,A0        ; |167| 
           MVKH    .S1     _Report,A0        ; |167| 
           B       .S2X    A0                ; |167| 
           MVKL    .S2     RL24,B3           ; |167| 
           MVKH    .S2     RL24,B3           ; |167| 
           NOP             3
RL24:      ; CALL OCCURS                     ; |167| 
           MVK     .S1     2024,A0           ; |168| 

           MVKL    .S1     _sprintf,A0       ; |168| 
||         STW     .D2T1   A0,*+SP(8)        ; |168| 

           MVKH    .S1     _sprintf,A0       ; |168| 
||         MVKL    .S2     SL2+0,B4          ; |168| 

           B       .S2X    A0                ; |168| 
           MVKH    .S2     SL2+0,B4          ; |168| 
           MVKL    .S2     _tmp_string,B5    ; |168| 
           MVKH    .S2     _tmp_string,B5    ; |168| 
           MVKL    .S2     RL26,B3           ; |168| 

           STW     .D2T2   B4,*+SP(4)        ; |168| 
||         MVKH    .S2     RL26,B3           ; |168| 
||         MV      .S1X    B5,A4             ; |168| 

RL26:      ; CALL OCCURS                     ; |168| 
           MVKL    .S1     _Report,A0        ; |168| 
           MVKH    .S1     _Report,A0        ; |168| 
           B       .S2X    A0                ; |168| 
           MVKL    .S2     RL28,B3           ; |168| 
           MVKH    .S2     RL28,B3           ; |168| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |168| 
           MVKL    .S2     SL3+0,B4          ; |169| 
           MVKL    .S2     0x20003fc,B5      ; |169| 
           MVKH    .S2     SL3+0,B4          ; |169| 

           MVKH    .S2     0x20003fc,B5      ; |169| 
||         STW     .D2T2   B4,*+SP(4)        ; |169| 

           LDW     .D2T2   *B5,B4            ; |169| 
           MVKL    .S1     0x20003fc,A0      ; |169| 
           MVKH    .S1     0x20003fc,A0      ; |169| 
           MVKL    .S1     _tmp_string,A4    ; |169| 
           MVKL    .S2     RL30,B3           ; |169| 
           EXTU    .S2     B4,16,24,B4       ; |169| 
           STW     .D2T2   B4,*+SP(8)        ; |169| 

           MVKL    .S1     _sprintf,A0       ; |169| 
||         LDW     .D1T1   *A0,A3            ; |169| 

           MVKH    .S1     _sprintf,A0       ; |169| 
           B       .S2X    A0                ; |169| 
           MVKH    .S2     RL30,B3           ; |169| 
           MVKH    .S1     _tmp_string,A4    ; |169| 
           NOP             1
           EXTU    .S1     A3,24,24,A3       ; |169| 
           STW     .D2T1   A3,*+SP(12)       ; |169| 
RL30:      ; CALL OCCURS                     ; |169| 
           MVKL    .S1     _Report,A0        ; |169| 
           MVKH    .S1     _Report,A0        ; |169| 
           B       .S2X    A0                ; |169| 
           MVKL    .S2     RL32,B3           ; |169| 
           MVKH    .S2     RL32,B3           ; |169| 
           NOP             3
RL32:      ; CALL OCCURS                     ; |169| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _GIE,B4           ; |172| 
           MVKH    .S2     _GIE,B4           ; |172| 
           B       .S2     B4                ; |172| 
           MVKL    .S2     RL34,B3           ; |172| 
           ZERO    .D2     B5                ; |171| 
           MVKL    .S1     _TFlag,A0         ; |171| 
           MVKH    .S1     _TFlag,A0         ; |171| 

           STW     .D1T2   B5,*A0            ; |171| 
||         MVKH    .S2     RL34,B3           ; |172| 

RL34:      ; CALL OCCURS                     ; |172| 
           MVKL    .S2     _WaitTFlagCnt,B4  ; |178| 
           MVKH    .S2     _WaitTFlagCnt,B4  ; |178| 
           B       .S2     B4                ; |178| 
           MVKL    .S1     _currPhaseIdx,A3  ; |176| 
           MVKL    .S1     0x200004c,A0      ; |174| 

           MVKH    .S1     0x200004c,A0      ; |174| 
||         MVK     .S2     1,B5              ; |174| 

           ZERO    .L1     A0                ; |176| 
||         STW     .D1T2   B5,*A0            ; |174| 
||         MVKL    .S2     RL36,B3           ; |178| 
||         MVKH    .S1     _currPhaseIdx,A3  ; |176| 

           STW     .D1T1   A0,*A3            ; |176| 
||         MVKH    .S2     RL36,B3           ; |178| 
||         MVK     .S1     0x2710,A4         ; |178| 

RL36:      ; CALL OCCURS                     ; |178| 
           MVKL    .S1     _OneStepMove,A0   ; |182| 
           MVKH    .S1     _OneStepMove,A0   ; |182| 
           B       .S2X    A0                ; |182| 
           MVKL    .S2     RL38,B3           ; |182| 
           MVK     .S2     0x1,B4            ; |182| 
           MVKH    .S2     RL38,B3           ; |182| 
           ZERO    .D1     A4                ; |182| 
           NOP             1
RL38:      ; CALL OCCURS                     ; |182| 
           MVKL    .S1     _OneStepMove,A0   ; |183| 
           MVKH    .S1     _OneStepMove,A0   ; |183| 
           B       .S2X    A0                ; |183| 
           MVKL    .S2     RL40,B3           ; |183| 
           MVK     .S2     0x1,B4            ; |183| 
           ZERO    .D1     A4                ; |183| 
           MVKH    .S2     RL40,B3           ; |183| 
           NOP             1
RL40:      ; CALL OCCURS                     ; |183| 
           MVKL    .S1     _OneStepMove,A0   ; |184| 
           MVKH    .S1     _OneStepMove,A0   ; |184| 
           B       .S2X    A0                ; |184| 
           MVKL    .S2     RL42,B3           ; |184| 
           MVK     .S2     0x1,B4            ; |184| 
           MVKH    .S2     RL42,B3           ; |184| 
           ZERO    .D1     A4                ; |184| 
           NOP             1
RL42:      ; CALL OCCURS                     ; |184| 
           MVKL    .S2     _StepMoveCV,B5    ; |187| 
           MVKH    .S2     _StepMoveCV,B5    ; |187| 
           B       .S2     B5                ; |187| 
           ZERO    .D2     B6                ; |187| 
           ZERO    .D1     A0                ; |187| 
           MVKH    .S2     0x43b40000,B6     ; |187| 

           MVKH    .S1     0x43340000,A0     ; |187| 
||         MVKL    .S2     RL44,B3           ; |187| 

           MVKH    .S2     RL44,B3           ; |187| 
||         MV      .L2X    A0,B4             ; |187| 
||         MV      .S1X    B6,A4             ; |187| 

RL44:      ; CALL OCCURS                     ; |187| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L14:    
           B       .S1     L14               ; |190| 
           NOP             5
           ; BRANCH OCCURS                   ; |190| 


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
	.global	__divf
