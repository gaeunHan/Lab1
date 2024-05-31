;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Fri May 31 10:01:43 2024                                *
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
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI1448_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI1448_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
           ZERO    .D1     A0                ; |37| 
           MVKH    .S1     0x1800000,A0      ; |37| 
           LDW     .D1T1   *A0,A4            ; |37| 
           MVKL    .S2     0x1800008,B5      ; |40| 
           MVKL    .S2     0x21520521,B6     ; |52| 
           B       .S2     B3                ; |62| 

           MVKL    .S2     0x1800010,B4      ; |52| 
||         MVKL    .S1     0xd00321,A3       ; |40| 

           CLR     .S1     A4,3,5,A4         ; |37| 
||         MVKH    .S2     0x1800008,B5      ; |40| 

           STW     .D1T1   A4,*A0            ; |37| 
||         MVKH    .S2     0x21520521,B6     ; |52| 
||         MVKH    .S1     0xd00321,A3       ; |40| 

           STW     .D2T1   A3,*B5            ; |40| 
||         MVKH    .S2     0x1800010,B4      ; |52| 

           STW     .D2T2   B6,*B4            ; |52| 
           ; BRANCH OCCURS                   ; |62| 


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
           ZERO    .D2     B4                ; |67| 
           MVKH    .S2     0x1940000,B4      ; |67| 
           LDW     .D2T2   *B4,B5            ; |67| 
           MVKL    .S1     0x1940004,A0      ; |70| 
           MVKH    .S1     0x1940004,A0      ; |70| 
           ZERO    .D1     A3                ; |73| 
           MVKH    .S1     0x1940000,A3      ; |73| 
           SET     .S2     B5,8,9,B5         ; |67| 

           MVK     .S2     20000,B4          ; |70| 
||         STW     .D2T2   B5,*B4            ; |67| 

           STW     .D1T2   B4,*A0            ; |70| 
           LDW     .D1T1   *A3,A0            ; |73| 
           B       .S2     B3                ; |74| 
           NOP             3
           SET     .S1     A0,6,7,A0         ; |73| 
           STW     .D1T1   A0,*A3            ; |73| 
           ; BRANCH OCCURS                   ; |74| 


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
           MVC     .S2     IER,B4            ; |79| 
           MVK     .S1     16450,A0          ; |79| 
           OR      .S2X    A0,B4,B4          ; |79| 
           MVC     .S2     B4,IER            ; |79| 
           B       .S2     B3                ; |80| 
           NOP             5
           ; BRANCH OCCURS                   ; |80| 


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
           MVC     .S2     CSR,B4            ; |85| 
           OR      .S2     1,B4,B4           ; |85| 
           MVC     .S2     B4,CSR            ; |85| 
           B       .S2     B3                ; |86| 
           NOP             5
           ; BRANCH OCCURS                   ; |86| 


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
           MV      .S2X    A4,B4             ; |90| 
           SHL     .S2     B4,4,B5           ; |93| 

           ZERO    .S2     B4                ; |93| 
||         SUBAH   .D2     B5,B4,B5          ; |93| 

           CMPLTU  .L2     B4,B5,B0          ; |93| 
   [!B0]   B       .S1     L2                ; |93| 
           SUB     .D2     SP,8,SP           ; |90| 
           STW     .D2T1   A4,*+SP(4)        ; |90| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |93| 
           NOP             2
           ; BRANCH OCCURS                   ; |93| 
;** --------------------------------------------------------------------------*
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L1:    
           SHL     .S2     B5,4,B6           ; |93| 

           SUBAH   .D2     B6,B5,B5          ; |93| 
||         ADD     .S2     1,B4,B4           ; |93| 

           CMPLTU  .L2     B4,B5,B0          ; |93| 
   [ B0]   B       .S1     L1                ; |93| 
   [ B0]   LDW     .D2T2   *+SP(4),B5        ; |93| 
           NOP             4
           ; BRANCH OCCURS                   ; |93| 
;** --------------------------------------------------------------------------*
L2:    
           B       .S2     B3                ; |94| 
           ADD     .D2     8,SP,SP           ; |94| 
           NOP             4
           ; BRANCH OCCURS                   ; |94| 


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
           ZERO    .D2     B7                ; |101| 
           CMPLTU  .L2X    B7,A4,B0
   [!B0]   B       .S1     L4                ; |101| 
           SUB     .D2     SP,8,SP           ; |98| 
           STW     .D2T1   A4,*+SP(4)        ; |98| 
           MV      .L2     B3,B9             ; |98| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |102| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |102| 
           ; BRANCH OCCURS                   ; |101| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L3:    
           B       .S2     B4                ; |102| 
           MVKL    .S2     RL0,B3            ; |102| 
           MVKH    .S2     RL0,B3            ; |102| 
           MVK     .S1     0x3e8,A4          ; |102| 
           NOP             2
RL0:       ; CALL OCCURS                     ; |102| 
           LDW     .D2T2   *+SP(4),B4        ; |103| 
           ADD     .D2     1,B7,B7           ; |103| 
           NOP             3
           CMPLTU  .L2     B7,B4,B0          ; |103| 
   [ B0]   B       .S1     L3                ; |103| 
   [ B0]   MVKL    .S2     _delay_us,B4      ; |102| 
   [ B0]   MVKH    .S2     _delay_us,B4      ; |102| 
           NOP             3
           ; BRANCH OCCURS                   ; |103| 
;** --------------------------------------------------------------------------*
L4:    
           B       .S2     B9                ; |104| 
           ADD     .D2     8,SP,SP           ; |104| 
           NOP             4
           ; BRANCH OCCURS                   ; |104| 


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
           MVKL    .S1     _TFlag,A0         ; |109| 
           MVKH    .S1     _TFlag,A0         ; |109| 
           LDW     .D1T1   *A0,A1            ; |109| 
           NOP             4
   [ A1]   B       .S1     L6                ; |109| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |109| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |109| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |109| 
           NOP             2
           ; BRANCH OCCURS                   ; |109| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L5:    
           NOP             2
   [!A1]   B       .S1     L5                ; |109| 
   [!A1]   MVKL    .S1     _TFlag,A0         ; |109| 
   [!A1]   MVKH    .S1     _TFlag,A0         ; |109| 
   [!A1]   LDW     .D1T1   *A0,A1            ; |109| 
           NOP             2
           ; BRANCH OCCURS                   ; |109| 
;** --------------------------------------------------------------------------*
L6:    
           B       .S2     B3                ; |111| 
           MVKL    .S1     _TFlag,A0         ; |110| 
           MVKH    .S1     _TFlag,A0         ; |110| 
           ZERO    .D1     A3                ; |110| 
           STW     .D1T1   A3,*A0            ; |110| 
           NOP             1
           ; BRANCH OCCURS                   ; |111| 


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

           SUB     .D2     SP,8,SP           ; |115| 
||         MVKL    .S1     _TFlag,A0         ; |118| 

           STW     .D2T1   A4,*+SP(4)        ; |115| 
||         MVKH    .S1     _TFlag,A0         ; |118| 
||         ZERO    .D1     A3                ; |118| 

           STW     .D1T1   A3,*A0            ; |118| 
           LDW     .D2T2   *+SP(4),B5        ; |120| 
           ZERO    .D2     B4                ; |120| 
           STW     .D2T2   B4,*+SP(8)        ; |120| 
           MV      .S2     B3,B9             ; |115| 
           NOP             1
           CMPLTU  .L2     B4,B5,B0          ; |120| 
   [!B0]   B       .S1     L8                ; |120| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |121| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |121| 
           NOP             3
           ; BRANCH OCCURS                   ; |120| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L7:    
           B       .S2X    A0                ; |121| 
           MVKL    .S2     RL2,B3            ; |121| 
           MVKH    .S2     RL2,B3            ; |121| 
           NOP             3
RL2:       ; CALL OCCURS                     ; |121| 
           LDW     .D2T2   *+SP(8),B4        ; |122| 
           LDW     .D2T2   *+SP(4),B5        ; |122| 
           NOP             3
           ADD     .D2     1,B4,B4           ; |122| 
           CMPLTU  .L2     B4,B5,B0          ; |122| 
   [ B0]   B       .S1     L7                ; |122| 
           STW     .D2T2   B4,*+SP(8)        ; |122| 
   [ B0]   MVKL    .S1     _WaitTFlag,A0     ; |121| 
   [ B0]   MVKH    .S1     _WaitTFlag,A0     ; |121| 
           NOP             2
           ; BRANCH OCCURS                   ; |122| 
;** --------------------------------------------------------------------------*
L8:    
           B       .S2     B9                ; |123| 
           ADD     .D2     8,SP,SP           ; |123| 
           NOP             4
           ; BRANCH OCCURS                   ; |123| 


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
           MV      .S2X    A4,B4             ; |126| 
           SPDP    .S2     B4,B5:B4          ; |135| 
           ZERO    .D2     B6                ; |135| 
           MVKL    .S2     0xc048c000,B7     ; |135| 
           MVKH    .S2     0xc048c000,B7     ; |135| 

           CMPLTDP .S2     B5:B4,B7:B6,B0    ; |135| 
||         ZERO    .D1     A0                ; |136| 
||         STW     .D2T2   B3,*SP--(16)      ; |126| 

           STW     .D2T1   A4,*+SP(4)        ; |126| 
||         MVKH    .S1     0xc2460000,A0     ; |136| 

   [ B0]   STW     .D2T1   A0,*+SP(4)        ; |136| 
           LDW     .D2T2   *+SP(4),B4        ; |139| 
           MVKL    .S1     0x4048c000,A1     ; |139| 
           ZERO    .D1     A0                ; |139| 
           MVKL    .S2     RL4,B3            ; |144| 
           MVKH    .S2     RL4,B3            ; |144| 
           SPDP    .S2     B4,B5:B4          ; |139| 
           MVKH    .S1     0x4048c000,A1     ; |139| 
           CMPGTDP .S1X    B5:B4,A1:A0,A1    ; |139| 
           MVKL    .S2     __divd,B8         ; |144| 
           MVKH    .S1     0x42460000,A0     ; |140| 
   [ A1]   STW     .D2T1   A0,*+SP(4)        ; |140| 
           LDW     .D2T2   *+SP(4),B4        ; |144| 
           ZERO    .D1     A0                ; |144| 
           MVKH    .S1     0x42480000,A0     ; |144| 
           MVKH    .S2     __divd,B8         ; |144| 
           NOP             1
           ADDSP   .L2X    A0,B4,B5          ; |144| 
           MVKL    .S2     0x457ff000,B4     ; |144| 
           MVKH    .S2     0x457ff000,B4     ; |144| 
           NOP             1
           MPYSP   .M2     B4,B5,B4          ; |144| 
           ZERO    .D2     B5                ; |144| 
           MVKH    .S2     0x40590000,B5     ; |144| 
           B       .S2     B8                ; |144| 
           SPDP    .S2     B4,B7:B6          ; |144| 
           ZERO    .D2     B4                ; |144| 
           MV      .S1X    B6,A4             ; |144| 
           NOP             1
           MV      .S1X    B7,A5             ; |144| 
RL4:       ; CALL OCCURS                     ; |144| 
           DPSP    .L1     A5:A4,A0          ; |144| 
           NOP             3
           MV      .S2X    A0,B4             ; |144| 
           SPTRUNC .L2     B4,B4             ; |146| 
           STW     .D2T1   A0,*+SP(8)        ; |144| 
           MVKL    .S1     0x2000088,A0      ; |146| 
           MVKH    .S1     0x2000088,A0      ; |146| 
           STW     .D1T2   B4,*A0            ; |146| 
           LDW     .D2T1   *+SP(4),A4        ; |148| 
           LDW     .D2T2   *++SP(16),B3      ; |149| 
           NOP             4
           B       .S2     B3                ; |149| 
           NOP             5
           ; BRANCH OCCURS                   ; |149| 


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
           MVKL    .S2     0x200020c,B4      ; |157| 
           MVKH    .S2     0x200020c,B4      ; |157| 
           LDW     .D2T2   *B4,B4            ; |157| 
           NOP             4

           EXTU    .S2     B4,16,16,B4       ; |157| 
||         SUB     .D2     SP,16,SP          ; |151| 

           STH     .D2T2   B4,*+SP(4)        ; |157| 
           LDH     .D2T2   *+SP(4),B5        ; |160| 
           LDH     .D2T2   *+SP(4),B6        ; |160| 
           LDH     .D2T2   *+SP(4),B4        ; |161| 
           NOP             2

           MVK     .S1     32767,A3          ; |160| 
||         ZERO    .D1     A0                ; |161| 

           CMPGT   .L1X    B5,A3,A1          ; |160| 
||         MVKH    .S1     0x10000,A0        ; |161| 

   [!A1]   STW     .D2T2   B6,*+SP(8)        ; |160| 
||         SUB     .L2X    B4,A0,B4          ; |161| 

   [ A1]   STW     .D2T2   B4,*+SP(8)        ; |161| 
           LDW     .D2T2   *+SP(8),B4        ; |164| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |164| 
           NOP             2
           MVKL    .S1     0x3fd68000,A1     ; |164| 

           MVKH    .S1     0x3fd68000,A1     ; |164| 
||         ZERO    .D1     A0                ; |164| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |164| 
           NOP             8
           B       .S2     B3                ; |166| 
           DPSP    .L1     A1:A0,A0          ; |164| 
           NOP             3

           ADDK    .S2     16,SP             ; |166| 
||         STW     .D2T1   A0,*+SP(12)       ; |164| 
||         MV      .D1     A0,A4             ; |164| 

           ; BRANCH OCCURS                   ; |166| 


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
           MVKL    .S2     0x2000210,B4      ; |174| 
           MVKH    .S2     0x2000210,B4      ; |174| 
           LDW     .D2T2   *B4,B4            ; |174| 
           NOP             4

           EXTU    .S2     B4,16,16,B4       ; |174| 
||         SUB     .D2     SP,16,SP          ; |168| 

           STH     .D2T2   B4,*+SP(4)        ; |174| 
           LDH     .D2T2   *+SP(4),B5        ; |177| 
           LDH     .D2T2   *+SP(4),B6        ; |177| 
           LDH     .D2T2   *+SP(4),B4        ; |178| 
           NOP             2

           MVK     .S1     32767,A3          ; |177| 
||         ZERO    .D1     A0                ; |178| 

           CMPGT   .L1X    B5,A3,A1          ; |177| 
||         MVKH    .S1     0x10000,A0        ; |178| 

   [!A1]   STW     .D2T2   B6,*+SP(8)        ; |177| 
||         SUB     .L2X    B4,A0,B4          ; |178| 

   [ A1]   STW     .D2T2   B4,*+SP(8)        ; |178| 
           LDW     .D2T2   *+SP(8),B4        ; |181| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |181| 
           NOP             2
           MVKL    .S1     0x3fd68000,A1     ; |181| 

           MVKH    .S1     0x3fd68000,A1     ; |181| 
||         ZERO    .D1     A0                ; |181| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |181| 
           NOP             8
           B       .S2     B3                ; |184| 
           DPSP    .L1     A1:A0,A0          ; |181| 
           NOP             3

           ADDK    .S2     16,SP             ; |184| 
||         STW     .D2T1   A0,*+SP(12)       ; |181| 
||         MV      .D1     A0,A4             ; |181| 

           ; BRANCH OCCURS                   ; |184| 


	.sect	".text"
	.global	_swingUp

;******************************************************************************
;* FUNCTION NAME: _swingUp                                                    *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,A4,A5,B0,B4,B5,B6                           *
;*   Regs Used         : A0,A1,A3,A4,A5,B0,B3,B4,B5,B6                        *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_swingUp:
;** --------------------------------------------------------------------------*

           MVKL    .S2     _rightSWUPcartPos,B4 ; |188| 
||         MVKL    .S1     _mostPlusPos,A0   ; |188| 

           MVKH    .S2     _rightSWUPcartPos,B4 ; |188| 
||         MVKH    .S1     _mostPlusPos,A0   ; |188| 

           LDW     .D2T2   *B4,B4            ; |188| 
||         LDW     .D1T1   *A0,A0            ; |188| 

           ZERO    .D1     A4                ; |192| 
           NOP             3
           SUBSP   .L2X    B4,A0,B5          ; |188| 
           MVKL    .S1     _leftSWUPcartPos,A3 ; |189| 
           MVKL    .S1     _rightSWUPcartPos,A0 ; |188| 

           MVKL    .S2     _mostMinusPos,B4  ; |189| 
||         MVKH    .S1     _rightSWUPcartPos,A0 ; |188| 

           MVKH    .S1     _leftSWUPcartPos,A3 ; |189| 
||         MVKH    .S2     _mostMinusPos,B4  ; |189| 
||         STW     .D1T2   B5,*A0            ; |188| 

           LDW     .D2T2   *B4,B4            ; |189| 
||         LDW     .D1T1   *A3,A0            ; |189| 

           NOP             4
           ADDSP   .L1X    B4,A0,A3          ; |189| 
           MVKL    .S2     _leftSWUPcartPos,B4 ; |189| 
           MVKL    .S1     _y_pend,A0        ; |192| 
           MVKH    .S2     _leftSWUPcartPos,B4 ; |189| 

           STW     .D2T1   A3,*B4            ; |189| 
||         MVKH    .S1     _y_pend,A0        ; |192| 

           LDW     .D1T1   *A0,A3            ; |192| 
           ZERO    .D1     A0                ; |192| 
           MVKL    .S2     _prevPendPos,B4   ; |192| 
           MVKH    .S2     _prevPendPos,B4   ; |192| 
           NOP             1
           CMPEQSP .S1     A3,A0,A1          ; |192| 
   [ A1]   LDW     .D2T2   *B4,B5            ; |192| 
           MVKL    .S2     _R_swup_cart,B4   ; |193| 
           MVKL    .S1     _prevPendPos,A0   ; |197| 
           MVKH    .S1     _prevPendPos,A0   ; |197| 
           NOP             1
   [ A1]   CMPEQSP .S1X    B5,A4,A1          ; |192| 
   [ A1]   B       .S1     L13               ; |194| 
           ZERO    .D1     A3                ; |193| 
           MVKH    .S1     0x43fa0000,A3     ; |193| 
           MVKH    .S2     _R_swup_cart,B4   ; |193| 

           ZERO    .D1     A3                ; |197| 
|| [ A1]   STW     .D2T1   A3,*B4            ; |193| 

   [!A1]   LDW     .D1T1   *A0,A5            ; |197| 
           ; BRANCH OCCURS                   ; |194| 
;** --------------------------------------------------------------------------*
           NOP             4
           CMPGTSP .S1     A5,A3,A1          ; |197| 
   [!A1]   B       .S1     L11               ; |197| 
           MVKL    .S1     _mostPlusPos,A4   ; |198| 
           MVKL    .S1     _prevPendPos,A0   ; |207| 
           MVKH    .S1     _mostPlusPos,A4   ; |198| 
           MVKH    .S1     _prevPendPos,A0   ; |207| 

           MVKH    .S1     0x42b40000,A3     ; |198| 
|| [ A1]   LDW     .D1T1   *A4,A5            ; |198| 
||         ZERO    .L1     A5                ; |207| 

           ; BRANCH OCCURS                   ; |197| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _mostPlusPos,B4   ; |199| 
           MVKH    .S2     _mostPlusPos,B4   ; |199| 
           NOP             2
           CMPGTSP .S1     A5,A3,A1          ; |198| 
   [ A1]   B       .S1     L10               ; |198| 
           MVKL    .S1     _mostPlusPos,A0   ; |201| 
           MVKL    .S1     _prevPendPos,A4   ; |199| 
           MVKH    .S1     _mostPlusPos,A0   ; |201| 

           ZERO    .D1     A3                ; |201| 
||         MVKH    .S1     _prevPendPos,A4   ; |199| 

   [ A1]   LDW     .D1T1   *A0,A4            ; |201| 
||         MVKH    .S1     0x42b40000,A3     ; |201| 

           ; BRANCH OCCURS                   ; |198| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _rightSWUPcartPos,A0 ; |199| 
           MVKH    .S1     _rightSWUPcartPos,A0 ; |199| 
;** --------------------------------------------------------------------------*
L9:    

           LDW     .D1T1   *A4,A3            ; |199| 
||         LDW     .D2T2   *B4,B4            ; |199| 

           NOP             4
           CMPEQSP .S2X    A3,B4,B0          ; |199| 

           B       .S2     B3                ; |215| 
|| [ B0]   LDW     .D1T1   *A0,A0            ; |199| 

           MVKL    .S2     _R_swup_cart,B4   ; |199| 
           MVKH    .S2     _R_swup_cart,B4   ; |199| 
           NOP             2
   [ B0]   STW     .D2T1   A0,*B4            ; |199| 
           ; BRANCH OCCURS                   ; |215| ; chained return
;** --------------------------------------------------------------------------*
L10:    
           MVKL    .S1     _mostPlusPos,A0   ; |201| 
           MVKH    .S1     _mostPlusPos,A0   ; |201| 
           ZERO    .D2     B5                ; |201| 
           MVKH    .S2     0x43340000,B5     ; |201| 
           CMPGTSP .S1     A4,A3,A1          ; |201| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |201| 
           MV      .L2X    A1,B6             ; |201| 
           MVKL    .S1     _y_pend,A0        ; |202| 
           MVKL    .S2     _prevPendPos,B4   ; |202| 
           MVKH    .S1     _y_pend,A0        ; |202| 
   [ A1]   CMPLTSP .S2X    A3,B5,B6          ; |201| 
           MV      .S1X    B6,A1             ; |201| 
   [!A1]   B       .S1     L13               ; |201| 
           MVKH    .S2     _prevPendPos,B4   ; |202| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |202| 
   [ A1]   LDW     .D2T2   *B4,B4            ; |202| 
           NOP             2
           ; BRANCH OCCURS                   ; |201| 
;** --------------------------------------------------------------------------*
           B       .S1     L12               ; |204| 
           MVKL    .S2     _rightSWUPcartPos,B5 ; |202| 
           MVKH    .S2     _rightSWUPcartPos,B5 ; |202| 
           MVKL    .S1     _y_pend,A0        ; |212| 

           ZERO    .D2     B4                ; |202| 
||         CMPGTSP .S2X    B4,A3,B0          ; |202| 

           MVKH    .S2     0x42b40000,B4     ; |202| 
           ; BRANCH OCCURS                   ; |204| 
;** --------------------------------------------------------------------------*
L11:    
           LDW     .D1T1   *A0,A3            ; |207| 
           NOP             4
           CMPLTSP .S1     A3,A5,A1          ; |207| 
   [!A1]   B       .S1     L13               ; |207| 
           MVKL    .S1     _mostMinusPos,A0  ; |208| 

           MVKH    .S1     _mostMinusPos,A0  ; |208| 
||         ZERO    .D1     A3                ; |208| 

   [ A1]   LDW     .D1T1   *A0,A5            ; |208| 
||         MVKH    .S1     0xc2b40000,A3     ; |208| 

           NOP             2
           ; BRANCH OCCURS                   ; |207| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _prevPendPos,A4   ; |209| 
           MVKL    .S1     _mostMinusPos,A0  ; |211| 
           CMPLTSP .S1     A5,A3,A1          ; |208| 
   [!A1]   B       .S2     L9                ; |210| 
           MVKH    .S1     _mostMinusPos,A0  ; |211| 
           MVKH    .S1     _prevPendPos,A4   ; |209| 

   [!A1]   MVKL    .S1     _leftSWUPcartPos,A0 ; |209| 
||         ZERO    .D1     A3                ; |211| 

           MVKH    .S1     0xc2b40000,A3     ; |211| 
||         MVKL    .S2     _mostMinusPos,B4  ; |209| 

   [!A1]   MVKH    .S1     _leftSWUPcartPos,A0 ; |209| 
||         MVKH    .S2     _mostMinusPos,B4  ; |209| 
|| [ A1]   LDW     .D1T1   *A0,A4            ; |211| 

           ; BRANCH OCCURS                   ; |210| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _mostMinusPos,A0  ; |211| 
           MVKH    .S1     _mostMinusPos,A0  ; |211| 
           ZERO    .D2     B4                ; |211| 
           MVKH    .S2     0xc3340000,B4     ; |211| 
           CMPLTSP .S1     A4,A3,A1          ; |211| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |211| 
           MV      .L2X    A1,B6             ; |211| 
           MVKL    .S1     _y_pend,A0        ; |212| 
           MVKH    .S1     _y_pend,A0        ; |212| 
           NOP             1
   [ A1]   CMPLTSP .S2X    A3,B4,B6          ; |211| 
           MV      .S1X    B6,A1             ; |211| 
   [!A1]   B       .S1     L13               ; |211| 
           MVKL    .S2     _prevPendPos,B5   ; |212| 
           MVKH    .S2     _prevPendPos,B5   ; |212| 

   [ A1]   LDW     .D2T2   *B5,B4            ; |212| 
|| [ A1]   LDW     .D1T1   *A0,A3            ; |212| 

           NOP             2
           ; BRANCH OCCURS                   ; |211| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _leftSWUPcartPos,B5 ; |212| 
           MVKH    .S2     _leftSWUPcartPos,B5 ; |212| 

           ZERO    .D2     B4                ; |212| 
||         CMPLTSP .S2X    B4,A3,B0          ; |212| 

           MVKH    .S2     0xc2b40000,B4     ; |212| 
           MVKL    .S1     _y_pend,A0        ; |212| 
;** --------------------------------------------------------------------------*
L12:    
           MVKH    .S1     _y_pend,A0        ; |212| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |212| 
           NOP             4
   [ B0]   CMPEQSP .S2X    A0,B4,B0          ; |212| 
   [ B0]   LDW     .D2T2   *B5,B4            ; |212| 
           MVKL    .S1     _R_swup_cart,A0   ; |212| 
           MVKH    .S1     _R_swup_cart,A0   ; |212| 
           NOP             2
   [ B0]   STW     .D1T2   B4,*A0            ; |212| 
;** --------------------------------------------------------------------------*
L13:    
           B       .S2     B3                ; |215| 
           NOP             5
           ; BRANCH OCCURS                   ; |215| 


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
           MVKL    .S1     _InitEXINTF,A0    ; |219| 
           MVKH    .S1     _InitEXINTF,A0    ; |219| 
           B       .S2X    A0                ; |219| 
           STW     .D2T2   B3,*SP--(24)      ; |218| 
           MVKL    .S2     RL10,B3           ; |219| 
           MVKH    .S2     RL10,B3           ; |219| 
           NOP             2
RL10:      ; CALL OCCURS                     ; |219| 
           MVKL    .S1     _InitTimer,A0     ; |220| 
           MVKH    .S1     _InitTimer,A0     ; |220| 
           B       .S2X    A0                ; |220| 
           MVKL    .S2     RL12,B3           ; |220| 
           MVKH    .S2     RL12,B3           ; |220| 
           NOP             3
RL12:      ; CALL OCCURS                     ; |220| 
           MVKL    .S2     _InitUART,B4      ; |221| 
           MVKH    .S2     _InitUART,B4      ; |221| 
           B       .S2     B4                ; |221| 
           MVKL    .S2     RL14,B3           ; |221| 
           MVKH    .S2     RL14,B3           ; |221| 
           NOP             3
RL14:      ; CALL OCCURS                     ; |221| 
           MVKL    .S1     _InitINT,A0       ; |222| 
           MVKH    .S1     _InitINT,A0       ; |222| 
           B       .S2X    A0                ; |222| 
           MVKL    .S2     RL16,B3           ; |222| 
           MVKH    .S2     RL16,B3           ; |222| 
           NOP             3
RL16:      ; CALL OCCURS                     ; |222| 
           MVKL    .S1     _InitUSBMon,A0    ; |223| 
           MVKH    .S1     _InitUSBMon,A0    ; |223| 
           B       .S2X    A0                ; |223| 
           MVKL    .S2     RL18,B3           ; |223| 
           MVKH    .S2     RL18,B3           ; |223| 
           NOP             3
RL18:      ; CALL OCCURS                     ; |223| 
           MVKL    .S1     _sprintf,A0       ; |225| 

           MVKH    .S1     _sprintf,A0       ; |225| 
||         MVKL    .S2     SL1+0,B5          ; |225| 

           B       .S2X    A0                ; |225| 
           MVKL    .S2     RL20,B3           ; |225| 
           MVKH    .S2     SL1+0,B5          ; |225| 
           MVKL    .S2     _tmp_string,B4    ; |225| 
           MVKH    .S2     _tmp_string,B4    ; |225| 

           MVKH    .S2     RL20,B3           ; |225| 
||         STW     .D2T2   B5,*+SP(4)        ; |225| 
||         MV      .S1X    B4,A4             ; |225| 

RL20:      ; CALL OCCURS                     ; |225| 
           MVKL    .S1     _Report,A0        ; |225| 
           MVKH    .S1     _Report,A0        ; |225| 
           B       .S2X    A0                ; |225| 
           MVKL    .S2     RL22,B3           ; |225| 
           MVKH    .S2     RL22,B3           ; |225| 
           NOP             3
RL22:      ; CALL OCCURS                     ; |225| 
           MVK     .S1     2024,A0           ; |226| 

           MVKL    .S1     _sprintf,A0       ; |226| 
||         STW     .D2T1   A0,*+SP(8)        ; |226| 

           MVKH    .S1     _sprintf,A0       ; |226| 
||         MVKL    .S2     _tmp_string,B5    ; |226| 

           B       .S2X    A0                ; |226| 
           MVKL    .S2     SL2+0,B4          ; |226| 
           MVKH    .S2     _tmp_string,B5    ; |226| 
           MVKH    .S2     SL2+0,B4          ; |226| 
           MVKL    .S2     RL24,B3           ; |226| 

           MVKH    .S2     RL24,B3           ; |226| 
||         STW     .D2T2   B4,*+SP(4)        ; |226| 
||         MV      .S1X    B5,A4             ; |226| 

RL24:      ; CALL OCCURS                     ; |226| 
           MVKL    .S1     _Report,A0        ; |226| 
           MVKH    .S1     _Report,A0        ; |226| 
           B       .S2X    A0                ; |226| 
           MVKL    .S2     RL26,B3           ; |226| 
           MVKH    .S2     RL26,B3           ; |226| 
           NOP             3
RL26:      ; CALL OCCURS                     ; |226| 
           MVKL    .S2     SL3+0,B5          ; |227| 
           MVKH    .S2     SL3+0,B5          ; |227| 
           MVKL    .S2     0x20003fc,B4      ; |227| 

           STW     .D2T2   B5,*+SP(4)        ; |227| 
||         MVKH    .S2     0x20003fc,B4      ; |227| 

           LDW     .D2T2   *B4,B4            ; |227| 
           MVKL    .S1     0x20003fc,A0      ; |227| 
           MVKH    .S1     0x20003fc,A0      ; |227| 
           MVKL    .S1     _tmp_string,A4    ; |227| 
           MVKL    .S2     RL28,B3           ; |227| 
           EXTU    .S2     B4,16,24,B4       ; |227| 
           STW     .D2T2   B4,*+SP(8)        ; |227| 

           MVKL    .S1     _sprintf,A0       ; |227| 
||         LDW     .D1T1   *A0,A3            ; |227| 

           MVKH    .S1     _sprintf,A0       ; |227| 
           B       .S2X    A0                ; |227| 
           MVKH    .S1     _tmp_string,A4    ; |227| 
           MVKH    .S2     RL28,B3           ; |227| 
           EXTU    .S1     A3,24,24,A3       ; |227| 
           STW     .D2T1   A3,*+SP(12)       ; |227| 
           NOP             1
RL28:      ; CALL OCCURS                     ; |227| 
           MVKL    .S1     _Report,A0        ; |227| 
           MVKH    .S1     _Report,A0        ; |227| 
           B       .S2X    A0                ; |227| 
           MVKL    .S2     RL30,B3           ; |227| 
           MVKH    .S2     RL30,B3           ; |227| 
           NOP             3
RL30:      ; CALL OCCURS                     ; |227| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |231| 
           MVKH    .S1     _GIE,A0           ; |231| 
           B       .S2X    A0                ; |231| 
           MVKL    .S2     _TFlag,B4         ; |229| 
           MVKL    .S2     RL32,B3           ; |231| 
           MVKH    .S2     _TFlag,B4         ; |229| 
           ZERO    .D2     B5                ; |229| 

           STW     .D2T2   B5,*B4            ; |229| 
||         MVKH    .S2     RL32,B3           ; |231| 

RL32:      ; CALL OCCURS                     ; |231| 

           MVK     .S2     1,B6              ; |233| 
||         MVKL    .S1     _WaitTFlagCnt,A3  ; |236| 

           MVKL    .S2     0x200004c,B5      ; |232| 
||         MVKH    .S1     _WaitTFlagCnt,A3  ; |236| 

           B       .S2X    A3                ; |236| 

           MVKH    .S2     0x200004c,B5      ; |232| 
||         MVK     .S1     1,A4              ; |232| 

           MVKL    .S2     0x200008c,B4      ; |234| 
||         MVKL    .S1     0x2000080,A0      ; |233| 

           MVKL    .S2     RL34,B3           ; |236| 
||         STW     .D2T1   A4,*B5            ; |232| 
||         MVKH    .S1     0x2000080,A0      ; |233| 

           STW     .D1T2   B6,*A0            ; |233| 
||         MVKH    .S2     0x200008c,B4      ; |234| 
||         MVK     .S1     1,A5              ; |234| 

           STW     .D2T1   A5,*B4            ; |234| 
||         MVK     .S1     0x3e8,A4          ; |236| 
||         MVKH    .S2     RL34,B3           ; |236| 

RL34:      ; CALL OCCURS                     ; |236| 
           MVKL    .S2     _TINTCnt,B4       ; |238| 

           MVKH    .S2     _TINTCnt,B4       ; |238| 
||         MVKL    .S1     _mode,A0          ; |239| 
||         ZERO    .D2     B5                ; |238| 

           STW     .D2T2   B5,*B4            ; |238| 
||         MVKH    .S1     _mode,A0          ; |239| 
||         ZERO    .D1     A3                ; |239| 

           STW     .D1T1   A3,*A0            ; |239| 
           MVKL    .S1     0x200004c,A0      ; |242| 
           MVKH    .S1     0x200004c,A0      ; |242| 
           LDW     .D1T1   *A0,A3            ; |242| 
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
           MVKL    .S2     _mode,B4          ; |244| 
           MVKH    .S2     _mode,B4          ; |244| 
           XOR     .S1     1,A3,A3           ; |242| 
           STW     .D1T1   A3,*A0            ; |242| 
           LDW     .D2T2   *B4,B0            ; |244| 
           NOP             4
   [ B0]   B       .S1     L16               ; |244| 
   [!B0]   MVKL    .S1     _swingUp,A0       ; |245| 
   [!B0]   MVKH    .S1     _swingUp,A0       ; |245| 
   [ B0]   MVKL    .S1     _y_pend,A0        ; |249| 
   [ B0]   MVKH    .S1     _y_pend,A0        ; |249| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |249| 
           ; BRANCH OCCURS                   ; |244| 
;** --------------------------------------------------------------------------*
           B       .S2X    A0                ; |245| 
           MVKL    .S2     RL36,B3           ; |245| 
           MVKH    .S2     RL36,B3           ; |245| 
           NOP             3
RL36:      ; CALL OCCURS                     ; |245| 
           MVKL    .S1     _y_pend,A0        ; |249| 
           MVKH    .S1     _y_pend,A0        ; |249| 
           LDW     .D1T1   *A0,A0            ; |249| 
;** --------------------------------------------------------------------------*
L16:    
           ZERO    .D2     B4                ; |249| 
           MVKH    .S2     0x432a0000,B4     ; |249| 
           NOP             2
           CMPLTSP .S2X    A0,B4,B4          ; |249| 
           XOR     .S2     1,B4,B0           ; |249| 
   [!B0]   MVKL    .S2     _y_pend,B4        ; |249| 
   [!B0]   MVKH    .S2     _y_pend,B4        ; |249| 
   [!B0]   LDW     .D2T2   *B4,B4            ; |249| 
   [!B0]   ZERO    .D1     A0                ; |249| 
   [!B0]   MVKH    .S1     0x433e0000,A0     ; |249| 
           NOP             2
   [!B0]   CMPGTSP .S2X    B4,A0,B4          ; |249| 
   [!B0]   XOR     .S2     1,B4,B0           ; |249| 
   [ B0]   MVKL    .S2     _mode,B5          ; |250| 
           MVKL    .S2     _TINTCnt,B4       ; |254| 

   [ B0]   MVKH    .S2     _mode,B5          ; |250| 
|| [ B0]   MVK     .S1     1,A0              ; |250| 

   [ B0]   STW     .D2T1   A0,*B5            ; |250| 
||         MVKH    .S2     _TINTCnt,B4       ; |254| 

           LDW     .D2T2   *B4,B4            ; |254| 
           MVK     .S1     500,A0            ; |254| 
           NOP             3
           CMPGTU  .L1X    B4,A0,A1          ; |254| 
   [!A1]   B       .S1     L15               ; |254| 

   [ A1]   MVKL    .S2     _timerCheckCnt,B4 ; |256| 
|| [!A1]   MVKL    .S1     0x200004c,A0      ; |242| 

   [ A1]   MVKH    .S2     _timerCheckCnt,B4 ; |256| 
|| [!A1]   MVKH    .S1     0x200004c,A0      ; |242| 

   [ A1]   LDW     .D2T2   *B4,B6            ; |256| 
|| [!A1]   LDW     .D1T1   *A0,A3            ; |242| 

           NOP             2
           ; BRANCH OCCURS                   ; |254| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     SL4+0,B5          ; |257| 
           MVKH    .S2     SL4+0,B5          ; |257| 
           ADD     .D2     1,B6,B7           ; |256| 

           STW     .D2T2   B7,*B4            ; |256| 
||         MVKL    .S2     _timerCheckCnt,B6 ; |257| 
||         MVKL    .S1     _sprintf,A0       ; |257| 

           STW     .D2T2   B5,*+SP(4)        ; |257| 
||         MVKH    .S2     _timerCheckCnt,B6 ; |257| 
||         MVKH    .S1     _sprintf,A0       ; |257| 

           B       .S2X    A0                ; |257| 
||         LDW     .D2T2   *B6,B5            ; |257| 

           MVKL    .S2     RL38,B3           ; |257| 
           MVKL    .S2     _tmp_string,B4    ; |257| 
           MVKH    .S2     _tmp_string,B4    ; |257| 
           MV      .S1X    B4,A4             ; |257| 

           STW     .D2T2   B5,*+SP(8)        ; |257| 
||         MVKH    .S2     RL38,B3           ; |257| 

RL38:      ; CALL OCCURS                     ; |257| 
           MVKL    .S1     _Report,A0        ; |257| 
           MVKH    .S1     _Report,A0        ; |257| 
           B       .S2X    A0                ; |257| 
           MVKL    .S2     RL40,B3           ; |257| 
           MVKH    .S2     RL40,B3           ; |257| 
           NOP             3
RL40:      ; CALL OCCURS                     ; |257| 
           MVKL    .S1     _GetPendulumPos,A0 ; |260| 
           MVKH    .S1     _GetPendulumPos,A0 ; |260| 
           B       .S2X    A0                ; |260| 
           MVKL    .S2     RL44,B3           ; |260| 
           MVKH    .S2     RL44,B3           ; |260| 
           NOP             3
RL44:      ; CALL OCCURS                     ; |260| 
           MVKL    .S2     _sprintf,B4       ; |260| 
           MVKH    .S2     _sprintf,B4       ; |260| 

           B       .S2     B4                ; |260| 
||         SPDP    .S1     A4,A7:A6          ; |260| 

           MVKL    .S2     SL5+0,B5          ; |260| 
           MV      .D1     A7,A0             ; |260| 

           MVKH    .S2     SL5+0,B5          ; |260| 
||         STW     .D2T1   A0,*+SP(12)       ; |260| 

           STW     .D2T2   B5,*+SP(4)        ; |260| 
||         MV      .D1     A6,A3             ; |260| 
||         MVKL    .S1     _tmp_string,A4    ; |260| 
||         MVKL    .S2     RL46,B3           ; |260| 

           STW     .D2T1   A3,*+SP(8)        ; |260| 
||         MVKH    .S1     _tmp_string,A4    ; |260| 
||         MVKH    .S2     RL46,B3           ; |260| 

RL46:      ; CALL OCCURS                     ; |260| 
           MVKL    .S1     _Report,A0        ; |260| 
           MVKH    .S1     _Report,A0        ; |260| 
           B       .S2X    A0                ; |260| 
           MVKL    .S2     RL48,B3           ; |260| 
           MVKH    .S2     RL48,B3           ; |260| 
           NOP             3
RL48:      ; CALL OCCURS                     ; |260| 
           MVKL    .S1     _GetCartPos,A0    ; |263| 
           MVKH    .S1     _GetCartPos,A0    ; |263| 
           B       .S2X    A0                ; |263| 
           MVKL    .S2     RL52,B3           ; |263| 
           MVKH    .S2     RL52,B3           ; |263| 
           NOP             3
RL52:      ; CALL OCCURS                     ; |263| 
           SPDP    .S1     A4,A5:A4          ; |263| 
           MVKL    .S2     SL6+0,B5          ; |263| 
           MV      .D1     A5,A0             ; |263| 

           MVKL    .S1     _sprintf,A0       ; |263| 
||         STW     .D2T1   A0,*+SP(12)       ; |263| 

           MVKH    .S1     _sprintf,A0       ; |263| 
           B       .S2X    A0                ; |263| 
           MVKH    .S2     SL6+0,B5          ; |263| 
           MVKL    .S2     _tmp_string,B4    ; |263| 

           MV      .D1     A4,A3             ; |263| 
||         MVKH    .S2     _tmp_string,B4    ; |263| 

           MVKL    .S2     RL54,B3           ; |263| 
||         STW     .D2T1   A3,*+SP(8)        ; |263| 

           MVKH    .S2     RL54,B3           ; |263| 
||         STW     .D2T2   B5,*+SP(4)        ; |263| 
||         MV      .S1X    B4,A4             ; |263| 

RL54:      ; CALL OCCURS                     ; |263| 
           MVKL    .S1     _Report,A0        ; |263| 
           MVKH    .S1     _Report,A0        ; |263| 
           B       .S2X    A0                ; |263| 
           MVKL    .S2     RL56,B3           ; |263| 
           MVKH    .S2     RL56,B3           ; |263| 
           NOP             3
RL56:      ; CALL OCCURS                     ; |263| 
           MVKL    .S1     _sprintf,A0       ; |266| 

           MVKH    .S1     _sprintf,A0       ; |266| 
||         MVKL    .S2     _tmp_string,B4    ; |266| 

           B       .S2X    A0                ; |266| 
           MVKL    .S2     SL7+0,B5          ; |266| 
           MVKH    .S2     _tmp_string,B4    ; |266| 
           MVKL    .S2     RL58,B3           ; |266| 
           MVKH    .S2     SL7+0,B5          ; |266| 

           STW     .D2T2   B5,*+SP(4)        ; |266| 
||         MV      .S1X    B4,A4             ; |266| 
||         MVKH    .S2     RL58,B3           ; |266| 

RL58:      ; CALL OCCURS                     ; |266| 
           MVKL    .S1     _Report,A0        ; |266| 
           MVKH    .S1     _Report,A0        ; |266| 
           B       .S2X    A0                ; |266| 
           MVKL    .S2     RL60,B3           ; |266| 
           MVKH    .S2     RL60,B3           ; |266| 
           NOP             3
RL60:      ; CALL OCCURS                     ; |266| 
           MVKL    .S2     SL8+0,B4          ; |267| 

           MVKL    .S1     _mostPlusPos,A0   ; |267| 
||         MVKH    .S2     SL8+0,B4          ; |267| 

           MVKH    .S1     _mostPlusPos,A0   ; |267| 
||         STW     .D2T2   B4,*+SP(4)        ; |267| 

           LDW     .D1T1   *A0,A0            ; |267| 
           MVKL    .S2     RL62,B3           ; |267| 
           MVKL    .S2     _tmp_string,B4    ; |267| 
           MVKH    .S2     _tmp_string,B4    ; |267| 
           MV      .S1X    B4,A4             ; |267| 
           SPDP    .S1     A0,A1:A0          ; |267| 
           MVKH    .S2     RL62,B3           ; |267| 

           MVKL    .S1     _sprintf,A0       ; |267| 
||         STW     .D2T1   A0,*+SP(8)        ; |267| 

           MVKH    .S1     _sprintf,A0       ; |267| 
           B       .S2X    A0                ; |267| 
           STW     .D2T1   A1,*+SP(12)       ; |267| 
           NOP             4
RL62:      ; CALL OCCURS                     ; |267| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _Report,A0        ; |267| 
           MVKH    .S1     _Report,A0        ; |267| 
           B       .S2X    A0                ; |267| 
           MVKL    .S2     RL64,B3           ; |267| 
           MVKH    .S2     RL64,B3           ; |267| 
           NOP             3
RL64:      ; CALL OCCURS                     ; |267| 
           MVKL    .S1     SL9+0,A0          ; |268| 

           MVKL    .S2     _prevPendPos,B4   ; |268| 
||         MVKH    .S1     SL9+0,A0          ; |268| 

           MVKH    .S2     _prevPendPos,B4   ; |268| 
||         STW     .D2T1   A0,*+SP(4)        ; |268| 

           LDW     .D2T2   *B4,B5            ; |268| 
           MVKL    .S2     _sprintf,B4       ; |268| 
           MVKH    .S2     _sprintf,B4       ; |268| 
           B       .S2     B4                ; |268| 
           MVKL    .S1     _tmp_string,A4    ; |268| 
           SPDP    .S2     B5,B7:B6          ; |268| 
           MVKH    .S1     _tmp_string,A4    ; |268| 

           STW     .D2T2   B6,*+SP(8)        ; |268| 
||         MVKL    .S2     RL66,B3           ; |268| 

           MVKH    .S2     RL66,B3           ; |268| 
||         STW     .D2T2   B7,*+SP(12)       ; |268| 

RL66:      ; CALL OCCURS                     ; |268| 
           MVKL    .S1     _Report,A0        ; |268| 
           MVKH    .S1     _Report,A0        ; |268| 
           B       .S2X    A0                ; |268| 
           MVKL    .S2     RL68,B3           ; |268| 
           MVKH    .S2     RL68,B3           ; |268| 
           NOP             3
RL68:      ; CALL OCCURS                     ; |268| 
           MVKL    .S1     SL10+0,A0         ; |269| 
           MVKL    .S1     _remainedAngleToTheGoal,A3 ; |269| 
           MVKH    .S1     SL10+0,A0         ; |269| 

           STW     .D2T1   A0,*+SP(4)        ; |269| 
||         MVKH    .S1     _remainedAngleToTheGoal,A3 ; |269| 

           LDW     .D1T1   *A3,A0            ; |269| 
           MVKL    .S2     _sprintf,B4       ; |269| 
           MVKH    .S2     _sprintf,B4       ; |269| 
           B       .S2     B4                ; |269| 
           MVKL    .S2     _tmp_string,B5    ; |269| 
           SPDP    .S1     A0,A1:A0          ; |269| 
           MVKH    .S2     _tmp_string,B5    ; |269| 

           STW     .D2T1   A1,*+SP(12)       ; |269| 
||         MVKL    .S2     RL70,B3           ; |269| 

           MV      .S1X    B5,A4             ; |269| 
||         STW     .D2T1   A0,*+SP(8)        ; |269| 
||         MVKH    .S2     RL70,B3           ; |269| 

RL70:      ; CALL OCCURS                     ; |269| 
           MVKL    .S1     _Report,A0        ; |269| 
           MVKH    .S1     _Report,A0        ; |269| 
           B       .S2X    A0                ; |269| 
           MVKL    .S2     RL72,B3           ; |269| 
           MVKH    .S2     RL72,B3           ; |269| 
           NOP             3
RL72:      ; CALL OCCURS                     ; |269| 
           MVKL    .S2     _sprintf,B4       ; |271| 
           MVKH    .S2     _sprintf,B4       ; |271| 
           B       .S2     B4                ; |271| 
           MVKL    .S1     _tmp_string,A4    ; |271| 
           MVKL    .S1     SL11+0,A0         ; |271| 
           MVKL    .S2     RL74,B3           ; |271| 
           MVKH    .S1     SL11+0,A0         ; |271| 

           MVKH    .S1     _tmp_string,A4    ; |271| 
||         STW     .D2T1   A0,*+SP(4)        ; |271| 
||         MVKH    .S2     RL74,B3           ; |271| 

RL74:      ; CALL OCCURS                     ; |271| 
           MVKL    .S1     _Report,A0        ; |271| 
           MVKH    .S1     _Report,A0        ; |271| 
           B       .S2X    A0                ; |271| 
           MVKL    .S2     RL76,B3           ; |271| 
           MVKH    .S2     RL76,B3           ; |271| 
           NOP             3
RL76:      ; CALL OCCURS                     ; |271| 
           B       .S1     L14               ; |274| 
           MVKL    .S2     _TINTCnt,B4       ; |272| 

           ZERO    .D2     B5                ; |272| 
||         MVKH    .S2     _TINTCnt,B4       ; |272| 

           STW     .D2T2   B5,*B4            ; |272| 
||         MVKL    .S1     0x200004c,A0      ; |242| 

           MVKH    .S1     0x200004c,A0      ; |242| 
           LDW     .D1T1   *A0,A3            ; |242| 
           ; BRANCH OCCURS                   ; |274| 


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
	.global	_mostMinusPos
	.global	_prevPendPos
	.global	_remainedAngleToTheGoal
	.global	__divd
