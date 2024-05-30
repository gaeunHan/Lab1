;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Thu May 30 11:25:39 2024                                *
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

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_R_swup_cart+0,32
	.word	000000000h		; _R_swup_cart @ 0
	.sect	".text"
	.global	_R_swup_cart
_R_swup_cart:	.usect	.far,4,4
	.global	_mode
_mode:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI17980_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI17980_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
           ZERO    .D1     A0                ; |32| 
           MVKH    .S1     0x1800000,A0      ; |32| 
           LDW     .D1T1   *A0,A4            ; |32| 
           MVKL    .S2     0x1800008,B5      ; |35| 
           MVKL    .S2     0x21520521,B6     ; |47| 
           B       .S2     B3                ; |57| 

           MVKL    .S2     0x1800010,B4      ; |47| 
||         MVKL    .S1     0xd00321,A3       ; |35| 

           CLR     .S1     A4,3,5,A4         ; |32| 
||         MVKH    .S2     0x1800008,B5      ; |35| 

           STW     .D1T1   A4,*A0            ; |32| 
||         MVKH    .S2     0x21520521,B6     ; |47| 
||         MVKH    .S1     0xd00321,A3       ; |35| 

           STW     .D2T1   A3,*B5            ; |35| 
||         MVKH    .S2     0x1800010,B4      ; |47| 

           STW     .D2T2   B6,*B4            ; |47| 
           ; BRANCH OCCURS                   ; |57| 


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
           ZERO    .D2     B4                ; |62| 
           MVKH    .S2     0x1940000,B4      ; |62| 
           LDW     .D2T2   *B4,B5            ; |62| 
           MVKL    .S1     0x1940004,A0      ; |65| 
           MVKH    .S1     0x1940004,A0      ; |65| 
           ZERO    .D1     A3                ; |68| 
           MVKH    .S1     0x1940000,A3      ; |68| 
           SET     .S2     B5,8,9,B5         ; |62| 

           MVK     .S2     20000,B4          ; |65| 
||         STW     .D2T2   B5,*B4            ; |62| 

           STW     .D1T2   B4,*A0            ; |65| 
           LDW     .D1T1   *A3,A0            ; |68| 
           B       .S2     B3                ; |69| 
           NOP             3
           SET     .S1     A0,6,7,A0         ; |68| 
           STW     .D1T1   A0,*A3            ; |68| 
           ; BRANCH OCCURS                   ; |69| 


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
           MVC     .S2     IER,B4            ; |74| 
           MVK     .S1     16450,A0          ; |74| 
           OR      .S2X    A0,B4,B4          ; |74| 
           MVC     .S2     B4,IER            ; |74| 
           B       .S2     B3                ; |75| 
           NOP             5
           ; BRANCH OCCURS                   ; |75| 


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
           MVC     .S2     CSR,B4            ; |80| 
           OR      .S2     1,B4,B4           ; |80| 
           MVC     .S2     B4,CSR            ; |80| 
           B       .S2     B3                ; |81| 
           NOP             5
           ; BRANCH OCCURS                   ; |81| 


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
           MV      .S2X    A4,B4             ; |85| 
           SHL     .S2     B4,4,B5           ; |88| 

           ZERO    .S2     B4                ; |88| 
||         SUBAH   .D2     B5,B4,B5          ; |88| 

           CMPLTU  .L2     B4,B5,B0          ; |88| 
   [!B0]   B       .S1     L2                ; |88| 
           SUB     .D2     SP,8,SP           ; |85| 
           STW     .D2T1   A4,*+SP(4)        ; |85| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |88| 
           NOP             2
           ; BRANCH OCCURS                   ; |88| 
;** --------------------------------------------------------------------------*
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L1:    
           SHL     .S2     B5,4,B6           ; |88| 

           SUBAH   .D2     B6,B5,B5          ; |88| 
||         ADD     .S2     1,B4,B4           ; |88| 

           CMPLTU  .L2     B4,B5,B0          ; |88| 
   [ B0]   B       .S1     L1                ; |88| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |88| 
           NOP             4
           ; BRANCH OCCURS                   ; |88| 
;** --------------------------------------------------------------------------*
L2:    
           B       .S2     B3                ; |89| 
           ADD     .D2     8,SP,SP           ; |89| 
           NOP             4
           ; BRANCH OCCURS                   ; |89| 


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
           ZERO    .D2     B7                ; |96| 
           CMPLTU  .L2X    B7,A4,B0
   [!B0]   B       .S1     L4                ; |96| 
           SUB     .D2     SP,8,SP           ; |93| 
           STW     .D2T1   A4,*+SP(4)        ; |93| 
           MV      .L2     B3,B9             ; |93| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |97| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |97| 
           ; BRANCH OCCURS                   ; |96| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L3:    
           B       .S2     B4                ; |97| 
           MVKL    .S2     RL0,B3            ; |97| 
           MVKH    .S2     RL0,B3            ; |97| 
           MVK     .S1     0x3e8,A4          ; |97| 
           NOP             2
RL0:       ; CALL OCCURS                     ; |97| 
           LDW     .D2T2   *+SP(4),B4        ; |98| 
           ADD     .D2     1,B7,B7           ; |98| 
           NOP             3
           CMPLTU  .L2     B7,B4,B0          ; |98| 
   [ B0]   B       .S1     L3                ; |98| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |97| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |97| 
           NOP             3
           ; BRANCH OCCURS                   ; |98| 
;** --------------------------------------------------------------------------*
L4:    
           B       .S2     B9                ; |99| 
           ADD     .D2     8,SP,SP           ; |99| 
           NOP             4
           ; BRANCH OCCURS                   ; |99| 


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
           MVKL    .S1     _TFlag,A0         ; |104| 
           MVKH    .S1     _TFlag,A0         ; |104| 
           LDW     .D1T1   *A0,A1            ; |104| 
           NOP             4
   [ A1]   B       .S1     L6                ; |104| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |104| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |104| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |104| 
           NOP             2
           ; BRANCH OCCURS                   ; |104| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L5:    
           NOP             2
   [!A1]   B       .S1     L5                ; |104| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |104| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |104| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |104| 
           NOP             2
           ; BRANCH OCCURS                   ; |104| 
;** --------------------------------------------------------------------------*
L6:    
           B       .S2     B3                ; |106| 
           MVKL    .S1     _TFlag,A0         ; |105| 
           MVKH    .S1     _TFlag,A0         ; |105| 
           ZERO    .D1     A3                ; |105| 
           STW     .D1T1   A3,*A0            ; |105| 
           NOP             1
           ; BRANCH OCCURS                   ; |106| 


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

           SUB     .D2     SP,8,SP           ; |110| 
||         MVKL    .S1     _TFlag,A0         ; |113| 

           STW     .D2T1   A4,*+SP(4)        ; |110| 
||         MVKH    .S1     _TFlag,A0         ; |113| 
||         ZERO    .D1     A3                ; |113| 

           STW     .D1T1   A3,*A0            ; |113| 
           LDW     .D2T2   *+SP(4),B5        ; |115| 
           ZERO    .D2     B4                ; |115| 
           STW     .D2T2   B4,*+SP(8)        ; |115| 
           MV      .S2     B3,B9             ; |110| 
           NOP             1
           CMPLTU  .L2     B4,B5,B0          ; |115| 
   [!B0]   B       .S1     L8                ; |115| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |116| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |116| 
           NOP             3
           ; BRANCH OCCURS                   ; |115| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L7:    
           B       .S2X    A0                ; |116| 
           MVKL    .S2     RL2,B3            ; |116| 
           MVKH    .S2     RL2,B3            ; |116| 
           NOP             3
RL2:       ; CALL OCCURS                     ; |116| 
           LDW     .D2T2   *+SP(8),B4        ; |117| 
           LDW     .D2T2   *+SP(4),B5        ; |117| 
           NOP             3
           ADD     .D2     1,B4,B4           ; |117| 
           CMPLTU  .L2     B4,B5,B0          ; |117| 
   [ B0]   B       .S1     L7                ; |117| 
           STW     .D2T2   B4,*+SP(8)        ; |117| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |116| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |116| 
           NOP             2
           ; BRANCH OCCURS                   ; |117| 
;** --------------------------------------------------------------------------*
L8:    
           B       .S2     B9                ; |118| 
           ADD     .D2     8,SP,SP           ; |118| 
           NOP             4
           ; BRANCH OCCURS                   ; |118| 


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
           MV      .S2X    A4,B4             ; |121| 
           SPDP    .S2     B4,B5:B4          ; |130| 
           ZERO    .D2     B6                ; |130| 
           MVKL    .S2     0xc048c000,B7     ; |130| 
           MVKH    .S2     0xc048c000,B7     ; |130| 

           CMPLTDP .S2     B5:B4,B7:B6,B0    ; |130| 
||         ZERO    .D1     A0                ; |131| 
||         STW     .D2T2   B3,*SP--(16)      ; |121| 

           STW     .D2T1   A4,*+SP(4)        ; |121| 
||         MVKH    .S1     0xc2460000,A0     ; |131| 

   [ B0]   STW     .D2T1   A0,*+SP(4)        ; |131| 
           LDW     .D2T2   *+SP(4),B4        ; |134| 
           MVKL    .S1     0x4048c000,A1     ; |134| 
           ZERO    .D1     A0                ; |134| 
           MVKL    .S2     RL4,B3            ; |139| 
           MVKH    .S2     RL4,B3            ; |139| 
           SPDP    .S2     B4,B5:B4          ; |134| 
           MVKH    .S1     0x4048c000,A1     ; |134| 
           CMPGTDP .S1X    B5:B4,A1:A0,A1    ; |134| 
           MVKL    .S2     __divd,B8         ; |139| 
           MVKH    .S1     0x42460000,A0     ; |135| 
   [ A1]   STW     .D2T1   A0,*+SP(4)        ; |135| 
           LDW     .D2T2   *+SP(4),B4        ; |139| 
           ZERO    .D1     A0                ; |139| 
           MVKH    .S1     0x42480000,A0     ; |139| 
           MVKH    .S2     __divd,B8         ; |139| 
           NOP             1
           ADDSP   .L2X    A0,B4,B5          ; |139| 
           MVKL    .S2     0x457ff000,B4     ; |139| 
           MVKH    .S2     0x457ff000,B4     ; |139| 
           NOP             1
           MPYSP   .M2     B4,B5,B4          ; |139| 
           ZERO    .D2     B5                ; |139| 
           MVKH    .S2     0x40590000,B5     ; |139| 
           B       .S2     B8                ; |139| 
           SPDP    .S2     B4,B7:B6          ; |139| 
           ZERO    .D2     B4                ; |139| 
           MV      .S1X    B6,A4             ; |139| 
           NOP             1
           MV      .S1X    B7,A5             ; |139| 
RL4:       ; CALL OCCURS                     ; |139| 
           DPSP    .L1     A5:A4,A0          ; |139| 
           NOP             3
           MV      .S2X    A0,B4             ; |139| 
           SPTRUNC .L2     B4,B4             ; |141| 
           STW     .D2T1   A0,*+SP(8)        ; |139| 
           MVKL    .S1     0x2000088,A0      ; |141| 
           MVKH    .S1     0x2000088,A0      ; |141| 
           STW     .D1T2   B4,*A0            ; |141| 
           LDW     .D2T1   *+SP(4),A4        ; |143| 
           LDW     .D2T2   *++SP(16),B3      ; |144| 
           NOP             4
           B       .S2     B3                ; |144| 
           NOP             5
           ; BRANCH OCCURS                   ; |144| 


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
           MVKL    .S2     0x200020c,B4      ; |152| 
           MVKH    .S2     0x200020c,B4      ; |152| 
           LDW     .D2T2   *B4,B4            ; |152| 
           NOP             4

           EXTU    .S2     B4,16,16,B4       ; |152| 
||         SUB     .D2     SP,16,SP          ; |146| 

           STH     .D2T2   B4,*+SP(4)        ; |152| 
           LDH     .D2T2   *+SP(4),B5        ; |155| 
           LDH     .D2T2   *+SP(4),B6        ; |155| 
           LDH     .D2T2   *+SP(4),B4        ; |156| 
           NOP             2

           MVK     .S1     32767,A3          ; |155| 
||         ZERO    .D1     A0                ; |156| 

           CMPGT   .L1X    B5,A3,A1          ; |155| 
||         MVKH    .S1     0x10000,A0        ; |156| 

   [!A1]   STW     .D2T2   B6,*+SP(8)        ; |155| 
||         SUB     .L2X    B4,A0,B4          ; |156| 

   [ A1]   STW     .D2T2   B4,*+SP(8)        ; |156| 
           LDW     .D2T2   *+SP(8),B4        ; |159| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |159| 
           NOP             2
           MVKL    .S1     0x3fd68000,A1     ; |159| 

           MVKH    .S1     0x3fd68000,A1     ; |159| 
||         ZERO    .D1     A0                ; |159| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |159| 
           NOP             8
           B       .S2     B3                ; |161| 
           DPSP    .L1     A1:A0,A0          ; |159| 
           NOP             3

           ADDK    .S2     16,SP             ; |161| 
||         STW     .D2T1   A0,*+SP(12)       ; |159| 
||         MV      .D1     A0,A4             ; |159| 

           ; BRANCH OCCURS                   ; |161| 


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
           MVKL    .S2     0x2000210,B4      ; |169| 
           MVKH    .S2     0x2000210,B4      ; |169| 
           LDW     .D2T2   *B4,B4            ; |169| 
           NOP             4

           EXTU    .S2     B4,16,16,B4       ; |169| 
||         SUB     .D2     SP,16,SP          ; |163| 

           STH     .D2T2   B4,*+SP(4)        ; |169| 
           LDH     .D2T2   *+SP(4),B5        ; |172| 
           LDH     .D2T2   *+SP(4),B6        ; |172| 
           LDH     .D2T2   *+SP(4),B4        ; |173| 
           NOP             2

           MVK     .S1     32767,A3          ; |172| 
||         ZERO    .D1     A0                ; |173| 

           CMPGT   .L1X    B5,A3,A1          ; |172| 
||         MVKH    .S1     0x10000,A0        ; |173| 

   [!A1]   STW     .D2T2   B6,*+SP(8)        ; |172| 
||         SUB     .L2X    B4,A0,B4          ; |173| 

   [ A1]   STW     .D2T2   B4,*+SP(8)        ; |173| 
           LDW     .D2T2   *+SP(8),B4        ; |176| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |176| 
           NOP             2
           MVKL    .S1     0x3fd68000,A1     ; |176| 

           MVKH    .S1     0x3fd68000,A1     ; |176| 
||         ZERO    .D1     A0                ; |176| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |176| 
           NOP             8
           B       .S2     B3                ; |179| 
           DPSP    .L1     A1:A0,A0          ; |176| 
           NOP             3

           ADDK    .S2     16,SP             ; |179| 
||         STW     .D2T1   A0,*+SP(12)       ; |176| 
||         MV      .D1     A0,A4             ; |176| 

           ; BRANCH OCCURS                   ; |179| 


	.sect	".text"
	.global	_swingUp

;******************************************************************************
;* FUNCTION NAME: _swingUp                                                    *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         : B3                                                   *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_swingUp:
;** --------------------------------------------------------------------------*
           B       .S2     B3                ; |183| 
           NOP             5
           ; BRANCH OCCURS                   ; |183| 


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
           MVKL    .S1     _InitEXINTF,A0    ; |187| 
           MVKH    .S1     _InitEXINTF,A0    ; |187| 
           B       .S2X    A0                ; |187| 
           STW     .D2T2   B3,*SP--(24)      ; |186| 
           MVKL    .S2     RL10,B3           ; |187| 
           MVKH    .S2     RL10,B3           ; |187| 
           NOP             2
RL10:      ; CALL OCCURS                     ; |187| 
           MVKL    .S1     _InitTimer,A0     ; |188| 
           MVKH    .S1     _InitTimer,A0     ; |188| 
           B       .S2X    A0                ; |188| 
           MVKL    .S2     RL12,B3           ; |188| 
           MVKH    .S2     RL12,B3           ; |188| 
           NOP             3
RL12:      ; CALL OCCURS                     ; |188| 
           MVKL    .S2     _InitUART,B4      ; |189| 
           MVKH    .S2     _InitUART,B4      ; |189| 
           B       .S2     B4                ; |189| 
           MVKL    .S2     RL14,B3           ; |189| 
           MVKH    .S2     RL14,B3           ; |189| 
           NOP             3
RL14:      ; CALL OCCURS                     ; |189| 
           MVKL    .S1     _InitINT,A0       ; |190| 
           MVKH    .S1     _InitINT,A0       ; |190| 
           B       .S2X    A0                ; |190| 
           MVKL    .S2     RL16,B3           ; |190| 
           MVKH    .S2     RL16,B3           ; |190| 
           NOP             3
RL16:      ; CALL OCCURS                     ; |190| 
           MVKL    .S1     _InitUSBMon,A0    ; |191| 
           MVKH    .S1     _InitUSBMon,A0    ; |191| 
           B       .S2X    A0                ; |191| 
           MVKL    .S2     RL18,B3           ; |191| 
           MVKH    .S2     RL18,B3           ; |191| 
           NOP             3
RL18:      ; CALL OCCURS                     ; |191| 
           MVKL    .S1     _sprintf,A0       ; |193| 

           MVKH    .S1     _sprintf,A0       ; |193| 
||         MVKL    .S2     SL1+0,B5          ; |193| 

           B       .S2X    A0                ; |193| 
           MVKL    .S2     RL20,B3           ; |193| 
           MVKH    .S2     SL1+0,B5          ; |193| 
           MVKL    .S2     _tmp_string,B4    ; |193| 
           MVKH    .S2     _tmp_string,B4    ; |193| 

           MVKH    .S2     RL20,B3           ; |193| 
||         STW     .D2T2   B5,*+SP(4)        ; |193| 
||         MV      .S1X    B4,A4             ; |193| 

RL20:      ; CALL OCCURS                     ; |193| 
           MVKL    .S1     _Report,A0        ; |193| 
           MVKH    .S1     _Report,A0        ; |193| 
           B       .S2X    A0                ; |193| 
           MVKL    .S2     RL22,B3           ; |193| 
           MVKH    .S2     RL22,B3           ; |193| 
           NOP             3
RL22:      ; CALL OCCURS                     ; |193| 
           MVK     .S1     2024,A0           ; |194| 

           MVKL    .S1     _sprintf,A0       ; |194| 
||         STW     .D2T1   A0,*+SP(8)        ; |194| 

           MVKH    .S1     _sprintf,A0       ; |194| 
||         MVKL    .S2     _tmp_string,B5    ; |194| 

           B       .S2X    A0                ; |194| 
           MVKL    .S2     SL2+0,B4          ; |194| 
           MVKH    .S2     _tmp_string,B5    ; |194| 
           MVKH    .S2     SL2+0,B4          ; |194| 
           MVKL    .S2     RL24,B3           ; |194| 

           MVKH    .S2     RL24,B3           ; |194| 
||         STW     .D2T2   B4,*+SP(4)        ; |194| 
||         MV      .S1X    B5,A4             ; |194| 

RL24:      ; CALL OCCURS                     ; |194| 
           MVKL    .S1     _Report,A0        ; |194| 
           MVKH    .S1     _Report,A0        ; |194| 
           B       .S2X    A0                ; |194| 
           MVKL    .S2     RL26,B3           ; |194| 
           MVKH    .S2     RL26,B3           ; |194| 
           NOP             3
RL26:      ; CALL OCCURS                     ; |194| 
           MVKL    .S2     SL3+0,B5          ; |195| 
           MVKH    .S2     SL3+0,B5          ; |195| 
           MVKL    .S2     0x20003fc,B4      ; |195| 

           STW     .D2T2   B5,*+SP(4)        ; |195| 
||         MVKH    .S2     0x20003fc,B4      ; |195| 

           LDW     .D2T2   *B4,B4            ; |195| 
           MVKL    .S1     0x20003fc,A0      ; |195| 
           MVKH    .S1     0x20003fc,A0      ; |195| 
           MVKL    .S1     _tmp_string,A4    ; |195| 
           MVKL    .S2     RL28,B3           ; |195| 
           EXTU    .S2     B4,16,24,B4       ; |195| 
           STW     .D2T2   B4,*+SP(8)        ; |195| 

           MVKL    .S1     _sprintf,A0       ; |195| 
||         LDW     .D1T1   *A0,A3            ; |195| 

           MVKH    .S1     _sprintf,A0       ; |195| 
           B       .S2X    A0                ; |195| 
           MVKH    .S1     _tmp_string,A4    ; |195| 
           MVKH    .S2     RL28,B3           ; |195| 
           EXTU    .S1     A3,24,24,A3       ; |195| 
           STW     .D2T1   A3,*+SP(12)       ; |195| 
           NOP             1
RL28:      ; CALL OCCURS                     ; |195| 
           MVKL    .S1     _Report,A0        ; |195| 
           MVKH    .S1     _Report,A0        ; |195| 
           B       .S2X    A0                ; |195| 
           MVKL    .S2     RL30,B3           ; |195| 
           MVKH    .S2     RL30,B3           ; |195| 
           NOP             3
RL30:      ; CALL OCCURS                     ; |195| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |199| 
           MVKH    .S1     _GIE,A0           ; |199| 
           B       .S2X    A0                ; |199| 
           MVKL    .S2     _TFlag,B4         ; |197| 
           MVKL    .S2     RL32,B3           ; |199| 
           MVKH    .S2     _TFlag,B4         ; |197| 
           ZERO    .D2     B5                ; |197| 

           STW     .D2T2   B5,*B4            ; |197| 
||         MVKH    .S2     RL32,B3           ; |199| 

RL32:      ; CALL OCCURS                     ; |199| 

           MVK     .S2     1,B6              ; |201| 
||         MVKL    .S1     _WaitTFlagCnt,A3  ; |204| 

           MVKL    .S2     0x200004c,B5      ; |200| 
||         MVKH    .S1     _WaitTFlagCnt,A3  ; |204| 

           B       .S2X    A3                ; |204| 

           MVKH    .S2     0x200004c,B5      ; |200| 
||         MVK     .S1     1,A4              ; |200| 

           MVKL    .S2     0x200008c,B4      ; |202| 
||         MVKL    .S1     0x2000080,A0      ; |201| 

           MVKL    .S2     RL34,B3           ; |204| 
||         STW     .D2T1   A4,*B5            ; |200| 
||         MVKH    .S1     0x2000080,A0      ; |201| 

           STW     .D1T2   B6,*A0            ; |201| 
||         MVKH    .S2     0x200008c,B4      ; |202| 
||         MVK     .S1     1,A5              ; |202| 

           STW     .D2T1   A5,*B4            ; |202| 
||         MVK     .S1     0x3e8,A4          ; |204| 
||         MVKH    .S2     RL34,B3           ; |204| 

RL34:      ; CALL OCCURS                     ; |204| 
           MVKL    .S2     _TINTCnt,B4       ; |206| 

           MVKH    .S2     _TINTCnt,B4       ; |206| 
||         MVKL    .S1     _mode,A0          ; |207| 
||         ZERO    .D2     B5                ; |206| 

           STW     .D2T2   B5,*B4            ; |206| 
||         MVKH    .S1     _mode,A0          ; |207| 
||         ZERO    .D1     A3                ; |207| 

           STW     .D1T1   A3,*A0            ; |207| 
           MVKL    .S1     0x200004c,A0      ; |210| 
           MVKH    .S1     0x200004c,A0      ; |210| 
           LDW     .D1T1   *A0,A3            ; |210| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L9
;** --------------------------------------------------------------------------*
L9:    
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L10:    
           MVKL    .S2     _mode,B4          ; |212| 
           MVKH    .S2     _mode,B4          ; |212| 
           XOR     .S1     1,A3,A3           ; |210| 
           STW     .D1T1   A3,*A0            ; |210| 
           LDW     .D2T2   *B4,B0            ; |212| 
           NOP             4
   [ B0]   B       .S1     L11               ; |212| 
   [!B0]   MVKL    .S1     _swingUp,A0       ; |213| 
   [!B0]   MVKH    .S1     _swingUp,A0       ; |213| 
   [ B0]   MVKL    .S1     _y_pend,A0        ; |217| 
   [ B0]   MVKH    .S1     _y_pend,A0        ; |217| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |217| 
           ; BRANCH OCCURS                   ; |212| 
;** --------------------------------------------------------------------------*
           B       .S2X    A0                ; |213| 
           MVKL    .S2     RL36,B3           ; |213| 
           MVKH    .S2     RL36,B3           ; |213| 
           NOP             3
RL36:      ; CALL OCCURS                     ; |213| 
           MVKL    .S1     _y_pend,A0        ; |217| 
           MVKH    .S1     _y_pend,A0        ; |217| 
           LDW     .D1T1   *A0,A0            ; |217| 
;** --------------------------------------------------------------------------*
L11:    
           ZERO    .D2     B4                ; |217| 
           MVKH    .S2     0x432a0000,B4     ; |217| 
           NOP             2
           CMPLTSP .S2X    A0,B4,B4          ; |217| 
           XOR     .S2     1,B4,B0           ; |217| 
   [!B0]   MVKL    .S2     _y_pend,B4        ; |217| 
   [!B0]   MVKH    .S2     _y_pend,B4        ; |217| 
   [!B0]   LDW     .D2T2   *B4,B4            ; |217| 
   [!B0]   ZERO    .D1     A0                ; |217| 
   [!B0]   MVKH    .S1     0x433e0000,A0     ; |217| 
           NOP             2
   [!B0]   CMPGTSP .S2X    B4,A0,B4          ; |217| 
   [!B0]   XOR     .S2     1,B4,B0           ; |217| 
   [ B0]   MVKL    .S2     _mode,B5          ; |218| 
           MVKL    .S2     _TINTCnt,B4       ; |222| 

   [ B0]   MVKH    .S2     _mode,B5          ; |218| 
|| [ B0]   MVK     .S1     1,A0              ; |218| 

   [ B0]   STW     .D2T1   A0,*B5            ; |218| 
||         MVKH    .S2     _TINTCnt,B4       ; |222| 

           LDW     .D2T2   *B4,B4            ; |222| 
           MVK     .S1     500,A0            ; |222| 
           NOP             3
           CMPGTU  .L1X    B4,A0,A1          ; |222| 
   [!A1]   B       .S1     L10               ; |222| 

   [ A1]   MVKL    .S2     _timerCheckCnt,B4 ; |224| 
|| [!A1]   MVKL    .S1     0x200004c,A0      ; |210| 

   [ A1]   MVKH    .S2     _timerCheckCnt,B4 ; |224| 
|| [!A1]   MVKH    .S1     0x200004c,A0      ; |210| 

   [ A1]   LDW     .D2T2   *B4,B6            ; |224| 
|| [!A1]   LDW     .D1T1   *A0,A3            ; |210| 

           NOP             2
           ; BRANCH OCCURS                   ; |222| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     SL4+0,B5          ; |225| 
           MVKH    .S2     SL4+0,B5          ; |225| 
           ADD     .D2     1,B6,B7           ; |224| 

           STW     .D2T2   B7,*B4            ; |224| 
||         MVKL    .S2     _timerCheckCnt,B6 ; |225| 
||         MVKL    .S1     _sprintf,A0       ; |225| 

           STW     .D2T2   B5,*+SP(4)        ; |225| 
||         MVKH    .S2     _timerCheckCnt,B6 ; |225| 
||         MVKH    .S1     _sprintf,A0       ; |225| 

           B       .S2X    A0                ; |225| 
||         LDW     .D2T2   *B6,B5            ; |225| 

           MVKL    .S2     RL38,B3           ; |225| 
           MVKL    .S2     _tmp_string,B4    ; |225| 
           MVKH    .S2     _tmp_string,B4    ; |225| 
           MV      .S1X    B4,A4             ; |225| 

           STW     .D2T2   B5,*+SP(8)        ; |225| 
||         MVKH    .S2     RL38,B3           ; |225| 

RL38:      ; CALL OCCURS                     ; |225| 
           MVKL    .S1     _Report,A0        ; |225| 
           MVKH    .S1     _Report,A0        ; |225| 
           B       .S2X    A0                ; |225| 
           MVKL    .S2     RL40,B3           ; |225| 
           MVKH    .S2     RL40,B3           ; |225| 
           NOP             3
RL40:      ; CALL OCCURS                     ; |225| 
           MVKL    .S1     _GetPendulumPos,A0 ; |228| 
           MVKH    .S1     _GetPendulumPos,A0 ; |228| 
           B       .S2X    A0                ; |228| 
           MVKL    .S2     RL44,B3           ; |228| 
           MVKH    .S2     RL44,B3           ; |228| 
           NOP             3
RL44:      ; CALL OCCURS                     ; |228| 
           MVKL    .S2     _sprintf,B4       ; |228| 
           MVKH    .S2     _sprintf,B4       ; |228| 

           B       .S2     B4                ; |228| 
||         SPDP    .S1     A4,A7:A6          ; |228| 

           MVKL    .S2     SL5+0,B5          ; |228| 
           MV      .D1     A7,A0             ; |228| 

           MVKH    .S2     SL5+0,B5          ; |228| 
||         STW     .D2T1   A0,*+SP(12)       ; |228| 

           STW     .D2T2   B5,*+SP(4)        ; |228| 
||         MV      .D1     A6,A3             ; |228| 
||         MVKL    .S1     _tmp_string,A4    ; |228| 
||         MVKL    .S2     RL46,B3           ; |228| 

           STW     .D2T1   A3,*+SP(8)        ; |228| 
||         MVKH    .S1     _tmp_string,A4    ; |228| 
||         MVKH    .S2     RL46,B3           ; |228| 

RL46:      ; CALL OCCURS                     ; |228| 
           MVKL    .S1     _Report,A0        ; |228| 
           MVKH    .S1     _Report,A0        ; |228| 
           B       .S2X    A0                ; |228| 
           MVKL    .S2     RL48,B3           ; |228| 
           MVKH    .S2     RL48,B3           ; |228| 
           NOP             3
RL48:      ; CALL OCCURS                     ; |228| 
           MVKL    .S1     _GetCartPos,A0    ; |231| 
           MVKH    .S1     _GetCartPos,A0    ; |231| 
           B       .S2X    A0                ; |231| 
           MVKL    .S2     RL52,B3           ; |231| 
           MVKH    .S2     RL52,B3           ; |231| 
           NOP             3
RL52:      ; CALL OCCURS                     ; |231| 
           SPDP    .S1     A4,A5:A4          ; |231| 
           MVKL    .S2     SL6+0,B5          ; |231| 
           MV      .D1     A5,A0             ; |231| 

           MVKL    .S1     _sprintf,A0       ; |231| 
||         STW     .D2T1   A0,*+SP(12)       ; |231| 

           MVKH    .S1     _sprintf,A0       ; |231| 
           B       .S2X    A0                ; |231| 
           MVKH    .S2     SL6+0,B5          ; |231| 
           MVKL    .S2     _tmp_string,B4    ; |231| 

           MV      .D1     A4,A3             ; |231| 
||         MVKH    .S2     _tmp_string,B4    ; |231| 

           MVKL    .S2     RL54,B3           ; |231| 
||         STW     .D2T1   A3,*+SP(8)        ; |231| 

           MVKH    .S2     RL54,B3           ; |231| 
||         STW     .D2T2   B5,*+SP(4)        ; |231| 
||         MV      .S1X    B4,A4             ; |231| 

RL54:      ; CALL OCCURS                     ; |231| 
           MVKL    .S1     _Report,A0        ; |231| 
           MVKH    .S1     _Report,A0        ; |231| 
           B       .S2X    A0                ; |231| 
           MVKL    .S2     RL56,B3           ; |231| 
           MVKH    .S2     RL56,B3           ; |231| 
           NOP             3
RL56:      ; CALL OCCURS                     ; |231| 
           MVKL    .S1     _sprintf,A0       ; |234| 

           MVKH    .S1     _sprintf,A0       ; |234| 
||         MVKL    .S2     _tmp_string,B4    ; |234| 

           B       .S2X    A0                ; |234| 
           MVKL    .S2     SL7+0,B5          ; |234| 
           MVKH    .S2     _tmp_string,B4    ; |234| 
           MVKL    .S2     RL58,B3           ; |234| 
           MVKH    .S2     SL7+0,B5          ; |234| 

           STW     .D2T2   B5,*+SP(4)        ; |234| 
||         MV      .S1X    B4,A4             ; |234| 
||         MVKH    .S2     RL58,B3           ; |234| 

RL58:      ; CALL OCCURS                     ; |234| 
           MVKL    .S1     _Report,A0        ; |234| 
           MVKH    .S1     _Report,A0        ; |234| 
           B       .S2X    A0                ; |234| 
           MVKL    .S2     RL60,B3           ; |234| 
           MVKH    .S2     RL60,B3           ; |234| 
           NOP             3
RL60:      ; CALL OCCURS                     ; |234| 
           MVKL    .S2     SL8+0,B4          ; |235| 

           MVKL    .S1     _mostPlusPos,A0   ; |235| 
||         MVKH    .S2     SL8+0,B4          ; |235| 

           MVKH    .S1     _mostPlusPos,A0   ; |235| 
||         STW     .D2T2   B4,*+SP(4)        ; |235| 

           LDW     .D1T1   *A0,A0            ; |235| 
           MVKL    .S2     RL62,B3           ; |235| 
           MVKL    .S2     _tmp_string,B4    ; |235| 
           MVKH    .S2     _tmp_string,B4    ; |235| 
           MV      .S1X    B4,A4             ; |235| 
           SPDP    .S1     A0,A1:A0          ; |235| 
           MVKH    .S2     RL62,B3           ; |235| 

           MVKL    .S1     _sprintf,A0       ; |235| 
||         STW     .D2T1   A0,*+SP(8)        ; |235| 

           MVKH    .S1     _sprintf,A0       ; |235| 
           B       .S2X    A0                ; |235| 
           STW     .D2T1   A1,*+SP(12)       ; |235| 
           NOP             4
RL62:      ; CALL OCCURS                     ; |235| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _Report,A0        ; |235| 
           MVKH    .S1     _Report,A0        ; |235| 
           B       .S2X    A0                ; |235| 
           MVKL    .S2     RL64,B3           ; |235| 
           MVKH    .S2     RL64,B3           ; |235| 
           NOP             3
RL64:      ; CALL OCCURS                     ; |235| 
           MVKL    .S1     SL9+0,A0          ; |236| 

           MVKL    .S2     _prevPendPos,B4   ; |236| 
||         MVKH    .S1     SL9+0,A0          ; |236| 

           MVKH    .S2     _prevPendPos,B4   ; |236| 
||         STW     .D2T1   A0,*+SP(4)        ; |236| 

           LDW     .D2T2   *B4,B5            ; |236| 
           MVKL    .S2     _sprintf,B4       ; |236| 
           MVKH    .S2     _sprintf,B4       ; |236| 
           B       .S2     B4                ; |236| 
           MVKL    .S1     _tmp_string,A4    ; |236| 
           SPDP    .S2     B5,B7:B6          ; |236| 
           MVKH    .S1     _tmp_string,A4    ; |236| 

           STW     .D2T2   B6,*+SP(8)        ; |236| 
||         MVKL    .S2     RL66,B3           ; |236| 

           MVKH    .S2     RL66,B3           ; |236| 
||         STW     .D2T2   B7,*+SP(12)       ; |236| 

RL66:      ; CALL OCCURS                     ; |236| 
           MVKL    .S1     _Report,A0        ; |236| 
           MVKH    .S1     _Report,A0        ; |236| 
           B       .S2X    A0                ; |236| 
           MVKL    .S2     RL68,B3           ; |236| 
           MVKH    .S2     RL68,B3           ; |236| 
           NOP             3
RL68:      ; CALL OCCURS                     ; |236| 
           MVKL    .S1     SL10+0,A0         ; |237| 
           MVKL    .S1     _remainedAngleToTheGoal,A3 ; |237| 
           MVKH    .S1     SL10+0,A0         ; |237| 

           STW     .D2T1   A0,*+SP(4)        ; |237| 
||         MVKH    .S1     _remainedAngleToTheGoal,A3 ; |237| 

           LDW     .D1T1   *A3,A0            ; |237| 
           MVKL    .S2     _sprintf,B4       ; |237| 
           MVKH    .S2     _sprintf,B4       ; |237| 
           B       .S2     B4                ; |237| 
           MVKL    .S2     _tmp_string,B5    ; |237| 
           SPDP    .S1     A0,A1:A0          ; |237| 
           MVKH    .S2     _tmp_string,B5    ; |237| 

           STW     .D2T1   A1,*+SP(12)       ; |237| 
||         MVKL    .S2     RL70,B3           ; |237| 

           MV      .S1X    B5,A4             ; |237| 
||         STW     .D2T1   A0,*+SP(8)        ; |237| 
||         MVKH    .S2     RL70,B3           ; |237| 

RL70:      ; CALL OCCURS                     ; |237| 
           MVKL    .S1     _Report,A0        ; |237| 
           MVKH    .S1     _Report,A0        ; |237| 
           B       .S2X    A0                ; |237| 
           MVKL    .S2     RL72,B3           ; |237| 
           MVKH    .S2     RL72,B3           ; |237| 
           NOP             3
RL72:      ; CALL OCCURS                     ; |237| 
           MVKL    .S2     _sprintf,B4       ; |239| 
           MVKH    .S2     _sprintf,B4       ; |239| 
           B       .S2     B4                ; |239| 
           MVKL    .S1     _tmp_string,A4    ; |239| 
           MVKL    .S1     SL11+0,A0         ; |239| 
           MVKL    .S2     RL74,B3           ; |239| 
           MVKH    .S1     SL11+0,A0         ; |239| 

           MVKH    .S1     _tmp_string,A4    ; |239| 
||         STW     .D2T1   A0,*+SP(4)        ; |239| 
||         MVKH    .S2     RL74,B3           ; |239| 

RL74:      ; CALL OCCURS                     ; |239| 
           MVKL    .S1     _Report,A0        ; |239| 
           MVKH    .S1     _Report,A0        ; |239| 
           B       .S2X    A0                ; |239| 
           MVKL    .S2     RL76,B3           ; |239| 
           MVKH    .S2     RL76,B3           ; |239| 
           NOP             3
RL76:      ; CALL OCCURS                     ; |239| 
           B       .S1     L9                ; |242| 
           MVKL    .S2     _TINTCnt,B4       ; |240| 

           ZERO    .D2     B5                ; |240| 
||         MVKH    .S2     _TINTCnt,B4       ; |240| 

           STW     .D2T2   B5,*B4            ; |240| 
||         MVKL    .S1     0x200004c,A0      ; |210| 

           MVKH    .S1     0x200004c,A0      ; |210| 
           LDW     .D1T1   *A0,A3            ; |210| 
           ; BRANCH OCCURS                   ; |242| 


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
SL7:	.string	"<< Swing-up debugging >> ",13,10,0
SL8:	.string	"   mostPlusPos: %6.2f ",13,10,0
SL9:	.string	"   prevPendPos: %6.2f ",13,10,0
SL10:	.string	"   remainedAngleToTheGoal: %6.2f ",13,10,0
SL11:	.string	13,10,0
;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_sprintf
	.global	_InitUART
	.global	_Report
	.global	_InitUSBMon
	.global	_tmp_string
	.global	_TFlag
	.global	_y_pend
	.global	_mostPlusPos
	.global	_prevPendPos
	.global	_remainedAngleToTheGoal
	.global	__divd
