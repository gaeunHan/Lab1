;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Sun Mar 24 16:59:19 2024                                *
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

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_pos_TINTCnt+0,32
	.word	000000000h		; _pos_TINTCnt @ 0
	.sect	".text"
	.global	_pos_TINTCnt
_pos_TINTCnt:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_vel_TINTCnt+0,32
	.word	000000000h		; _vel_TINTCnt @ 0
	.sect	".text"
	.global	_vel_TINTCnt
_vel_TINTCnt:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI5744_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI5744_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,B0,B1,B2,  *
;*                           B3,B4,B5,B6,B7,B8,B9,SP                          *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,B0,B1,B2,  *
;*                           B3,B4,B5,B6,B7,B8,B9,SP                          *
;*   Local Frame Size  : 0 Args + 8 Auto + 16 Save = 24 byte                  *
;******************************************************************************
_PWMOut:
;** --------------------------------------------------------------------------*
           MV      .S2X    A4,B6             ; |106| 
           SPDP    .S2     B6,B9:B8          ; |114| 
           ZERO    .D2     B7                ; |113| 
           MV      .S2X    A4,B4             ; |106| 
           SPDP    .S2     B4,B5:B4          ; |113| 
           ZERO    .D2     B6                ; |113| 
           MVKH    .S2     0xc0490000,B7     ; |113| 
           CMPLTDP .S2     B5:B4,B7:B6,B0    ; |113| 
           STW     .D2T1   A12,*SP--(24)     ; |106| 
   [ B0]   B       .S1     L9                ; |113| 

           STW     .D2T1   A4,*+SP(4)        ; |106| 
||         MVKL    .S1     0x2000084,A0      ; |113| 
||         ZERO    .D1     A5                ; |114| 

           STW     .D2T1   A11,*+SP(16)      ; |106| 
||         MVKH    .S1     0x40490000,A5     ; |114| 

           STW     .D2T1   A10,*+SP(12)      ; |106| 
||         ZERO    .D1     A4                ; |114| 
||         MVKH    .S1     0x2000084,A0      ; |113| 

           CMPGTDP .S1X    B9:B8,A5:A4,A1    ; |114| 
||         STW     .D2T2   B3,*+SP(20)       ; |106| 
||         ZERO    .D1     A3                ; |113| 

   [ B0]   STW     .D1T1   A3,*A0            ; |113| 
|| [!B0]   LDW     .D2T2   *+SP(4),B4        ; |118| 

           ; BRANCH OCCURS                   ; |113| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     0x2000084,B7      ; |114| 
           MVKL    .S2     RL4,B3            ; |118| 
           MVKL    .S1     0x40affe00,A11    ; |118| 
           MVK     .S1     4095,A0           ; |114| 
           SPDP    .S2     B4,B5:B4          ; |118| 
           ZERO    .D1     A5                ; |118| 
           MVKH    .S2     0x2000084,B7      ; |114| 
           MVKH    .S1     0x40490000,A5     ; |118| 
   [ A1]   B       .S2     L9                ; |114| 
           MVKL    .S2     __divd,B6         ; |118| 
           MVKH    .S2     RL4,B3            ; |118| 

           ADDDP   .L1X    A5:A4,B5:B4,A5:A4 ; |118| 
||         MVKL    .S1     0x2000084,A12     ; |118| 

           ZERO    .D2     B5                ; |118| 
||         MVKH    .S2     __divd,B6         ; |118| 
||         MVKH    .S1     0x40affe00,A11    ; |118| 

           MVKH    .S2     0x40590000,B5     ; |118| 
||         ZERO    .L2     B4                ; |118| 
|| [ A1]   STW     .D2T1   A0,*B7            ; |114| 
||         MVKH    .S1     0x2000084,A12     ; |118| 
||         ZERO    .D1     A10               ; |118| 

           ; BRANCH OCCURS                   ; |114| 
;** --------------------------------------------------------------------------*
           B       .S2     B6                ; |118| 
           NOP             5
RL4:       ; CALL OCCURS                     ; |118| 
           MPYDP   .M1     A11:A10,A5:A4,A1:A0 ; |118| 
           NOP             9
           DPTRUNC .L1     A1:A0,A0          ; |118| 
           NOP             3
           STW     .D1T1   A0,*A12           ; |118| 
;** --------------------------------------------------------------------------*
L9:    
           MVKL    .S1     0x2000084,A0      ; |122| 
           MVKH    .S1     0x2000084,A0      ; |122| 
           LDW     .D1T1   *A0,A0            ; |122| 
           LDW     .D2T2   *+SP(20),B3       ; |124| 
           LDW     .D2T1   *+SP(16),A11      ; |124| 
           LDW     .D2T1   *+SP(12),A10      ; |124| 
           NOP             1
           INTSPU  .L1     A0,A0             ; |122| 
           ZERO    .D2     B4                ; |122| 
           MVKH    .S2     0x45000000,B4     ; |122| 
           NOP             1
           SUBSP   .L2X    A0,B4,B4          ; |122| 
           NOP             3

           STW     .D2T2   B4,*+SP(8)        ; |122| 
||         B       .S2     B3                ; |124| 

           LDW     .D2T1   *++SP(24),A12     ; |124| 
           MV      .S1X    B4,A4             ; |122| 
           NOP             3
           ; BRANCH OCCURS                   ; |124| 


	.sect	".text"
	.global	_GetAngle

;******************************************************************************
;* FUNCTION NAME: _GetAngle                                                   *
;*                                                                            *
;*   Regs Modified     : A0,A1,A3,A4,B4,B5,B6,SP                              *
;*   Regs Used         : A0,A1,A3,A4,B3,B4,B5,B6,SP                           *
;*   Local Frame Size  : 0 Args + 12 Auto + 0 Save = 12 byte                  *
;******************************************************************************
_GetAngle:
;** --------------------------------------------------------------------------*
           MVKL    .S2     0x200020c,B4      ; |132| 
           MVKH    .S2     0x200020c,B4      ; |132| 
           LDW     .D2T2   *B4,B4            ; |132| 
           NOP             4

           EXTU    .S2     B4,16,16,B4       ; |132| 
||         ZERO    .D1     A0                ; |136| 
||         MVK     .S1     32767,A3          ; |135| 
||         SUB     .D2     SP,16,SP          ; |126| 

           STW     .D2T2   B4,*+SP(4)        ; |132| 
||         CMPGT   .L1X    B4,A3,A1
||         MV      .S2     B4,B6             ; |132| 
||         MVKH    .S1     0x10000,A0        ; |136| 

   [!A1]   STW     .D2T2   B6,*+SP(8)        ; |135| 
||         SUB     .L2X    B4,A0,B4          ; |136| 

   [ A1]   STW     .D2T2   B4,*+SP(8)        ; |136| 
           LDW     .D2T2   *+SP(8),B4        ; |139| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |139| 
           NOP             2
           ZERO    .D1     A1                ; |139| 

           MVKH    .S1     0x3fb80000,A1     ; |139| 
||         ZERO    .D1     A0                ; |139| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |139| 
           NOP             8
           B       .S2     B3                ; |141| 
           DPSP    .L1     A1:A0,A0          ; |139| 
           NOP             3

           ADDK    .S2     16,SP             ; |141| 
||         STW     .D2T1   A0,*+SP(12)       ; |139| 
||         MV      .D1     A0,A4             ; |139| 

           ; BRANCH OCCURS                   ; |141| 


	.sect	".text"
	.global	_GetRefAngleFeedForward

;******************************************************************************
;* FUNCTION NAME: _GetRefAngleFeedForward                                     *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,B0,B1,B2,B3,B4,B5, *
;*                           B6,B7,B8,B9,B10,B11,B12,B13,SP                   *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,B0,B1,B2,B3,B4,B5, *
;*                           B6,B7,B8,B9,B10,B11,B12,B13,SP                   *
;*   Local Frame Size  : 0 Args + 32 Auto + 24 Save = 56 byte                 *
;******************************************************************************
_GetRefAngleFeedForward:
;** --------------------------------------------------------------------------*

           MV      .S1X    B4,A0             ; |203| 
||         STW     .D2T2   B13,*SP--(56)     ; |203| 

           STW     .D2T1   A0,*+SP(8)        ; |203| 

           STW     .D2T1   A4,*+SP(4)        ; |203| 
||         MVKL    .S1     __divf,A0         ; |222| 

           STW     .D2T2   B3,*+SP(40)       ; |203| 
||         MVKH    .S1     __divf,A0         ; |222| 

           B       .S2X    A0                ; |222| 
||         STW     .D2T2   B11,*+SP(48)      ; |203| 

           LDW     .D2T1   *+SP(8),A4
           STW     .D2T2   B10,*+SP(44)      ; |203| 
           STW     .D2T1   A10,*+SP(36)      ; |203| 

           STW     .D2T1   A6,*+SP(12)       ; |203| 
||         MVKL    .S2     RL8,B3            ; |222| 

           MVKH    .S2     RL8,B3            ; |222| 
||         STW     .D2T2   B12,*+SP(52)      ; |203| 
||         MV      .L2X    A6,B4             ; |203| 

RL8:       ; CALL OCCURS                     ; |222| 
           LDW     .D2T2   *+SP(8),B7        ; |223| 
           LDW     .D2T2   *+SP(12),B4       ; |223| 
           MVKL    .S2     __divf,B6         ; |223| 
           MVKH    .S2     __divf,B6         ; |223| 

           B       .S2     B6                ; |223| 
||         ZERO    .D1     A0                ; |223| 

           MPYSP   .M2     B7,B7,B5
||         MVKH    .S1     0x40000000,A0     ; |223| 

           MPYSP   .M2X    B4,A0,B4          ; |223| 
           MVKL    .S2     RL10,B3           ; |223| 
           STW     .D2T1   A4,*+SP(16)       ; |222| 

           MVKH    .S2     RL10,B3           ; |223| 
||         MV      .S1X    B5,A4             ; |223| 

RL10:      ; CALL OCCURS                     ; |223| 
           MVKL    .S1     __divf,A0         ; |226| 

           LDW     .D2T2   *+SP(8),B4        ; |226| 
||         MVKH    .S1     __divf,A0         ; |226| 

           B       .S2X    A0                ; |226| 
||         STW     .D2T1   A4,*+SP(28)       ; |223| 

           LDW     .D2T1   *+SP(4),A4
           MVKL    .S2     RL12,B3           ; |226| 
           MVKH    .S2     RL12,B3           ; |226| 
           NOP             2
RL12:      ; CALL OCCURS                     ; |226| 
           LDW     .D2T2   *+SP(28),B9       ; |227| 
           LDW     .D2T2   *+SP(4),B1        ; |227| 
           ZERO    .D2     B7                ; |233| 
           MVKH    .S2     0x40000000,B7     ; |233| 
           LDW     .D2T2   *+SP(16),B5       ; |230| 
           MV      .D2     B9,B8             ; |227| 

           MPYSP   .M2     B8,B7,B9          ; |233| 
||         SUBSP   .L2     B1,B9,B8          ; |227| 

           MV      .D2     B1,B0
           MVKL    .S2     RL16,B3           ; |236| 
           MVKL    .S2     __divf,B13        ; |237| 
           CMPGTSP .S2     B0,B9,B0          ; |233| 
           ADDSP   .L2X    B5,A4,B7
           MVKH    .S2     RL16,B3           ; |236| 
           MVKL    .S2     _sqrt,B11         ; |236| 

           MVKL    .S2     __divf,B6         ; |236| 
|| [ B0]   B       .S1     L13               ; |233| 

           STW     .D2T1   A4,*+SP(20)       ; |226| 
||         ZERO    .L2     B12               ; |237| 
||         MVKH    .S2     __divf,B13        ; |237| 

           MVKL    .S1     _TINTCnt,A0       ; |263| 
||         STW     .D2T2   B7,*+SP(24)       ; |230| 
||         MVKH    .S2     0x40000000,B12    ; |237| 

           MVKH    .S1     _TINTCnt,A0       ; |263| 
||         LDW     .D2T1   *+SP(16),A5       ; |263| 
||         ZERO    .L2     B10               ; |242| 
||         MVKH    .S2     _sqrt,B11         ; |236| 

           STW     .D2T2   B8,*+SP(32)       ; |227| 
||         MVKL    .S1     _TINTCnt,A10      ; |245| 
||         MVKH    .S2     0x40000000,B10    ; |242| 

   [ B0]   LDW     .D1T1   *A0,A3            ; |263| 
||         MV      .L1X    B1,A4
||         LDW     .D2T2   *+SP(12),B4       ; |236| 
||         MVKH    .S1     _TINTCnt,A10      ; |245| 
||         MVKH    .S2     __divf,B6         ; |236| 

           ; BRANCH OCCURS                   ; |233| 
;** --------------------------------------------------------------------------*
           B       .S2     B6                ; |236| 
           NOP             5
RL16:      ; CALL OCCURS                     ; |236| 
           B       .S2     B11               ; |236| 
           MVKL    .S2     RL18,B3           ; |236| 
           NOP             2
           SPDP    .S1     A4,A5:A4          ; |236| 
           MVKH    .S2     RL18,B3           ; |236| 
RL18:      ; CALL OCCURS                     ; |236| 
           B       .S2     B13               ; |237| 

           LDW     .D2T1   *+SP(4),A4
||         DPSP    .L1     A5:A4,A0          ; |236| 

           MV      .L2     B12,B4            ; |237| 
           NOP             1
           MVKL    .S2     RL20,B3           ; |237| 

           MVKH    .S2     RL20,B3           ; |237| 
||         STW     .D2T1   A0,*+SP(16)       ; |236| 

RL20:      ; CALL OCCURS                     ; |237| 
           LDW     .D2T2   *+SP(16),B6       ; |242| 
           LDW     .D2T2   *+SP(12),B4       ; |239| 
           MVKL    .S1     _vel_TINTCnt,A3   ; |246| 
           MVKL    .S1     _pos_TINTCnt,A8   ; |247| 
           MVKL    .S1     _TINTCnt,A0       ; |250| 
           LDW     .D2T1   *+SP(12),A6       ; |246| 
           MPYSP   .M2     B6,B4,B4
           MV      .D2     B6,B5
           MPYSP   .M2     B6,B10,B6         ; |242| 
           STW     .D2T1   A4,*+SP(28)       ; |237| 
           MVKL    .S1     _TINTCnt,A4       ; |246| 
           STW     .D2T2   B4,*+SP(8)        ; |239| 
           STW     .D2T2   B6,*+SP(20)       ; |242| 
           LDW     .D1T1   *A10,A5           ; |245| 
           MVKL    .S1     _TINTCnt,A7       ; |247| 
           MVKH    .S1     _TINTCnt,A0       ; |250| 
           NOP             2
           INTSPU  .L1     A5,A5             ; |245| 
           NOP             3
           CMPGTSP .S1X    A5,B5,A1          ; |245| 
           MVKH    .S1     _TINTCnt,A4       ; |246| 
   [ A1]   B       .S2     L10               ; |245| 
           MVKH    .S1     _TINTCnt,A7       ; |247| 
           MVKH    .S1     _vel_TINTCnt,A3   ; |246| 
           MVKH    .S1     _pos_TINTCnt,A8   ; |247| 
           MVKL    .S2     _TINTCnt,B4       ; |247| 

           ZERO    .L2     B5                ; |247| 
||         MVKH    .S2     _TINTCnt,B4       ; |247| 
||         LDW     .D2T1   *+SP(16),A5       ; |250| 

           ; BRANCH OCCURS                   ; |245| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A4,A0            ; |246| 
           NOP             4
           INTSPU  .L1     A0,A0             ; |246| 
           NOP             3
           MPYSP   .M1     A0,A6,A0          ; |246| 
           NOP             3
           STW     .D1T1   A0,*A3            ; |246| 

           LDW     .D2T2   *+SP(12),B6       ; |247| 
||         LDW     .D1T1   *A7,A0            ; |247| 

           LDW     .D2T2   *B4,B4            ; |247| 
           NOP             3

           INTSPU  .L1     A0,A0             ; |247| 
||         MPYSP   .M2     B6,B5,B5          ; |247| 

           NOP             3

           INTSPU  .L2     B4,B4             ; |247| 
||         MPYSP   .M1X    A0,B5,A0          ; |247| 

           NOP             2
           B       .S1     L18               ; |248| 
           MPYSP   .M1X    B4,A0,A0          ; |247| 
           NOP             3
           STW     .D1T1   A0,*A8            ; |247| 
           ; BRANCH OCCURS                   ; |248| 
;** --------------------------------------------------------------------------*
L10:    
           LDW     .D1T1   *A0,A0            ; |250| 
           MV      .D2     B6,B5             ; |252| 
           MVKL    .S1     _TINTCnt,A9       ; |251| 
           MVKH    .S1     _TINTCnt,A9       ; |251| 
           MVKL    .S2     _pos_TINTCnt,B8   ; |252| 
           INTSPU  .L1     A0,A3             ; |250| 
           MVKL    .S1     _TINTCnt,A0       ; |250| 
           MVKH    .S1     _TINTCnt,A0       ; |250| 
           MVKL    .S1     _TINTCnt,A7       ; |252| 
           CMPLTSP .S1     A5,A3,A1          ; |250| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |250| 
           MVKL    .S1     _TINTCnt,A4       ; |252| 
           MVKL    .S1     _TINTCnt,A6       ; |252| 
           MV      .S2X    A1,B4             ; |250| 
           MVKH    .S1     _TINTCnt,A7       ; |252| 
   [ A1]   INTSPU  .L1     A3,A3             ; |250| 
           MVKH    .S1     _TINTCnt,A4       ; |252| 
           MVKH    .S1     _TINTCnt,A6       ; |252| 
           MVKL    .S1     _vel_TINTCnt,A5   ; |251| 
   [ A1]   CMPGTSP .S2X    A3,B5,B7          ; |250| 
   [ A1]   XOR     .S2     1,B7,B4           ; |250| 
           MV      .L1X    B4,A1             ; |250| 
   [!A1]   B       .S2     L11               ; |250| 
           MVKH    .S1     _vel_TINTCnt,A5   ; |251| 
           MVKL    .S2     _pos_TINTCnt,B6   ; |256| 
           LDW     .D2T1   *+SP(16),A2       ; |251| 

           MVKL    .S1     _vel_TINTCnt,A0   ; |255| 
||         MVKH    .S2     _pos_TINTCnt,B8   ; |252| 
||         LDW     .D2T1   *+SP(12),A10      ; |251| 

           ZERO    .D1     A3                ; |255| 
||         ZERO    .L2     B5                ; |252| 
||         MVKH    .S1     _vel_TINTCnt,A0   ; |255| 
||         MVKH    .S2     _pos_TINTCnt,B6   ; |256| 
||         LDW     .D2T1   *+SP(8),A8        ; |251| 

           ; BRANCH OCCURS                   ; |250| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A9,A0            ; |251| 
           NOP             4
           INTSPU  .L1     A0,A0             ; |251| 
           NOP             3
           SUBSP   .L1     A0,A2,A0          ; |251| 
           NOP             3
           MPYSP   .M1     A0,A10,A0         ; |251| 
           NOP             3
           SUBSP   .L1     A8,A0,A0          ; |251| 
           NOP             3
           STW     .D1T1   A0,*A5            ; |251| 
           LDW     .D1T1   *A7,A3            ; |252| 
           LDW     .D1T1   *A6,A0            ; |252| 
           LDW     .D1T1   *A4,A4            ; |252| 
           LDW     .D2T2   *+SP(16),B6       ; |252| 
           LDW     .D2T2   *+SP(12),B9       ; |252| 
           INTSPU  .L1     A3,A3             ; |252| 
           INTSPU  .L1     A0,A0             ; |252| 
           LDW     .D2T2   *+SP(8),B4        ; |252| 
           MV      .S2     B6,B7
           INTSPU  .L1     A4,A4             ; |252| 

           SUBSP   .L2X    A3,B6,B9
||         SUBSP   .L1X    A0,B6,A0          ; |252| 
||         MPYSP   .M2     B9,B5,B5          ; |252| 

           LDW     .D2T2   *+SP(28),B6       ; |252| 
           NOP             2

           SUBSP   .L2X    A4,B7,B5          ; |252| 
||         MPYSP   .M2     B9,B5,B4          ; |252| 
||         MPYSP   .M1X    A0,B4,A0          ; |252| 

           NOP             3

           ADDSP   .L2X    A0,B6,B5          ; |252| 
||         MPYSP   .M2     B5,B4,B4          ; |252| 

           NOP             2
           B       .S1     L18               ; |253| 
           SUBSP   .L2     B5,B4,B4          ; |252| 
           NOP             3
           STW     .D2T2   B4,*B8            ; |252| 
           ; BRANCH OCCURS                   ; |253| 
;** --------------------------------------------------------------------------*
L11:    
           STW     .D1T1   A3,*A0            ; |255| 
           LDW     .D2T2   *+SP(4),B4        ; |256| 
;** --------------------------------------------------------------------------*
L12:    
           B       .S1     L19               ; |258| 
           NOP             3
           STW     .D2T2   B4,*B6            ; |256| 
           LDW     .D2T2   *+SP(40),B3       ; |284| 
           ; BRANCH OCCURS                   ; |258| 
;** --------------------------------------------------------------------------*
L13:    
           MVKL    .S1     _TINTCnt,A6       ; |268| 
           MVKL    .S2     _vel_TINTCnt,B7   ; |264| 
           MVKL    .S1     _TINTCnt,A0       ; |265| 
           MVKL    .S2     _pos_TINTCnt,B5   ; |265| 
           INTSPU  .L1     A3,A4             ; |263| 
           MVKH    .S1     _TINTCnt,A6       ; |268| 
           MVKL    .S2     _TINTCnt,B4       ; |265| 
           MVKH    .S1     _TINTCnt,A0       ; |265| 
           CMPGTSP .S1     A4,A5,A1          ; |263| 
   [ A1]   B       .S1     L14               ; |263| 
           MVKH    .S2     _vel_TINTCnt,B7   ; |264| 
           MVKL    .S1     _TINTCnt,A3       ; |264| 
           MVKH    .S2     _pos_TINTCnt,B5   ; |265| 
           MV      .L1     A5,A4             ; |263| 

           MVKH    .S1     _TINTCnt,A3       ; |264| 
||         MVKH    .S2     _TINTCnt,B4       ; |265| 
||         LDW     .D2T2   *+SP(12),B6       ; |264| 
||         ZERO    .L2     B8                ; |265| 
|| [ A1]   LDW     .D1T1   *A6,A0            ; |268| 

           ; BRANCH OCCURS                   ; |263| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A3,A3            ; |264| 
           NOP             4
           INTSPU  .L1     A3,A3             ; |264| 
           NOP             3
           MPYSP   .M2X    A3,B6,B6          ; |264| 
           NOP             3
           STW     .D2T2   B6,*B7            ; |264| 

           LDW     .D2T2   *B4,B4            ; |265| 
||         LDW     .D1T1   *A0,A0            ; |265| 

           NOP             4
           MPYI    .M1X    B4,A0,A0          ; |265| 
           NOP             3
           LDW     .D2T2   *+SP(12),B4       ; |265| 
           NOP             3
           B       .S1     L15               ; |266| 

           MPYSP   .M2     B4,B8,B4          ; |265| 
||         INTSPU  .L1     A0,A0             ; |265| 

           NOP             3
           MPYSP   .M2X    A0,B4,B4          ; |265| 
           ; BRANCH OCCURS                   ; |266| 
;** --------------------------------------------------------------------------*
L14:    
           LDW     .D2T2   *+SP(20),B6       ; |268| 
           LDW     .D2T1   *+SP(8),A6        ; |269| 
           MVKL    .S2     _pos_TINTCnt,B5   ; |270| 
           MVKH    .S2     _pos_TINTCnt,B5   ; |270| 
           INTSPU  .L1     A0,A3             ; |268| 
           MVKL    .S1     _TINTCnt,A0       ; |268| 
           MVKH    .S1     _TINTCnt,A0       ; |268| 
           NOP             1
           CMPLTSP .S1     A4,A3,A1          ; |268| 
   [ A1]   LDW     .D1T1   *A0,A0            ; |268| 
           MV      .S2X    A1,B4             ; |268| 
           MVKL    .S1     _TINTCnt,A4       ; |273| 
           NOP             2
   [ A1]   INTSPU  .L1     A0,A5             ; |268| 
           NOP             3
   [ A1]   CMPGTSP .S2X    A5,B6,B6          ; |268| 
   [ A1]   XOR     .S2     1,B6,B4           ; |268| 
           MV      .S1X    B4,A1             ; |268| 
   [!A1]   B       .S2     L16               ; |268| 
           MVKL    .S1     _vel_TINTCnt,A3   ; |269| 
           MVKH    .S1     _TINTCnt,A4       ; |273| 
           MVKH    .S1     _vel_TINTCnt,A3   ; |269| 
           MVKL    .S1     _TINTCnt,A0       ; |270| 

           LDW     .D2T1   *+SP(20),A5       ; |273| 
||         MVKH    .S1     _TINTCnt,A0       ; |270| 

           ; BRANCH OCCURS                   ; |268| 
;** --------------------------------------------------------------------------*
           STW     .D1T1   A6,*A3            ; |269| 
           LDW     .D1T1   *A0,A0            ; |270| 
           LDW     .D2T2   *+SP(16),B4       ; |270| 
           LDW     .D2T2   *+SP(8),B6        ; |270| 
           NOP             2
           INTSPU  .L1     A0,A0             ; |270| 
           NOP             3
           SUBSP   .L2X    A0,B4,B7          ; |270| 
           LDW     .D2T2   *+SP(28),B4       ; |270| 
           NOP             2
           MPYSP   .M2     B7,B6,B6          ; |270| 
           NOP             3
           ADDSP   .L2     B6,B4,B4          ; |270| 
;** --------------------------------------------------------------------------*
L15:    
           B       .S1     L20               ; |271| 
           NOP             2
           STW     .D2T2   B4,*B5            ; |270| 
           LDW     .D2T2   *+SP(40),B3       ; |284| 
           NOP             1
           ; BRANCH OCCURS                   ; |271| 
;** --------------------------------------------------------------------------*
L16:    
           LDW     .D1T1   *A4,A0            ; |273| 
           LDW     .D2T2   *+SP(24),B7       ; |273| 
           MVKL    .S1     _TINTCnt,A6       ; |275| 
           MVKL    .S1     _TINTCnt,A4       ; |275| 
           MVKH    .S1     _TINTCnt,A6       ; |275| 
           INTSPU  .L1     A0,A3             ; |273| 
           MVKL    .S1     _TINTCnt,A0       ; |273| 
           MVKH    .S1     _TINTCnt,A0       ; |273| 
           MVKL    .S1     _TINTCnt,A8       ; |274| 
           CMPLTSP .S1     A5,A3,A1          ; |273| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |273| 
           MVKL    .S1     _TINTCnt,A7       ; |275| 
           MV      .S2X    A1,B5             ; |273| 
           MVKH    .S1     _TINTCnt,A8       ; |274| 
           MVKH    .S1     _TINTCnt,A7       ; |275| 
   [ A1]   INTSPU  .L1     A3,A3             ; |273| 
           MVKL    .S1     _vel_TINTCnt,A5   ; |274| 
           MVKH    .S1     _TINTCnt,A4       ; |275| 
           MVKL    .S2     _pos_TINTCnt,B6   ; |275| 
   [ A1]   CMPGTSP .S2X    A3,B7,B7          ; |273| 
   [ A1]   XOR     .S2     1,B7,B5           ; |273| 
           MV      .L1X    B5,A1             ; |273| 
   [!A1]   B       .S2     L17               ; |273| 
           MVKL    .S2     _pos_TINTCnt,B4   ; |279| 
           ZERO    .D2     B9                ; |275| 

           MVKH    .S1     _vel_TINTCnt,A5   ; |274| 
||         MVKH    .S2     0x3fe00000,B9     ; |275| 
||         LDW     .D2T1   *+SP(20),A2       ; |274| 

           MVKL    .S1     _vel_TINTCnt,A0   ; |278| 
||         MVKH    .S2     _pos_TINTCnt,B4   ; |279| 
||         LDW     .D2T1   *+SP(12),A10      ; |274| 

           ZERO    .D1     A3                ; |278| 
||         MVKH    .S1     _vel_TINTCnt,A0   ; |278| 
||         MVKH    .S2     _pos_TINTCnt,B6   ; |275| 
||         LDW     .D2T1   *+SP(8),A9        ; |274| 

           ; BRANCH OCCURS                   ; |273| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A8,A0            ; |274| 
           NOP             4
           INTSPU  .L1     A0,A0             ; |274| 
           NOP             3
           SUBSP   .L1     A0,A2,A0          ; |274| 
           NOP             3
           MPYSP   .M1     A0,A10,A0         ; |274| 
           NOP             3
           SUBSP   .L1     A9,A0,A0          ; |274| 
           NOP             3
           STW     .D1T1   A0,*A5            ; |274| 
           LDW     .D2T2   *+SP(12),B4       ; |275| 
           NOP             1
           LDW     .D1T1   *A7,A0            ; |275| 
           NOP             2
           SPDP    .S2     B4,B5:B4          ; |275| 
           LDW     .D2T2   *+SP(20),B7       ; |275| 

           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |275| 
||         INTSPU  .L1     A0,A0             ; |275| 

           NOP             3
           SUBSP   .L1X    A0,B7,A0          ; |275| 
           LDW     .D1T1   *A6,A5            ; |275| 
           NOP             1
           LDW     .D1T1   *A4,A3            ; |275| 
           SPDP    .S1     A0,A1:A0          ; |275| 
           NOP             1

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |275| 
||         INTSPU  .L1     A5,A4             ; |275| 

           NOP             1
           INTSPU  .L1     A3,A3             ; |275| 
           NOP             1
           SUBSP   .L2X    A4,B7,B4          ; |275| 
           LDW     .D2T2   *+SP(8),B8        ; |275| 
           SUBSP   .L1X    A3,B7,A3
           NOP             1
           SPDP    .S2     B4,B5:B4          ; |275| 
           LDW     .D2T2   *+SP(32),B7       ; |275| 

           MPYSP   .M1X    A3,B8,A0          ; |275| 
||         MPYDP   .M2X    B5:B4,A1:A0,B5:B4 ; |275| 

           NOP             3
           ADDSP   .L2X    A0,B7,B7          ; |275| 
           NOP             3
           SPDP    .S2     B7,B9:B8          ; |275| 
           NOP             1
           SUBDP   .L2     B9:B8,B5:B4,B5:B4 ; |275| 
           NOP             1
           B       .S1     L12               ; |276| 
           NOP             4
           DPSP    .L2     B5:B4,B4          ; |275| 
           ; BRANCH OCCURS                   ; |276| 
;** --------------------------------------------------------------------------*
L17:    
           STW     .D1T1   A3,*A0            ; |278| 
           LDW     .D2T2   *+SP(4),B5        ; |279| 
           NOP             4
           STW     .D2T2   B5,*B4            ; |279| 
;** --------------------------------------------------------------------------*
L18:    
           LDW     .D2T2   *+SP(40),B3       ; |284| 
;** --------------------------------------------------------------------------*
L19:    
           NOP             1
;** --------------------------------------------------------------------------*
L20:    
           LDW     .D2T2   *+SP(48),B11      ; |284| 
           LDW     .D2T2   *+SP(44),B10      ; |284| 

           LDW     .D2T1   *+SP(36),A10      ; |284| 
||         MVKL    .S1     _pos_TINTCnt,A0   ; |283| 

           B       .S2     B3                ; |284| 
||         MVKH    .S1     _pos_TINTCnt,A0   ; |283| 
||         LDW     .D2T2   *+SP(52),B12      ; |284| 

           LDW     .D2T2   *++SP(56),B13     ; |284| 
||         LDW     .D1T1   *A0,A4            ; |283| 

           NOP             4
           ; BRANCH OCCURS                   ; |284| 


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
           MVKL    .S1     _InitEXINTF,A0    ; |288| 
           MVKH    .S1     _InitEXINTF,A0    ; |288| 
           B       .S2X    A0                ; |288| 
           STW     .D2T2   B3,*SP--(24)      ; |287| 
           MVKL    .S2     RL22,B3           ; |288| 
           MVKH    .S2     RL22,B3           ; |288| 
           NOP             2
RL22:      ; CALL OCCURS                     ; |288| 
           MVKL    .S1     _InitTimer,A0     ; |289| 
           MVKH    .S1     _InitTimer,A0     ; |289| 
           B       .S2X    A0                ; |289| 
           MVKL    .S2     RL24,B3           ; |289| 
           MVKH    .S2     RL24,B3           ; |289| 
           NOP             3
RL24:      ; CALL OCCURS                     ; |289| 
           MVKL    .S2     _InitUART,B4      ; |290| 
           MVKH    .S2     _InitUART,B4      ; |290| 
           B       .S2     B4                ; |290| 
           MVKL    .S2     RL26,B3           ; |290| 
           MVKH    .S2     RL26,B3           ; |290| 
           NOP             3
RL26:      ; CALL OCCURS                     ; |290| 
           MVKL    .S1     _InitINT,A0       ; |291| 
           MVKH    .S1     _InitINT,A0       ; |291| 
           B       .S2X    A0                ; |291| 
           MVKL    .S2     RL28,B3           ; |291| 
           MVKH    .S2     RL28,B3           ; |291| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |291| 
           MVKL    .S1     _InitUSBMon,A0    ; |292| 
           MVKH    .S1     _InitUSBMon,A0    ; |292| 
           B       .S2X    A0                ; |292| 
           MVKL    .S2     RL30,B3           ; |292| 
           MVKH    .S2     RL30,B3           ; |292| 
           NOP             3
RL30:      ; CALL OCCURS                     ; |292| 
           MVKL    .S1     _sprintf,A0       ; |294| 

           MVKH    .S1     _sprintf,A0       ; |294| 
||         MVKL    .S2     _tmp_string,B5    ; |294| 

           B       .S2X    A0                ; |294| 
           MVKL    .S2     RL32,B3           ; |294| 
           MVKH    .S2     _tmp_string,B5    ; |294| 
           MVKL    .S2     SL1+0,B4          ; |294| 
           MVKH    .S2     SL1+0,B4          ; |294| 

           MVKH    .S2     RL32,B3           ; |294| 
||         MV      .S1X    B5,A4             ; |294| 
||         STW     .D2T2   B4,*+SP(4)        ; |294| 

RL32:      ; CALL OCCURS                     ; |294| 
           MVKL    .S1     _Report,A0        ; |294| 
           MVKH    .S1     _Report,A0        ; |294| 
           B       .S2X    A0                ; |294| 
           MVKL    .S2     RL34,B3           ; |294| 
           MVKH    .S2     RL34,B3           ; |294| 
           NOP             3
RL34:      ; CALL OCCURS                     ; |294| 
           MVK     .S1     2024,A0           ; |295| 

           MVKL    .S1     _sprintf,A0       ; |295| 
||         STW     .D2T1   A0,*+SP(8)        ; |295| 

           MVKH    .S1     _sprintf,A0       ; |295| 
||         MVKL    .S2     SL2+0,B4          ; |295| 

           B       .S2X    A0                ; |295| 
           MVKH    .S2     SL2+0,B4          ; |295| 
           MVKL    .S2     _tmp_string,B5    ; |295| 
           MVKH    .S2     _tmp_string,B5    ; |295| 
           MVKL    .S2     RL36,B3           ; |295| 

           STW     .D2T2   B4,*+SP(4)        ; |295| 
||         MVKH    .S2     RL36,B3           ; |295| 
||         MV      .S1X    B5,A4             ; |295| 

RL36:      ; CALL OCCURS                     ; |295| 
           MVKL    .S1     _Report,A0        ; |295| 
           MVKH    .S1     _Report,A0        ; |295| 
           B       .S2X    A0                ; |295| 
           MVKL    .S2     RL38,B3           ; |295| 
           MVKH    .S2     RL38,B3           ; |295| 
           NOP             3
RL38:      ; CALL OCCURS                     ; |295| 
           MVKL    .S2     SL3+0,B4          ; |296| 
           MVKL    .S2     0x20003fc,B5      ; |296| 
           MVKH    .S2     SL3+0,B4          ; |296| 

           MVKH    .S2     0x20003fc,B5      ; |296| 
||         STW     .D2T2   B4,*+SP(4)        ; |296| 

           LDW     .D2T2   *B5,B4            ; |296| 
           MVKL    .S1     _sprintf,A3       ; |296| 
           MVKL    .S1     0x20003fc,A0      ; |296| 
           MVKH    .S1     0x20003fc,A0      ; |296| 
           MVKH    .S1     _sprintf,A3       ; |296| 
           EXTU    .S2     B4,16,24,B4       ; |296| 
           STW     .D2T2   B4,*+SP(8)        ; |296| 
           LDW     .D1T1   *A0,A0            ; |296| 
           B       .S2X    A3                ; |296| 
           MVKL    .S2     RL40,B3           ; |296| 
           MVKH    .S2     RL40,B3           ; |296| 
           MVKL    .S1     _tmp_string,A4    ; |296| 
           EXTU    .S1     A0,24,24,A0       ; |296| 

           STW     .D2T1   A0,*+SP(12)       ; |296| 
||         MVKH    .S1     _tmp_string,A4    ; |296| 

RL40:      ; CALL OCCURS                     ; |296| 
           MVKL    .S1     _Report,A0        ; |296| 
           MVKH    .S1     _Report,A0        ; |296| 
           B       .S2X    A0                ; |296| 
           MVKL    .S2     RL42,B3           ; |296| 
           MVKH    .S2     RL42,B3           ; |296| 
           NOP             3
RL42:      ; CALL OCCURS                     ; |296| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |300| 
           MVKH    .S1     _GIE,A0           ; |300| 
           B       .S2X    A0                ; |300| 
           MVKL    .S2     _TFlag,B4         ; |298| 
           MVKL    .S2     RL44,B3           ; |300| 
           MVKH    .S2     _TFlag,B4         ; |298| 
           ZERO    .D2     B5                ; |298| 

           STW     .D2T2   B5,*B4            ; |298| 
||         MVKH    .S2     RL44,B3           ; |300| 

RL44:      ; CALL OCCURS                     ; |300| 
           MVK     .S2     1,B6              ; |303| 
           MVKL    .S2     0x2000080,B5      ; |303| 
           MVKL    .S2     0x200004c,B4      ; |302| 

           MVKH    .S2     0x200004c,B4      ; |302| 
||         MVK     .S1     1,A0              ; |302| 

           MVKL    .S1     _TINTCnt,A0       ; |306| 
||         STW     .D2T1   A0,*B4            ; |302| 
||         MVKH    .S2     0x2000080,B5      ; |303| 

           STW     .D2T2   B6,*B5            ; |303| 
||         MVKH    .S1     _TINTCnt,A0       ; |306| 
||         ZERO    .D1     A3                ; |306| 

           STW     .D1T1   A3,*A0            ; |306| 
           MVKL    .S2     0x200004c,B4      ; |309| 
           MVKH    .S2     0x200004c,B4      ; |309| 
           LDW     .D2T2   *B4,B5            ; |309| 
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L21:    
           MVKL    .S1     _TINTCnt,A3       ; |310| 
           MVKH    .S1     _TINTCnt,A3       ; |310| 

           MVKL    .S2     SL4+0,B5          ; |310| 
||         XOR     .L2     1,B5,B6           ; |309| 

           STW     .D2T2   B6,*B4            ; |309| 
||         MVKH    .S2     SL4+0,B5          ; |310| 

           STW     .D2T2   B5,*+SP(4)        ; |310| 

           LDW     .D1T1   *A3,A0            ; |310| 
||         MVKL    .S2     _sprintf,B5       ; |310| 

           MVKH    .S2     _sprintf,B5       ; |310| 
           B       .S2     B5                ; |310| 
           MVKL    .S2     RL46,B3           ; |310| 
           MVKL    .S2     _tmp_string,B4    ; |310| 
           ADD     .D1     1,A0,A4           ; |310| 

           STW     .D1T1   A4,*A3            ; |310| 
||         MVKH    .S2     _tmp_string,B4    ; |310| 

           STW     .D2T1   A0,*+SP(8)        ; |310| 
||         MV      .S1X    B4,A4             ; |310| 
||         MVKH    .S2     RL46,B3           ; |310| 

RL46:      ; CALL OCCURS                     ; |310| 
           MVKL    .S1     _Report,A0        ; |310| 
           MVKH    .S1     _Report,A0        ; |310| 
           B       .S2X    A0                ; |310| 
           MVKL    .S2     RL48,B3           ; |310| 
           MVKH    .S2     RL48,B3           ; |310| 
           NOP             3
RL48:      ; CALL OCCURS                     ; |310| 
           MVKL    .S1     _WaitTFlagCnt,A0  ; |311| 
           MVKH    .S1     _WaitTFlagCnt,A0  ; |311| 
           B       .S2X    A0                ; |311| 
           MVKL    .S2     RL50,B3           ; |311| 
           MVKH    .S2     RL50,B3           ; |311| 
           MVK     .S1     0x1f4,A4          ; |311| 
           NOP             2
RL50:      ; CALL OCCURS                     ; |311| 
           B       .S1     L21               ; |312| 
           MVKL    .S2     0x200004c,B4      ; |309| 
           MVKH    .S2     0x200004c,B4      ; |309| 
           LDW     .D2T2   *B4,B5            ; |309| 
           NOP             2
           ; BRANCH OCCURS                   ; |312| 


;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
SL1:	.string	13,10,13,10,0
SL2:	.string	"Mechatronics Course %d",13,10,0
SL3:	.string	"FPGA Ver%2x.%02x",13,10,0
SL4:	.string	"Timer Check: %d ",13,10,0
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
