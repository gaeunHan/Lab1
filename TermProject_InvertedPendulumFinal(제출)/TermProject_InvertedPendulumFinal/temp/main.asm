;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Sat Jun 08 23:18:32 2024                                *
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
	.word	043fa0000h		; _R_swup_cart @ 0
	.sect	".text"
	.global	_R_swup_cart
_R_swup_cart:	.usect	.far,4,4
	.global	_mode
_mode:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_swingUpDirection+0,32
	.field  	1,32			; _swingUpDirection @ 0
	.sect	".text"
	.global	_swingUpDirection
_swingUpDirection:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_WaitCnt+0,32
	.field  	400,32			; _WaitCnt @ 0
	.sect	".text"
	.global	_WaitCnt
_WaitCnt:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_u+0,32
	.word	041f00000h		; _u @ 0
	.sect	".text"
	.global	_u
_u:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI9076_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI9076_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
           ZERO    .D1     A0                ; |33| 
           MVKH    .S1     0x1800000,A0      ; |33| 
           LDW     .D1T1   *A0,A4            ; |33| 
           MVKL    .S2     0x1800008,B5      ; |36| 
           MVKL    .S2     0x21520521,B6     ; |48| 
           B       .S2     B3                ; |58| 

           MVKL    .S2     0x1800010,B4      ; |48| 
||         MVKL    .S1     0xd00321,A3       ; |36| 

           CLR     .S1     A4,3,5,A4         ; |33| 
||         MVKH    .S2     0x1800008,B5      ; |36| 

           STW     .D1T1   A4,*A0            ; |33| 
||         MVKH    .S2     0x21520521,B6     ; |48| 
||         MVKH    .S1     0xd00321,A3       ; |36| 

           STW     .D2T1   A3,*B5            ; |36| 
||         MVKH    .S2     0x1800010,B4      ; |48| 

           STW     .D2T2   B6,*B4            ; |48| 
           ; BRANCH OCCURS                   ; |58| 


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
           ZERO    .D2     B4                ; |63| 
           MVKH    .S2     0x1940000,B4      ; |63| 
           LDW     .D2T2   *B4,B5            ; |63| 
           MVKL    .S1     0x1940004,A0      ; |66| 
           MVKH    .S1     0x1940004,A0      ; |66| 
           ZERO    .D1     A3                ; |69| 
           MVKH    .S1     0x1940000,A3      ; |69| 
           SET     .S2     B5,8,9,B5         ; |63| 

           MVK     .S2     20000,B4          ; |66| 
||         STW     .D2T2   B5,*B4            ; |63| 

           STW     .D1T2   B4,*A0            ; |66| 
           LDW     .D1T1   *A3,A0            ; |69| 
           B       .S2     B3                ; |70| 
           NOP             3
           SET     .S1     A0,6,7,A0         ; |69| 
           STW     .D1T1   A0,*A3            ; |69| 
           ; BRANCH OCCURS                   ; |70| 


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
           MVC     .S2     IER,B4            ; |75| 
           MVK     .S1     16450,A0          ; |75| 
           OR      .S2X    A0,B4,B4          ; |75| 
           MVC     .S2     B4,IER            ; |75| 
           B       .S2     B3                ; |76| 
           NOP             5
           ; BRANCH OCCURS                   ; |76| 


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
           MVC     .S2     CSR,B4            ; |81| 
           OR      .S2     1,B4,B4           ; |81| 
           MVC     .S2     B4,CSR            ; |81| 
           B       .S2     B3                ; |82| 
           NOP             5
           ; BRANCH OCCURS                   ; |82| 


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
           MV      .S2X    A4,B4             ; |86| 
           SHL     .S2     B4,4,B5           ; |89| 

           ZERO    .S2     B4                ; |89| 
||         SUBAH   .D2     B5,B4,B5          ; |89| 

           CMPLTU  .L2     B4,B5,B0          ; |89| 
   [!B0]   B       .S1     L2                ; |89| 
           SUB     .D2     SP,8,SP           ; |86| 
           STW     .D2T1   A4,*+SP(4)        ; |86| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |89| 
           NOP             2
           ; BRANCH OCCURS                   ; |89| 
;** --------------------------------------------------------------------------*
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L1:    
           SHL     .S2     B5,4,B6           ; |89| 

           SUBAH   .D2     B6,B5,B5          ; |89| 
||         ADD     .S2     1,B4,B4           ; |89| 

           CMPLTU  .L2     B4,B5,B0          ; |89| 
   [ B0]   B       .S1     L1                ; |89| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |89| 
           NOP             4
           ; BRANCH OCCURS                   ; |89| 
;** --------------------------------------------------------------------------*
L2:    
           B       .S2     B3                ; |90| 
           ADD     .D2     8,SP,SP           ; |90| 
           NOP             4
           ; BRANCH OCCURS                   ; |90| 


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
           ZERO    .D2     B7                ; |97| 
           CMPLTU  .L2X    B7,A4,B0
   [!B0]   B       .S1     L4                ; |97| 
           SUB     .D2     SP,8,SP           ; |94| 
           STW     .D2T1   A4,*+SP(4)        ; |94| 
           MV      .L2     B3,B9             ; |94| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |98| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |98| 
           ; BRANCH OCCURS                   ; |97| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L3:    
           B       .S2     B4                ; |98| 
           MVKL    .S2     RL0,B3            ; |98| 
           MVKH    .S2     RL0,B3            ; |98| 
           MVK     .S1     0x3e8,A4          ; |98| 
           NOP             2
RL0:       ; CALL OCCURS                     ; |98| 
           LDW     .D2T2   *+SP(4),B4        ; |99| 
           ADD     .D2     1,B7,B7           ; |99| 
           NOP             3
           CMPLTU  .L2     B7,B4,B0          ; |99| 
   [ B0]   B       .S1     L3                ; |99| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |98| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |98| 
           NOP             3
           ; BRANCH OCCURS                   ; |99| 
;** --------------------------------------------------------------------------*
L4:    
           B       .S2     B9                ; |100| 
           ADD     .D2     8,SP,SP           ; |100| 
           NOP             4
           ; BRANCH OCCURS                   ; |100| 


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
           MVKL    .S1     _TFlag,A0         ; |105| 
           MVKH    .S1     _TFlag,A0         ; |105| 
           LDW     .D1T1   *A0,A1            ; |105| 
           NOP             4
   [ A1]   B       .S1     L6                ; |105| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |105| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |105| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |105| 
           NOP             2
           ; BRANCH OCCURS                   ; |105| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L5:    
           NOP             2
   [!A1]   B       .S1     L5                ; |105| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |105| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |105| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |105| 
           NOP             2
           ; BRANCH OCCURS                   ; |105| 
;** --------------------------------------------------------------------------*
L6:    
           B       .S2     B3                ; |107| 
           MVKL    .S1     _TFlag,A0         ; |106| 
           MVKH    .S1     _TFlag,A0         ; |106| 
           ZERO    .D1     A3                ; |106| 
           STW     .D1T1   A3,*A0            ; |106| 
           NOP             1
           ; BRANCH OCCURS                   ; |107| 


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

           SUB     .D2     SP,8,SP           ; |111| 
||         MVKL    .S1     _TFlag,A0         ; |114| 

           STW     .D2T1   A4,*+SP(4)        ; |111| 
||         MVKH    .S1     _TFlag,A0         ; |114| 
||         ZERO    .D1     A3                ; |114| 

           STW     .D1T1   A3,*A0            ; |114| 
           LDW     .D2T2   *+SP(4),B5        ; |116| 
           ZERO    .D2     B4                ; |116| 
           STW     .D2T2   B4,*+SP(8)        ; |116| 
           MV      .S2     B3,B9             ; |111| 
           NOP             1
           CMPLTU  .L2     B4,B5,B0          ; |116| 
   [!B0]   B       .S1     L8                ; |116| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |117| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |117| 
           NOP             3
           ; BRANCH OCCURS                   ; |116| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L7:    
           B       .S2X    A0                ; |117| 
           MVKL    .S2     RL2,B3            ; |117| 
           MVKH    .S2     RL2,B3            ; |117| 
           NOP             3
RL2:       ; CALL OCCURS                     ; |117| 
           LDW     .D2T2   *+SP(8),B4        ; |118| 
           LDW     .D2T2   *+SP(4),B5        ; |118| 
           NOP             3
           ADD     .D2     1,B4,B4           ; |118| 
           CMPLTU  .L2     B4,B5,B0          ; |118| 
   [ B0]   B       .S1     L7                ; |118| 
           STW     .D2T2   B4,*+SP(8)        ; |118| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |117| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |117| 
           NOP             2
           ; BRANCH OCCURS                   ; |118| 
;** --------------------------------------------------------------------------*
L8:    
           B       .S2     B9                ; |119| 
           ADD     .D2     8,SP,SP           ; |119| 
           NOP             4
           ; BRANCH OCCURS                   ; |119| 


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
           MV      .S2X    A4,B4             ; |123| 
           SPDP    .S2     B4,B5:B4          ; |127| 
           ZERO    .D2     B6                ; |127| 
           MVKL    .S2     0xc048c000,B7     ; |127| 
           MVKH    .S2     0xc048c000,B7     ; |127| 

           CMPLTDP .S2     B5:B4,B7:B6,B0    ; |127| 
||         ZERO    .D1     A0                ; |128| 
||         STW     .D2T2   B3,*SP--(16)      ; |123| 

           STW     .D2T1   A4,*+SP(4)        ; |123| 
||         MVKH    .S1     0xc2460000,A0     ; |128| 

   [ B0]   STW     .D2T1   A0,*+SP(4)        ; |128| 
           LDW     .D2T2   *+SP(4),B4        ; |131| 
           MVKL    .S1     0x4048c000,A1     ; |131| 
           ZERO    .D1     A0                ; |131| 
           MVKL    .S2     RL4,B3            ; |136| 
           MVKH    .S2     RL4,B3            ; |136| 
           SPDP    .S2     B4,B5:B4          ; |131| 
           MVKH    .S1     0x4048c000,A1     ; |131| 
           CMPGTDP .S1X    B5:B4,A1:A0,A1    ; |131| 
           MVKL    .S2     __divd,B8         ; |136| 
           MVKH    .S1     0x42460000,A0     ; |132| 
   [ A1]   STW     .D2T1   A0,*+SP(4)        ; |132| 
           LDW     .D2T2   *+SP(4),B4        ; |136| 
           ZERO    .D1     A0                ; |136| 
           MVKH    .S1     0x42480000,A0     ; |136| 
           MVKH    .S2     __divd,B8         ; |136| 
           NOP             1
           ADDSP   .L2X    A0,B4,B5          ; |136| 
           MVKL    .S2     0x457ff000,B4     ; |136| 
           MVKH    .S2     0x457ff000,B4     ; |136| 
           NOP             1
           MPYSP   .M2     B4,B5,B4          ; |136| 
           ZERO    .D2     B5                ; |136| 
           MVKH    .S2     0x40590000,B5     ; |136| 
           B       .S2     B8                ; |136| 
           SPDP    .S2     B4,B7:B6          ; |136| 
           ZERO    .D2     B4                ; |136| 
           MV      .S1X    B6,A4             ; |136| 
           NOP             1
           MV      .S1X    B7,A5             ; |136| 
RL4:       ; CALL OCCURS                     ; |136| 
           DPSP    .L1     A5:A4,A0          ; |136| 
           NOP             3
           MV      .S2X    A0,B4             ; |136| 
           SPTRUNC .L2     B4,B4             ; |138| 
           STW     .D2T1   A0,*+SP(8)        ; |136| 
           MVKL    .S1     0x2000088,A0      ; |138| 
           MVKH    .S1     0x2000088,A0      ; |138| 
           STW     .D1T2   B4,*A0            ; |138| 
           LDW     .D2T1   *+SP(4),A4        ; |140| 
           LDW     .D2T2   *++SP(16),B3      ; |141| 
           NOP             4
           B       .S2     B3                ; |141| 
           NOP             5
           ; BRANCH OCCURS                   ; |141| 


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
           MVKL    .S2     0x200020c,B4      ; |150| 
           MVKH    .S2     0x200020c,B4      ; |150| 
           LDW     .D2T2   *B4,B4            ; |150| 
           NOP             4

           EXTU    .S2     B4,16,16,B4       ; |150| 
||         SUB     .D2     SP,16,SP          ; |144| 

           STH     .D2T2   B4,*+SP(4)        ; |150| 
           LDH     .D2T2   *+SP(4),B5        ; |153| 
           LDH     .D2T2   *+SP(4),B6        ; |153| 
           LDH     .D2T2   *+SP(4),B4        ; |154| 
           NOP             2

           MVK     .S1     32767,A3          ; |153| 
||         ZERO    .D1     A0                ; |154| 

           CMPGT   .L1X    B5,A3,A1          ; |153| 
||         MVKH    .S1     0x10000,A0        ; |154| 

   [!A1]   STW     .D2T2   B6,*+SP(8)        ; |153| 
||         SUB     .L2X    B4,A0,B4          ; |154| 

   [ A1]   STW     .D2T2   B4,*+SP(8)        ; |154| 
           LDW     .D2T2   *+SP(8),B4        ; |157| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |157| 
           NOP             2
           MVKL    .S1     0x3fd68000,A1     ; |157| 

           MVKH    .S1     0x3fd68000,A1     ; |157| 
||         ZERO    .D1     A0                ; |157| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |157| 
           NOP             8
           B       .S2     B3                ; |159| 
           DPSP    .L1     A1:A0,A0          ; |157| 
           NOP             3

           ADDK    .S2     16,SP             ; |159| 
||         STW     .D2T1   A0,*+SP(12)       ; |157| 
||         MV      .D1     A0,A4             ; |157| 

           ; BRANCH OCCURS                   ; |159| 


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
           MVKL    .S2     0x2000210,B4      ; |168| 
           MVKH    .S2     0x2000210,B4      ; |168| 
           LDW     .D2T2   *B4,B4            ; |168| 
           NOP             4

           EXTU    .S2     B4,16,16,B4       ; |168| 
||         SUB     .D2     SP,16,SP          ; |162| 

           STH     .D2T2   B4,*+SP(4)        ; |168| 
           LDH     .D2T2   *+SP(4),B5        ; |171| 
           LDH     .D2T2   *+SP(4),B6        ; |171| 
           LDH     .D2T2   *+SP(4),B4        ; |172| 
           NOP             2

           MVK     .S1     32767,A3          ; |171| 
||         ZERO    .D1     A0                ; |172| 

           CMPGT   .L1X    B5,A3,A1          ; |171| 
||         MVKH    .S1     0x10000,A0        ; |172| 

   [!A1]   STW     .D2T2   B6,*+SP(8)        ; |171| 
||         SUB     .L2X    B4,A0,B4          ; |172| 

   [ A1]   STW     .D2T2   B4,*+SP(8)        ; |172| 
           LDW     .D2T2   *+SP(8),B4        ; |175| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |175| 
           NOP             2
           MVKL    .S1     0x3fd68000,A1     ; |175| 

           MVKH    .S1     0x3fd68000,A1     ; |175| 
||         ZERO    .D1     A0                ; |175| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |175| 
           NOP             8
           B       .S2     B3                ; |178| 
           DPSP    .L1     A1:A0,A0          ; |175| 
           NOP             3

           ADDK    .S2     16,SP             ; |178| 
||         STW     .D2T1   A0,*+SP(12)       ; |175| 
||         MV      .D1     A0,A4             ; |175| 

           ; BRANCH OCCURS                   ; |178| 


	.sect	".text"
	.global	_SwingUpControl

;******************************************************************************
;* FUNCTION NAME: _SwingUpControl                                             *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 4 Save = 4 byte                    *
;******************************************************************************
_SwingUpControl:
;** --------------------------------------------------------------------------*

           MVKL    .S1     _WaitCnt,A0       ; |188| 
||         MVKL    .S2     _TINTCnt,B4       ; |188| 

           MVKH    .S1     _WaitCnt,A0       ; |188| 
||         MVKH    .S2     _TINTCnt,B4       ; |188| 
||         STW     .D2T2   B3,*SP--(8)       ; |185| 

           LDW     .D1T1   *A0,A3            ; |188| 
||         LDW     .D2T2   *B4,B4            ; |188| 

           MVKL    .S2     _TINTCnt,B8       ; |224| 
           MVKL    .S2     _swingUpDirection,B5 ; |189| 
           MVKL    .S2     _swingUpDirection,B6 ; |225| 
           MVKL    .S2     _swingUpDirection,B7 ; |225| 
           CMPLTU  .L1X    B4,A3,A1          ; |188| 
   [!A1]   B       .S1     L18               ; |188| 
           MVKH    .S2     _TINTCnt,B8       ; |224| 
           MVKL    .S1     0x40568000,A5     ; |226| 

           MVKH    .S2     _swingUpDirection,B5 ; |189| 
||         MVKH    .S1     0x40568000,A5     ; |226| 

           MVKL    .S1     _mostPlusPos,A0   ; |226| 
||         MVKH    .S2     _swingUpDirection,B6 ; |225| 

           ZERO    .L2     B4                ; |224| 
||         MVKH    .S1     _mostPlusPos,A0   ; |226| 
||         MVKH    .S2     _swingUpDirection,B7 ; |225| 
||         ZERO    .D1     A4                ; |226| 
|| [ A1]   LDW     .D2T2   *B5,B0            ; |189| 

           ; BRANCH OCCURS                   ; |188| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _mostPlusPos,A0   ; |190| 
           MVKH    .S1     0x431b0000,A4     ; |205| 
           NOP             2
   [!B0]   B       .S2     L13               ; |189| 
           MVKL    .S1     _mostPlusPos,A5   ; |205| 
           ZERO    .D1     A3                ; |190| 
           MVKH    .S1     0x431b0000,A3     ; |190| 
           MVKH    .S1     _mostPlusPos,A0   ; |190| 

   [ B0]   LDW     .D1T1   *A0,A4            ; |190| 
||         MVKH    .S1     _mostPlusPos,A5   ; |205| 

           ; BRANCH OCCURS                   ; |189| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _mostPlusPos,A0   ; |190| 
           MVKH    .S1     _mostPlusPos,A0   ; |190| 
           MVKH    .S2     0x43340000,B4     ; |190| 
           NOP             1
           CMPGTSP .S1     A4,A3,A1          ; |190| 
   [ A1]   LDW     .D1T1   *A0,A4            ; |190| 
           MV      .L2X    A1,B5             ; |190| 
           MVKL    .S1     _mostMinusPos,A3  ; |190| 
           ZERO    .D1     A0                ; |190| 
           MVKH    .S1     _mostMinusPos,A3  ; |190| 
   [ A1]   CMPLTSP .S2X    A4,B4,B5          ; |190| 
           MV      .S1X    B5,A1             ; |190| 
   [ A1]   B       .S1     L9                ; |190| 
   [!A1]   LDW     .D1T1   *A3,A4            ; |190| 
           MVKH    .S1     0xc3160000,A0     ; |190| 
           NOP             3
           ; BRANCH OCCURS                   ; |190| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _mostMinusPos,A3  ; |190| 
           MVKH    .S1     _mostMinusPos,A3  ; |190| 
           ZERO    .D2     B4                ; |190| 
           MVKH    .S2     0xc3340000,B4     ; |190| 
           CMPLTSP .S1     A4,A0,A1          ; |190| 
   [ A1]   LDW     .D1T1   *A3,A0            ; |190| 
           NOP             3
           MV      .L2X    A1,B5             ; |190| 
   [ A1]   CMPGTSP .S2X    A0,B4,B5          ; |190| 
           MV      .S1X    B5,A1             ; |190| 
;** --------------------------------------------------------------------------*
L9:    
           MVKL    .S1     _u,A4             ; |193| 

           MVKL    .S1     _mostPlusPos,A3   ; |195| 
||         MVKL    .S2     _PWMOut,B4        ; |193| 

   [!A1]   B       .S2     L10               ; |190| 
||         MVKL    .S1     _u,A0             ; |191| 
||         ZERO    .D1     A5                ; |191| 

           MVKH    .S1     0x41f00000,A5     ; |191| 
||         MVKL    .S2     _WaitCnt,B5       ; |192| 
||         ZERO    .D1     A6                ; |195| 

           MVKH    .S1     0x42b40000,A6     ; |195| 
||         MVK     .S2     25,B6             ; |192| 

           MVKH    .S1     _u,A4             ; |193| 

           MVKH    .S1     _mostPlusPos,A3   ; |195| 
||         MVKH    .S2     _PWMOut,B4        ; |193| 

           MVKH    .S2     _WaitCnt,B5       ; |192| 
||         MVKH    .S1     _u,A0             ; |191| 
|| [!A1]   LDW     .D1T1   *A3,A3            ; |195| 

           ; BRANCH OCCURS                   ; |190| 
;** --------------------------------------------------------------------------*
           STW     .D1T1   A5,*A0            ; |191| 

           B       .S2     B4                ; |193| 
||         STW     .D2T2   B6,*B5            ; |192| 

           LDW     .D2T2   *++SP(8),B3       ; |233| 
||         LDW     .D1T1   *A4,A4            ; |193| 

           NOP             4
RL6:       ; CALL OCCURS                     ; |193| ; bypass _SwingUpControl upon return
;** --------------------------------------------------------------------------*
L10:    
           MVKL    .S1     _mostPlusPos,A0   ; |195| 
           MVKH    .S1     _mostPlusPos,A0   ; |195| 
           ZERO    .D2     B5                ; |195| 
           MVKH    .S2     0x431b0000,B5     ; |195| 
           CMPGTSP .S1     A3,A6,A1          ; |195| 
   [ A1]   LDW     .D1T1   *A0,A0            ; |195| 
           MV      .L2X    A1,B4             ; |195| 
           NOP             3
   [ A1]   CMPGTSP .S2X    A0,B5,B5          ; |195| 
   [ A1]   XOR     .S2     1,B5,B4           ; |195| 
           MV      .S1X    B4,A1             ; |195| 
   [ A1]   B       .S1     L11               ; |195| 
           MVKL    .S1     _mostMinusPos,A3  ; |195| 

           MVKH    .S1     _mostMinusPos,A3  ; |195| 
||         ZERO    .D1     A0                ; |195| 

   [ A1]   MVKL    .S2     _u,B7             ; |200| 
|| [!A1]   LDW     .D1T1   *A3,A4            ; |195| 
||         MVKH    .S1     0xc2b40000,A0     ; |195| 

   [ A1]   MVKL    .S2     _u,B6             ; |196| 
   [ A1]   MVKL    .S2     _PWMOut,B5        ; |197| 
           ; BRANCH OCCURS                   ; |195| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _mostMinusPos,A3  ; |195| 
           MVKH    .S1     _mostMinusPos,A3  ; |195| 
           CMPLTSP .S1     A4,A0,A1          ; |195| 
   [ A1]   LDW     .D1T1   *A3,A0            ; |195| 
           ZERO    .D2     B5                ; |195| 
           MV      .L2X    A1,B4             ; |195| 
           MVKH    .S2     0xc31b0000,B5     ; |195| 
           MVKL    .S2     _u,B7             ; |200| 
   [ A1]   CMPLTSP .S2X    A0,B5,B5          ; |195| 
   [ A1]   XOR     .S2     1,B5,B4           ; |195| 
           MV      .S1X    B4,A1             ; |195| 
           MVKL    .S2     _u,B6             ; |196| 
           MVKL    .S2     _PWMOut,B5        ; |197| 
;** --------------------------------------------------------------------------*
L11:    
           MVKL    .S2     _PWMOut,B4        ; |201| 

           MVKH    .S2     _u,B7             ; |200| 
||         MVKL    .S1     _u,A3             ; |201| 
||         ZERO    .D2     B8                ; |200| 

   [!A1]   B       .S1     L12               ; |195| 
||         MVKH    .S2     0x41f00000,B8     ; |200| 

           MVKH    .S2     _u,B6             ; |196| 
||         MVKL    .S1     _u,A0             ; |197| 
||         ZERO    .D1     A5                ; |201| 

           SET     .S1     A5,31,31,A5       ; |201| 
||         MVKH    .S2     _PWMOut,B5        ; |197| 
||         ZERO    .D2     B9                ; |196| 

           MVKH    .S2     0x41d80000,B9     ; |196| 
||         MVKH    .S1     _u,A3             ; |201| 
||         ZERO    .D1     A4                ; |197| 

           MVKH    .S2     _PWMOut,B4        ; |201| 
||         SET     .S1     A4,31,31,A4       ; |197| 

           MVKH    .S1     _u,A0             ; |197| 
|| [ A1]   STW     .D2T2   B9,*B6            ; |196| 

           ; BRANCH OCCURS                   ; |195| 
;** --------------------------------------------------------------------------*

           B       .S2     B5                ; |197| 
||         LDW     .D1T1   *A0,A0            ; |197| 

           LDW     .D2T2   *++SP(8),B3       ; |233| 
           NOP             3
           XOR     .S1     A0,A4,A4          ; |197| 
RL8:       ; CALL OCCURS                     ; |197| ; bypass _SwingUpControl upon return
;** --------------------------------------------------------------------------*
L12:    
           STW     .D2T2   B8,*B7            ; |200| 

           B       .S2     B4                ; |201| 
||         LDW     .D1T1   *A3,A0            ; |201| 

           LDW     .D2T2   *++SP(8),B3       ; |233| 
           NOP             3
           XOR     .S1     A0,A5,A4          ; |201| 
RL10:      ; CALL OCCURS                     ; |201| ; bypass _SwingUpControl upon return
;** --------------------------------------------------------------------------*
L13:    
           LDW     .D1T1   *A5,A3            ; |205| 
           MVKL    .S1     _mostPlusPos,A0   ; |205| 
           MVKH    .S1     _mostPlusPos,A0   ; |205| 
           MVKH    .S2     0x43340000,B4     ; |205| 
           NOP             1
           CMPGTSP .S1     A3,A4,A1          ; |205| 
   [ A1]   LDW     .D1T1   *A0,A4            ; |205| 
           MV      .L2X    A1,B5             ; |205| 
           MVKL    .S1     _mostMinusPos,A3  ; |205| 
           ZERO    .D1     A0                ; |205| 
           MVKH    .S1     _mostMinusPos,A3  ; |205| 
   [ A1]   CMPLTSP .S2X    A4,B4,B5          ; |205| 
           MV      .S1X    B5,A1             ; |205| 
   [ A1]   B       .S1     L14               ; |205| 
   [!A1]   LDW     .D1T1   *A3,A4            ; |205| 
           MVKH    .S1     0xc3160000,A0     ; |205| 
           NOP             3
           ; BRANCH OCCURS                   ; |205| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _mostMinusPos,A3  ; |205| 
           MVKH    .S1     _mostMinusPos,A3  ; |205| 
           ZERO    .D2     B4                ; |205| 
           MVKH    .S2     0xc3340000,B4     ; |205| 
           CMPLTSP .S1     A4,A0,A1          ; |205| 
   [ A1]   LDW     .D1T1   *A3,A0            ; |205| 
           NOP             3
           MV      .L2X    A1,B5             ; |205| 
   [ A1]   CMPGTSP .S2X    A0,B4,B5          ; |205| 
           MV      .S1X    B5,A1             ; |205| 
;** --------------------------------------------------------------------------*
L14:    
           MVKL    .S1     _u,A4             ; |208| 
           MVKL    .S1     _mostPlusPos,A3   ; |210| 

           MVKL    .S1     _u,A0             ; |206| 
||         MVKL    .S2     _PWMOut,B4        ; |208| 
||         ZERO    .D1     A7                ; |208| 

   [!A1]   B       .S2     L15               ; |205| 
||         SET     .S1     A7,31,31,A7       ; |208| 
||         ZERO    .D1     A6                ; |206| 

           MVKH    .S1     0x41f00000,A6     ; |206| 
||         MVKL    .S2     _WaitCnt,B5       ; |207| 
||         ZERO    .D1     A5                ; |210| 

           MVKH    .S1     0x42b40000,A5     ; |210| 
||         MVK     .S2     25,B6             ; |207| 

           MVKH    .S1     _u,A4             ; |208| 

           MVKH    .S1     _mostPlusPos,A3   ; |210| 
||         MVKH    .S2     _PWMOut,B4        ; |208| 

           MVKH    .S2     _WaitCnt,B5       ; |207| 
||         MVKH    .S1     _u,A0             ; |206| 
|| [!A1]   LDW     .D1T1   *A3,A3            ; |210| 

           ; BRANCH OCCURS                   ; |205| 
;** --------------------------------------------------------------------------*
           STW     .D1T1   A6,*A0            ; |206| 
           STW     .D2T2   B6,*B5            ; |207| 

           B       .S2     B4                ; |208| 
||         LDW     .D1T1   *A4,A0            ; |208| 

           LDW     .D2T2   *++SP(8),B3       ; |233| 
           NOP             3
           XOR     .S1     A0,A7,A4          ; |208| 
RL12:      ; CALL OCCURS                     ; |208| ; bypass _SwingUpControl upon return
;** --------------------------------------------------------------------------*
L15:    
           MVKL    .S1     _mostPlusPos,A0   ; |210| 
           MVKH    .S1     _mostPlusPos,A0   ; |210| 
           ZERO    .D2     B4                ; |210| 
           MVKH    .S2     0x431b0000,B4     ; |210| 
           CMPGTSP .S1     A3,A5,A1          ; |210| 
   [ A1]   LDW     .D1T1   *A0,A0            ; |210| 
           MV      .L2X    A1,B5             ; |210| 
           NOP             3
   [ A1]   CMPGTSP .S2X    A0,B4,B4          ; |210| 
   [ A1]   XOR     .S2     1,B4,B5           ; |210| 
           MV      .S1X    B5,A1             ; |210| 
   [ A1]   B       .S1     L16               ; |210| 
           MVKL    .S1     _mostMinusPos,A3  ; |210| 

           MVKH    .S1     _mostMinusPos,A3  ; |210| 
||         ZERO    .D1     A0                ; |210| 

   [ A1]   MVKL    .S2     _PWMOut,B6        ; |212| 
|| [!A1]   LDW     .D1T1   *A3,A4            ; |210| 
||         MVKH    .S1     0xc2b40000,A0     ; |210| 

   [ A1]   MVKL    .S2     _u,B7             ; |215| 
           NOP             1
           ; BRANCH OCCURS                   ; |210| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _mostMinusPos,A3  ; |210| 
           MVKH    .S1     _mostMinusPos,A3  ; |210| 
           CMPLTSP .S1     A4,A0,A1          ; |210| 
   [ A1]   LDW     .D1T1   *A3,A0            ; |210| 
           ZERO    .D2     B4                ; |210| 
           MV      .L2X    A1,B5             ; |210| 
           MVKH    .S2     0xc31b0000,B4     ; |210| 
           MVKL    .S2     _PWMOut,B6        ; |212| 
   [ A1]   CMPLTSP .S2X    A0,B4,B4          ; |210| 
   [ A1]   XOR     .S2     1,B4,B5           ; |210| 
           MV      .S1X    B5,A1             ; |210| 
           MVKL    .S2     _u,B7             ; |215| 
;** --------------------------------------------------------------------------*
L16:    
           MVKL    .S2     _PWMOut,B4        ; |216| 
           MVKL    .S2     _u,B5             ; |211| 
           MVKH    .S2     _PWMOut,B6        ; |212| 

   [!A1]   B       .S1     L17               ; |210| 
||         ZERO    .D2     B9                ; |215| 

           MVKH    .S2     0x41f00000,B9     ; |215| 

           MVKH    .S2     _u,B7             ; |215| 
||         MVKL    .S1     _u,A0             ; |216| 
||         ZERO    .D2     B8                ; |211| 

           MVKH    .S2     0x41d80000,B8     ; |211| 
||         MVKL    .S1     _u,A3             ; |212| 

           MVKH    .S2     _PWMOut,B4        ; |216| 
||         MVKH    .S1     _u,A0             ; |216| 

           MVKH    .S1     _u,A3             ; |212| 
||         MVKH    .S2     _u,B5             ; |211| 

           ; BRANCH OCCURS                   ; |210| 
;** --------------------------------------------------------------------------*

           B       .S2     B6                ; |212| 
||         STW     .D2T2   B8,*B5            ; |211| 

           LDW     .D2T2   *++SP(8),B3       ; |233| 
||         LDW     .D1T1   *A3,A4            ; |212| 

           NOP             4
RL14:      ; CALL OCCURS                     ; |212| ; bypass _SwingUpControl upon return
;** --------------------------------------------------------------------------*
L17:    

           B       .S2     B4                ; |216| 
||         STW     .D2T2   B9,*B7            ; |215| 

           LDW     .D2T2   *++SP(8),B3       ; |233| 
||         LDW     .D1T1   *A0,A4            ; |216| 

           NOP             4
RL16:      ; CALL OCCURS                     ; |216| ; bypass _SwingUpControl upon return
;** --------------------------------------------------------------------------*
L18:    
           STW     .D2T2   B4,*B8            ; |224| 
           LDW     .D2T2   *B7,B4            ; |225| 
           NOP             4
           CMPEQ   .L2     B4,0,B4           ; |225| 
           STW     .D2T2   B4,*B6            ; |225| 
           LDW     .D1T1   *A0,A0            ; |226| 
           MVKL    .S2     _mostMinusPos,B4  ; |226| 
           NOP             3
           SPDP    .S1     A0,A1:A0          ; |226| 
           MVKH    .S2     _mostMinusPos,B4  ; |226| 
           CMPLTDP .S1     A1:A0,A5:A4,A1    ; |226| 
           ZERO    .D1     A3                ; |226| 
   [!A1]   LDW     .D2T2   *B4,B4            ; |226| 
           MVKH    .S1     0xc2c80000,A3     ; |226| 
           MVKL    .S1     _WaitCnt,A0       ; |227| 
           MVKH    .S1     _WaitCnt,A0       ; |227| 
           ZERO    .D1     A5                ; |229| 
   [!A1]   CMPLTSP .S1X    B4,A3,A1          ; |226| 
   [ A1]   LDW     .D1T2   *A0,B4            ; |227| 
   [ A1]   LDW     .D2T2   *++SP(8),B3       ; |233| 
           MVKH    .S1     0x40590000,A5     ; |229| 
           MVKL    .S1     _mostPlusPos,A3   ; |229| 
           MVKH    .S1     _mostPlusPos,A3   ; |229| 
           NOP             1
   [ A1]   B       .S2     B3                ; |233| 
   [ A1]   ADDK    .S2     20,B4             ; |227| 
   [ A1]   STW     .D1T2   B4,*A0            ; |227| 
           NOP             3
           ; BRANCH OCCURS                   ; |233| ; chained return
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A3,A0            ; |229| 
           MVKL    .S1     _WaitCnt,A3       ; |230| 
           MVKH    .S1     _WaitCnt,A3       ; |230| 
           NOP             2
           SPDP    .S1     A0,A1:A0          ; |229| 
           MVKL    .S2     _mostMinusPos,B4  ; |229| 
           CMPLTDP .S1     A1:A0,A5:A4,A0    ; |229| 
           MVKH    .S2     _mostMinusPos,B4  ; |229| 
           XOR     .S1     1,A0,A1           ; |229| 
   [!A1]   LDW     .D2T2   *B4,B4            ; |229| 
           ZERO    .D1     A0                ; |229| 
           MVKH    .S1     0xc2c80000,A0     ; |229| 
           NOP             2
   [!A1]   CMPGTSP .S2X    B4,A0,B4          ; |229| 
   [!A1]   XOR     .L1X    1,B4,A1           ; |229| 
   [ A1]   LDW     .D1T1   *A3,A0            ; |230| 
           NOP             4
   [ A1]   SUB     .D1     A0,20,A0          ; |230| 
   [ A1]   STW     .D1T1   A0,*A3            ; |230| 
           LDW     .D2T2   *++SP(8),B3       ; |233| 
           NOP             4
           B       .S2     B3                ; |233| 
           NOP             5
           ; BRANCH OCCURS                   ; |233| 


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
           MVKL    .S1     _InitEXINTF,A0    ; |237| 
           MVKH    .S1     _InitEXINTF,A0    ; |237| 
           B       .S2X    A0                ; |237| 
           STW     .D2T2   B3,*SP--(24)      ; |236| 
           MVKL    .S2     RL18,B3           ; |237| 
           MVKH    .S2     RL18,B3           ; |237| 
           NOP             2
RL18:      ; CALL OCCURS                     ; |237| 
           MVKL    .S1     _InitTimer,A0     ; |238| 
           MVKH    .S1     _InitTimer,A0     ; |238| 
           B       .S2X    A0                ; |238| 
           MVKL    .S2     RL20,B3           ; |238| 
           MVKH    .S2     RL20,B3           ; |238| 
           NOP             3
RL20:      ; CALL OCCURS                     ; |238| 
           MVKL    .S2     _InitUART,B4      ; |239| 
           MVKH    .S2     _InitUART,B4      ; |239| 
           B       .S2     B4                ; |239| 
           MVKL    .S2     RL22,B3           ; |239| 
           MVKH    .S2     RL22,B3           ; |239| 
           NOP             3
RL22:      ; CALL OCCURS                     ; |239| 
           MVKL    .S1     _InitINT,A0       ; |240| 
           MVKH    .S1     _InitINT,A0       ; |240| 
           B       .S2X    A0                ; |240| 
           MVKL    .S2     RL24,B3           ; |240| 
           MVKH    .S2     RL24,B3           ; |240| 
           NOP             3
RL24:      ; CALL OCCURS                     ; |240| 
           MVKL    .S1     _InitUSBMon,A0    ; |241| 
           MVKH    .S1     _InitUSBMon,A0    ; |241| 
           B       .S2X    A0                ; |241| 
           MVKL    .S2     RL26,B3           ; |241| 
           MVKH    .S2     RL26,B3           ; |241| 
           NOP             3
RL26:      ; CALL OCCURS                     ; |241| 
           MVKL    .S1     _sprintf,A0       ; |243| 

           MVKH    .S1     _sprintf,A0       ; |243| 
||         MVKL    .S2     _tmp_string,B5    ; |243| 

           B       .S2X    A0                ; |243| 
           MVKL    .S2     RL28,B3           ; |243| 
           MVKH    .S2     _tmp_string,B5    ; |243| 
           MVKL    .S2     SL1+0,B4          ; |243| 
           MVKH    .S2     SL1+0,B4          ; |243| 

           MVKH    .S2     RL28,B3           ; |243| 
||         MV      .S1X    B5,A4             ; |243| 
||         STW     .D2T2   B4,*+SP(4)        ; |243| 

RL28:      ; CALL OCCURS                     ; |243| 
           MVKL    .S1     _Report,A0        ; |243| 
           MVKH    .S1     _Report,A0        ; |243| 
           B       .S2X    A0                ; |243| 
           MVKL    .S2     RL30,B3           ; |243| 
           MVKH    .S2     RL30,B3           ; |243| 
           NOP             3
RL30:      ; CALL OCCURS                     ; |243| 
           MVK     .S1     2024,A0           ; |244| 

           MVKL    .S1     _sprintf,A0       ; |244| 
||         STW     .D2T1   A0,*+SP(8)        ; |244| 

           MVKH    .S1     _sprintf,A0       ; |244| 
||         MVKL    .S2     SL2+0,B4          ; |244| 

           B       .S2X    A0                ; |244| 
           MVKH    .S2     SL2+0,B4          ; |244| 
           MVKL    .S2     _tmp_string,B5    ; |244| 
           MVKH    .S2     _tmp_string,B5    ; |244| 
           MVKL    .S2     RL32,B3           ; |244| 

           STW     .D2T2   B4,*+SP(4)        ; |244| 
||         MVKH    .S2     RL32,B3           ; |244| 
||         MV      .S1X    B5,A4             ; |244| 

RL32:      ; CALL OCCURS                     ; |244| 
           MVKL    .S1     _Report,A0        ; |244| 
           MVKH    .S1     _Report,A0        ; |244| 
           B       .S2X    A0                ; |244| 
           MVKL    .S2     RL34,B3           ; |244| 
           MVKH    .S2     RL34,B3           ; |244| 
           NOP             3
RL34:      ; CALL OCCURS                     ; |244| 
           MVKL    .S2     SL3+0,B4          ; |245| 
           MVKL    .S2     0x20003fc,B5      ; |245| 
           MVKH    .S2     SL3+0,B4          ; |245| 

           MVKH    .S2     0x20003fc,B5      ; |245| 
||         STW     .D2T2   B4,*+SP(4)        ; |245| 

           LDW     .D2T2   *B5,B4            ; |245| 
           MVKL    .S1     _sprintf,A3       ; |245| 
           MVKL    .S1     0x20003fc,A0      ; |245| 
           MVKH    .S1     0x20003fc,A0      ; |245| 
           MVKH    .S1     _sprintf,A3       ; |245| 
           EXTU    .S2     B4,16,24,B4       ; |245| 
           STW     .D2T2   B4,*+SP(8)        ; |245| 
           LDW     .D1T1   *A0,A0            ; |245| 
           B       .S2X    A3                ; |245| 
           MVKL    .S2     RL36,B3           ; |245| 
           MVKH    .S2     RL36,B3           ; |245| 
           MVKL    .S1     _tmp_string,A4    ; |245| 
           EXTU    .S1     A0,24,24,A0       ; |245| 

           STW     .D2T1   A0,*+SP(12)       ; |245| 
||         MVKH    .S1     _tmp_string,A4    ; |245| 

RL36:      ; CALL OCCURS                     ; |245| 
           MVKL    .S1     _Report,A0        ; |245| 
           MVKH    .S1     _Report,A0        ; |245| 
           B       .S2X    A0                ; |245| 
           MVKL    .S2     RL38,B3           ; |245| 
           MVKH    .S2     RL38,B3           ; |245| 
           NOP             3
RL38:      ; CALL OCCURS                     ; |245| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |249| 
           MVKH    .S1     _GIE,A0           ; |249| 
           B       .S2X    A0                ; |249| 
           MVKL    .S2     _TFlag,B4         ; |247| 
           MVKL    .S2     RL40,B3           ; |249| 
           MVKH    .S2     _TFlag,B4         ; |247| 
           ZERO    .D2     B5                ; |247| 

           STW     .D2T2   B5,*B4            ; |247| 
||         MVKH    .S2     RL40,B3           ; |249| 

RL40:      ; CALL OCCURS                     ; |249| 

           MVK     .S2     1,B6              ; |251| 
||         MVKL    .S1     _WaitTFlagCnt,A3  ; |254| 

           MVKL    .S2     0x200004c,B5      ; |250| 
||         MVKH    .S1     _WaitTFlagCnt,A3  ; |254| 

           B       .S2X    A3                ; |254| 

           MVKH    .S2     0x200004c,B5      ; |250| 
||         MVK     .S1     1,A4              ; |250| 

           MVKL    .S2     0x200008c,B4      ; |252| 
||         MVKL    .S1     0x2000080,A0      ; |251| 

           MVKL    .S2     RL42,B3           ; |254| 
||         STW     .D2T1   A4,*B5            ; |250| 
||         MVKH    .S1     0x2000080,A0      ; |251| 

           STW     .D1T2   B6,*A0            ; |251| 
||         MVKH    .S2     0x200008c,B4      ; |252| 
||         MVK     .S1     1,A5              ; |252| 

           STW     .D2T1   A5,*B4            ; |252| 
||         MVK     .S1     0x3e8,A4          ; |254| 
||         MVKH    .S2     RL42,B3           ; |254| 

RL42:      ; CALL OCCURS                     ; |254| 
           MVKL    .S2     _TINTCnt,B4       ; |256| 

           MVKH    .S2     _TINTCnt,B4       ; |256| 
||         MVKL    .S1     _mode,A0          ; |257| 
||         ZERO    .D2     B5                ; |256| 

           STW     .D2T2   B5,*B4            ; |256| 
||         MVKH    .S1     _mode,A0          ; |257| 
||         ZERO    .D1     A3                ; |257| 

           STW     .D1T1   A3,*A0            ; |257| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L19:    
           MVKL    .S1     0x200004c,A0      ; |260| 
           MVKH    .S1     0x200004c,A0      ; |260| 
           LDW     .D1T1   *A0,A3            ; |260| 
           MVKL    .S2     _mode,B4          ; |263| 
           MVKH    .S2     _mode,B4          ; |263| 
           NOP             2
           XOR     .S1     1,A3,A3           ; |260| 
           STW     .D1T1   A3,*A0            ; |260| 
           LDW     .D2T2   *B4,B0            ; |263| 
           NOP             4
   [ B0]   B       .S1     L20               ; |263| 
   [!B0]   MVKL    .S1     _SwingUpControl,A0 ; |264| 
   [!B0]   MVKH    .S1     _SwingUpControl,A0 ; |264| 
   [ B0]   MVKL    .S1     _y_pend,A0        ; |268| 
   [ B0]   MVKH    .S1     _y_pend,A0        ; |268| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |268| 
           ; BRANCH OCCURS                   ; |263| 
;** --------------------------------------------------------------------------*
           B       .S2X    A0                ; |264| 
           MVKL    .S2     RL44,B3           ; |264| 
           MVKH    .S2     RL44,B3           ; |264| 
           NOP             3
RL44:      ; CALL OCCURS                     ; |264| 
           MVKL    .S1     _y_pend,A0        ; |268| 
           MVKH    .S1     _y_pend,A0        ; |268| 
           LDW     .D1T1   *A0,A0            ; |268| 
;** --------------------------------------------------------------------------*
L20:    
           ZERO    .D2     B4                ; |268| 
           MVKH    .S2     0x432a0000,B4     ; |268| 
           NOP             2
           CMPLTSP .S2X    A0,B4,B4          ; |268| 
           XOR     .S2     1,B4,B0           ; |268| 
   [ B0]   MVKL    .S2     _y_pend,B4        ; |268| 
   [ B0]   MVKH    .S2     _y_pend,B4        ; |268| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |268| 
   [ B0]   ZERO    .D1     A0                ; |268| 
   [ B0]   MVKH    .S1     0x433e0000,A0     ; |268| 
           NOP             1
           B       .S2     L19               ; |271| 
   [ B0]   CMPGTSP .S2X    B4,A0,B4          ; |268| 
   [ B0]   XOR     .S2     1,B4,B0           ; |268| 
   [ B0]   MVKL    .S2     _mode,B4          ; |269| 

   [ B0]   MVKH    .S2     _mode,B4          ; |269| 
|| [ B0]   MVK     .S1     1,A0              ; |269| 

   [ B0]   STW     .D2T1   A0,*B4            ; |269| 
           ; BRANCH OCCURS                   ; |271| 


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
	.global	_y_pend
	.global	_mostPlusPos
	.global	_mostMinusPos
	.global	__divd
