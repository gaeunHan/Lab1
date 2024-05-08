;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Wed May 08 11:24:55 2024                                *
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

	.global	_PWMD
_PWMD:	.usect	.far,4,4
	.global	_PWMH
_PWMH:	.usect	.far,4,4
	.global	_PWML
_PWML:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI20372_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI20372_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
           MVKL    .S1     0x44ffe000,A0     ; |115| 

           MVKH    .S1     0x44ffe000,A0     ; |115| 
||         MV      .S2X    A4,B4             ; |111| 

           MPYSP   .M2X    A0,B4,B4          ; |115| 
           MVKL    .S2     __divd,B8         ; |115| 
           MVKH    .S2     __divd,B8         ; |115| 
           B       .S2     B8                ; |115| 
           SPDP    .S2     B4,B7:B6          ; |115| 
           ZERO    .L2     B5                ; |115| 

           STW     .D2T2   B3,*SP--(16)      ; |111| 
||         MVKL    .S2     RL4,B3            ; |115| 

           MV      .S1X    B7,A5             ; |115| 
||         MVKH    .S2     0x40590000,B5     ; |115| 

           ZERO    .L2     B4                ; |115| 
||         MV      .S1X    B6,A4             ; |115| 
||         STW     .D2T1   A4,*+SP(4)        ; |111| 
||         MVKH    .S2     RL4,B3            ; |115| 

RL4:       ; CALL OCCURS                     ; |115| 
           DPSP    .L1     A5:A4,A0          ; |115| 
           NOP             3
           MV      .S2X    A0,B4             ; |115| 
           SPTRUNC .L2     B4,B5             ; |118| 
           STW     .D2T1   A0,*+SP(8)        ; |115| 
           MVKL    .S1     _PWMD,A0          ; |118| 

           MVKL    .S2     _PWMD,B4          ; |119| 
||         MVKH    .S1     _PWMD,A0          ; |118| 

           MVKH    .S2     _PWMD,B4          ; |119| 
||         STW     .D1T2   B5,*A0            ; |118| 

           LDW     .D2T2   *B4,B4            ; |119| 
           MVKL    .S1     _PWMH,A0          ; |119| 
           MVKL    .S2     _PWMD,B5          ; |120| 
           MVKH    .S1     _PWMH,A0          ; |119| 
           MVKH    .S2     _PWMD,B5          ; |120| 
           ADDK    .S2     2048,B4           ; |119| 
           STW     .D1T2   B4,*A0            ; |119| 
           LDW     .D2T2   *B5,B4            ; |120| 
           MVK     .S2     2048,B5           ; |120| 
           MVKL    .S1     _PWML,A0          ; |120| 
           MVKH    .S1     _PWML,A0          ; |120| 
           NOP             1
           SUB     .D2     B5,B4,B4          ; |120| 
           STW     .D1T2   B4,*A0            ; |120| 
           LDW     .D2T2   *++SP(16),B3      ; |121| 
           NOP             4
           B       .S2     B3                ; |121| 
           NOP             5
           ; BRANCH OCCURS                   ; |121| 


	.sect	".text"
	.global	_BLDCDrive

;******************************************************************************
;* FUNCTION NAME: _BLDCDrive                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 16 Auto + 4 Save = 20 byte                  *
;******************************************************************************
_BLDCDrive:
;** --------------------------------------------------------------------------*
           MVKL    .S2     _PWMOut,B4        ; |130| 
           MVKH    .S2     _PWMOut,B4        ; |130| 
           B       .S2     B4                ; |130| 
           STW     .D2T2   B3,*SP--(24)      ; |124| 
           STW     .D2T1   A4,*+SP(4)        ; |124| 
           NOP             1
           MVKL    .S2     RL6,B3            ; |130| 
           MVKH    .S2     RL6,B3            ; |130| 
RL6:       ; CALL OCCURS                     ; |130| 
           MVKL    .S1     0x2000208,A0      ; |133| 

           MVKH    .S1     0x2000208,A0      ; |133| 
||         MVK     .S2     -1,B4             ; |137| 

           STW     .D2T2   B4,*+SP(16)       ; |137| 
||         LDW     .D1T1   *A0,A0            ; |133| 

           LDW     .D2T2   *+SP(16),B5       ; |139| 
           ZERO    .D2     B4
           B       .S1     L10               ; |144| 
           ZERO    .S2     B6

           AND     .S1     7,A0,A0           ; |133| 
||         STW     .D2T2   B4,*+SP(8)        ; |136| 

           CMPEQ   .L2X    A0,B6,B0
||         ADD     .S2     1,B5,B5           ; |139| 
||         STW     .D2T1   A0,*+SP(12)       ; |133| 

           MV      .S2X    A0,B4             ; |139| 
|| [!B0]   STW     .D2T2   B5,*+SP(16)       ; |139| 

   [!B0]   STW     .D2T2   B4,*+SP(8)        ; |140| 
           ; BRANCH OCCURS                   ; |144| 
;** --------------------------------------------------------------------------*
L9:    
           STW     .D2T2   B4,*B7            ; |146| 
           STW     .D2T2   B8,*B6            ; |147| 

           B       .S1     L11               ; |148| 
||         LDW     .D1T1   *A3,A3            ; |148| 

           NOP             4
           STW     .D1T1   A3,*A0            ; |148| 
           ; BRANCH OCCURS                   ; |148| 
;** --------------------------------------------------------------------------*
L10:    
           CMPGT   .L2     B4,4,B0           ; |148| 
   [ B0]   B       .S1     L13               ; |148| 

           CMPEQ   .L1X    B4,4,A1           ; |148| 
|| [!B0]   MVKL    .S2     0x20000a0,B7      ; |146| 
|| [ B0]   LDW     .D2T2   *++SP(24),B3      ; |162| 

           NOP             4
           ; BRANCH OCCURS                   ; |148| 
;** --------------------------------------------------------------------------*

   [ A1]   B       .S1     L12               ; |148| 
||         MVKL    .S2     0x200009c,B6      ; |147| 

           MVKL    .S2     _PWML,B5          ; |146| 

           MVK     .S2     2048,B8           ; |147| 
||         MVKL    .S1     0x2000098,A0      ; |148| 

           MVKH    .S2     0x20000a0,B7      ; |146| 
||         MVKL    .S1     _PWMH,A3          ; |148| 

           MVKH    .S1     0x2000098,A0      ; |148| 
||         MVKH    .S2     0x200009c,B6      ; |147| 

           MVKH    .S2     _PWML,B5          ; |146| 
||         MVKH    .S1     _PWMH,A3          ; |148| 
||         CMPEQ   .L2     B4,1,B0           ; |148| 
|| [ A1]   LDW     .D2T2   *++SP(24),B3      ; |162| 

           ; BRANCH OCCURS                   ; |148| 
;** --------------------------------------------------------------------------*
   [ B0]   B       .S1     L9                ; |148| 
   [ B0]   LDW     .D2T2   *B5,B4            ; |146| 
           NOP             4
           ; BRANCH OCCURS                   ; |148| 
;** --------------------------------------------------------------------------*
L11:    
           LDW     .D2T2   *++SP(24),B3      ; |162| 
;** --------------------------------------------------------------------------*
L12:    
           NOP             4
;** --------------------------------------------------------------------------*
L13:    
           B       .S2     B3                ; |162| 
           NOP             5
           ; BRANCH OCCURS                   ; |162| 


	.sect	".text"
	.global	_main

;******************************************************************************
;* FUNCTION NAME: _main                                                       *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 16 Args + 8 Auto + 4 Save = 28 byte                  *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _InitEXINTF,A0    ; |177| 
           MVKH    .S1     _InitEXINTF,A0    ; |177| 
           B       .S2X    A0                ; |177| 
           STW     .D2T2   B3,*SP--(32)      ; |173| 
           MVKL    .S2     RL8,B3            ; |177| 
           MVKH    .S2     RL8,B3            ; |177| 
           NOP             2
RL8:       ; CALL OCCURS                     ; |177| 
           MVKL    .S1     _InitTimer,A0     ; |178| 
           MVKH    .S1     _InitTimer,A0     ; |178| 
           B       .S2X    A0                ; |178| 
           MVKL    .S2     RL10,B3           ; |178| 
           MVKH    .S2     RL10,B3           ; |178| 
           NOP             3
RL10:      ; CALL OCCURS                     ; |178| 
           MVKL    .S2     _InitUART,B4      ; |179| 
           MVKH    .S2     _InitUART,B4      ; |179| 
           B       .S2     B4                ; |179| 
           MVKL    .S2     RL12,B3           ; |179| 
           MVKH    .S2     RL12,B3           ; |179| 
           NOP             3
RL12:      ; CALL OCCURS                     ; |179| 
           MVKL    .S1     _InitINT,A0       ; |180| 
           MVKH    .S1     _InitINT,A0       ; |180| 
           B       .S2X    A0                ; |180| 
           MVKL    .S2     RL14,B3           ; |180| 
           MVKH    .S2     RL14,B3           ; |180| 
           NOP             3
RL14:      ; CALL OCCURS                     ; |180| 
           MVKL    .S1     _InitUSBMon,A0    ; |181| 
           MVKH    .S1     _InitUSBMon,A0    ; |181| 
           B       .S2X    A0                ; |181| 
           MVKL    .S2     RL16,B3           ; |181| 
           MVKH    .S2     RL16,B3           ; |181| 
           NOP             3
RL16:      ; CALL OCCURS                     ; |181| 
           MVKL    .S1     _sprintf,A0       ; |183| 

           MVKH    .S1     _sprintf,A0       ; |183| 
||         MVKL    .S2     SL1+0,B5          ; |183| 

           B       .S2X    A0                ; |183| 
           MVKL    .S2     RL18,B3           ; |183| 
           MVKH    .S2     SL1+0,B5          ; |183| 
           MVKL    .S2     _tmp_string,B4    ; |183| 
           MVKH    .S2     _tmp_string,B4    ; |183| 

           MVKH    .S2     RL18,B3           ; |183| 
||         STW     .D2T2   B5,*+SP(4)        ; |183| 
||         MV      .S1X    B4,A4             ; |183| 

RL18:      ; CALL OCCURS                     ; |183| 
           MVKL    .S1     _Report,A0        ; |183| 
           MVKH    .S1     _Report,A0        ; |183| 
           B       .S2X    A0                ; |183| 
           MVKL    .S2     RL20,B3           ; |183| 
           MVKH    .S2     RL20,B3           ; |183| 
           NOP             3
RL20:      ; CALL OCCURS                     ; |183| 
           MVK     .S1     2024,A0           ; |184| 

           MVKL    .S1     _sprintf,A0       ; |184| 
||         STW     .D2T1   A0,*+SP(8)        ; |184| 

           MVKH    .S1     _sprintf,A0       ; |184| 
||         MVKL    .S2     _tmp_string,B5    ; |184| 

           B       .S2X    A0                ; |184| 
           MVKL    .S2     SL2+0,B4          ; |184| 
           MVKH    .S2     _tmp_string,B5    ; |184| 
           MVKH    .S2     SL2+0,B4          ; |184| 
           MVKL    .S2     RL22,B3           ; |184| 

           MVKH    .S2     RL22,B3           ; |184| 
||         STW     .D2T2   B4,*+SP(4)        ; |184| 
||         MV      .S1X    B5,A4             ; |184| 

RL22:      ; CALL OCCURS                     ; |184| 
           MVKL    .S1     _Report,A0        ; |184| 
           MVKH    .S1     _Report,A0        ; |184| 
           B       .S2X    A0                ; |184| 
           MVKL    .S2     RL24,B3           ; |184| 
           MVKH    .S2     RL24,B3           ; |184| 
           NOP             3
RL24:      ; CALL OCCURS                     ; |184| 
           MVKL    .S2     SL3+0,B5          ; |185| 
           MVKH    .S2     SL3+0,B5          ; |185| 
           MVKL    .S2     0x20003fc,B4      ; |185| 

           STW     .D2T2   B5,*+SP(4)        ; |185| 
||         MVKH    .S2     0x20003fc,B4      ; |185| 

           LDW     .D2T2   *B4,B4            ; |185| 
           MVKL    .S1     0x20003fc,A0      ; |185| 
           MVKH    .S1     0x20003fc,A0      ; |185| 
           MVKL    .S1     _tmp_string,A4    ; |185| 
           MVKL    .S2     RL26,B3           ; |185| 
           EXTU    .S2     B4,16,24,B4       ; |185| 
           STW     .D2T2   B4,*+SP(8)        ; |185| 

           MVKL    .S1     _sprintf,A0       ; |185| 
||         LDW     .D1T1   *A0,A3            ; |185| 

           MVKH    .S1     _sprintf,A0       ; |185| 
           B       .S2X    A0                ; |185| 
           MVKH    .S1     _tmp_string,A4    ; |185| 
           MVKH    .S2     RL26,B3           ; |185| 
           EXTU    .S1     A3,24,24,A3       ; |185| 
           STW     .D2T1   A3,*+SP(12)       ; |185| 
           NOP             1
RL26:      ; CALL OCCURS                     ; |185| 
           MVKL    .S1     _Report,A0        ; |185| 
           MVKH    .S1     _Report,A0        ; |185| 
           B       .S2X    A0                ; |185| 
           MVKL    .S2     RL28,B3           ; |185| 
           MVKH    .S2     RL28,B3           ; |185| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |185| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |189| 
           MVKH    .S1     _GIE,A0           ; |189| 
           B       .S2X    A0                ; |189| 
           MVKL    .S2     _TFlag,B4         ; |187| 
           MVKL    .S2     RL30,B3           ; |189| 
           MVKH    .S2     _TFlag,B4         ; |187| 
           ZERO    .D2     B5                ; |187| 

           STW     .D2T2   B5,*B4            ; |187| 
||         MVKH    .S2     RL30,B3           ; |189| 

RL30:      ; CALL OCCURS                     ; |189| 
           MVKL    .S1     _WaitTFlagCnt,A0  ; |193| 
           MVKH    .S1     _WaitTFlagCnt,A0  ; |193| 
           B       .S2X    A0                ; |193| 
           MVKL    .S2     0x2000094,B4      ; |191| 
           MVKL    .S2     RL32,B3           ; |193| 
           MVKH    .S2     0x2000094,B4      ; |191| 
           MVK     .S1     1,A3              ; |191| 

           STW     .D2T1   A3,*B4            ; |191| 
||         MVKH    .S2     RL32,B3           ; |193| 
||         MVK     .S1     0x64,A4           ; |193| 

RL32:      ; CALL OCCURS                     ; |193| 

           MVK     .S2     2048,B6           ; |198| 
||         MVK     .S1     4095,A5           ; |199| 
||         ZERO    .D1     A6                ; |197| 

;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L14:    
           MVKL    .S2     _WaitTFlagCnt,B5  ; |200| 
           MVKH    .S2     _WaitTFlagCnt,B5  ; |200| 
           B       .S2     B5                ; |200| 
           MVKL    .S1     0x20000a0,A0      ; |197| 

           MVKH    .S1     0x20000a0,A0      ; |197| 
||         MVKL    .S2     0x200009c,B4      ; |198| 

           MVKL    .S1     0x2000098,A0      ; |199| 
||         STW     .D1T1   A6,*A0            ; |197| 
||         MVKH    .S2     0x200009c,B4      ; |198| 

           MVKH    .S1     0x2000098,A0      ; |199| 
||         STW     .D2T2   B6,*B4            ; |198| 
||         MVKL    .S2     RL34,B3           ; |200| 

           STW     .D1T1   A5,*A0            ; |199| 
||         MVKH    .S2     RL34,B3           ; |200| 
||         MVK     .S1     0xc8,A4           ; |200| 

RL34:      ; CALL OCCURS                     ; |200| 
           MVKL    .S2     _WaitTFlagCnt,B4  ; |205| 
           MVKH    .S2     _WaitTFlagCnt,B4  ; |205| 
           B       .S2     B4                ; |205| 

           MVKL    .S2     0x20000a0,B5      ; |202| 
||         MVKL    .S1     0x200009c,A3      ; |203| 

           MVKH    .S1     0x200009c,A3      ; |203| 
||         MVKH    .S2     0x20000a0,B5      ; |202| 

           STW     .D2T2   B6,*B5            ; |202| 
||         MVKL    .S1     0x2000098,A0      ; |204| 

           STW     .D1T1   A6,*A3            ; |203| 
||         MVKL    .S2     RL36,B3           ; |205| 
||         MVKH    .S1     0x2000098,A0      ; |204| 

           STW     .D1T1   A5,*A0            ; |204| 
||         MVKH    .S2     RL36,B3           ; |205| 

RL36:      ; CALL OCCURS                     ; |205| 
           MVKL    .S2     _WaitTFlagCnt,B4  ; |210| 

           MVKL    .S1     0x200009c,A3      ; |208| 
||         MVKH    .S2     _WaitTFlagCnt,B4  ; |210| 

           B       .S2     B4                ; |210| 
||         MVKL    .S1     0x20000a0,A0      ; |207| 

           MVKH    .S1     0x20000a0,A0      ; |207| 
           MVKL    .S1     0x2000098,A4      ; |209| 

           STW     .D1T1   A5,*A0            ; |207| 
||         MVKH    .S1     0x200009c,A3      ; |208| 

           STW     .D1T1   A6,*A3            ; |208| 
||         MVKL    .S2     RL38,B3           ; |210| 
||         MVKH    .S1     0x2000098,A4      ; |209| 

           MVK     .S1     0xc8,A4           ; |210| 
||         STW     .D1T2   B6,*A4            ; |209| 
||         MVKH    .S2     RL38,B3           ; |210| 

RL38:      ; CALL OCCURS                     ; |210| 
           MVKL    .S2     _WaitTFlagCnt,B4  ; |215| 
           MVKH    .S2     _WaitTFlagCnt,B4  ; |215| 

           B       .S2     B4                ; |215| 
||         MVKL    .S1     0x20000a0,A0      ; |212| 

           MVKH    .S1     0x20000a0,A0      ; |212| 

           MVKL    .S2     0x200009c,B5      ; |213| 
||         STW     .D1T1   A5,*A0            ; |212| 

           MVKH    .S2     0x200009c,B5      ; |213| 
||         MVKL    .S1     0x2000098,A0      ; |214| 

           MVKH    .S1     0x2000098,A0      ; |214| 
||         MVKL    .S2     RL40,B3           ; |215| 
||         STW     .D2T2   B6,*B5            ; |213| 

           MVKH    .S2     RL40,B3           ; |215| 
||         STW     .D1T1   A6,*A0            ; |214| 

RL40:      ; CALL OCCURS                     ; |215| 
           MVKL    .S2     _WaitTFlagCnt,B4  ; |220| 
           MVKH    .S2     _WaitTFlagCnt,B4  ; |220| 
           B       .S2     B4                ; |220| 

           MVKL    .S2     0x20000a0,B5      ; |217| 
||         MVKL    .S1     0x200009c,A3      ; |218| 

           MVKH    .S2     0x20000a0,B5      ; |217| 
||         MVKH    .S1     0x200009c,A3      ; |218| 

           MVKL    .S1     0x2000098,A0      ; |219| 
||         STW     .D2T2   B6,*B5            ; |217| 

           STW     .D1T1   A5,*A3            ; |218| 
||         MVKL    .S2     RL42,B3           ; |220| 
||         MVKH    .S1     0x2000098,A0      ; |219| 

           STW     .D1T1   A6,*A0            ; |219| 
||         MVKH    .S2     RL42,B3           ; |220| 

RL42:      ; CALL OCCURS                     ; |220| 
           MVKL    .S1     _WaitTFlagCnt,A0  ; |225| 
           MVKH    .S1     _WaitTFlagCnt,A0  ; |225| 

           B       .S2X    A0                ; |225| 
||         MVKL    .S1     0x20000a0,A3      ; |222| 

           MVKH    .S1     0x20000a0,A3      ; |222| 

           MVKL    .S2     0x2000098,B4      ; |224| 
||         MVKL    .S1     0x200009c,A4      ; |223| 

           MVKL    .S2     RL44,B3           ; |225| 
||         MVKH    .S1     0x200009c,A4      ; |223| 
||         STW     .D1T1   A6,*A3            ; |222| 

           MVKH    .S2     0x2000098,B4      ; |224| 
||         STW     .D1T1   A5,*A4            ; |223| 

           STW     .D2T2   B6,*B4            ; |224| 
||         MVKH    .S2     RL44,B3           ; |225| 
||         MVK     .S1     0xc8,A4           ; |225| 

RL44:      ; CALL OCCURS                     ; |225| 
           B       .S1     L14               ; |226| 
           NOP             5
           ; BRANCH OCCURS                   ; |226| 


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
	.global	__divd
