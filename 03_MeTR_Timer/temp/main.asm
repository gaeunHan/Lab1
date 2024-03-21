;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Thu Mar 21 16:23:52 2024                                *
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
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI20248_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI20248_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
	.global	_GetRefAngle

;******************************************************************************
;* FUNCTION NAME: _GetRefAngle                                                *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,B0,B1,B2,B3,B4,B5, *
;*                           B6,B7,B8,B9,B10,B11,B12,B13,SP                   *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,B0,B1,B2,B3,B4,B5, *
;*                           B6,B7,B8,B9,B10,B11,B12,B13,SP                   *
;*   Local Frame Size  : 0 Args + 36 Auto + 24 Save = 60 byte                 *
;******************************************************************************
_GetRefAngle:
;** --------------------------------------------------------------------------*

           MV      .S1X    B4,A0
||         STW     .D2T2   B13,*SP--(64)     ; |144| 

           ZERO    .D1     A0                ; |154| 
||         STW     .D2T1   A0,*+SP(8)        ; |144| 

           MVKL    .S1     __divf,A0         ; |157| 
||         STW     .D2T1   A0,*+SP(36)       ; |154| 

           MVKH    .S1     __divf,A0         ; |157| 
||         STW     .D2T2   B3,*+SP(48)       ; |144| 

           B       .S2X    A0                ; |157| 
||         STW     .D2T1   A4,*+SP(4)        ; |144| 

           STW     .D2T2   B11,*+SP(56)      ; |144| 
           STW     .D2T2   B10,*+SP(52)      ; |144| 
           STW     .D2T1   A10,*+SP(44)      ; |144| 

           STW     .D2T1   A6,*+SP(12)       ; |144| 
||         MVKL    .S2     RL8,B3            ; |157| 
||         MV      .L2     B4,B5

           MVKH    .S2     RL8,B3            ; |157| 
||         MV      .S1X    B5,A4             ; |157| 
||         STW     .D2T2   B12,*+SP(60)      ; |144| 
||         MV      .L2X    A6,B4             ; |144| 

RL8:       ; CALL OCCURS                     ; |157| 
           LDW     .D2T2   *+SP(8),B7        ; |158| 
           LDW     .D2T2   *+SP(12),B4       ; |158| 
           MVKL    .S2     __divf,B6         ; |158| 
           MVKH    .S2     __divf,B6         ; |158| 

           B       .S2     B6                ; |158| 
||         ZERO    .D1     A0                ; |158| 

           MPYSP   .M2     B7,B7,B5
||         MVKH    .S1     0x40000000,A0     ; |158| 

           MPYSP   .M2X    B4,A0,B4          ; |158| 
           MVKL    .S2     RL10,B3           ; |158| 
           STW     .D2T1   A4,*+SP(16)       ; |157| 

           MVKH    .S2     RL10,B3           ; |158| 
||         MV      .S1X    B5,A4             ; |158| 

RL10:      ; CALL OCCURS                     ; |158| 
           MVKL    .S1     __divf,A0         ; |161| 

           LDW     .D2T2   *+SP(8),B4        ; |161| 
||         MVKH    .S1     __divf,A0         ; |161| 

           B       .S2X    A0                ; |161| 
||         STW     .D2T1   A4,*+SP(28)       ; |158| 

           LDW     .D2T1   *+SP(4),A4
           MVKL    .S2     RL12,B3           ; |161| 
           MVKH    .S2     RL12,B3           ; |161| 
           NOP             2
RL12:      ; CALL OCCURS                     ; |161| 
           LDW     .D2T2   *+SP(16),B8       ; |165| 
           LDW     .D2T2   *+SP(28),B6       ; |168| 
           LDW     .D2T2   *+SP(4),B0        ; |162| 
           ZERO    .D2     B4                ; |168| 
           MVKH    .S2     0x40000000,B4     ; |168| 
           ADDSP   .L2X    B8,A4,B7
           MPYSP   .M2     B6,B4,B8          ; |168| 
           MV      .D2     B0,B2
           MVKL    .S2     RL16,B3           ; |171| 

           MV      .L2     B0,B9             ; |172| 
||         STW     .D2T1   A4,*+SP(20)       ; |161| 
||         MVKL    .S2     _sqrt,B10         ; |171| 

           CMPGTSP .S2     B9,B8,B0          ; |168| 
||         SUBSP   .L2     B0,B6,B6
||         MV      .S1X    B0,A4
||         MV      .D2     B6,B1

           ZERO    .D2     B13               ; |177| 
||         MVKH    .S2     RL16,B3           ; |171| 

           MVKH    .S2     0x40000000,B13    ; |177| 

           MVKL    .S2     __divf,B12        ; |172| 
|| [ B0]   B       .S1     L11               ; |168| 

           MVKH    .S2     _sqrt,B10         ; |171| 

           LDW     .D2T2   *+SP(12),B4       ; |171| 
||         ZERO    .L2     B11               ; |172| 
||         MVKL    .S1     _TINTCnt,A10      ; |180| 
||         MVKH    .S2     __divf,B12        ; |172| 

           MVKH    .S1     _TINTCnt,A10      ; |180| 
||         MVKH    .S2     0x40000000,B11    ; |172| 
||         STW     .D2T2   B6,*+SP(32)       ; |162| 

           MVKL    .S2     __divf,B5         ; |171| 
||         MVKL    .S1     _TINTCnt,A0       ; |189| 
||         STW     .D2T2   B7,*+SP(24)       ; |165| 

           MVKH    .S2     __divf,B5         ; |171| 
||         LDW     .D2T1   *+SP(16),A3       ; |189| 
||         MVKH    .S1     _TINTCnt,A0       ; |189| 

           ; BRANCH OCCURS                   ; |168| 
;** --------------------------------------------------------------------------*
           B       .S2     B5                ; |171| 
           NOP             5
RL16:      ; CALL OCCURS                     ; |171| 
           B       .S2     B10               ; |171| 
           MVKL    .S2     RL18,B3           ; |171| 
           NOP             2
           SPDP    .S1     A4,A5:A4          ; |171| 
           MVKH    .S2     RL18,B3           ; |171| 
RL18:      ; CALL OCCURS                     ; |171| 
           B       .S2     B12               ; |172| 

           LDW     .D2T1   *+SP(4),A4
||         DPSP    .L1     A5:A4,A0          ; |171| 

           MV      .L2     B11,B4            ; |172| 
           NOP             1
           MVKL    .S2     RL20,B3           ; |172| 

           MVKH    .S2     RL20,B3           ; |172| 
||         STW     .D2T1   A0,*+SP(16)       ; |171| 

RL20:      ; CALL OCCURS                     ; |172| 
           LDW     .D2T2   *+SP(12),B5       ; |174| 
           LDW     .D2T2   *+SP(16),B4       ; |177| 
           STW     .D2T1   A4,*+SP(28)       ; |172| 
           NOP             3
           MPYSP   .M2     B4,B5,B5

           MPYSP   .M2     B4,B13,B4         ; |177| 
||         MV      .D2     B4,B6

           NOP             3
           STW     .D2T2   B4,*+SP(20)       ; |177| 
           STW     .D2T2   B5,*+SP(8)        ; |174| 
           LDW     .D1T1   *A10,A0           ; |180| 
           MV      .D2     B6,B4             ; |180| 
           LDW     .D2T2   *+SP(12),B5       ; |180| 
           ZERO    .S2     B6                ; |180| 
           NOP             1
           INTSPU  .L1     A0,A3             ; |180| 
           MVKL    .S1     _TINTCnt,A0       ; |180| 
           MVKH    .S1     _TINTCnt,A0       ; |180| 
           NOP             1
           CMPGTSP .S1X    A3,B4,A1          ; |180| 
   [!A1]   LDW     .D1T1   *A0,A0            ; |180| 
           MVKL    .S2     _TINTCnt,B4       ; |180| 
           MVKH    .S2     _TINTCnt,B4       ; |180| 
   [!A1]   LDW     .D2T2   *B4,B4            ; |180| 
           LDW     .D2T1   *+SP(16),A3       ; |182| 

           MPYSP   .M2     B5,B6,B5          ; |180| 
|| [!A1]   INTSPU  .L1     A0,A0             ; |180| 

           NOP             3

   [!A1]   MPYSP   .M2X    A0,B5,B5          ; |180| 
|| [!A1]   INTSPU  .L2     B4,B4             ; |180| 

           MVKL    .S1     _TINTCnt,A0       ; |182| 
           MVKH    .S1     _TINTCnt,A0       ; |182| 
   [!A1]   B       .S1     L14               ; |180| 
   [!A1]   MPYSP   .M2     B4,B5,B4          ; |180| 
           NOP             3
   [!A1]   STW     .D2T2   B4,*+SP(36)       ; |180| 
           ; BRANCH OCCURS                   ; |180| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A0,A0            ; |182| 
           LDW     .D2T2   *+SP(20),B6       ; |182| 
           LDW     .D2T2   *+SP(12),B8       ; |182| 
           MVKL    .S1     _TINTCnt,A5       ; |182| 
           MVKH    .S1     _TINTCnt,A5       ; |182| 
           INTSPU  .L1     A0,A4             ; |182| 
           MVKL    .S1     _TINTCnt,A0       ; |182| 
           MVKH    .S1     _TINTCnt,A0       ; |182| 
           LDW     .D2T2   *+SP(4),B9        ; |183| 
           CMPLTSP .S1     A3,A4,A1          ; |182| 
   [ A1]   LDW     .D1T1   *A0,A0            ; |182| 
           MV      .S2X    A1,B4             ; |182| 
           LDW     .D2T1   *+SP(16),A4       ; |182| 
           LDW     .D2T1   *+SP(28),A6       ; |182| 
           MVKL    .S2     _TINTCnt,B5       ; |182| 
   [ A1]   INTSPU  .L1     A0,A3             ; |182| 
           MVKL    .S1     _TINTCnt,A0       ; |182| 
           MVKH    .S1     _TINTCnt,A0       ; |182| 
           MVKH    .S2     _TINTCnt,B5       ; |182| 
   [ A1]   CMPGTSP .S2X    A3,B6,B7          ; |182| 
   [ A1]   XOR     .S2     1,B7,B4           ; |182| 
           MV      .S1X    B4,A1             ; |182| 
   [!A1]   B       .S1     L10               ; |182| 
           ZERO    .D1     A3                ; |182| 
           MV      .L2X    A4,B6             ; |182| 
           LDW     .D2T1   *+SP(8),A8        ; |182| 
           NOP             1

           MV      .D1     A4,A3             ; |182| 
||         MPYSP   .M1X    B8,A3,A7          ; |182| 

           ; BRANCH OCCURS                   ; |182| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A0,A0            ; |182| 
           LDW     .D1T1   *A5,A5            ; |182| 
           LDW     .D2T2   *B5,B4            ; |182| 
           NOP             2
           INTSPU  .L1     A0,A0             ; |182| 
           INTSPU  .L1     A5,A5             ; |182| 
           NOP             2
           SUBSP   .L1     A0,A4,A0          ; |182| 

           SUBSP   .L1     A5,A3,A3          ; |182| 
||         INTSPU  .L2     B4,B4             ; |182| 

           NOP             2
           MPYSP   .M1     A0,A8,A0          ; |182| 

           SUBSP   .L2     B4,B6,B4          ; |182| 
||         MPYSP   .M1     A3,A7,A3          ; |182| 

           NOP             2
           B       .S1     L12               ; |182| 

           MPYSP   .M2X    B4,A3,B4          ; |182| 
||         ADDSP   .L1     A0,A6,A0          ; |182| 

           NOP             3
           SUBSP   .L2X    A0,B4,B4          ; |182| 
           ; BRANCH OCCURS                   ; |182| 
;** --------------------------------------------------------------------------*
L10:    
           B       .S1     L16               ; |184| 
           LDW     .D2T2   *+SP(48),B3       ; |198| 
           LDW     .D2T2   *+SP(60),B12      ; |198| 
           LDW     .D2T2   *+SP(56),B11      ; |198| 
           NOP             1
           STW     .D2T2   B9,*+SP(36)       ; |183| 
           ; BRANCH OCCURS                   ; |184| 
;** --------------------------------------------------------------------------*
L11:    
           LDW     .D1T1   *A0,A0            ; |189| 
           NOP             4
           INTSPU  .L1     A0,A4             ; |189| 
           NOP             2
           MVKL    .S1     _TINTCnt,A0       ; |189| 

           CMPGTSP .S1     A4,A3,A1          ; |189| 
||         MVKL    .S2     _TINTCnt,B4       ; |189| 

           MVKH    .S1     _TINTCnt,A0       ; |189| 
||         MVKH    .S2     _TINTCnt,B4       ; |189| 

   [!A1]   LDW     .D1T1   *A0,A0            ; |189| 
|| [!A1]   LDW     .D2T2   *B4,B4            ; |189| 

           NOP             4
   [!A1]   MPYI    .M1X    B4,A0,A0          ; |189| 
           NOP             3
           LDW     .D2T2   *+SP(12),B5       ; |189| 
           NOP             3
           ZERO    .D2     B4                ; |189| 

   [!A1]   INTSPU  .L1     A0,A0             ; |189| 
||         MPYSP   .M2     B5,B4,B4          ; |189| 

           NOP             2
   [!A1]   B       .S1     L14               ; |189| 
   [!A1]   MPYSP   .M2X    A0,B4,B4          ; |189| 
           NOP             2
           MVKL    .S1     _TINTCnt,A0       ; |191| 

           MVKH    .S1     _TINTCnt,A0       ; |191| 
|| [!A1]   STW     .D2T2   B4,*+SP(36)       ; |189| 

           ; BRANCH OCCURS                   ; |189| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A0,A0            ; |191| 
           MVKL    .S2     _TINTCnt,B4       ; |191| 
           MVKH    .S2     _TINTCnt,B4       ; |191| 
           LDW     .D2T2   *+SP(20),B6       ; |191| 
           NOP             1
           INTSPU  .L1     A0,A0             ; |191| 
           NOP             3
           CMPLTSP .S1     A3,A0,A1          ; |191| 
   [ A1]   LDW     .D2T2   *B4,B4            ; |191| 
           MVKL    .S1     _TINTCnt,A0       ; |191| 
           MVKH    .S1     _TINTCnt,A0       ; |191| 
           NOP             2
   [ A1]   INTSPU  .L2     B4,B5             ; |191| 
           MV      .L2X    A1,B4             ; |191| 
           NOP             2
   [ A1]   CMPGTSP .S2     B5,B6,B5          ; |191| 
   [ A1]   XOR     .S2     1,B5,B4           ; |191| 
           MV      .L1X    B4,A1             ; |191| 
   [ A1]   LDW     .D1T1   *A0,A0            ; |191| 
           LDW     .D2T2   *+SP(8),B5        ; |191| 
           MV      .S2X    A3,B4             ; |191| 
           LDW     .D2T1   *+SP(20),A3       ; |193| 
           NOP             1
   [ A1]   INTSPU  .L1     A0,A0             ; |191| 
           NOP             3
   [ A1]   SUBSP   .L2X    A0,B4,B6          ; |191| 
           MV      .D2     B1,B4
           MVKL    .S1     _TINTCnt,A0       ; |193| 
           MVKH    .S1     _TINTCnt,A0       ; |193| 
   [ A1]   MPYSP   .M2     B6,B5,B5          ; |191| 
           NOP             2
   [ A1]   B       .S1     L14               ; |191| 
   [ A1]   ADDSP   .L2     B5,B1,B4
           NOP             3
   [ A1]   STW     .D2T2   B4,*+SP(36)       ; |191| 
           ; BRANCH OCCURS                   ; |191| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A0,A0            ; |193| 
           NOP             4
           INTSPU  .L1     A0,A4             ; |193| 
           NOP             2
           MVKL    .S1     _TINTCnt,A0       ; |193| 
           CMPLTSP .S1     A3,A4,A1          ; |193| 
           MVKH    .S1     _TINTCnt,A0       ; |193| 
   [ A1]   LDW     .D1T1   *A0,A0            ; |193| 
           NOP             4

   [ A1]   INTSPU  .L1     A0,A3             ; |193| 
||         LDW     .D2T2   *+SP(12),B4       ; |193| 

           NOP             2

           MV      .S2X    A1,B9             ; |193| 
||         MV      .D2     B7,B5             ; |193| 

   [ A1]   CMPGTSP .S2X    A3,B5,B5          ; |193| 

           SPDP    .S2     B4,B5:B4          ; |193| 
|| [ A1]   XOR     .L2     1,B5,B9           ; |193| 
||         ZERO    .D1     A5                ; |193| 

           MV      .L1X    B9,A1             ; |193| 
||         ZERO    .D1     A4                ; |193| 
||         MVKH    .S1     0x3fe00000,A5     ; |193| 

           MPYDP   .M1X    B5:B4,A5:A4,A5:A4 ; |193| 

   [!A1]   B       .S1     L13               ; |193| 
||         LDW     .D2T1   *+SP(20),A3       ; |193| 

           NOP             1
           MVKL    .S1     _TINTCnt,A9       ; |193| 
           MVKH    .S1     _TINTCnt,A9       ; |193| 

           MVKL    .S1     _TINTCnt,A0       ; |193| 
||         LDW     .D2T1   *+SP(32),A6       ; |193| 
||         MV      .L2     B2,B6             ; |193| 
||         MVKL    .S2     _TINTCnt,B8       ; |193| 

           MV      .L2X    A3,B7             ; |193| 
||         MV      .D1     A3,A8             ; |193| 
||         MVKH    .S1     _TINTCnt,A0       ; |193| 
||         MVKH    .S2     _TINTCnt,B8       ; |193| 
||         LDW     .D2T1   *+SP(8),A7        ; |193| 

           ; BRANCH OCCURS                   ; |193| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A0,A0            ; |193| 
           NOP             4
           INTSPU  .L1     A0,A0             ; |193| 
           NOP             3
           SUBSP   .L1     A0,A8,A0          ; |193| 
           LDW     .D2T2   *B8,B4            ; |193| 
           NOP             1
           LDW     .D1T1   *A9,A8            ; |193| 
           SPDP    .S1     A0,A1:A0          ; |193| 
           NOP             1

           MPYDP   .M1     A1:A0,A5:A4,A1:A0 ; |193| 
||         INTSPU  .L2     B4,B4             ; |193| 

           NOP             1
           INTSPU  .L1     A8,A4             ; |193| 
           NOP             1
           SUBSP   .L2     B4,B7,B4          ; |193| 
           NOP             1
           SUBSP   .L1     A4,A3,A3          ; |193| 
           NOP             1
           SPDP    .S2     B4,B5:B4          ; |193| 
           NOP             1

           MPYSP   .M1     A3,A7,A0          ; |193| 
||         MPYDP   .M2X    B5:B4,A1:A0,B5:B4 ; |193| 

           NOP             3
           ADDSP   .L1     A0,A6,A0          ; |193| 
           NOP             3
           SPDP    .S1     A0,A1:A0          ; |193| 
           NOP             1
           SUBDP   .L2X    A1:A0,B5:B4,B5:B4 ; |193| 
           NOP             6
           DPSP    .L2     B5:B4,B4          ; |193| 
;** --------------------------------------------------------------------------*
L12:    
           B       .S1     L15               ; |193| 
           LDW     .D2T2   *+SP(48),B3       ; |198| 
           LDW     .D2T2   *+SP(60),B12      ; |198| 
           NOP             2
           STW     .D2T2   B4,*+SP(36)       ; |193| 
           ; BRANCH OCCURS                   ; |193| 
;** --------------------------------------------------------------------------*
L13:    
           STW     .D2T2   B6,*+SP(36)       ; |194| 
;** --------------------------------------------------------------------------*
L14:    
           LDW     .D2T2   *+SP(48),B3       ; |198| 
           LDW     .D2T2   *+SP(60),B12      ; |198| 
;** --------------------------------------------------------------------------*
L15:    
           LDW     .D2T2   *+SP(56),B11      ; |198| 
;** --------------------------------------------------------------------------*
L16:    
           LDW     .D2T2   *+SP(52),B10      ; |198| 
           LDW     .D2T1   *+SP(44),A10      ; |198| 

           B       .S2     B3                ; |198| 
||         LDW     .D2T1   *+SP(36),A4       ; |197| 

           LDW     .D2T2   *++SP(64),B13     ; |198| 
           NOP             4
           ; BRANCH OCCURS                   ; |198| 


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
           MVKL    .S1     _InitEXINTF,A0    ; |202| 
           MVKH    .S1     _InitEXINTF,A0    ; |202| 
           B       .S2X    A0                ; |202| 
           STW     .D2T2   B3,*SP--(24)      ; |201| 
           MVKL    .S2     RL22,B3           ; |202| 
           MVKH    .S2     RL22,B3           ; |202| 
           NOP             2
RL22:      ; CALL OCCURS                     ; |202| 
           MVKL    .S1     _InitTimer,A0     ; |203| 
           MVKH    .S1     _InitTimer,A0     ; |203| 
           B       .S2X    A0                ; |203| 
           MVKL    .S2     RL24,B3           ; |203| 
           MVKH    .S2     RL24,B3           ; |203| 
           NOP             3
RL24:      ; CALL OCCURS                     ; |203| 
           MVKL    .S2     _InitUART,B4      ; |204| 
           MVKH    .S2     _InitUART,B4      ; |204| 
           B       .S2     B4                ; |204| 
           MVKL    .S2     RL26,B3           ; |204| 
           MVKH    .S2     RL26,B3           ; |204| 
           NOP             3
RL26:      ; CALL OCCURS                     ; |204| 
           MVKL    .S1     _InitINT,A0       ; |205| 
           MVKH    .S1     _InitINT,A0       ; |205| 
           B       .S2X    A0                ; |205| 
           MVKL    .S2     RL28,B3           ; |205| 
           MVKH    .S2     RL28,B3           ; |205| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |205| 
           MVKL    .S1     _InitUSBMon,A0    ; |206| 
           MVKH    .S1     _InitUSBMon,A0    ; |206| 
           B       .S2X    A0                ; |206| 
           MVKL    .S2     RL30,B3           ; |206| 
           MVKH    .S2     RL30,B3           ; |206| 
           NOP             3
RL30:      ; CALL OCCURS                     ; |206| 
           MVKL    .S1     _sprintf,A0       ; |208| 

           MVKH    .S1     _sprintf,A0       ; |208| 
||         MVKL    .S2     _tmp_string,B5    ; |208| 

           B       .S2X    A0                ; |208| 
           MVKL    .S2     RL32,B3           ; |208| 
           MVKH    .S2     _tmp_string,B5    ; |208| 
           MVKL    .S2     SL1+0,B4          ; |208| 
           MVKH    .S2     SL1+0,B4          ; |208| 

           MVKH    .S2     RL32,B3           ; |208| 
||         MV      .S1X    B5,A4             ; |208| 
||         STW     .D2T2   B4,*+SP(4)        ; |208| 

RL32:      ; CALL OCCURS                     ; |208| 
           MVKL    .S1     _Report,A0        ; |208| 
           MVKH    .S1     _Report,A0        ; |208| 
           B       .S2X    A0                ; |208| 
           MVKL    .S2     RL34,B3           ; |208| 
           MVKH    .S2     RL34,B3           ; |208| 
           NOP             3
RL34:      ; CALL OCCURS                     ; |208| 
           MVK     .S1     2024,A0           ; |209| 

           MVKL    .S1     _sprintf,A0       ; |209| 
||         STW     .D2T1   A0,*+SP(8)        ; |209| 

           MVKH    .S1     _sprintf,A0       ; |209| 
||         MVKL    .S2     SL2+0,B4          ; |209| 

           B       .S2X    A0                ; |209| 
           MVKH    .S2     SL2+0,B4          ; |209| 
           MVKL    .S2     _tmp_string,B5    ; |209| 
           MVKH    .S2     _tmp_string,B5    ; |209| 
           MVKL    .S2     RL36,B3           ; |209| 

           STW     .D2T2   B4,*+SP(4)        ; |209| 
||         MVKH    .S2     RL36,B3           ; |209| 
||         MV      .S1X    B5,A4             ; |209| 

RL36:      ; CALL OCCURS                     ; |209| 
           MVKL    .S1     _Report,A0        ; |209| 
           MVKH    .S1     _Report,A0        ; |209| 
           B       .S2X    A0                ; |209| 
           MVKL    .S2     RL38,B3           ; |209| 
           MVKH    .S2     RL38,B3           ; |209| 
           NOP             3
RL38:      ; CALL OCCURS                     ; |209| 
           MVKL    .S2     SL3+0,B4          ; |210| 
           MVKL    .S2     0x20003fc,B5      ; |210| 
           MVKH    .S2     SL3+0,B4          ; |210| 

           MVKH    .S2     0x20003fc,B5      ; |210| 
||         STW     .D2T2   B4,*+SP(4)        ; |210| 

           LDW     .D2T2   *B5,B4            ; |210| 
           MVKL    .S1     _sprintf,A3       ; |210| 
           MVKL    .S1     0x20003fc,A0      ; |210| 
           MVKH    .S1     0x20003fc,A0      ; |210| 
           MVKH    .S1     _sprintf,A3       ; |210| 
           EXTU    .S2     B4,16,24,B4       ; |210| 
           STW     .D2T2   B4,*+SP(8)        ; |210| 
           LDW     .D1T1   *A0,A0            ; |210| 
           B       .S2X    A3                ; |210| 
           MVKL    .S2     RL40,B3           ; |210| 
           MVKH    .S2     RL40,B3           ; |210| 
           MVKL    .S1     _tmp_string,A4    ; |210| 
           EXTU    .S1     A0,24,24,A0       ; |210| 

           STW     .D2T1   A0,*+SP(12)       ; |210| 
||         MVKH    .S1     _tmp_string,A4    ; |210| 

RL40:      ; CALL OCCURS                     ; |210| 
           MVKL    .S1     _Report,A0        ; |210| 
           MVKH    .S1     _Report,A0        ; |210| 
           B       .S2X    A0                ; |210| 
           MVKL    .S2     RL42,B3           ; |210| 
           MVKH    .S2     RL42,B3           ; |210| 
           NOP             3
RL42:      ; CALL OCCURS                     ; |210| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |214| 
           MVKH    .S1     _GIE,A0           ; |214| 
           B       .S2X    A0                ; |214| 
           MVKL    .S2     _TFlag,B4         ; |212| 
           MVKL    .S2     RL44,B3           ; |214| 
           MVKH    .S2     _TFlag,B4         ; |212| 
           ZERO    .D2     B5                ; |212| 

           STW     .D2T2   B5,*B4            ; |212| 
||         MVKH    .S2     RL44,B3           ; |214| 

RL44:      ; CALL OCCURS                     ; |214| 
           MVK     .S2     1,B6              ; |217| 
           MVKL    .S2     0x2000080,B5      ; |217| 
           MVKL    .S2     0x200004c,B4      ; |216| 

           MVKH    .S2     0x200004c,B4      ; |216| 
||         MVK     .S1     1,A0              ; |216| 

           MVKL    .S1     _TINTCnt,A0       ; |220| 
||         STW     .D2T1   A0,*B4            ; |216| 
||         MVKH    .S2     0x2000080,B5      ; |217| 

           STW     .D2T2   B6,*B5            ; |217| 
||         MVKH    .S1     _TINTCnt,A0       ; |220| 
||         ZERO    .D1     A3                ; |220| 

           STW     .D1T1   A3,*A0            ; |220| 
           MVKL    .S2     0x200004c,B4      ; |223| 
           MVKH    .S2     0x200004c,B4      ; |223| 
           LDW     .D2T2   *B4,B5            ; |223| 
           NOP             2
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L17:    
           MVKL    .S1     _TINTCnt,A3       ; |224| 
           MVKH    .S1     _TINTCnt,A3       ; |224| 

           MVKL    .S2     SL4+0,B5          ; |224| 
||         XOR     .L2     1,B5,B6           ; |223| 

           STW     .D2T2   B6,*B4            ; |223| 
||         MVKH    .S2     SL4+0,B5          ; |224| 

           STW     .D2T2   B5,*+SP(4)        ; |224| 

           LDW     .D1T1   *A3,A0            ; |224| 
||         MVKL    .S2     _sprintf,B5       ; |224| 

           MVKH    .S2     _sprintf,B5       ; |224| 
           B       .S2     B5                ; |224| 
           MVKL    .S2     RL46,B3           ; |224| 
           MVKL    .S2     _tmp_string,B4    ; |224| 
           ADD     .D1     1,A0,A4           ; |224| 

           STW     .D1T1   A4,*A3            ; |224| 
||         MVKH    .S2     _tmp_string,B4    ; |224| 

           STW     .D2T1   A0,*+SP(8)        ; |224| 
||         MV      .S1X    B4,A4             ; |224| 
||         MVKH    .S2     RL46,B3           ; |224| 

RL46:      ; CALL OCCURS                     ; |224| 
           MVKL    .S1     _Report,A0        ; |224| 
           MVKH    .S1     _Report,A0        ; |224| 
           B       .S2X    A0                ; |224| 
           MVKL    .S2     RL48,B3           ; |224| 
           MVKH    .S2     RL48,B3           ; |224| 
           NOP             3
RL48:      ; CALL OCCURS                     ; |224| 
           MVKL    .S1     _WaitTFlagCnt,A0  ; |225| 
           MVKH    .S1     _WaitTFlagCnt,A0  ; |225| 
           B       .S2X    A0                ; |225| 
           MVKL    .S2     RL50,B3           ; |225| 
           MVKH    .S2     RL50,B3           ; |225| 
           MVK     .S1     0x1f4,A4          ; |225| 
           NOP             2
RL50:      ; CALL OCCURS                     ; |225| 
           B       .S1     L17               ; |226| 
           MVKL    .S2     0x200004c,B4      ; |223| 
           MVKH    .S2     0x200004c,B4      ; |223| 
           LDW     .D2T2   *B4,B5            ; |223| 
           NOP             2
           ; BRANCH OCCURS                   ; |226| 


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
