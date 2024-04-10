;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Wed Apr 10 10:37:05 2024                                *
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
	.field  	_timerCheckCnt+0,32
	.field  	0,32			; _timerCheckCnt @ 0
	.sect	".text"
	.global	_timerCheckCnt
_timerCheckCnt:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_R+0,32
	.word	044340000h		; _R @ 0
	.sect	".text"
	.global	_R
_R:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_vel_max+0,32
	.word	044bb8000h		; _vel_max @ 0
	.sect	".text"
	.global	_vel_max
_vel_max:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_accel+0,32
	.word	0461c4000h		; _accel @ 0
	.sect	".text"
	.global	_accel
_accel:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_pos_t+0,32
	.word	000000000h		; _pos_t @ 0
	.sect	".text"
	.global	_pos_t
_pos_t:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_vel_t+0,32
	.word	000000000h		; _vel_t @ 0
	.sect	".text"
	.global	_vel_t
_vel_t:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI7920_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI7920_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
           MVKL    .S1     0x2000084,A0      ; |127| 
           MVKH    .S1     0x2000084,A0      ; |127| 
           STW     .D1T2   B4,*A0            ; |127| 
           LDW     .D2T1   *+SP(4),A4        ; |129| 
           LDW     .D2T2   *++SP(16),B3      ; |130| 
           NOP             4
           B       .S2     B3                ; |130| 
           NOP             5
           ; BRANCH OCCURS                   ; |130| 


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
           MVKL    .S2     0x200020c,B4      ; |138| 
           MVKH    .S2     0x200020c,B4      ; |138| 
           LDW     .D2T2   *B4,B4            ; |138| 
           NOP             4

           EXTU    .S2     B4,16,16,B4       ; |138| 
||         SUB     .D2     SP,16,SP          ; |132| 

           STH     .D2T2   B4,*+SP(4)        ; |138| 
           LDH     .D2T2   *+SP(4),B5        ; |141| 
           LDH     .D2T2   *+SP(4),B6        ; |141| 
           LDH     .D2T2   *+SP(4),B4        ; |142| 
           NOP             2

           MVK     .S1     32767,A3          ; |141| 
||         ZERO    .D1     A0                ; |142| 

           CMPGT   .L1X    B5,A3,A1          ; |141| 
||         MVKH    .S1     0x10000,A0        ; |142| 

   [!A1]   STW     .D2T2   B6,*+SP(8)        ; |141| 
||         SUB     .L2X    B4,A0,B4          ; |142| 

   [ A1]   STW     .D2T2   B4,*+SP(8)        ; |142| 
           LDW     .D2T2   *+SP(8),B4        ; |145| 
           NOP             4
           INTDP   .L2     B4,B5:B4          ; |145| 
           NOP             2
           ZERO    .D1     A1                ; |145| 

           MVKH    .S1     0x3fb80000,A1     ; |145| 
||         ZERO    .D1     A0                ; |145| 

           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |145| 
           NOP             8
           B       .S2     B3                ; |147| 
           DPSP    .L1     A1:A0,A0          ; |145| 
           NOP             3

           ADDK    .S2     16,SP             ; |147| 
||         STW     .D2T1   A0,*+SP(12)       ; |145| 
||         MV      .D1     A0,A4             ; |145| 

           ; BRANCH OCCURS                   ; |147| 


	.sect	".text"
	.global	_GetRefAngleVel

;******************************************************************************
;* FUNCTION NAME: _GetRefAngleVel                                             *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,B10,B11,B12,B13,SP                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,B10,B11,B12,B13,SP                      *
;*   Local Frame Size  : 0 Args + 36 Auto + 20 Save = 56 byte                 *
;******************************************************************************
_GetRefAngleVel:
;** --------------------------------------------------------------------------*
           STW     .D2T2   B13,*SP--(56)     ; |159| 
           STW     .D2T2   B12,*+SP(52)      ; |159| 
           STW     .D2T2   B11,*+SP(48)      ; |159| 
           STW     .D2T2   B10,*+SP(44)      ; |159| 
           STW     .D2T2   B3,*+SP(40)       ; |159| 
           STW     .D2T2   B4,*+SP(8)        ; |159| 

           STW     .D2T1   A4,*+SP(4)        ; |159| 
||         MVKL    .S1     _TINTCnt,A0       ; |174| 
||         MV      .S2X    A6,B5             ; |159| 

           STW     .D2T2   B5,*+SP(12)       ; |159| 
||         MVKH    .S1     _TINTCnt,A0       ; |174| 

           LDW     .D1T1   *A0,A0            ; |174| 
           NOP             4
           INTDPU  .L1     A0,A1:A0          ; |174| 
           MVKL    .S2     0xd2f1a9fc,B4     ; |174| 
           MVKL    .S2     0x3f50624d,B5     ; |174| 
           MVKH    .S2     0xd2f1a9fc,B4     ; |174| 
           MVKH    .S2     0x3f50624d,B5     ; |174| 
           MPYDP   .M1X    B5:B4,A1:A0,A1:A0 ; |174| 
           NOP             6
           MVKL    .S2     __divf,B5         ; |179| 
           MVKH    .S2     __divf,B5         ; |179| 

           B       .S2     B5                ; |179| 
||         LDW     .D2T1   *+SP(8),A4

           DPSP    .L1     A1:A0,A0          ; |174| 
||         LDW     .D2T2   *+SP(12),B4       ; |179| 

           NOP             2
           MVKL    .S2     RL8,B3            ; |179| 

           STW     .D2T1   A0,*+SP(16)       ; |174| 
||         MVKH    .S2     RL8,B3            ; |179| 

RL8:       ; CALL OCCURS                     ; |179| 
           LDW     .D2T2   *+SP(12),B4       ; |180| 
           NOP             4

           SPDP    .S2     B4,B5:B4          ; |180| 
||         ZERO    .D1     A1                ; |180| 

           ZERO    .D1     A0                ; |180| 
||         MVKH    .S1     0x40000000,A1     ; |180| 

           MPYDP   .M2X    B5:B4,A1:A0,B5:B4 ; |180| 
           NOP             1
           LDW     .D2T2   *+SP(8),B6        ; |180| 
           NOP             4

           MVKL    .S1     __divd,A0         ; |180| 
||         MPYSP   .M2     B6,B6,B6

           MVKH    .S1     __divd,A0         ; |180| 
           B       .S2X    A0                ; |180| 
           NOP             1
           SPDP    .S2     B6,B7:B6          ; |180| 
           NOP             1

           MV      .S1X    B7,A5             ; |180| 
||         MVKL    .S2     RL10,B3           ; |180| 

           MV      .S1X    B6,A4             ; |180| 
||         STW     .D2T1   A4,*+SP(20)       ; |179| 
||         MVKH    .S2     RL10,B3           ; |180| 

RL10:      ; CALL OCCURS                     ; |180| 
           MVKL    .S1     __divf,A0         ; |183| 
           MVKH    .S1     __divf,A0         ; |183| 

           B       .S2X    A0                ; |183| 
||         LDW     .D2T2   *+SP(8),B4        ; |183| 

           LDW     .D2T1   *+SP(4),A4
||         DPSP    .L1     A5:A4,A3          ; |180| 

           NOP             2
           MVKL    .S2     RL12,B3           ; |183| 

           STW     .D2T1   A3,*+SP(32)       ; |180| 
||         MVKH    .S2     RL12,B3           ; |183| 

RL12:      ; CALL OCCURS                     ; |183| 
           LDW     .D2T2   *+SP(20),B1       ; |187| 
           NOP             2
           LDW     .D2T2   *+SP(4),B7        ; |184| 
           LDW     .D2T2   *+SP(32),B8       ; |190| 

           LDW     .D2T2   *+SP(16),B1       ; |220| 
||         ADDSP   .L2X    B1,A4,B9
||         MV      .S2     B1,B0             ; |194| 

           NOP             1

           ZERO    .S2     B6                ; |190| 
||         STW     .D2T1   A4,*+SP(24)       ; |183| 

           MVKH    .S2     0x40000000,B6     ; |190| 
||         MV      .D2     B7,B2
||         MV      .S1X    B7,A4

           MPYSP   .M2     B8,B6,B8          ; |190| 
||         SUBSP   .L2     B7,B8,B7

           CMPGTSP .S2     B1,B0,B1          ; |220| 
           MVKL    .S2     RL16,B3           ; |193| 

           MVKH    .S2     RL16,B3           ; |193| 
||         MV      .D2     B2,B6             ; |190| 

           CMPGTSP .S2     B6,B8,B0          ; |190| 
           MVKL    .S2     __divf,B5         ; |193| 
           MVKL    .S2     _sqrt,B13         ; |193| 

   [ B0]   B       .S1     L13               ; |190| 
||         MVKL    .S2     __divf,B11        ; |194| 

           MVKH    .S2     __divf,B5         ; |193| 
           MVKH    .S2     _sqrt,B13         ; |193| 

           MVKH    .S2     __divf,B11        ; |194| 
||         ZERO    .L2     B10               ; |194| 
||         LDW     .D2T2   *+SP(12),B4       ; |193| 

           MVKH    .S2     0x40000000,B10    ; |194| 
||         ZERO    .L2     B12               ; |199| 
||         STW     .D2T2   B7,*+SP(36)       ; |184| 

           STW     .D2T2   B9,*+SP(28)       ; |187| 
||         MVKH    .S2     0x40000000,B12    ; |199| 

           ; BRANCH OCCURS                   ; |190| 
;** --------------------------------------------------------------------------*
           B       .S2     B5                ; |193| 
           NOP             5
RL16:      ; CALL OCCURS                     ; |193| 
           B       .S2     B13               ; |193| 
           MVKL    .S2     RL18,B3           ; |193| 
           NOP             2
           SPDP    .S1     A4,A5:A4          ; |193| 
           MVKH    .S2     RL18,B3           ; |193| 
RL18:      ; CALL OCCURS                     ; |193| 
           B       .S2     B11               ; |194| 

           LDW     .D2T1   *+SP(4),A4
||         DPSP    .L1     A5:A4,A0          ; |193| 

           MV      .L2     B10,B4            ; |194| 
           NOP             1
           MVKL    .S2     RL20,B3           ; |194| 

           MVKH    .S2     RL20,B3           ; |194| 
||         STW     .D2T1   A0,*+SP(20)       ; |193| 

RL20:      ; CALL OCCURS                     ; |194| 
           LDW     .D2T2   *+SP(12),B6       ; |196| 
           LDW     .D2T2   *+SP(20),B5       ; |199| 
           LDW     .D2T2   *+SP(16),B4       ; |202| 
           MVKL    .S1     _pos_t,A3         ; |204| 
           STW     .D2T1   A4,*+SP(32)       ; |194| 
           MVKH    .S1     _pos_t,A3         ; |204| 

           MV      .D2     B5,B7             ; |202| 
||         MV      .S2     B6,B9             ; |202| 

           MV      .D2     B5,B2             ; |202| 
||         MPYSP   .M2     B5,B6,B6
||         CMPGTSP .S2     B4,B7,B0          ; |202| 

   [ B0]   B       .S1     L9                ; |202| 
||         MPYSP   .M2     B5,B12,B5         ; |199| 

           MV      .S1X    B4,A5
           MPYSP   .M1X    A5,B9,A4          ; |203| 
           MV      .D2     B4,B1

           CMPLTSP .S2     B2,B1,B1          ; |207| 
||         MVKL    .S1     _vel_t,A0         ; |203| 
||         ZERO    .L2     B3                ; |204| 
||         STW     .D2T2   B5,*+SP(24)       ; |199| 

           MVKH    .S1     _vel_t,A0         ; |203| 
||         MVKH    .S2     0x3fe00000,B3     ; |204| 
||         STW     .D2T2   B6,*+SP(8)        ; |196| 
||         ZERO    .L2     B2                ; |204| 

           ; BRANCH OCCURS                   ; |202| 
;** --------------------------------------------------------------------------*
           STW     .D1T1   A4,*A0            ; |203| 
           LDW     .D2T2   *+SP(12),B4       ; |204| 
           NOP             4
           SPDP    .S2     B4,B5:B4          ; |204| 
           NOP             1
           MPYDP   .M2     B5:B4,B3:B2,B5:B4 ; |204| 
           NOP             2
           LDW     .D2T2   *+SP(16),B6       ; |204| 
           NOP             4
           SPDP    .S1X    B6,A1:A0          ; |204| 
           NOP             1
           MPYDP   .M1X    A1:A0,B5:B4,A1:A0 ; |204| 
           NOP             6
           MV      .D2     B6,B4             ; |204| 
           SPDP    .S2     B4,B5:B4          ; |204| 
           NOP             1
           MPYDP   .M1X    B5:B4,A1:A0,A1:A0 ; |204| 
           NOP             8
           B       .S1     L17               ; |205| 
           DPSP    .L1     A1:A0,A0          ; |204| 
           NOP             3
           STW     .D1T1   A0,*A3            ; |204| 
           ; BRANCH OCCURS                   ; |205| 
;** --------------------------------------------------------------------------*
L9:    
           MV      .D2     B7,B4

           SUBSP   .L2X    A5,B4,B9
||         MV      .D2     B9,B8

           MV      .S2X    A5,B7
           CMPGTSP .S2     B7,B5,B5          ; |207| 

           XOR     .S2     1,B5,B5           ; |207| 
||         LDW     .D2T1   *+SP(8),A4        ; |208| 

           MPYSP   .M2     B9,B8,B7          ; |208| 
|| [!B1]   MV      .D2     B1,B5             ; |207| 

           MV      .S1X    B5,A1             ; |207| 
   [!A1]   B       .S1     L12               ; |207| 
           MVKL    .S2     _pos_t,B6         ; |209| 

           SUBSP   .L1X    A4,B7,A4          ; |208| 
||         MVKL    .S2     _pos_t,B4         ; |213| 
||         MVKL    .S1     _vel_t,A3         ; |208| 

           MVKH    .S2     _pos_t,B6         ; |209| 
||         MVKL    .S1     _vel_t,A0         ; |212| 

           MVKH    .S2     _pos_t,B4         ; |213| 
||         ZERO    .D2     B1                ; |209| 
||         MVKH    .S1     _vel_t,A3         ; |208| 

           MVKH    .S2     0x3fe00000,B1     ; |209| 
||         ZERO    .D1     A5                ; |212| 
||         MVKH    .S1     _vel_t,A0         ; |212| 
||         ZERO    .D2     B0                ; |209| 

           ; BRANCH OCCURS                   ; |207| 
;** --------------------------------------------------------------------------*
           STW     .D1T1   A4,*A3            ; |208| 
           LDW     .D2T2   *+SP(12),B4       ; |209| 
           NOP             4

           LDW     .D2T2   *+SP(20),B8       ; |209| 
||         SPDP    .S2     B4,B5:B4          ; |209| 

           LDW     .D2T2   *+SP(16),B7       ; |209| 
           MPYDP   .M2     B5:B4,B1:B0,B1:B0 ; |209| 
           NOP             3
           SUBSP   .L2     B7,B8,B4          ; |209| 
           NOP             3
           SPDP    .S2     B4,B5:B4          ; |209| 
           NOP             1

           MPYDP   .M2     B5:B4,B1:B0,B9:B8 ; |209| 
||         MV      .D2     B8,B2             ; |209| 

           NOP             3

           LDW     .D2T2   *+SP(8),B0        ; |209| 
||         SUBSP   .L2     B7,B2,B5

           SUBSP   .L2     B7,B2,B7
           NOP             2
           SPDP    .S2     B5,B5:B4          ; |209| 

           LDW     .D2T2   *+SP(32),B0       ; |209| 
||         MPYSP   .M2     B7,B0,B7          ; |209| 

           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |209| 
           NOP             3
;** --------------------------------------------------------------------------*
L10:    
           ADDSP   .L2     B7,B0,B7          ; |209| 
           NOP             3
           SPDP    .S2     B7,B9:B8          ; |209| 
           NOP             1
           SUBDP   .L2     B9:B8,B5:B4,B5:B4 ; |209| 
           NOP             5
;** --------------------------------------------------------------------------*
L11:    
           B       .S1     L17               ; |210| 
           DPSP    .L2     B5:B4,B4          ; |209| 
           NOP             3
           STW     .D2T2   B4,*B6            ; |209| 
           ; BRANCH OCCURS                   ; |210| 
;** --------------------------------------------------------------------------*
L12:    
           B       .S1     L16               ; |215| 
           STW     .D1T1   A5,*A0            ; |212| 
           LDW     .D2T2   *+SP(4),B5        ; |236| 
           NOP             3
           ; BRANCH OCCURS                   ; |215| 
;** --------------------------------------------------------------------------*
L13:    
           LDW     .D2T1   *+SP(16),A3       ; |221| 
           NOP             4

           MPYSP   .M1X    A3,B4,A3          ; |221| 
||         MV      .S2X    A3,B7             ; |225| 
||         LDW     .D2T2   *+SP(20),B8       ; |225| 

           NOP             1
           MVKL    .S1     _vel_t,A0         ; |221| 
           MVKH    .S1     _vel_t,A0         ; |221| 
   [!B1]   STW     .D1T1   A3,*A0            ; |221| 

   [!B1]   LDW     .D2T2   *+SP(12),B7       ; |222| 
||         CMPLTSP .S2     B8,B7,B0          ; |225| 

           NOP             4
   [!B1]   SPDP    .S2     B7,B9:B8          ; |222| 
           ZERO    .D2     B5                ; |222| 

           ZERO    .D2     B4                ; |222| 
||         MVKH    .S2     0x3fe00000,B5     ; |222| 

   [!B1]   MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |222| 
           NOP             1
   [!B1]   LDW     .D2T2   *+SP(16),B7       ; |222| 
           NOP             4
   [!B1]   MPYSP   .M2     B7,B7,B7
           NOP             3
   [!B1]   SPDP    .S2     B7,B9:B8          ; |222| 
           NOP             1
   [!B1]   MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |222| 
           NOP             2
   [!B1]   B       .S1     L11               ; |223| 
           NOP             3
           MVKL    .S2     _pos_t,B6         ; |222| 
           MVKH    .S2     _pos_t,B6         ; |222| 
           ; BRANCH OCCURS                   ; |223| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(24),B4       ; |225| 
           MV      .D2     B7,B5
           MV      .S2     B7,B6
           LDW     .D2T2   *+SP(24),B7       ; |230| 
           LDW     .D2T1   *+SP(8),A3        ; |226| 
           CMPGTSP .S2     B5,B4,B4          ; |225| 
           XOR     .S2     1,B4,B4           ; |225| 
   [!B0]   MV      .D2     B0,B4             ; |225| 
           MV      .S1X    B4,A1             ; |225| 
   [!A1]   B       .S1     L14               ; |225| 
           MVKL    .S2     _pos_t,B5         ; |227| 
           MVKH    .S2     _pos_t,B5         ; |227| 
           MVKL    .S1     _vel_t,A0         ; |226| 
           CMPLTSP .S2     B7,B6,B0          ; |230| 

           MVKH    .S1     _vel_t,A0         ; |226| 
|| [!A1]   LDW     .D2T2   *+SP(12),B8       ; |231| 
|| [!A1]   MV      .L2     B7,B4

           ; BRANCH OCCURS                   ; |225| 
;** --------------------------------------------------------------------------*
           STW     .D1T1   A3,*A0            ; |226| 
           LDW     .D2T2   *+SP(20),B4       ; |227| 
           LDW     .D2T2   *+SP(16),B7       ; |227| 
           LDW     .D2T2   *+SP(8),B6        ; |227| 
           NOP             3
           SUBSP   .L2     B7,B4,B7          ; |227| 
           LDW     .D2T2   *+SP(32),B4       ; |227| 
           NOP             2
           MPYSP   .M2     B7,B6,B6          ; |227| 
           NOP             2
           B       .S1     L17               ; |228| 
           ADDSP   .L2     B6,B4,B4          ; |227| 
           NOP             3
           STW     .D2T2   B4,*B5            ; |227| 
           ; BRANCH OCCURS                   ; |228| 
;** --------------------------------------------------------------------------*
L14:    

           SUBSP   .L2     B6,B4,B9          ; |231| 
||         MV      .D2     B9,B7

           MV      .D2     B6,B5
           CMPGTSP .S2     B5,B7,B5          ; |230| 
           XOR     .S2     1,B5,B5           ; |230| 

           MPYSP   .M2     B9,B8,B7          ; |231| 
|| [!B0]   MV      .D2     B0,B5             ; |230| 

           MV      .S1X    B5,A1             ; |230| 
   [!A1]   B       .S1     L15               ; |230| 

           MVKL    .S2     _pos_t,B6         ; |232| 
||         MV      .D1     A3,A0             ; |230| 

           SUBSP   .L1X    A0,B7,A5          ; |231| 
||         MVKL    .S2     _pos_t,B4         ; |236| 
||         MVKL    .S1     _vel_t,A4         ; |231| 

           MVKH    .S2     _pos_t,B6         ; |232| 
||         MVKL    .S1     _vel_t,A3         ; |235| 

           ZERO    .D2     B9                ; |232| 
||         MVKH    .S2     _pos_t,B4         ; |236| 
||         MVKH    .S1     _vel_t,A4         ; |231| 

           MVKH    .S2     0x3fe00000,B9     ; |232| 
||         ZERO    .D1     A0                ; |235| 
||         ZERO    .D2     B8                ; |232| 
||         MVKH    .S1     _vel_t,A3         ; |235| 

           ; BRANCH OCCURS                   ; |230| 
;** --------------------------------------------------------------------------*
           STW     .D1T1   A5,*A4            ; |231| 
           LDW     .D2T2   *+SP(12),B4       ; |232| 
           NOP             4

           LDW     .D2T2   *+SP(24),B0       ; |232| 
||         SPDP    .S2     B4,B5:B4          ; |232| 

           LDW     .D2T2   *+SP(16),B7       ; |232| 
           MPYDP   .M2     B5:B4,B9:B8,B9:B8 ; |232| 
           NOP             3
           SUBSP   .L2     B7,B0,B4          ; |232| 
           NOP             3
           SPDP    .S2     B4,B5:B4          ; |232| 
           NOP             1
           MPYDP   .M2     B5:B4,B9:B8,B5:B4 ; |232| 
           NOP             2
           SUBSP   .L2     B7,B0,B1
           SUBSP   .L2     B7,B0,B7          ; |232| 
           NOP             3
           SPDP    .S2     B7,B9:B8          ; |232| 
           NOP             1
           MPYDP   .M2     B9:B8,B5:B4,B5:B4 ; |232| 
           NOP             1
           LDW     .D2T2   *+SP(8),B0        ; |232| 
           NOP             3
           B       .S1     L10               ; |233| 

           LDW     .D2T2   *+SP(36),B0       ; |232| 
||         MPYSP   .M2     B1,B0,B7          ; |232| 

           NOP             4
           ; BRANCH OCCURS                   ; |233| 
;** --------------------------------------------------------------------------*
L15:    
           STW     .D1T1   A0,*A3            ; |235| 
           LDW     .D2T2   *+SP(4),B5        ; |236| 
           NOP             3
;** --------------------------------------------------------------------------*
L16:    
           NOP             1
           STW     .D2T2   B5,*B4            ; |236| 
;** --------------------------------------------------------------------------*
L17:    
           LDW     .D2T2   *+SP(40),B3       ; |239| 
           LDW     .D2T2   *+SP(48),B11      ; |239| 
           LDW     .D2T2   *+SP(44),B10      ; |239| 
           LDW     .D2T2   *+SP(52),B12      ; |239| 
           LDW     .D2T2   *++SP(56),B13     ; |239| 
           B       .S2     B3                ; |239| 
           NOP             5
           ; BRANCH OCCURS                   ; |239| 


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
           MVKL    .S1     _InitEXINTF,A0    ; |243| 
           MVKH    .S1     _InitEXINTF,A0    ; |243| 
           B       .S2X    A0                ; |243| 
           STW     .D2T2   B3,*SP--(24)      ; |242| 
           MVKL    .S2     RL24,B3           ; |243| 
           MVKH    .S2     RL24,B3           ; |243| 
           NOP             2
RL24:      ; CALL OCCURS                     ; |243| 
           MVKL    .S1     _InitTimer,A0     ; |244| 
           MVKH    .S1     _InitTimer,A0     ; |244| 
           B       .S2X    A0                ; |244| 
           MVKL    .S2     RL26,B3           ; |244| 
           MVKH    .S2     RL26,B3           ; |244| 
           NOP             3
RL26:      ; CALL OCCURS                     ; |244| 
           MVKL    .S2     _InitUART,B4      ; |245| 
           MVKH    .S2     _InitUART,B4      ; |245| 
           B       .S2     B4                ; |245| 
           MVKL    .S2     RL28,B3           ; |245| 
           MVKH    .S2     RL28,B3           ; |245| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |245| 
           MVKL    .S1     _InitINT,A0       ; |246| 
           MVKH    .S1     _InitINT,A0       ; |246| 
           B       .S2X    A0                ; |246| 
           MVKL    .S2     RL30,B3           ; |246| 
           MVKH    .S2     RL30,B3           ; |246| 
           NOP             3
RL30:      ; CALL OCCURS                     ; |246| 
           MVKL    .S1     _InitUSBMon,A0    ; |247| 
           MVKH    .S1     _InitUSBMon,A0    ; |247| 
           B       .S2X    A0                ; |247| 
           MVKL    .S2     RL32,B3           ; |247| 
           MVKH    .S2     RL32,B3           ; |247| 
           NOP             3
RL32:      ; CALL OCCURS                     ; |247| 
           MVKL    .S1     _sprintf,A0       ; |249| 

           MVKH    .S1     _sprintf,A0       ; |249| 
||         MVKL    .S2     SL1+0,B5          ; |249| 

           B       .S2X    A0                ; |249| 
           MVKL    .S2     RL34,B3           ; |249| 
           MVKH    .S2     SL1+0,B5          ; |249| 
           MVKL    .S2     _tmp_string,B4    ; |249| 
           MVKH    .S2     _tmp_string,B4    ; |249| 

           MVKH    .S2     RL34,B3           ; |249| 
||         STW     .D2T2   B5,*+SP(4)        ; |249| 
||         MV      .S1X    B4,A4             ; |249| 

RL34:      ; CALL OCCURS                     ; |249| 
           MVKL    .S1     _Report,A0        ; |249| 
           MVKH    .S1     _Report,A0        ; |249| 
           B       .S2X    A0                ; |249| 
           MVKL    .S2     RL36,B3           ; |249| 
           MVKH    .S2     RL36,B3           ; |249| 
           NOP             3
RL36:      ; CALL OCCURS                     ; |249| 
           MVK     .S1     2024,A0           ; |250| 

           MVKL    .S1     _sprintf,A0       ; |250| 
||         STW     .D2T1   A0,*+SP(8)        ; |250| 

           MVKH    .S1     _sprintf,A0       ; |250| 
||         MVKL    .S2     _tmp_string,B5    ; |250| 

           B       .S2X    A0                ; |250| 
           MVKL    .S2     SL2+0,B4          ; |250| 
           MVKH    .S2     _tmp_string,B5    ; |250| 
           MVKH    .S2     SL2+0,B4          ; |250| 
           MVKL    .S2     RL38,B3           ; |250| 

           MVKH    .S2     RL38,B3           ; |250| 
||         STW     .D2T2   B4,*+SP(4)        ; |250| 
||         MV      .S1X    B5,A4             ; |250| 

RL38:      ; CALL OCCURS                     ; |250| 
           MVKL    .S1     _Report,A0        ; |250| 
           MVKH    .S1     _Report,A0        ; |250| 
           B       .S2X    A0                ; |250| 
           MVKL    .S2     RL40,B3           ; |250| 
           MVKH    .S2     RL40,B3           ; |250| 
           NOP             3
RL40:      ; CALL OCCURS                     ; |250| 
           MVKL    .S2     SL3+0,B5          ; |251| 
           MVKH    .S2     SL3+0,B5          ; |251| 
           MVKL    .S2     0x20003fc,B4      ; |251| 

           STW     .D2T2   B5,*+SP(4)        ; |251| 
||         MVKH    .S2     0x20003fc,B4      ; |251| 

           LDW     .D2T2   *B4,B4            ; |251| 
           MVKL    .S1     0x20003fc,A0      ; |251| 
           MVKH    .S1     0x20003fc,A0      ; |251| 
           MVKL    .S1     _tmp_string,A4    ; |251| 
           MVKL    .S2     RL42,B3           ; |251| 
           EXTU    .S2     B4,16,24,B4       ; |251| 
           STW     .D2T2   B4,*+SP(8)        ; |251| 

           MVKL    .S1     _sprintf,A0       ; |251| 
||         LDW     .D1T1   *A0,A3            ; |251| 

           MVKH    .S1     _sprintf,A0       ; |251| 
           B       .S2X    A0                ; |251| 
           MVKH    .S1     _tmp_string,A4    ; |251| 
           MVKH    .S2     RL42,B3           ; |251| 
           EXTU    .S1     A3,24,24,A3       ; |251| 
           STW     .D2T1   A3,*+SP(12)       ; |251| 
           NOP             1
RL42:      ; CALL OCCURS                     ; |251| 
           MVKL    .S1     _Report,A0        ; |251| 
           MVKH    .S1     _Report,A0        ; |251| 
           B       .S2X    A0                ; |251| 
           MVKL    .S2     RL44,B3           ; |251| 
           MVKH    .S2     RL44,B3           ; |251| 
           NOP             3
RL44:      ; CALL OCCURS                     ; |251| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |255| 
           MVKH    .S1     _GIE,A0           ; |255| 
           B       .S2X    A0                ; |255| 
           MVKL    .S2     _TFlag,B4         ; |253| 
           MVKL    .S2     RL46,B3           ; |255| 
           MVKH    .S2     _TFlag,B4         ; |253| 
           ZERO    .D2     B5                ; |253| 

           STW     .D2T2   B5,*B4            ; |253| 
||         MVKH    .S2     RL46,B3           ; |255| 

RL46:      ; CALL OCCURS                     ; |255| 
           MVKL    .S2     _WaitTFlagCnt,B7  ; |262| 
           MVKL    .S2     0x200008c,B6      ; |259| 
           MVKH    .S2     _WaitTFlagCnt,B7  ; |262| 
           MVKH    .S2     0x200008c,B6      ; |259| 
           MVKL    .S2     0x200004c,B5      ; |257| 
           B       .S2     B7                ; |262| 
           MVKH    .S2     0x200004c,B5      ; |257| 

           MVKL    .S2     0x2000080,B4      ; |258| 
||         MVK     .S1     1,A0              ; |257| 

           STW     .D2T1   A0,*B5            ; |257| 
||         MVKH    .S2     0x2000080,B4      ; |258| 

           STW     .D2T1   A0,*B4            ; |258| 
||         MVKL    .S2     RL48,B3           ; |262| 

           STW     .D2T1   A0,*B6            ; |259| 
||         MVKH    .S2     RL48,B3           ; |262| 
||         MVK     .S1     0x3e8,A4          ; |262| 

RL48:      ; CALL OCCURS                     ; |262| 
           MVKL    .S1     _TINTCnt,A0       ; |264| 

           MVKH    .S1     _TINTCnt,A0       ; |264| 
||         ZERO    .D1     A3                ; |264| 

           STW     .D1T1   A3,*A0            ; |264| 
           MVKL    .S1     0x200004c,A3      ; |267| 
           MVKH    .S1     0x200004c,A3      ; |267| 
           LDW     .D1T1   *A3,A0            ; |267| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L18:    
           MVKL    .S2     _GetRefAngleVel,B5 ; |268| 
           MVKL    .S2     _vel_max,B4       ; |268| 
           MVKL    .S1     _accel,A4         ; |268| 
           MVKH    .S1     _accel,A4         ; |268| 

           XOR     .L1     1,A0,A5           ; |267| 
||         MVKH    .S2     _GetRefAngleVel,B5 ; |268| 

           STW     .D1T1   A5,*A3            ; |267| 
||         MVKL    .S1     _R,A0             ; |268| 
||         MVKH    .S2     _vel_max,B4       ; |268| 

           B       .S2     B5                ; |268| 
||         LDW     .D1T1   *A4,A6            ; |268| 
||         MVKH    .S1     _R,A0             ; |268| 

           LDW     .D1T1   *A0,A4            ; |268| 
||         LDW     .D2T2   *B4,B4            ; |268| 

           MVKL    .S2     RL50,B3           ; |268| 
           MVKH    .S2     RL50,B3           ; |268| 
           NOP             2
RL50:      ; CALL OCCURS                     ; |268| 
           MVKL    .S2     _TINTCnt,B4       ; |271| 
           MVKH    .S2     _TINTCnt,B4       ; |271| 
           LDW     .D2T2   *B4,B4            ; |271| 
           MVK     .S2     2000,B5           ; |271| 
           NOP             3
           CMPGTU  .L2     B4,B5,B0          ; |271| 
   [!B0]   B       .S1     L18               ; |271| 
           NOP             2
   [!B0]   MVKL    .S1     0x200004c,A3      ; |267| 
   [!B0]   MVKH    .S1     0x200004c,A3      ; |267| 
   [!B0]   LDW     .D1T1   *A3,A0            ; |267| 
           ; BRANCH OCCURS                   ; |271| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _timerCheckCnt,A0 ; |273| 
           MVKH    .S1     _timerCheckCnt,A0 ; |273| 
           LDW     .D1T1   *A0,A3            ; |273| 
           MVKL    .S2     SL4+0,B4          ; |274| 
           MVKH    .S2     SL4+0,B4          ; |274| 
           MVKL    .S2     RL52,B3           ; |274| 
           MVKH    .S2     RL52,B3           ; |274| 
           ADD     .D1     1,A3,A3           ; |273| 

           MVKL    .S1     _timerCheckCnt,A0 ; |274| 
||         STW     .D1T1   A3,*A0            ; |273| 

           STW     .D2T2   B4,*+SP(4)        ; |274| 
||         MVKH    .S1     _timerCheckCnt,A0 ; |274| 

           MVKL    .S1     _sprintf,A0       ; |274| 
||         LDW     .D1T1   *A0,A3            ; |274| 

           MVKH    .S1     _sprintf,A0       ; |274| 
           B       .S2X    A0                ; |274| 
           NOP             2
           MVKL    .S2     _tmp_string,B4    ; |274| 
           MVKH    .S2     _tmp_string,B4    ; |274| 

           STW     .D2T1   A3,*+SP(8)        ; |274| 
||         MV      .S1X    B4,A4             ; |274| 

RL52:      ; CALL OCCURS                     ; |274| 
           MVKL    .S1     _Report,A0        ; |274| 
           MVKH    .S1     _Report,A0        ; |274| 
           B       .S2X    A0                ; |274| 
           MVKL    .S2     RL54,B3           ; |274| 
           MVKH    .S2     RL54,B3           ; |274| 
           NOP             3
RL54:      ; CALL OCCURS                     ; |274| 
           MVKL    .S1     _GetAngle,A0      ; |276| 
           MVKH    .S1     _GetAngle,A0      ; |276| 
           B       .S2X    A0                ; |276| 
           MVKL    .S2     RL58,B3           ; |276| 
           MVKH    .S2     RL58,B3           ; |276| 
           NOP             3
RL58:      ; CALL OCCURS                     ; |276| 

           MVKL    .S1     _sprintf,A0       ; |276| 
||         SPDP    .S2X    A4,B7:B6          ; |276| 

           MVKH    .S1     _sprintf,A0       ; |276| 
           B       .S2X    A0                ; |276| 
           MVKL    .S2     SL5+0,B8          ; |276| 
           MVKH    .S2     SL5+0,B8          ; |276| 

           MV      .S2     B6,B5             ; |276| 
||         STW     .D2T2   B8,*+SP(4)        ; |276| 

           MVKL    .S2     RL60,B3           ; |276| 
||         MVKL    .S1     _tmp_string,A4    ; |276| 
||         MV      .L2     B7,B4             ; |276| 
||         STW     .D2T2   B5,*+SP(8)        ; |276| 

           MVKH    .S2     RL60,B3           ; |276| 
||         MVKH    .S1     _tmp_string,A4    ; |276| 
||         STW     .D2T2   B4,*+SP(12)       ; |276| 

RL60:      ; CALL OCCURS                     ; |276| 
           MVKL    .S1     _Report,A0        ; |276| 
           MVKH    .S1     _Report,A0        ; |276| 
           B       .S2X    A0                ; |276| 
           MVKL    .S2     RL62,B3           ; |276| 
           MVKH    .S2     RL62,B3           ; |276| 
           NOP             3
RL62:      ; CALL OCCURS                     ; |276| 
           MVKL    .S2     SL6+0,B4          ; |278| 
           MVKL    .S2     0x200020c,B5      ; |278| 
           MVKH    .S2     SL6+0,B4          ; |278| 

           MVKH    .S2     0x200020c,B5      ; |278| 
||         STW     .D2T2   B4,*+SP(4)        ; |278| 

           LDW     .D2T2   *B5,B5            ; |278| 
           MVKL    .S1     _sprintf,A0       ; |278| 
           MVKH    .S1     _sprintf,A0       ; |278| 
           B       .S2X    A0                ; |278| 
           MVKL    .S2     _tmp_string,B4    ; |278| 
           EXTU    .S2     B5,16,16,B5       ; |278| 
           MVKH    .S2     _tmp_string,B4    ; |278| 
           MVKL    .S2     RL64,B3           ; |278| 

           MVKH    .S2     RL64,B3           ; |278| 
||         STW     .D2T2   B5,*+SP(8)        ; |278| 
||         MV      .S1X    B4,A4             ; |278| 

RL64:      ; CALL OCCURS                     ; |278| 
           MVKL    .S1     _Report,A0        ; |278| 
           MVKH    .S1     _Report,A0        ; |278| 
           B       .S2X    A0                ; |278| 
           MVKL    .S2     RL66,B3           ; |278| 
           MVKH    .S2     RL66,B3           ; |278| 
           NOP             3
RL66:      ; CALL OCCURS                     ; |278| 
           MVKL    .S1     _sprintf,A0       ; |280| 
           MVKH    .S1     _sprintf,A0       ; |280| 
           B       .S2X    A0                ; |280| 
           MVKL    .S2     SL7+0,B4          ; |280| 
           MVKH    .S2     SL7+0,B4          ; |280| 
           MVKL    .S2     RL68,B3           ; |280| 
           MVKL    .S1     _tmp_string,A4    ; |280| 

           MVKH    .S2     RL68,B3           ; |280| 
||         STW     .D2T2   B4,*+SP(4)        ; |280| 
||         MVKH    .S1     _tmp_string,A4    ; |280| 

RL68:      ; CALL OCCURS                     ; |280| 
           MVKL    .S2     _Report,B4        ; |280| 
           MVKH    .S2     _Report,B4        ; |280| 
           B       .S2     B4                ; |280| 
           MVKL    .S2     RL70,B3           ; |280| 
           MVKH    .S2     RL70,B3           ; |280| 
           NOP             3
RL70:      ; CALL OCCURS                     ; |280| 
           B       .S1     L18               ; |285| 
           MVKL    .S1     _TINTCnt,A0       ; |281| 

           ZERO    .D2     B4                ; |281| 
||         MVKH    .S1     _TINTCnt,A0       ; |281| 

           STW     .D1T2   B4,*A0            ; |281| 
||         MVKL    .S1     0x200004c,A3      ; |267| 

           MVKH    .S1     0x200004c,A3      ; |267| 
           LDW     .D1T1   *A3,A0            ; |267| 
           ; BRANCH OCCURS                   ; |285| 


;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
SL1:	.string	13,10,13,10,0
SL2:	.string	"Mechatronics Course %d",13,10,0
SL3:	.string	"FPGA Ver%2x.%02x",13,10,0
SL4:	.string	"==== Timer Check: %d ====",13,10,0
SL5:	.string	"current pos: %6.2f ",13,10,0
SL6:	.string	"Encoder bit: 0x%04x ",13,10,0
SL7:	.string	13,10,0
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
