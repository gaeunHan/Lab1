;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Tue Jun 04 00:51:08 2024                                *
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

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_rightSWUPcartPos+0,32
	.word	043fa0000h		; _rightSWUPcartPos @ 0
	.sect	".text"
	.global	_rightSWUPcartPos
_rightSWUPcartPos:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_leftSWUPcartPos+0,32
	.word	0c3fa0000h		; _leftSWUPcartPos @ 0
	.sect	".text"
	.global	_leftSWUPcartPos
_leftSWUPcartPos:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI17036_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI17036_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
           ZERO    .D1     A0                ; |38| 
           MVKH    .S1     0x1800000,A0      ; |38| 
           LDW     .D1T1   *A0,A4            ; |38| 
           MVKL    .S2     0x1800008,B5      ; |41| 
           MVKL    .S2     0x21520521,B6     ; |53| 
           B       .S2     B3                ; |63| 

           MVKL    .S2     0x1800010,B4      ; |53| 
||         MVKL    .S1     0xd00321,A3       ; |41| 

           CLR     .S1     A4,3,5,A4         ; |38| 
||         MVKH    .S2     0x1800008,B5      ; |41| 

           STW     .D1T1   A4,*A0            ; |38| 
||         MVKH    .S2     0x21520521,B6     ; |53| 
||         MVKH    .S1     0xd00321,A3       ; |41| 

           STW     .D2T1   A3,*B5            ; |41| 
||         MVKH    .S2     0x1800010,B4      ; |53| 

           STW     .D2T2   B6,*B4            ; |53| 
           ; BRANCH OCCURS                   ; |63| 


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
           ZERO    .D2     B4                ; |68| 
           MVKH    .S2     0x1940000,B4      ; |68| 
           LDW     .D2T2   *B4,B5            ; |68| 
           MVKL    .S1     0x1940004,A0      ; |71| 
           MVKH    .S1     0x1940004,A0      ; |71| 
           ZERO    .D1     A3                ; |74| 
           MVKH    .S1     0x1940000,A3      ; |74| 
           SET     .S2     B5,8,9,B5         ; |68| 

           MVK     .S2     20000,B4          ; |71| 
||         STW     .D2T2   B5,*B4            ; |68| 

           STW     .D1T2   B4,*A0            ; |71| 
           LDW     .D1T1   *A3,A0            ; |74| 
           B       .S2     B3                ; |75| 
           NOP             3
           SET     .S1     A0,6,7,A0         ; |74| 
           STW     .D1T1   A0,*A3            ; |74| 
           ; BRANCH OCCURS                   ; |75| 


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
           MVC     .S2     IER,B4            ; |80| 
           MVK     .S1     16450,A0          ; |80| 
           OR      .S2X    A0,B4,B4          ; |80| 
           MVC     .S2     B4,IER            ; |80| 
           B       .S2     B3                ; |81| 
           NOP             5
           ; BRANCH OCCURS                   ; |81| 


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
           MVC     .S2     CSR,B4            ; |86| 
           OR      .S2     1,B4,B4           ; |86| 
           MVC     .S2     B4,CSR            ; |86| 
           B       .S2     B3                ; |87| 
           NOP             5
           ; BRANCH OCCURS                   ; |87| 


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
           MV      .S2X    A4,B4             ; |91| 
           SHL     .S2     B4,4,B5           ; |94| 

           ZERO    .S2     B4                ; |94| 
||         SUBAH   .D2     B5,B4,B5          ; |94| 

           CMPLTU  .L2     B4,B5,B0          ; |94| 
   [!B0]   B       .S1     L2                ; |94| 
           SUB     .D2     SP,8,SP           ; |91| 
           STW     .D2T1   A4,*+SP(4)        ; |91| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |94| 
           NOP             2
           ; BRANCH OCCURS                   ; |94| 
;** --------------------------------------------------------------------------*
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L1:    
           SHL     .S2     B5,4,B6           ; |94| 

           SUBAH   .D2     B6,B5,B5          ; |94| 
||         ADD     .S2     1,B4,B4           ; |94| 

           CMPLTU  .L2     B4,B5,B0          ; |94| 
   [ B0]   B       .S1     L1                ; |94| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |94| 
           NOP             4
           ; BRANCH OCCURS                   ; |94| 
;** --------------------------------------------------------------------------*
L2:    
           B       .S2     B3                ; |95| 
           ADD     .D2     8,SP,SP           ; |95| 
           NOP             4
           ; BRANCH OCCURS                   ; |95| 


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
           ZERO    .D2     B7                ; |102| 
           CMPLTU  .L2X    B7,A4,B0
   [!B0]   B       .S1     L4                ; |102| 
           SUB     .D2     SP,8,SP           ; |99| 
           STW     .D2T1   A4,*+SP(4)        ; |99| 
           MV      .L2     B3,B9             ; |99| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |103| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |103| 
           ; BRANCH OCCURS                   ; |102| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L3:    
           B       .S2     B4                ; |103| 
           MVKL    .S2     RL0,B3            ; |103| 
           MVKH    .S2     RL0,B3            ; |103| 
           MVK     .S1     0x3e8,A4          ; |103| 
           NOP             2
RL0:       ; CALL OCCURS                     ; |103| 
           LDW     .D2T2   *+SP(4),B4        ; |104| 
           ADD     .D2     1,B7,B7           ; |104| 
           NOP             3
           CMPLTU  .L2     B7,B4,B0          ; |104| 
   [ B0]   B       .S1     L3                ; |104| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |103| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |103| 
           NOP             3
           ; BRANCH OCCURS                   ; |104| 
;** --------------------------------------------------------------------------*
L4:    
           B       .S2     B9                ; |105| 
           ADD     .D2     8,SP,SP           ; |105| 
           NOP             4
           ; BRANCH OCCURS                   ; |105| 


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
           MVKL    .S1     _TFlag,A0         ; |110| 
           MVKH    .S1     _TFlag,A0         ; |110| 
           LDW     .D1T1   *A0,A1            ; |110| 
           NOP             4
   [ A1]   B       .S1     L6                ; |110| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |110| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |110| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |110| 
           NOP             2
           ; BRANCH OCCURS                   ; |110| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L5:    
           NOP             2
   [!A1]   B       .S1     L5                ; |110| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |110| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |110| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |110| 
           NOP             2
           ; BRANCH OCCURS                   ; |110| 
;** --------------------------------------------------------------------------*
L6:    
           B       .S2     B3                ; |112| 
           MVKL    .S1     _TFlag,A0         ; |111| 
           MVKH    .S1     _TFlag,A0         ; |111| 
           ZERO    .D1     A3                ; |111| 
           STW     .D1T1   A3,*A0            ; |111| 
           NOP             1
           ; BRANCH OCCURS                   ; |112| 


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

           SUB     .D2     SP,8,SP           ; |116| 
||         MVKL    .S1     _TFlag,A0         ; |119| 

           STW     .D2T1   A4,*+SP(4)        ; |116| 
||         MVKH    .S1     _TFlag,A0         ; |119| 
||         ZERO    .D1     A3                ; |119| 

           STW     .D1T1   A3,*A0            ; |119| 
           LDW     .D2T2   *+SP(4),B5        ; |121| 
           ZERO    .D2     B4                ; |121| 
           STW     .D2T2   B4,*+SP(8)        ; |121| 
           MV      .S2     B3,B9             ; |116| 
           NOP             1
           CMPLTU  .L2     B4,B5,B0          ; |121| 
   [!B0]   B       .S1     L8                ; |121| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |122| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |122| 
           NOP             3
           ; BRANCH OCCURS                   ; |121| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L7:    
           B       .S2X    A0                ; |122| 
           MVKL    .S2     RL2,B3            ; |122| 
           MVKH    .S2     RL2,B3            ; |122| 
           NOP             3
RL2:       ; CALL OCCURS                     ; |122| 
           LDW     .D2T2   *+SP(8),B4        ; |123| 
           LDW     .D2T2   *+SP(4),B5        ; |123| 
           NOP             3
           ADD     .D2     1,B4,B4           ; |123| 
           CMPLTU  .L2     B4,B5,B0          ; |123| 
   [ B0]   B       .S1     L7                ; |123| 
           STW     .D2T2   B4,*+SP(8)        ; |123| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |122| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |122| 
           NOP             2
           ; BRANCH OCCURS                   ; |123| 
;** --------------------------------------------------------------------------*
L8:    
           B       .S2     B9                ; |124| 
           ADD     .D2     8,SP,SP           ; |124| 
           NOP             4
           ; BRANCH OCCURS                   ; |124| 


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
           MV      .S2X    A4,B4             ; |127| 
           SPDP    .S2     B4,B5:B4          ; |136| 
           ZERO    .D2     B6                ; |136| 
           MVKL    .S2     0xc048c000,B7     ; |136| 
           MVKH    .S2     0xc048c000,B7     ; |136| 

           CMPLTDP .S2     B5:B4,B7:B6,B0    ; |136| 
||         ZERO    .D1     A0                ; |137| 
||         STW     .D2T2   B3,*SP--(16)      ; |127| 

           STW     .D2T1   A4,*+SP(4)        ; |127| 
||         MVKH    .S1     0xc2460000,A0     ; |137| 

   [ B0]   STW     .D2T1   A0,*+SP(4)        ; |137| 
           LDW     .D2T2   *+SP(4),B4        ; |140| 
           MVKL    .S1     0x4048c000,A1     ; |140| 
           ZERO    .D1     A0                ; |140| 
           MVKL    .S2     RL4,B3            ; |145| 
           MVKH    .S2     RL4,B3            ; |145| 
           SPDP    .S2     B4,B5:B4          ; |140| 
           MVKH    .S1     0x4048c000,A1     ; |140| 
           CMPGTDP .S1X    B5:B4,A1:A0,A1    ; |140| 
           MVKL    .S2     __divd,B8         ; |145| 
           MVKH    .S1     0x42460000,A0     ; |141| 
   [ A1]   STW     .D2T1   A0,*+SP(4)        ; |141| 
           LDW     .D2T2   *+SP(4),B4        ; |145| 
           ZERO    .D1     A0                ; |145| 
           MVKH    .S1     0x42480000,A0     ; |145| 
           MVKH    .S2     __divd,B8         ; |145| 
           NOP             1
           ADDSP   .L2X    A0,B4,B5          ; |145| 
           MVKL    .S2     0x457ff000,B4     ; |145| 
           MVKH    .S2     0x457ff000,B4     ; |145| 
           NOP             1
           MPYSP   .M2     B4,B5,B4          ; |145| 
           ZERO    .D2     B5                ; |145| 
           MVKH    .S2     0x40590000,B5     ; |145| 
           B       .S2     B8                ; |145| 
           SPDP    .S2     B4,B7:B6          ; |145| 
           ZERO    .D2     B4                ; |145| 
           MV      .S1X    B6,A4             ; |145| 
           NOP             1
           MV      .S1X    B7,A5             ; |145| 
RL4:       ; CALL OCCURS                     ; |145| 
           DPSP    .L1     A5:A4,A0          ; |145| 
           NOP             3
           MV      .S2X    A0,B4             ; |145| 
           SPTRUNC .L2     B4,B4             ; |147| 
           STW     .D2T1   A0,*+SP(8)        ; |145| 
           MVKL    .S1     0x2000088,A0      ; |147| 
           MVKH    .S1     0x2000088,A0      ; |147| 
           STW     .D1T2   B4,*A0            ; |147| 
           LDW     .D2T1   *+SP(4),A4        ; |149| 
           LDW     .D2T2   *++SP(16),B3      ; |150| 
           NOP             4
           B       .S2     B3                ; |150| 
           NOP             5
           ; BRANCH OCCURS                   ; |150| 


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
           MVKL    .S2     0x200020c,B4      ; |158| 
           MVKH    .S2     0x200020c,B4      ; |158| 
           LDW     .D2T2   *B4,B4            ; |158| 
           NOP             4

           EXTU    .S2     B4,16,16,B4       ; |158| 
||         SUB     .D2     SP,16,SP          ; |152| 

           STH     .D2T2   B4,*+SP(4)        ; |158| 
           LDH     .D2T2   *+SP(4),B5        ; |161| 
           LDH     .D2T2   *+SP(4),B6        ; |161| 
           LDH     .D2T2   *+SP(4),B4        ; |162| 
           NOP             2

           MVK     .S1     32767,A3          ; |161| 
||         ZERO    .D1     A0                ; |162| 

           CMPGT   .L1X    B5,A3,A1          ; |161| 
||         MVKH    .S1     0x10000,A0        ; |162| 

   [!A1]   STW     .D2T2   B6,*+SP(8)        ; |161| 
||         SUB     .L2X    B4,A0,B4          ; |162| 

   [ A1]   STW     .D2T2   B4,*+SP(8)        ; |162| 
           LDW     .D2T2   *+SP(8),B4        ; |165| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |165| 
           NOP             2
           MVKL    .S1     0x3fd68000,A1     ; |165| 

           MVKH    .S1     0x3fd68000,A1     ; |165| 
||         ZERO    .D1     A0                ; |165| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |165| 
           NOP             8
           B       .S2     B3                ; |167| 
           DPSP    .L1     A1:A0,A0          ; |165| 
           NOP             3

           ADDK    .S2     16,SP             ; |167| 
||         STW     .D2T1   A0,*+SP(12)       ; |165| 
||         MV      .D1     A0,A4             ; |165| 

           ; BRANCH OCCURS                   ; |167| 


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
           MVKL    .S2     0x2000210,B4      ; |175| 
           MVKH    .S2     0x2000210,B4      ; |175| 
           LDW     .D2T2   *B4,B4            ; |175| 
           NOP             4

           EXTU    .S2     B4,16,16,B4       ; |175| 
||         SUB     .D2     SP,16,SP          ; |169| 

           STH     .D2T2   B4,*+SP(4)        ; |175| 
           LDH     .D2T2   *+SP(4),B5        ; |178| 
           LDH     .D2T2   *+SP(4),B6        ; |178| 
           LDH     .D2T2   *+SP(4),B4        ; |179| 
           NOP             2

           MVK     .S1     32767,A3          ; |178| 
||         ZERO    .D1     A0                ; |179| 

           CMPGT   .L1X    B5,A3,A1          ; |178| 
||         MVKH    .S1     0x10000,A0        ; |179| 

   [!A1]   STW     .D2T2   B6,*+SP(8)        ; |178| 
||         SUB     .L2X    B4,A0,B4          ; |179| 

   [ A1]   STW     .D2T2   B4,*+SP(8)        ; |179| 
           LDW     .D2T2   *+SP(8),B4        ; |182| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |182| 
           NOP             2
           MVKL    .S1     0x3fd68000,A1     ; |182| 

           MVKH    .S1     0x3fd68000,A1     ; |182| 
||         ZERO    .D1     A0                ; |182| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |182| 
           NOP             8
           B       .S2     B3                ; |185| 
           DPSP    .L1     A1:A0,A0          ; |182| 
           NOP             3

           ADDK    .S2     16,SP             ; |185| 
||         STW     .D2T1   A0,*+SP(12)       ; |182| 
||         MV      .D1     A0,A4             ; |182| 

           ; BRANCH OCCURS                   ; |185| 


	.sect	".text"
	.global	_swingUp

;******************************************************************************
;* FUNCTION NAME: _swingUp                                                    *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,A4,A5,A6,A7,A8,A9,B0,B4,B5,B6               *
;*   Regs Used         : A0,A1,A3,A4,A5,A6,A7,A8,A9,B0,B3,B4,B5,B6            *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_swingUp:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _y_pend,A0        ; |189| 
           MVKH    .S1     _y_pend,A0        ; |189| 
           LDW     .D1T1   *A0,A3            ; |189| 
           ZERO    .D1     A0                ; |189| 
           MVKL    .S2     _prevPendPos,B4   ; |189| 
           MVKH    .S2     _prevPendPos,B4   ; |189| 
           ZERO    .D1     A4                ; |189| 
           CMPEQSP .S1     A3,A0,A1          ; |189| 
   [ A1]   LDW     .D2T2   *B4,B6            ; |189| 
           MVKL    .S2     _R_swup_cart,B5   ; |190| 
           MVKL    .S1     _y_cart,A0        ; |194| 
           ZERO    .D1     A3                ; |190| 
           MVKH    .S2     _R_swup_cart,B5   ; |190| 
   [ A1]   CMPEQSP .S1X    B6,A4,A1          ; |189| 
   [ A1]   B       .S2     B3                ; |219| 
           ZERO    .D1     A5                ; |194| 
           MVKH    .S1     0x40080000,A5     ; |194| 
           MVKH    .S1     0x43fa0000,A3     ; |190| 
           MVKL    .S2     _R_swup_cart,B4   ; |194| 

   [ A1]   STW     .D2T1   A3,*B5            ; |190| 
||         MVKH    .S1     _y_cart,A0        ; |194| 
||         MVKH    .S2     _R_swup_cart,B4   ; |194| 

           ; BRANCH OCCURS                   ; |219| ; chained return
;** --------------------------------------------------------------------------*

           LDW     .D2T2   *B4,B4            ; |194| 
||         LDW     .D1T1   *A0,A0            ; |194| 

           NOP             4
           SUBSP   .L1X    B4,A0,A0          ; |194| 
           NOP             3
           SPDP    .S1     A0,A1:A0          ; |194| 
           NOP             1
           ABSDP   .S1     A1:A0,A1:A0       ; |194| 
           NOP             1
           CMPLTDP .S1     A1:A0,A5:A4,A1    ; |194| 
           NOP             1
   [!A1]   B       .S1     L13               ; |194| 
           MVKL    .S1     _prevPendPos,A0   ; |196| 
           MVKH    .S1     _prevPendPos,A0   ; |196| 
   [ A1]   LDW     .D1T1   *A0,A7            ; |196| 
           NOP             2
           ; BRANCH OCCURS                   ; |194| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     0x407f4000,A5     ; |197| 
           MVKL    .S1     _rightSWUPcartPos,A3 ; |197| 
           CMPGTSP .S1     A7,A4,A1          ; |196| 

   [!A1]   B       .S2     L11               ; |196| 
||         MVKL    .S1     _mostPlusPos,A6   ; |197| 

           MVKL    .S1     _prevPendPos,A0   ; |207| 
           MVKH    .S1     0x407f4000,A5     ; |197| 

           MVKH    .S1     _rightSWUPcartPos,A3 ; |197| 
||         MVKL    .S2     _mostPlusPos,B4   ; |199| 
||         ZERO    .D2     B5                ; |199| 

           MVKH    .S2     0x42b40000,B5     ; |199| 
||         MVKH    .S1     _mostPlusPos,A6   ; |197| 

           ZERO    .L1     A7                ; |207| 
||         MVKH    .S1     _prevPendPos,A0   ; |207| 
||         MVKH    .S2     _mostPlusPos,B4   ; |199| 
|| [ A1]   LDW     .D1T1   *A6,A0            ; |197| 

           ; BRANCH OCCURS                   ; |196| 
;** --------------------------------------------------------------------------*
           NOP             4
           SPDP    .S1     A0,A1:A0          ; |197| 
           NOP             1
           SUBDP   .L1     A5:A4,A1:A0,A1:A0 ; |197| 
           NOP             6
           DPSP    .L1     A1:A0,A0          ; |197| 
           NOP             3
           STW     .D1T1   A0,*A3            ; |197| 
           LDW     .D2T2   *B4,B6            ; |199| 
           MVKL    .S2     _mostPlusPos,B4   ; |199| 
           MVKH    .S2     _mostPlusPos,B4   ; |199| 
           ZERO    .D1     A3                ; |203| 
           MVKH    .S1     0x42b40000,A3     ; |203| 
           CMPGTSP .S2     B6,B5,B5          ; |199| 
           XOR     .L2     1,B5,B0           ; |199| 
   [ B0]   LDW     .D2T2   *B4,B6            ; |199| 
           ZERO    .D2     B5                ; |199| 
           MVKL    .S2     _mostPlusPos,B4   ; |200| 
           MVKL    .S1     _prevPendPos,A0   ; |200| 
           MVKH    .S2     _mostPlusPos,B4   ; |200| 
   [ B0]   CMPGTSP .S2     B6,B5,B0          ; |199| 
   [!B0]   B       .S1     L10               ; |199| 
           MVKL    .S1     _mostPlusPos,A4   ; |203| 
           MVKH    .S1     _mostPlusPos,A4   ; |203| 
           MVKH    .S1     _prevPendPos,A0   ; |200| 
   [!B0]   LDW     .D1T1   *A4,A4            ; |203| 
           NOP             1
           ; BRANCH OCCURS                   ; |199| 
;** --------------------------------------------------------------------------*

           MVKL    .S1     _rightSWUPcartPos,A0 ; |200| 
||         LDW     .D1T1   *A0,A3            ; |200| 

           MVKH    .S1     _rightSWUPcartPos,A0 ; |200| 
;** --------------------------------------------------------------------------*
L9:    
           LDW     .D2T2   *B4,B4            ; |200| 
           NOP             4
           CMPEQSP .S2X    A3,B4,B0          ; |200| 

           B       .S2     B3                ; |219| 
|| [ B0]   LDW     .D1T1   *A0,A0            ; |200| 

           MVKL    .S2     _R_swup_cart,B4   ; |200| 
           MVKH    .S2     _R_swup_cart,B4   ; |200| 
           NOP             2
   [ B0]   STW     .D2T1   A0,*B4            ; |200| 
           ; BRANCH OCCURS                   ; |219| ; chained return
;** --------------------------------------------------------------------------*
L10:    
           MVKL    .S1     _mostPlusPos,A0   ; |203| 
           MVKH    .S1     _mostPlusPos,A0   ; |203| 
           ZERO    .D2     B4                ; |203| 
           MVKH    .S2     0x43340000,B4     ; |203| 
           CMPGTSP .S1     A4,A3,A1          ; |203| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |203| 
           MV      .L2X    A1,B6             ; |203| 
           MVKL    .S1     _y_pend,A0        ; |204| 
           MVKH    .S1     _y_pend,A0        ; |204| 
           NOP             1
   [ A1]   CMPLTSP .S2X    A3,B4,B6          ; |203| 
           MV      .S1X    B6,A1             ; |203| 
   [!A1]   B       .S1     L13               ; |203| 
           MVKL    .S2     _prevPendPos,B5   ; |204| 
           MVKH    .S2     _prevPendPos,B5   ; |204| 

   [ A1]   LDW     .D2T2   *B5,B4            ; |204| 
|| [ A1]   LDW     .D1T1   *A0,A3            ; |204| 

           NOP             2
           ; BRANCH OCCURS                   ; |203| 
;** --------------------------------------------------------------------------*
           B       .S1     L12               ; |205| 
           ZERO    .D2     B5                ; |204| 
           CMPGTSP .S2X    B4,A3,B0          ; |204| 
           MVKH    .S2     0x42b40000,B5     ; |204| 
           MVKL    .S2     _rightSWUPcartPos,B4 ; |204| 

           MVKH    .S2     _rightSWUPcartPos,B4 ; |204| 
||         MVKL    .S1     _y_pend,A0        ; |215| 

           ; BRANCH OCCURS                   ; |205| 
;** --------------------------------------------------------------------------*
L11:    
           LDW     .D1T1   *A0,A0            ; |207| 
           MVKL    .S1     _leftSWUPcartPos,A3 ; |208| 
           MVKH    .S1     _leftSWUPcartPos,A3 ; |208| 
           MVKL    .S2     _mostMinusPos,B5  ; |210| 
           ZERO    .D2     B4                ; |210| 
           CMPLTSP .S1     A0,A7,A1          ; |207| 
   [!A1]   B       .S2     B3                ; |219| 
           MVKL    .S1     0x407f4000,A9     ; |208| 
           MVKL    .S1     _mostMinusPos,A4  ; |208| 
           MVKH    .S1     0x407f4000,A9     ; |208| 
           MVKH    .S2     0xc2b40000,B4     ; |210| 

           MVKH    .S2     _mostMinusPos,B5  ; |210| 
||         MVKH    .S1     _mostMinusPos,A4  ; |208| 
||         ZERO    .D1     A8                ; |208| 

           ; BRANCH OCCURS                   ; |219| ; chained return
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A4,A0            ; |208| 
           MVKL    .S1     _mostMinusPos,A4  ; |214| 
           MVKH    .S1     _mostMinusPos,A4  ; |214| 
           NOP             2
           SPDP    .S1     A0,A1:A0          ; |208| 
           NOP             1
           ADDDP   .L1     A1:A0,A9:A8,A1:A0 ; |208| 
           NOP             6
           DPSP    .L1     A1:A0,A0          ; |208| 
           NOP             3
           STW     .D1T1   A0,*A3            ; |208| 
           LDW     .D2T2   *B5,B6            ; |210| 
           MVKL    .S2     _mostMinusPos,B5  ; |210| 
           MVKH    .S2     _mostMinusPos,B5  ; |210| 
           MVKL    .S1     _prevPendPos,A0   ; |211| 
           ZERO    .D1     A3                ; |214| 
           CMPLTSP .S2     B6,B4,B4          ; |210| 
           XOR     .L2     1,B4,B0           ; |210| 
   [ B0]   LDW     .D2T2   *B5,B6            ; |210| 
           ZERO    .D2     B5                ; |210| 
           MVKH    .S1     0xc2b40000,A3     ; |214| 
           MVKH    .S1     _prevPendPos,A0   ; |211| 
           MVKL    .S2     _mostMinusPos,B4  ; |211| 
   [ B0]   CMPLTSP .S2     B6,B5,B0          ; |210| 
   [ B0]   B       .S2     L9                ; |212| 
   [ B0]   LDW     .D1T1   *A0,A3            ; |211| 
   [ B0]   MVKL    .S1     _leftSWUPcartPos,A0 ; |211| 
   [ B0]   MVKH    .S1     _leftSWUPcartPos,A0 ; |211| 
           MVKH    .S2     _mostMinusPos,B4  ; |211| 
   [!B0]   LDW     .D1T1   *A4,A4            ; |214| 
           ; BRANCH OCCURS                   ; |212| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _mostMinusPos,A0  ; |214| 
           MVKH    .S1     _mostMinusPos,A0  ; |214| 
           ZERO    .D2     B4                ; |214| 
           MVKH    .S2     0xc3340000,B4     ; |214| 
           CMPLTSP .S1     A4,A3,A1          ; |214| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |214| 
           MV      .L2X    A1,B6             ; |214| 
           MVKL    .S1     _y_pend,A0        ; |215| 
           MVKH    .S1     _y_pend,A0        ; |215| 
           NOP             1
   [ A1]   CMPGTSP .S2X    A3,B4,B6          ; |214| 
           MV      .S1X    B6,A1             ; |214| 
   [!A1]   B       .S1     L13               ; |214| 
           MVKL    .S2     _prevPendPos,B5   ; |215| 
           MVKH    .S2     _prevPendPos,B5   ; |215| 

   [ A1]   LDW     .D2T2   *B5,B4            ; |215| 
|| [ A1]   LDW     .D1T1   *A0,A3            ; |215| 

           NOP             2
           ; BRANCH OCCURS                   ; |214| 
;** --------------------------------------------------------------------------*
           ZERO    .D2     B5                ; |215| 
           MVKH    .S2     0xc2b40000,B5     ; |215| 
           CMPLTSP .S2X    B4,A3,B0          ; |215| 
           MVKL    .S2     _leftSWUPcartPos,B4 ; |215| 
           MVKH    .S2     _leftSWUPcartPos,B4 ; |215| 
           MVKL    .S1     _y_pend,A0        ; |215| 
;** --------------------------------------------------------------------------*
L12:    
           MVKH    .S1     _y_pend,A0        ; |215| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |215| 
           NOP             4
   [ B0]   CMPEQSP .S2X    A0,B5,B0          ; |215| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |215| 
           MVKL    .S1     _R_swup_cart,A0   ; |215| 
           MVKH    .S1     _R_swup_cart,A0   ; |215| 
           NOP             2
   [ B0]   STW     .D1T2   B4,*A0            ; |215| 
;** --------------------------------------------------------------------------*
L13:    
           B       .S2     B3                ; |219| 
           NOP             5
           ; BRANCH OCCURS                   ; |219| 


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
           MVKL    .S1     _InitEXINTF,A0    ; |223| 
           MVKH    .S1     _InitEXINTF,A0    ; |223| 
           B       .S2X    A0                ; |223| 
           STW     .D2T2   B3,*SP--(24)      ; |222| 
           MVKL    .S2     RL10,B3           ; |223| 
           MVKH    .S2     RL10,B3           ; |223| 
           NOP             2
RL10:      ; CALL OCCURS                     ; |223| 
           MVKL    .S1     _InitTimer,A0     ; |224| 
           MVKH    .S1     _InitTimer,A0     ; |224| 
           B       .S2X    A0                ; |224| 
           MVKL    .S2     RL12,B3           ; |224| 
           MVKH    .S2     RL12,B3           ; |224| 
           NOP             3
RL12:      ; CALL OCCURS                     ; |224| 
           MVKL    .S2     _InitUART,B4      ; |225| 
           MVKH    .S2     _InitUART,B4      ; |225| 
           B       .S2     B4                ; |225| 
           MVKL    .S2     RL14,B3           ; |225| 
           MVKH    .S2     RL14,B3           ; |225| 
           NOP             3
RL14:      ; CALL OCCURS                     ; |225| 
           MVKL    .S1     _InitINT,A0       ; |226| 
           MVKH    .S1     _InitINT,A0       ; |226| 
           B       .S2X    A0                ; |226| 
           MVKL    .S2     RL16,B3           ; |226| 
           MVKH    .S2     RL16,B3           ; |226| 
           NOP             3
RL16:      ; CALL OCCURS                     ; |226| 
           MVKL    .S1     _InitUSBMon,A0    ; |227| 
           MVKH    .S1     _InitUSBMon,A0    ; |227| 
           B       .S2X    A0                ; |227| 
           MVKL    .S2     RL18,B3           ; |227| 
           MVKH    .S2     RL18,B3           ; |227| 
           NOP             3
RL18:      ; CALL OCCURS                     ; |227| 
           MVKL    .S1     _sprintf,A0       ; |229| 

           MVKH    .S1     _sprintf,A0       ; |229| 
||         MVKL    .S2     SL1+0,B5          ; |229| 

           B       .S2X    A0                ; |229| 
           MVKL    .S2     RL20,B3           ; |229| 
           MVKH    .S2     SL1+0,B5          ; |229| 
           MVKL    .S2     _tmp_string,B4    ; |229| 
           MVKH    .S2     _tmp_string,B4    ; |229| 

           MVKH    .S2     RL20,B3           ; |229| 
||         STW     .D2T2   B5,*+SP(4)        ; |229| 
||         MV      .S1X    B4,A4             ; |229| 

RL20:      ; CALL OCCURS                     ; |229| 
           MVKL    .S1     _Report,A0        ; |229| 
           MVKH    .S1     _Report,A0        ; |229| 
           B       .S2X    A0                ; |229| 
           MVKL    .S2     RL22,B3           ; |229| 
           MVKH    .S2     RL22,B3           ; |229| 
           NOP             3
RL22:      ; CALL OCCURS                     ; |229| 
           MVK     .S1     2024,A0           ; |230| 

           MVKL    .S1     _sprintf,A0       ; |230| 
||         STW     .D2T1   A0,*+SP(8)        ; |230| 

           MVKH    .S1     _sprintf,A0       ; |230| 
||         MVKL    .S2     _tmp_string,B5    ; |230| 

           B       .S2X    A0                ; |230| 
           MVKL    .S2     SL2+0,B4          ; |230| 
           MVKH    .S2     _tmp_string,B5    ; |230| 
           MVKH    .S2     SL2+0,B4          ; |230| 
           MVKL    .S2     RL24,B3           ; |230| 

           MVKH    .S2     RL24,B3           ; |230| 
||         STW     .D2T2   B4,*+SP(4)        ; |230| 
||         MV      .S1X    B5,A4             ; |230| 

RL24:      ; CALL OCCURS                     ; |230| 
           MVKL    .S1     _Report,A0        ; |230| 
           MVKH    .S1     _Report,A0        ; |230| 
           B       .S2X    A0                ; |230| 
           MVKL    .S2     RL26,B3           ; |230| 
           MVKH    .S2     RL26,B3           ; |230| 
           NOP             3
RL26:      ; CALL OCCURS                     ; |230| 
           MVKL    .S2     SL3+0,B5          ; |231| 
           MVKH    .S2     SL3+0,B5          ; |231| 
           MVKL    .S2     0x20003fc,B4      ; |231| 

           STW     .D2T2   B5,*+SP(4)        ; |231| 
||         MVKH    .S2     0x20003fc,B4      ; |231| 

           LDW     .D2T2   *B4,B4            ; |231| 
           MVKL    .S1     0x20003fc,A0      ; |231| 
           MVKH    .S1     0x20003fc,A0      ; |231| 
           MVKL    .S1     _tmp_string,A4    ; |231| 
           MVKL    .S2     RL28,B3           ; |231| 
           EXTU    .S2     B4,16,24,B4       ; |231| 
           STW     .D2T2   B4,*+SP(8)        ; |231| 

           MVKL    .S1     _sprintf,A0       ; |231| 
||         LDW     .D1T1   *A0,A3            ; |231| 

           MVKH    .S1     _sprintf,A0       ; |231| 
           B       .S2X    A0                ; |231| 
           MVKH    .S1     _tmp_string,A4    ; |231| 
           MVKH    .S2     RL28,B3           ; |231| 
           EXTU    .S1     A3,24,24,A3       ; |231| 
           STW     .D2T1   A3,*+SP(12)       ; |231| 
           NOP             1
RL28:      ; CALL OCCURS                     ; |231| 
           MVKL    .S1     _Report,A0        ; |231| 
           MVKH    .S1     _Report,A0        ; |231| 
           B       .S2X    A0                ; |231| 
           MVKL    .S2     RL30,B3           ; |231| 
           MVKH    .S2     RL30,B3           ; |231| 
           NOP             3
RL30:      ; CALL OCCURS                     ; |231| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |235| 
           MVKH    .S1     _GIE,A0           ; |235| 
           B       .S2X    A0                ; |235| 
           MVKL    .S2     _TFlag,B4         ; |233| 
           MVKL    .S2     RL32,B3           ; |235| 
           MVKH    .S2     _TFlag,B4         ; |233| 
           ZERO    .D2     B5                ; |233| 

           STW     .D2T2   B5,*B4            ; |233| 
||         MVKH    .S2     RL32,B3           ; |235| 

RL32:      ; CALL OCCURS                     ; |235| 

           MVK     .S2     1,B6              ; |237| 
||         MVKL    .S1     _WaitTFlagCnt,A3  ; |240| 

           MVKL    .S2     0x200004c,B5      ; |236| 
||         MVKH    .S1     _WaitTFlagCnt,A3  ; |240| 

           B       .S2X    A3                ; |240| 

           MVKH    .S2     0x200004c,B5      ; |236| 
||         MVK     .S1     1,A4              ; |236| 

           MVKL    .S2     0x200008c,B4      ; |238| 
||         MVKL    .S1     0x2000080,A0      ; |237| 

           MVKL    .S2     RL34,B3           ; |240| 
||         STW     .D2T1   A4,*B5            ; |236| 
||         MVKH    .S1     0x2000080,A0      ; |237| 

           STW     .D1T2   B6,*A0            ; |237| 
||         MVKH    .S2     0x200008c,B4      ; |238| 
||         MVK     .S1     1,A5              ; |238| 

           STW     .D2T1   A5,*B4            ; |238| 
||         MVK     .S1     0x3e8,A4          ; |240| 
||         MVKH    .S2     RL34,B3           ; |240| 

RL34:      ; CALL OCCURS                     ; |240| 
           MVKL    .S2     _TINTCnt,B4       ; |242| 

           MVKH    .S2     _TINTCnt,B4       ; |242| 
||         MVKL    .S1     _mode,A0          ; |243| 
||         ZERO    .D2     B5                ; |242| 

           STW     .D2T2   B5,*B4            ; |242| 
||         MVKH    .S1     _mode,A0          ; |243| 
||         ZERO    .D1     A3                ; |243| 

           STW     .D1T1   A3,*A0            ; |243| 
           MVKL    .S1     0x200004c,A0      ; |246| 
           MVKH    .S1     0x200004c,A0      ; |246| 
           LDW     .D1T1   *A0,A3            ; |246| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L14
;** --------------------------------------------------------------------------*
L14:    
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L15:    
           MVKL    .S2     _mode,B4          ; |248| 
           MVKH    .S2     _mode,B4          ; |248| 
           XOR     .S1     1,A3,A3           ; |246| 
           STW     .D1T1   A3,*A0            ; |246| 
           LDW     .D2T2   *B4,B0            ; |248| 
           NOP             4
   [ B0]   B       .S1     L16               ; |248| 
   [!B0]   MVKL    .S1     _swingUp,A0       ; |249| 
   [!B0]   MVKH    .S1     _swingUp,A0       ; |249| 
   [ B0]   MVKL    .S1     _y_pend,A0        ; |253| 
   [ B0]   MVKH    .S1     _y_pend,A0        ; |253| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |253| 
           ; BRANCH OCCURS                   ; |248| 
;** --------------------------------------------------------------------------*
           B       .S2X    A0                ; |249| 
           MVKL    .S2     RL36,B3           ; |249| 
           MVKH    .S2     RL36,B3           ; |249| 
           NOP             3
RL36:      ; CALL OCCURS                     ; |249| 
           MVKL    .S1     _y_pend,A0        ; |253| 
           MVKH    .S1     _y_pend,A0        ; |253| 
           LDW     .D1T1   *A0,A0            ; |253| 
;** --------------------------------------------------------------------------*
L16:    
           ZERO    .D2     B4                ; |253| 
           MVKH    .S2     0x432a0000,B4     ; |253| 
           NOP             2
           CMPLTSP .S2X    A0,B4,B4          ; |253| 
           XOR     .S2     1,B4,B0           ; |253| 
   [ B0]   MVKL    .S2     _y_pend,B4        ; |253| 
   [ B0]   MVKH    .S2     _y_pend,B4        ; |253| 
   [ B0]   LDW     .D2T2   *B4,B4            ; |253| 
   [ B0]   ZERO    .D1     A0                ; |253| 
   [ B0]   MVKH    .S1     0x433e0000,A0     ; |253| 
           NOP             2
   [ B0]   CMPGTSP .S2X    B4,A0,B4          ; |253| 
   [ B0]   XOR     .S2     1,B4,B0           ; |253| 
   [ B0]   MVKL    .S2     _mode,B5          ; |254| 
           MVKL    .S2     _TINTCnt,B4       ; |258| 

   [ B0]   MVKH    .S2     _mode,B5          ; |254| 
|| [ B0]   MVK     .S1     1,A0              ; |254| 

   [ B0]   STW     .D2T1   A0,*B5            ; |254| 
||         MVKH    .S2     _TINTCnt,B4       ; |258| 

           LDW     .D2T2   *B4,B4            ; |258| 
           MVK     .S1     500,A0            ; |258| 
           NOP             3
           CMPGTU  .L1X    B4,A0,A1          ; |258| 
   [!A1]   B       .S1     L15               ; |258| 

   [ A1]   MVKL    .S2     _timerCheckCnt,B4 ; |260| 
|| [!A1]   MVKL    .S1     0x200004c,A0      ; |246| 

   [ A1]   MVKH    .S2     _timerCheckCnt,B4 ; |260| 
|| [!A1]   MVKH    .S1     0x200004c,A0      ; |246| 

   [ A1]   LDW     .D2T2   *B4,B6            ; |260| 
|| [!A1]   LDW     .D1T1   *A0,A3            ; |246| 

           NOP             2
           ; BRANCH OCCURS                   ; |258| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     SL4+0,B5          ; |261| 
           MVKH    .S2     SL4+0,B5          ; |261| 
           ADD     .D2     1,B6,B7           ; |260| 

           STW     .D2T2   B7,*B4            ; |260| 
||         MVKL    .S2     _timerCheckCnt,B6 ; |261| 
||         MVKL    .S1     _sprintf,A0       ; |261| 

           STW     .D2T2   B5,*+SP(4)        ; |261| 
||         MVKH    .S2     _timerCheckCnt,B6 ; |261| 
||         MVKH    .S1     _sprintf,A0       ; |261| 

           B       .S2X    A0                ; |261| 
||         LDW     .D2T2   *B6,B5            ; |261| 

           MVKL    .S2     RL38,B3           ; |261| 
           MVKL    .S2     _tmp_string,B4    ; |261| 
           MVKH    .S2     _tmp_string,B4    ; |261| 
           MV      .S1X    B4,A4             ; |261| 

           STW     .D2T2   B5,*+SP(8)        ; |261| 
||         MVKH    .S2     RL38,B3           ; |261| 

RL38:      ; CALL OCCURS                     ; |261| 
           MVKL    .S1     _Report,A0        ; |261| 
           MVKH    .S1     _Report,A0        ; |261| 
           B       .S2X    A0                ; |261| 
           MVKL    .S2     RL40,B3           ; |261| 
           MVKH    .S2     RL40,B3           ; |261| 
           NOP             3
RL40:      ; CALL OCCURS                     ; |261| 
           MVKL    .S1     _GetPendulumPos,A0 ; |264| 
           MVKH    .S1     _GetPendulumPos,A0 ; |264| 
           B       .S2X    A0                ; |264| 
           MVKL    .S2     RL44,B3           ; |264| 
           MVKH    .S2     RL44,B3           ; |264| 
           NOP             3
RL44:      ; CALL OCCURS                     ; |264| 
           MVKL    .S2     _sprintf,B4       ; |264| 
           MVKH    .S2     _sprintf,B4       ; |264| 

           B       .S2     B4                ; |264| 
||         SPDP    .S1     A4,A7:A6          ; |264| 

           MVKL    .S2     SL5+0,B5          ; |264| 
           MV      .D1     A7,A0             ; |264| 

           MVKH    .S2     SL5+0,B5          ; |264| 
||         STW     .D2T1   A0,*+SP(12)       ; |264| 

           STW     .D2T2   B5,*+SP(4)        ; |264| 
||         MV      .D1     A6,A3             ; |264| 
||         MVKL    .S1     _tmp_string,A4    ; |264| 
||         MVKL    .S2     RL46,B3           ; |264| 

           STW     .D2T1   A3,*+SP(8)        ; |264| 
||         MVKH    .S1     _tmp_string,A4    ; |264| 
||         MVKH    .S2     RL46,B3           ; |264| 

RL46:      ; CALL OCCURS                     ; |264| 
           MVKL    .S1     _Report,A0        ; |264| 
           MVKH    .S1     _Report,A0        ; |264| 
           B       .S2X    A0                ; |264| 
           MVKL    .S2     RL48,B3           ; |264| 
           MVKH    .S2     RL48,B3           ; |264| 
           NOP             3
RL48:      ; CALL OCCURS                     ; |264| 
           MVKL    .S1     _GetCartPos,A0    ; |267| 
           MVKH    .S1     _GetCartPos,A0    ; |267| 
           B       .S2X    A0                ; |267| 
           MVKL    .S2     RL52,B3           ; |267| 
           MVKH    .S2     RL52,B3           ; |267| 
           NOP             3
RL52:      ; CALL OCCURS                     ; |267| 
           SPDP    .S1     A4,A5:A4          ; |267| 
           MVKL    .S2     SL6+0,B5          ; |267| 
           MV      .D1     A5,A0             ; |267| 

           MVKL    .S1     _sprintf,A0       ; |267| 
||         STW     .D2T1   A0,*+SP(12)       ; |267| 

           MVKH    .S1     _sprintf,A0       ; |267| 
           B       .S2X    A0                ; |267| 
           MVKH    .S2     SL6+0,B5          ; |267| 
           MVKL    .S2     _tmp_string,B4    ; |267| 

           MV      .D1     A4,A3             ; |267| 
||         MVKH    .S2     _tmp_string,B4    ; |267| 

           MVKL    .S2     RL54,B3           ; |267| 
||         STW     .D2T1   A3,*+SP(8)        ; |267| 

           MVKH    .S2     RL54,B3           ; |267| 
||         STW     .D2T2   B5,*+SP(4)        ; |267| 
||         MV      .S1X    B4,A4             ; |267| 

RL54:      ; CALL OCCURS                     ; |267| 
           MVKL    .S1     _Report,A0        ; |267| 
           MVKH    .S1     _Report,A0        ; |267| 
           B       .S2X    A0                ; |267| 
           MVKL    .S2     RL56,B3           ; |267| 
           MVKH    .S2     RL56,B3           ; |267| 
           NOP             3
RL56:      ; CALL OCCURS                     ; |267| 
           MVKL    .S1     _sprintf,A0       ; |270| 

           MVKH    .S1     _sprintf,A0       ; |270| 
||         MVKL    .S2     _tmp_string,B4    ; |270| 

           B       .S2X    A0                ; |270| 
           MVKL    .S2     SL7+0,B5          ; |270| 
           MVKH    .S2     _tmp_string,B4    ; |270| 
           MVKL    .S2     RL58,B3           ; |270| 
           MVKH    .S2     SL7+0,B5          ; |270| 

           STW     .D2T2   B5,*+SP(4)        ; |270| 
||         MV      .S1X    B4,A4             ; |270| 
||         MVKH    .S2     RL58,B3           ; |270| 

RL58:      ; CALL OCCURS                     ; |270| 
           MVKL    .S1     _Report,A0        ; |270| 
           MVKH    .S1     _Report,A0        ; |270| 
           B       .S2X    A0                ; |270| 
           MVKL    .S2     RL60,B3           ; |270| 
           MVKH    .S2     RL60,B3           ; |270| 
           NOP             3
RL60:      ; CALL OCCURS                     ; |270| 
           MVKL    .S2     SL8+0,B4          ; |271| 

           MVKL    .S1     _mostPlusPos,A0   ; |271| 
||         MVKH    .S2     SL8+0,B4          ; |271| 

           MVKH    .S1     _mostPlusPos,A0   ; |271| 
||         STW     .D2T2   B4,*+SP(4)        ; |271| 

           LDW     .D1T1   *A0,A0            ; |271| 
           MVKL    .S2     RL62,B3           ; |271| 
           MVKL    .S2     _tmp_string,B4    ; |271| 
           MVKH    .S2     _tmp_string,B4    ; |271| 
           MV      .S1X    B4,A4             ; |271| 
           SPDP    .S1     A0,A1:A0          ; |271| 
           MVKH    .S2     RL62,B3           ; |271| 

           MVKL    .S1     _sprintf,A0       ; |271| 
||         STW     .D2T1   A0,*+SP(8)        ; |271| 

           MVKH    .S1     _sprintf,A0       ; |271| 
           B       .S2X    A0                ; |271| 
           STW     .D2T1   A1,*+SP(12)       ; |271| 
           NOP             4
RL62:      ; CALL OCCURS                     ; |271| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _Report,A0        ; |271| 
           MVKH    .S1     _Report,A0        ; |271| 
           B       .S2X    A0                ; |271| 
           MVKL    .S2     RL64,B3           ; |271| 
           MVKH    .S2     RL64,B3           ; |271| 
           NOP             3
RL64:      ; CALL OCCURS                     ; |271| 
           MVKL    .S1     SL9+0,A0          ; |272| 

           MVKL    .S2     _prevPendPos,B4   ; |272| 
||         MVKH    .S1     SL9+0,A0          ; |272| 

           MVKH    .S2     _prevPendPos,B4   ; |272| 
||         STW     .D2T1   A0,*+SP(4)        ; |272| 

           LDW     .D2T2   *B4,B5            ; |272| 
           MVKL    .S2     _sprintf,B4       ; |272| 
           MVKH    .S2     _sprintf,B4       ; |272| 
           B       .S2     B4                ; |272| 
           MVKL    .S1     _tmp_string,A4    ; |272| 
           SPDP    .S2     B5,B7:B6          ; |272| 
           MVKH    .S1     _tmp_string,A4    ; |272| 

           STW     .D2T2   B6,*+SP(8)        ; |272| 
||         MVKL    .S2     RL66,B3           ; |272| 

           MVKH    .S2     RL66,B3           ; |272| 
||         STW     .D2T2   B7,*+SP(12)       ; |272| 

RL66:      ; CALL OCCURS                     ; |272| 
           MVKL    .S1     _Report,A0        ; |272| 
           MVKH    .S1     _Report,A0        ; |272| 
           B       .S2X    A0                ; |272| 
           MVKL    .S2     RL68,B3           ; |272| 
           MVKH    .S2     RL68,B3           ; |272| 
           NOP             3
RL68:      ; CALL OCCURS                     ; |272| 
           MVKL    .S1     SL10+0,A0         ; |273| 
           MVKL    .S1     _remainedAngleToTheGoal,A3 ; |273| 
           MVKH    .S1     SL10+0,A0         ; |273| 

           STW     .D2T1   A0,*+SP(4)        ; |273| 
||         MVKH    .S1     _remainedAngleToTheGoal,A3 ; |273| 

           LDW     .D1T1   *A3,A0            ; |273| 
           MVKL    .S2     _sprintf,B4       ; |273| 
           MVKH    .S2     _sprintf,B4       ; |273| 
           B       .S2     B4                ; |273| 
           MVKL    .S2     _tmp_string,B5    ; |273| 
           SPDP    .S1     A0,A1:A0          ; |273| 
           MVKH    .S2     _tmp_string,B5    ; |273| 

           STW     .D2T1   A1,*+SP(12)       ; |273| 
||         MVKL    .S2     RL70,B3           ; |273| 

           MV      .S1X    B5,A4             ; |273| 
||         STW     .D2T1   A0,*+SP(8)        ; |273| 
||         MVKH    .S2     RL70,B3           ; |273| 

RL70:      ; CALL OCCURS                     ; |273| 
           MVKL    .S1     _Report,A0        ; |273| 
           MVKH    .S1     _Report,A0        ; |273| 
           B       .S2X    A0                ; |273| 
           MVKL    .S2     RL72,B3           ; |273| 
           MVKH    .S2     RL72,B3           ; |273| 
           NOP             3
RL72:      ; CALL OCCURS                     ; |273| 
           MVKL    .S2     _sprintf,B4       ; |275| 
           MVKH    .S2     _sprintf,B4       ; |275| 
           B       .S2     B4                ; |275| 
           MVKL    .S1     _tmp_string,A4    ; |275| 
           MVKL    .S1     SL11+0,A0         ; |275| 
           MVKL    .S2     RL74,B3           ; |275| 
           MVKH    .S1     SL11+0,A0         ; |275| 

           MVKH    .S1     _tmp_string,A4    ; |275| 
||         STW     .D2T1   A0,*+SP(4)        ; |275| 
||         MVKH    .S2     RL74,B3           ; |275| 

RL74:      ; CALL OCCURS                     ; |275| 
           MVKL    .S1     _Report,A0        ; |275| 
           MVKH    .S1     _Report,A0        ; |275| 
           B       .S2X    A0                ; |275| 
           MVKL    .S2     RL76,B3           ; |275| 
           MVKH    .S2     RL76,B3           ; |275| 
           NOP             3
RL76:      ; CALL OCCURS                     ; |275| 
           B       .S1     L14               ; |278| 
           MVKL    .S2     _TINTCnt,B4       ; |276| 

           ZERO    .D2     B5                ; |276| 
||         MVKH    .S2     _TINTCnt,B4       ; |276| 

           STW     .D2T2   B5,*B4            ; |276| 
||         MVKL    .S1     0x200004c,A0      ; |246| 

           MVKH    .S1     0x200004c,A0      ; |246| 
           LDW     .D1T1   *A0,A3            ; |246| 
           ; BRANCH OCCURS                   ; |278| 


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
	.global	_y_cart
	.global	_mostPlusPos
	.global	_mostMinusPos
	.global	_prevPendPos
	.global	_remainedAngleToTheGoal
	.global	__divd
