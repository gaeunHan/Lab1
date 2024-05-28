;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Tue May 28 15:51:30 2024                                *
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

	.global	_TINTCnt
_TINTCnt:	.usect	.far,4,4
	.global	_timerCheckCnt
_timerCheckCnt:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_R_pend+0,32
	.word	043340000h		; _R_pend @ 0
	.sect	".text"
	.global	_R_pend
_R_pend:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_R_cart+0,32
	.word	000000000h		; _R_cart @ 0
	.sect	".text"
	.global	_R_cart
_R_cart:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI18264_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI18264_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
           MV      .S2X    A4,B4             ; |107| 
           SPDP    .S2     B4,B5:B4          ; |116| 
           ZERO    .D2     B6                ; |116| 
           MVKL    .S2     0xc048c000,B7     ; |116| 
           MVKH    .S2     0xc048c000,B7     ; |116| 

           CMPLTDP .S2     B5:B4,B7:B6,B0    ; |116| 
||         ZERO    .D1     A0                ; |117| 
||         STW     .D2T2   B3,*SP--(16)      ; |107| 

           STW     .D2T1   A4,*+SP(4)        ; |107| 
||         MVKH    .S1     0xc2460000,A0     ; |117| 

   [ B0]   STW     .D2T1   A0,*+SP(4)        ; |117| 
           LDW     .D2T2   *+SP(4),B4        ; |120| 
           MVKL    .S1     0x4048c000,A1     ; |120| 
           ZERO    .D1     A0                ; |120| 
           MVKL    .S2     RL4,B3            ; |125| 
           MVKH    .S2     RL4,B3            ; |125| 
           SPDP    .S2     B4,B5:B4          ; |120| 
           MVKH    .S1     0x4048c000,A1     ; |120| 
           CMPGTDP .S1X    B5:B4,A1:A0,A1    ; |120| 
           MVKL    .S2     __divd,B8         ; |125| 
           MVKH    .S1     0x42460000,A0     ; |121| 
   [ A1]   STW     .D2T1   A0,*+SP(4)        ; |121| 
           LDW     .D2T2   *+SP(4),B4        ; |125| 
           ZERO    .D1     A0                ; |125| 
           MVKH    .S1     0x42480000,A0     ; |125| 
           MVKH    .S2     __divd,B8         ; |125| 
           NOP             1
           ADDSP   .L2X    A0,B4,B5          ; |125| 
           MVKL    .S2     0x457ff000,B4     ; |125| 
           MVKH    .S2     0x457ff000,B4     ; |125| 
           NOP             1
           MPYSP   .M2     B4,B5,B4          ; |125| 
           ZERO    .D2     B5                ; |125| 
           MVKH    .S2     0x40590000,B5     ; |125| 
           B       .S2     B8                ; |125| 
           SPDP    .S2     B4,B7:B6          ; |125| 
           ZERO    .D2     B4                ; |125| 
           MV      .S1X    B6,A4             ; |125| 
           NOP             1
           MV      .S1X    B7,A5             ; |125| 
RL4:       ; CALL OCCURS                     ; |125| 
           DPSP    .L1     A5:A4,A0          ; |125| 
           NOP             3
           MV      .S2X    A0,B4             ; |125| 
           SPTRUNC .L2     B4,B4             ; |127| 
           STW     .D2T1   A0,*+SP(8)        ; |125| 
           MVKL    .S1     0x2000088,A0      ; |127| 
           MVKH    .S1     0x2000088,A0      ; |127| 
           STW     .D1T2   B4,*A0            ; |127| 
           LDW     .D2T1   *+SP(4),A4        ; |129| 
           LDW     .D2T2   *++SP(16),B3      ; |130| 
           NOP             4
           B       .S2     B3                ; |130| 
           NOP             5
           ; BRANCH OCCURS                   ; |130| 


	.sect	".text"
	.global	_GetCartPos

;******************************************************************************
;* FUNCTION NAME: _GetCartPos                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,A4,B4,B5,B6,SP                              *
;*   Regs Used         : A0,A1,A3,A4,B3,B4,B5,B6,SP                           *
;*   Local Frame Size  : 0 Args + 12 Auto + 0 Save = 12 byte                  *
;******************************************************************************
_GetCartPos:
;** --------------------------------------------------------------------------*
           MVKL    .S2     0x200020c,B4      ; |139| 
           MVKH    .S2     0x200020c,B4      ; |139| 
           LDW     .D2T2   *B4,B4            ; |139| 
           NOP             4

           EXTU    .S2     B4,16,16,B4       ; |139| 
||         SUB     .D2     SP,16,SP          ; |133| 

           STH     .D2T2   B4,*+SP(4)        ; |139| 
           LDH     .D2T2   *+SP(4),B5        ; |142| 
           LDH     .D2T2   *+SP(4),B6        ; |142| 
           LDH     .D2T2   *+SP(4),B4        ; |143| 
           NOP             2

           MVK     .S1     32767,A3          ; |142| 
||         ZERO    .D1     A0                ; |143| 

           CMPGT   .L1X    B5,A3,A1          ; |142| 
||         MVKH    .S1     0x10000,A0        ; |143| 

   [!A1]   STW     .D2T2   B6,*+SP(8)        ; |142| 
||         SUB     .L2X    B4,A0,B4          ; |143| 

   [ A1]   STW     .D2T2   B4,*+SP(8)        ; |143| 
           LDW     .D2T2   *+SP(8),B4        ; |146| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |146| 
           NOP             2
           MVKL    .S1     0x3fd68000,A1     ; |146| 

           MVKH    .S1     0x3fd68000,A1     ; |146| 
||         ZERO    .D1     A0                ; |146| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |146| 
           NOP             8
           B       .S2     B3                ; |148| 
           DPSP    .L1     A1:A0,A0          ; |146| 
           NOP             3

           ADDK    .S2     16,SP             ; |148| 
||         STW     .D2T1   A0,*+SP(12)       ; |146| 
||         MV      .D1     A0,A4             ; |146| 

           ; BRANCH OCCURS                   ; |148| 


	.sect	".text"
	.global	_GetPendulumPos

;******************************************************************************
;* FUNCTION NAME: _GetPendulumPos                                             *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,A4,B4,B5,B6,SP                              *
;*   Regs Used         : A0,A1,A3,A4,B3,B4,B5,B6,SP                           *
;*   Local Frame Size  : 0 Args + 12 Auto + 0 Save = 12 byte                  *
;******************************************************************************
_GetPendulumPos:
;** --------------------------------------------------------------------------*
           MVKL    .S2     0x2000210,B4      ; |156| 
           MVKH    .S2     0x2000210,B4      ; |156| 
           LDW     .D2T2   *B4,B4            ; |156| 
           NOP             4

           EXTU    .S2     B4,16,16,B4       ; |156| 
||         SUB     .D2     SP,16,SP          ; |150| 

           STH     .D2T2   B4,*+SP(4)        ; |156| 
           LDH     .D2T2   *+SP(4),B5        ; |159| 
           LDH     .D2T2   *+SP(4),B6        ; |159| 
           LDH     .D2T2   *+SP(4),B4        ; |160| 
           NOP             2

           MVK     .S1     32767,A3          ; |159| 
||         ZERO    .D1     A0                ; |160| 

           CMPGT   .L1X    B5,A3,A1          ; |159| 
||         MVKH    .S1     0x10000,A0        ; |160| 

   [!A1]   STW     .D2T2   B6,*+SP(8)        ; |159| 
||         SUB     .L2X    B4,A0,B4          ; |160| 

   [ A1]   STW     .D2T2   B4,*+SP(8)        ; |160| 
           LDW     .D2T2   *+SP(8),B4        ; |163| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |163| 
           NOP             2
           MVKL    .S1     0x3fd68000,A1     ; |163| 

           MVKH    .S1     0x3fd68000,A1     ; |163| 
||         ZERO    .D1     A0                ; |163| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |163| 
           NOP             8
           B       .S2     B3                ; |166| 
           DPSP    .L1     A1:A0,A0          ; |163| 
           NOP             3

           ADDK    .S2     16,SP             ; |166| 
||         STW     .D2T1   A0,*+SP(12)       ; |163| 
||         MV      .D1     A0,A4             ; |163| 

           ; BRANCH OCCURS                   ; |166| 


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
           MVKL    .S1     _InitEXINTF,A0    ; |178| 
           MVKH    .S1     _InitEXINTF,A0    ; |178| 
           B       .S2X    A0                ; |178| 
           STW     .D2T2   B3,*SP--(24)      ; |177| 
           MVKL    .S2     RL10,B3           ; |178| 
           MVKH    .S2     RL10,B3           ; |178| 
           NOP             2
RL10:      ; CALL OCCURS                     ; |178| 
           MVKL    .S1     _InitTimer,A0     ; |179| 
           MVKH    .S1     _InitTimer,A0     ; |179| 
           B       .S2X    A0                ; |179| 
           MVKL    .S2     RL12,B3           ; |179| 
           MVKH    .S2     RL12,B3           ; |179| 
           NOP             3
RL12:      ; CALL OCCURS                     ; |179| 
           MVKL    .S2     _InitUART,B4      ; |180| 
           MVKH    .S2     _InitUART,B4      ; |180| 
           B       .S2     B4                ; |180| 
           MVKL    .S2     RL14,B3           ; |180| 
           MVKH    .S2     RL14,B3           ; |180| 
           NOP             3
RL14:      ; CALL OCCURS                     ; |180| 
           MVKL    .S1     _InitINT,A0       ; |181| 
           MVKH    .S1     _InitINT,A0       ; |181| 
           B       .S2X    A0                ; |181| 
           MVKL    .S2     RL16,B3           ; |181| 
           MVKH    .S2     RL16,B3           ; |181| 
           NOP             3
RL16:      ; CALL OCCURS                     ; |181| 
           MVKL    .S1     _InitUSBMon,A0    ; |182| 
           MVKH    .S1     _InitUSBMon,A0    ; |182| 
           B       .S2X    A0                ; |182| 
           MVKL    .S2     RL18,B3           ; |182| 
           MVKH    .S2     RL18,B3           ; |182| 
           NOP             3
RL18:      ; CALL OCCURS                     ; |182| 
           MVKL    .S1     _sprintf,A0       ; |184| 

           MVKH    .S1     _sprintf,A0       ; |184| 
||         MVKL    .S2     SL1+0,B5          ; |184| 

           B       .S2X    A0                ; |184| 
           MVKL    .S2     RL20,B3           ; |184| 
           MVKH    .S2     SL1+0,B5          ; |184| 
           MVKL    .S2     _tmp_string,B4    ; |184| 
           MVKH    .S2     _tmp_string,B4    ; |184| 

           MVKH    .S2     RL20,B3           ; |184| 
||         STW     .D2T2   B5,*+SP(4)        ; |184| 
||         MV      .S1X    B4,A4             ; |184| 

RL20:      ; CALL OCCURS                     ; |184| 
           MVKL    .S1     _Report,A0        ; |184| 
           MVKH    .S1     _Report,A0        ; |184| 
           B       .S2X    A0                ; |184| 
           MVKL    .S2     RL22,B3           ; |184| 
           MVKH    .S2     RL22,B3           ; |184| 
           NOP             3
RL22:      ; CALL OCCURS                     ; |184| 
           MVK     .S1     2024,A0           ; |185| 

           MVKL    .S1     _sprintf,A0       ; |185| 
||         STW     .D2T1   A0,*+SP(8)        ; |185| 

           MVKH    .S1     _sprintf,A0       ; |185| 
||         MVKL    .S2     _tmp_string,B5    ; |185| 

           B       .S2X    A0                ; |185| 
           MVKL    .S2     SL2+0,B4          ; |185| 
           MVKH    .S2     _tmp_string,B5    ; |185| 
           MVKH    .S2     SL2+0,B4          ; |185| 
           MVKL    .S2     RL24,B3           ; |185| 

           MVKH    .S2     RL24,B3           ; |185| 
||         STW     .D2T2   B4,*+SP(4)        ; |185| 
||         MV      .S1X    B5,A4             ; |185| 

RL24:      ; CALL OCCURS                     ; |185| 
           MVKL    .S1     _Report,A0        ; |185| 
           MVKH    .S1     _Report,A0        ; |185| 
           B       .S2X    A0                ; |185| 
           MVKL    .S2     RL26,B3           ; |185| 
           MVKH    .S2     RL26,B3           ; |185| 
           NOP             3
RL26:      ; CALL OCCURS                     ; |185| 
           MVKL    .S2     SL3+0,B4          ; |186| 
           MVKL    .S2     0x20003fc,B5      ; |186| 
           MVKH    .S2     SL3+0,B4          ; |186| 

           STW     .D2T2   B4,*+SP(4)        ; |186| 
||         MVKH    .S2     0x20003fc,B5      ; |186| 

           LDW     .D2T2   *B5,B4            ; |186| 
           MVKL    .S1     0x20003fc,A0      ; |186| 
           MVKH    .S1     0x20003fc,A0      ; |186| 
           MVKL    .S1     _tmp_string,A4    ; |186| 
           MVKL    .S2     RL28,B3           ; |186| 
           EXTU    .S2     B4,16,24,B4       ; |186| 
           STW     .D2T2   B4,*+SP(8)        ; |186| 

           MVKL    .S1     _sprintf,A0       ; |186| 
||         LDW     .D1T1   *A0,A3            ; |186| 

           MVKH    .S1     _sprintf,A0       ; |186| 
           B       .S2X    A0                ; |186| 
           MVKH    .S1     _tmp_string,A4    ; |186| 
           MVKH    .S2     RL28,B3           ; |186| 
           NOP             1
           EXTU    .S1     A3,24,24,A3       ; |186| 
           STW     .D2T1   A3,*+SP(12)       ; |186| 
RL28:      ; CALL OCCURS                     ; |186| 
           MVKL    .S1     _Report,A0        ; |186| 
           MVKH    .S1     _Report,A0        ; |186| 
           B       .S2X    A0                ; |186| 
           MVKL    .S2     RL30,B3           ; |186| 
           MVKH    .S2     RL30,B3           ; |186| 
           NOP             3
RL30:      ; CALL OCCURS                     ; |186| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |190| 
           MVKH    .S1     _GIE,A0           ; |190| 
           B       .S2X    A0                ; |190| 
           MVKL    .S2     _TFlag,B4         ; |188| 
           MVKL    .S2     RL32,B3           ; |190| 
           MVKH    .S2     _TFlag,B4         ; |188| 
           ZERO    .D2     B5                ; |188| 

           STW     .D2T2   B5,*B4            ; |188| 
||         MVKH    .S2     RL32,B3           ; |190| 

RL32:      ; CALL OCCURS                     ; |190| 
           MVKL    .S2     _WaitTFlagCnt,B7  ; |195| 
           MVKL    .S2     0x200008c,B6      ; |193| 
           MVKH    .S2     _WaitTFlagCnt,B7  ; |195| 
           MVKH    .S2     0x200008c,B6      ; |193| 
           MVKL    .S2     0x200004c,B5      ; |191| 
           B       .S2     B7                ; |195| 
           MVKH    .S2     0x200004c,B5      ; |191| 

           MVKL    .S2     0x2000080,B4      ; |192| 
||         MVK     .S1     1,A0              ; |191| 

           STW     .D2T1   A0,*B5            ; |191| 
||         MVKH    .S2     0x2000080,B4      ; |192| 

           STW     .D2T1   A0,*B4            ; |192| 
||         MVKL    .S2     RL34,B3           ; |195| 

           STW     .D2T1   A0,*B6            ; |193| 
||         MVKH    .S2     RL34,B3           ; |195| 
||         MVK     .S1     0x3e8,A4          ; |195| 

RL34:      ; CALL OCCURS                     ; |195| 
           MVKL    .S1     _TINTCnt,A0       ; |197| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L9
;** --------------------------------------------------------------------------*
L9:    

           MVKH    .S1     _TINTCnt,A0       ; |197| 
||         ZERO    .D1     A3                ; |197| 

           STW     .D1T1   A3,*A0            ; |197| 
           MVKL    .S1     0x200004c,A0      ; |200| 
           MVKH    .S1     0x200004c,A0      ; |200| 
           LDW     .D1T1   *A0,A3            ; |200| 
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L10:    
           MVKL    .S2     _TINTCnt,B4       ; |203| 
           MVKH    .S2     _TINTCnt,B4       ; |203| 
           XOR     .S1     1,A3,A3           ; |200| 
           STW     .D1T1   A3,*A0            ; |200| 
           LDW     .D2T2   *B4,B4            ; |203| 
           MVK     .S2     1000,B5           ; |203| 
           NOP             3
           CMPGTU  .L2     B4,B5,B0          ; |203| 
   [!B0]   B       .S1     L10               ; |203| 
   [!B0]   MVKL    .S1     0x200004c,A0      ; |200| 
   [!B0]   MVKH    .S1     0x200004c,A0      ; |200| 

   [ B0]   MVKL    .S1     _timerCheckCnt,A0 ; |205| 
|| [!B0]   LDW     .D1T1   *A0,A3            ; |200| 

   [ B0]   MVKH    .S1     _timerCheckCnt,A0 ; |205| 
   [ B0]   LDW     .D1T1   *A0,A3            ; |205| 
           ; BRANCH OCCURS                   ; |203| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     SL4+0,B4          ; |206| 
           MVKL    .S2     _timerCheckCnt,B5 ; |206| 
           MVKH    .S2     SL4+0,B4          ; |206| 
           MVKH    .S2     _timerCheckCnt,B5 ; |206| 
           ADD     .D1     1,A3,A3           ; |205| 

           MVKL    .S1     _sprintf,A0       ; |206| 
||         STW     .D1T1   A3,*A0            ; |205| 

           STW     .D2T2   B4,*+SP(4)        ; |206| 
||         MVKH    .S1     _sprintf,A0       ; |206| 

           B       .S2X    A0                ; |206| 
||         LDW     .D2T2   *B5,B4            ; |206| 

           MVKL    .S2     RL36,B3           ; |206| 
           MVKH    .S2     RL36,B3           ; |206| 
           NOP             1
           MVKL    .S1     _tmp_string,A4    ; |206| 

           MVKH    .S1     _tmp_string,A4    ; |206| 
||         STW     .D2T2   B4,*+SP(8)        ; |206| 

RL36:      ; CALL OCCURS                     ; |206| 
           MVKL    .S1     _Report,A0        ; |206| 
           MVKH    .S1     _Report,A0        ; |206| 
           B       .S2X    A0                ; |206| 
           MVKL    .S2     RL38,B3           ; |206| 
           MVKH    .S2     RL38,B3           ; |206| 
           NOP             3
RL38:      ; CALL OCCURS                     ; |206| 
           MVKL    .S1     _GetPendulumPos,A0 ; |209| 
           MVKH    .S1     _GetPendulumPos,A0 ; |209| 
           B       .S2X    A0                ; |209| 
           MVKL    .S2     RL42,B3           ; |209| 
           MVKH    .S2     RL42,B3           ; |209| 
           NOP             3
RL42:      ; CALL OCCURS                     ; |209| 
           SPDP    .S2X    A4,B7:B6          ; |209| 
           MVKL    .S1     _sprintf,A0       ; |209| 

           MVKH    .S1     _sprintf,A0       ; |209| 
||         MVKL    .S2     SL5+0,B9          ; |209| 

           B       .S2X    A0                ; |209| 
           MVKL    .S2     _tmp_string,B8    ; |209| 
           MVKH    .S2     SL5+0,B9          ; |209| 

           MVKH    .S2     _tmp_string,B8    ; |209| 
||         MV      .L2     B6,B5             ; |209| 
||         STW     .D2T2   B9,*+SP(4)        ; |209| 

           MV      .L2     B7,B4             ; |209| 
||         MVKL    .S2     RL44,B3           ; |209| 
||         STW     .D2T2   B5,*+SP(8)        ; |209| 

           MV      .S1X    B8,A4             ; |209| 
||         MVKH    .S2     RL44,B3           ; |209| 
||         STW     .D2T2   B4,*+SP(12)       ; |209| 

RL44:      ; CALL OCCURS                     ; |209| 
           MVKL    .S1     _Report,A0        ; |209| 
           MVKH    .S1     _Report,A0        ; |209| 
           B       .S2X    A0                ; |209| 
           MVKL    .S2     RL46,B3           ; |209| 
           MVKH    .S2     RL46,B3           ; |209| 
           NOP             3
RL46:      ; CALL OCCURS                     ; |209| 
           MVKL    .S1     _GetCartPos,A0    ; |212| 
           MVKH    .S1     _GetCartPos,A0    ; |212| 
           B       .S2X    A0                ; |212| 
           MVKL    .S2     RL50,B3           ; |212| 
           MVKH    .S2     RL50,B3           ; |212| 
           NOP             3
RL50:      ; CALL OCCURS                     ; |212| 
           SPDP    .S1     A4,A5:A4          ; |212| 
           MVKL    .S2     RL52,B3           ; |212| 
           MV      .D1     A5,A0             ; |212| 

           MVKL    .S1     _sprintf,A0       ; |212| 
||         STW     .D2T1   A0,*+SP(12)       ; |212| 

           MVKH    .S1     _sprintf,A0       ; |212| 
           B       .S2X    A0                ; |212| 
           MVKL    .S2     SL6+0,B5          ; |212| 
           MVKH    .S2     SL6+0,B5          ; |212| 
           MVKL    .S2     _tmp_string,B4    ; |212| 

           MVKH    .S2     _tmp_string,B4    ; |212| 
||         MV      .D1     A4,A3             ; |212| 
||         STW     .D2T2   B5,*+SP(4)        ; |212| 

           MVKH    .S2     RL52,B3           ; |212| 
||         MV      .S1X    B4,A4             ; |212| 
||         STW     .D2T1   A3,*+SP(8)        ; |212| 

RL52:      ; CALL OCCURS                     ; |212| 
           MVKL    .S1     _Report,A0        ; |212| 
           MVKH    .S1     _Report,A0        ; |212| 
           B       .S2X    A0                ; |212| 
           MVKL    .S2     RL54,B3           ; |212| 
           MVKH    .S2     RL54,B3           ; |212| 
           NOP             3
RL54:      ; CALL OCCURS                     ; |212| 
           MVKL    .S2     _sprintf,B4       ; |213| 
           MVKH    .S2     _sprintf,B4       ; |213| 
           B       .S2     B4                ; |213| 
           MVKL    .S2     SL7+0,B5          ; |213| 
           MVKH    .S2     SL7+0,B5          ; |213| 
           MVKL    .S1     _tmp_string,A4    ; |213| 
           MVKL    .S2     RL56,B3           ; |213| 

           MVKH    .S1     _tmp_string,A4    ; |213| 
||         MVKH    .S2     RL56,B3           ; |213| 
||         STW     .D2T2   B5,*+SP(4)        ; |213| 

RL56:      ; CALL OCCURS                     ; |213| 
           MVKL    .S2     _Report,B4        ; |213| 
           MVKH    .S2     _Report,B4        ; |213| 
           B       .S2     B4                ; |213| 
           MVKL    .S2     RL58,B3           ; |213| 
           MVKH    .S2     RL58,B3           ; |213| 
           NOP             3
RL58:      ; CALL OCCURS                     ; |213| 
           B       .S1     L9                ; |216| 
           MVKL    .S1     _TINTCnt,A0       ; |197| 
           NOP             4
           ; BRANCH OCCURS                   ; |216| 


;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
SL1:	.string	13,10,13,10,0
SL2:	.string	"Mechatronics Course %d",13,10,0
SL3:	.string	"FPGA Ver%2x.%02x",13,10,0
SL4:	.string	"==== Timer Check: %d ====",13,10,0
SL5:	.string	"pendulum pos: %6.2f ",13,10,0
SL6:	.string	"cart encoder: %6.2f ",13,10,0
SL7:	.string	13,10,0
;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_sprintf
	.global	_InitUART
	.global	_Report
	.global	_InitUSBMon
	.global	_tmp_string
	.global	_TFlag
	.global	__divd
