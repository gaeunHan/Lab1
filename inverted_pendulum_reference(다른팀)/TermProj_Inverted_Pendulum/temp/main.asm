;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Wed Jun 05 12:28:29 2024                                *
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


	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_con_input_d+0,32
	.word	000000000h		; _con_input_d @ 0
	.sect	".text"
	.global	_con_input_d
_con_input_d:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_con_input+0,32
	.word	000000000h		; _con_input @ 0
	.sect	".text"
	.global	_con_input
_con_input:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_angle_d+0,32
	.word	000000000h		; _angle_d @ 0
	.sect	".text"
	.global	_angle_d
_angle_d:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_angle+0,32
	.word	000000000h		; _angle @ 0
	.sect	".text"
	.global	_angle
_angle:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_error+0,32
	.word	000000000h		; _error @ 0
	.sect	".text"
	.global	_error
_error:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_error_d+0,32
	.word	000000000h		; _error_d @ 0
	.sect	".text"
	.global	_error_d
_error_d:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_state+0,32
	.field  	0,32			; _state @ 0
	.sect	".text"
	.global	_state
_state:	.usect	.far,4,4
	.global	_t
_t:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_startFlag+0,32
	.field  	0,32			; _startFlag @ 0
	.sect	".text"
	.global	_startFlag
_startFlag:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_i+0,32
	.field  	0,32			; _i @ 0
	.sect	".text"
	.global	_i
_i:	.usect	.far,4,4
	.global	_TINTCnt
_TINTCnt:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\user\AppData\Local\Temp\TI864_2 --template_info_file C:\Users\user\AppData\Local\Temp\TI864_3 --object_file main.obj --opt_shell 9 main.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 main.c 
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
;*   Regs Modified     : A0,A3,B0,B1,B4,B5,B6,SP                              *
;*   Regs Used         : A0,A3,A4,B0,B1,B3,B4,B5,B6,SP                        *
;*   Local Frame Size  : 0 Args + 4 Auto + 0 Save = 4 byte                    *
;******************************************************************************
_PWMOut:
;** --------------------------------------------------------------------------*
           ZERO    .D2     B4                ; |108| 

           MVKH    .S2     0x42440000,B4     ; |108| 
||         MV      .L2X    A4,B5             ; |107| 

           CMPGTSP .S2     B5,B4,B0          ; |108| 
   [ B0]   B       .S1     L9                ; |108| 
           ZERO    .D1     A3                ; |109| 

           MVKH    .S1     0xc2440000,A3     ; |109| 
||         SUB     .D2     SP,8,SP           ; |107| 
||         ZERO    .D1     A0                ; |108| 

           MVKH    .S1     0x42440000,A0     ; |108| 
||         STW     .D2T1   A4,*+SP(4)        ; |107| 
||         MV      .S2X    A4,B6             ; |107| 

   [ B0]   STW     .D2T1   A0,*+SP(4)        ; |108| 
||         CMPLTSP .S2X    B6,A3,B1          ; |109| 
|| [!B0]   MVKL    .S1     0x2000088,A0      ; |109| 

   [!B0]   MVKH    .S1     0x2000088,A0      ; |109| 
|| [!B0]   ZERO    .D1     A3                ; |109| 
|| [ B0]   LDW     .D2T2   *+SP(4),B4        ; |111| 

           ; BRANCH OCCURS                   ; |108| 
;** --------------------------------------------------------------------------*
   [ B1]   STW     .D1T1   A3,*A0            ; |109| 
           LDW     .D2T2   *+SP(4),B4        ; |111| 
;** --------------------------------------------------------------------------*
L9:    
           ZERO    .D1     A0                ; |111| 
           MVKH    .S1     0x42480000,A0     ; |111| 
           ADD     .D2     8,SP,SP           ; |112| 
           NOP             1
           ADDSP   .L2X    A0,B4,B5          ; |111| 
           MVKL    .S2     0x4223cccd,B4     ; |111| 
           MVKH    .S2     0x4223cccd,B4     ; |111| 
           MVKL    .S1     0x2000088,A0      ; |111| 
           MPYSP   .M2     B4,B5,B4          ; |111| 
           MVKH    .S1     0x2000088,A0      ; |111| 
           NOP             1
           B       .S2     B3                ; |112| 
           SPTRUNC .L2     B4,B4             ; |111| 
           NOP             3
           STW     .D1T2   B4,*A0            ; |111| 
           ; BRANCH OCCURS                   ; |112| 


	.sect	".text"
	.global	_GetAngle

;******************************************************************************
;* FUNCTION NAME: _GetAngle                                                   *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 8 Auto + 4 Save = 12 byte                   *
;******************************************************************************
_GetAngle:
;** --------------------------------------------------------------------------*

           ZERO    .D1     A3                ; |115| 
||         MVKL    .S1     0x200020c,A0      ; |118| 
||         STW     .D2T2   B3,*SP--(16)      ; |114| 

           STW     .D2T1   A3,*+SP(4)        ; |115| 
||         MVKH    .S1     0x200020c,A0      ; |118| 

           LDW     .D1T1   *A0,A0            ; |118| 
           MVKL    .S2     __divf,B5         ; |119| 
           NOP             3
           EXTU    .S1     A0,16,16,A0       ; |118| 
           STH     .D2T1   A0,*+SP(8)        ; |118| 
           LDH     .D2T2   *+SP(8),B4        ; |119| 
           ZERO    .D1     A0                ; |119| 
           NOP             3
           INTSP   .L2     B4,B6             ; |119| 
           MVKH    .S2     __divf,B5         ; |119| 
           B       .S2     B5                ; |119| 
           MVKH    .S1     0x43b40000,A0     ; |119| 
           MPYSP   .M1X    A0,B6,A4          ; |119| 
           MVKL    .S2     RL4,B3            ; |119| 

           ZERO    .D2     B4                ; |119| 
||         MVKH    .S2     RL4,B3            ; |119| 

           MVKH    .S2     0x44800000,B4     ; |119| 
RL4:       ; CALL OCCURS                     ; |119| 
           STW     .D2T1   A4,*+SP(4)        ; |119| 
           LDW     .D2T2   *++SP(16),B3      ; |122| 
           NOP             4
           B       .S2     B3                ; |122| 
           NOP             5
           ; BRANCH OCCURS                   ; |122| 


	.sect	".text"
	.global	_GetAngleDist

;******************************************************************************
;* FUNCTION NAME: _GetAngleDist                                               *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 8 Auto + 4 Save = 12 byte                   *
;******************************************************************************
_GetAngleDist:
;** --------------------------------------------------------------------------*

           ZERO    .D1     A3                ; |125| 
||         MVKL    .S1     0x2000210,A0      ; |128| 
||         STW     .D2T2   B3,*SP--(16)      ; |124| 

           STW     .D2T1   A3,*+SP(4)        ; |125| 
||         MVKH    .S1     0x2000210,A0      ; |128| 

           LDW     .D1T1   *A0,A0            ; |128| 
           MVKL    .S2     __divf,B5         ; |129| 
           NOP             3
           EXTU    .S1     A0,16,16,A0       ; |128| 
           STH     .D2T1   A0,*+SP(8)        ; |128| 
           LDH     .D2T2   *+SP(8),B4        ; |129| 
           ZERO    .D1     A0                ; |129| 
           NOP             3
           INTSP   .L2     B4,B6             ; |129| 
           MVKH    .S2     __divf,B5         ; |129| 
           B       .S2     B5                ; |129| 
           MVKH    .S1     0x43b40000,A0     ; |129| 
           MPYSP   .M1X    A0,B6,A4          ; |129| 
           MVKL    .S2     RL6,B3            ; |129| 

           ZERO    .D2     B4                ; |129| 
||         MVKH    .S2     RL6,B3            ; |129| 

           MVKH    .S2     0x44800000,B4     ; |129| 
RL6:       ; CALL OCCURS                     ; |129| 
           STW     .D2T1   A4,*+SP(4)        ; |129| 
           LDW     .D2T2   *++SP(16),B3      ; |132| 
           NOP             4
           B       .S2     B3                ; |132| 
           NOP             5
           ; BRANCH OCCURS                   ; |132| 


	.sect	".text"
	.global	_main

;******************************************************************************
;* FUNCTION NAME: _main                                                       *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 24 Args + 0 Auto + 4 Save = 28 byte                  *
;******************************************************************************
_main:
;** --------------------------------------------------------------------------*
           MVKL    .S1     _InitEXINTF,A0    ; |151| 
           MVKH    .S1     _InitEXINTF,A0    ; |151| 
           B       .S2X    A0                ; |151| 
           STW     .D2T2   B3,*SP--(32)      ; |150| 
           MVKL    .S2     RL8,B3            ; |151| 
           MVKH    .S2     RL8,B3            ; |151| 
           NOP             2
RL8:       ; CALL OCCURS                     ; |151| 
           MVKL    .S1     _InitTimer,A0     ; |152| 
           MVKH    .S1     _InitTimer,A0     ; |152| 
           B       .S2X    A0                ; |152| 
           MVKL    .S2     RL10,B3           ; |152| 
           MVKH    .S2     RL10,B3           ; |152| 
           NOP             3
RL10:      ; CALL OCCURS                     ; |152| 
           MVKL    .S2     _InitUART,B4      ; |153| 
           MVKH    .S2     _InitUART,B4      ; |153| 
           B       .S2     B4                ; |153| 
           MVKL    .S2     RL12,B3           ; |153| 
           MVKH    .S2     RL12,B3           ; |153| 
           NOP             3
RL12:      ; CALL OCCURS                     ; |153| 
           MVKL    .S1     _InitINT,A0       ; |154| 
           MVKH    .S1     _InitINT,A0       ; |154| 
           B       .S2X    A0                ; |154| 
           MVKL    .S2     RL14,B3           ; |154| 
           MVKH    .S2     RL14,B3           ; |154| 
           NOP             3
RL14:      ; CALL OCCURS                     ; |154| 
           MVKL    .S1     _InitUSBMon,A0    ; |155| 
           MVKH    .S1     _InitUSBMon,A0    ; |155| 
           B       .S2X    A0                ; |155| 
           MVKL    .S2     RL16,B3           ; |155| 
           MVKH    .S2     RL16,B3           ; |155| 
           NOP             3
RL16:      ; CALL OCCURS                     ; |155| 
           MVKL    .S1     _sprintf,A0       ; |157| 

           MVKH    .S1     _sprintf,A0       ; |157| 
||         MVKL    .S2     _tmp_string,B5    ; |157| 

           B       .S2X    A0                ; |157| 
           MVKL    .S2     RL18,B3           ; |157| 
           MVKH    .S2     _tmp_string,B5    ; |157| 
           MVKL    .S2     SL1+0,B4          ; |157| 
           MVKH    .S2     SL1+0,B4          ; |157| 

           MVKH    .S2     RL18,B3           ; |157| 
||         MV      .S1X    B5,A4             ; |157| 
||         STW     .D2T2   B4,*+SP(4)        ; |157| 

RL18:      ; CALL OCCURS                     ; |157| 
           MVKL    .S1     _Report,A0        ; |157| 
           MVKH    .S1     _Report,A0        ; |157| 
           B       .S2X    A0                ; |157| 
           MVKL    .S2     RL20,B3           ; |157| 
           MVKH    .S2     RL20,B3           ; |157| 
           NOP             3
RL20:      ; CALL OCCURS                     ; |157| 
           MVK     .S1     2024,A0           ; |158| 

           MVKL    .S1     _sprintf,A0       ; |158| 
||         STW     .D2T1   A0,*+SP(8)        ; |158| 

           MVKH    .S1     _sprintf,A0       ; |158| 
||         MVKL    .S2     SL2+0,B4          ; |158| 

           B       .S2X    A0                ; |158| 
           MVKH    .S2     SL2+0,B4          ; |158| 
           MVKL    .S2     _tmp_string,B5    ; |158| 
           MVKH    .S2     _tmp_string,B5    ; |158| 
           MVKL    .S2     RL22,B3           ; |158| 

           STW     .D2T2   B4,*+SP(4)        ; |158| 
||         MVKH    .S2     RL22,B3           ; |158| 
||         MV      .S1X    B5,A4             ; |158| 

RL22:      ; CALL OCCURS                     ; |158| 
           MVKL    .S1     _Report,A0        ; |158| 
           MVKH    .S1     _Report,A0        ; |158| 
           B       .S2X    A0                ; |158| 
           MVKL    .S2     RL24,B3           ; |158| 
           MVKH    .S2     RL24,B3           ; |158| 
           NOP             3
RL24:      ; CALL OCCURS                     ; |158| 
           MVKL    .S2     SL3+0,B4          ; |159| 
           MVKL    .S2     0x20003fc,B5      ; |159| 
           MVKH    .S2     SL3+0,B4          ; |159| 

           MVKH    .S2     0x20003fc,B5      ; |159| 
||         STW     .D2T2   B4,*+SP(4)        ; |159| 

           LDW     .D2T2   *B5,B4            ; |159| 
           MVKL    .S1     _sprintf,A3       ; |159| 
           MVKL    .S1     0x20003fc,A0      ; |159| 
           MVKH    .S1     0x20003fc,A0      ; |159| 
           MVKH    .S1     _sprintf,A3       ; |159| 
           EXTU    .S2     B4,16,24,B4       ; |159| 
           STW     .D2T2   B4,*+SP(8)        ; |159| 
           LDW     .D1T1   *A0,A0            ; |159| 
           B       .S2X    A3                ; |159| 
           MVKL    .S2     RL26,B3           ; |159| 
           MVKH    .S2     RL26,B3           ; |159| 
           MVKL    .S1     _tmp_string,A4    ; |159| 
           EXTU    .S1     A0,24,24,A0       ; |159| 

           STW     .D2T1   A0,*+SP(12)       ; |159| 
||         MVKH    .S1     _tmp_string,A4    ; |159| 

RL26:      ; CALL OCCURS                     ; |159| 
           MVKL    .S1     _Report,A0        ; |159| 
           MVKH    .S1     _Report,A0        ; |159| 
           B       .S2X    A0                ; |159| 
           MVKL    .S2     RL28,B3           ; |159| 
           MVKH    .S2     RL28,B3           ; |159| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |159| 
;** --------------------------------------------------------------------------*
           MVKL    .S1     _GIE,A0           ; |163| 
           MVKH    .S1     _GIE,A0           ; |163| 
           B       .S2X    A0                ; |163| 
           MVKL    .S2     _TFlag,B4         ; |161| 
           MVKL    .S2     RL30,B3           ; |163| 
           MVKH    .S2     _TFlag,B4         ; |161| 
           ZERO    .D1     A3                ; |161| 

           STW     .D2T1   A3,*B4            ; |161| 
||         MVKH    .S2     RL30,B3           ; |163| 

RL30:      ; CALL OCCURS                     ; |163| 
           MVKL    .S2     0x200004c,B5      ; |165| 
           MVKL    .S2     0x2000080,B6      ; |166| 
           MVKL    .S2     0x2000084,B7      ; |167| 
           MVKH    .S2     0x200004c,B5      ; |165| 
           MVKH    .S2     0x2000080,B6      ; |166| 

           MVK     .S1     1,A0              ; |165| 
||         MVKH    .S2     0x2000084,B7      ; |167| 

           STW     .D2T1   A0,*B5            ; |165| 
||         MVKL    .S2     _TINTCnt,B4       ; |169| 

           MVK     .S1     2048,A0           ; |167| 
||         STW     .D2T1   A0,*B6            ; |166| 
||         MVKH    .S2     _TINTCnt,B4       ; |169| 

           MVKL    .S1     _t,A0             ; |171| 
||         STW     .D2T1   A0,*B7            ; |167| 
||         ZERO    .S2     B6                ; |171| 
||         ZERO    .L2     B5                ; |169| 

           STW     .D2T2   B5,*B4            ; |169| 
||         MVKH    .S1     _t,A0             ; |171| 
||         MVKH    .S2     0x41f00000,B6     ; |171| 

           STW     .D1T2   B6,*A0            ; |171| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L10
;** --------------------------------------------------------------------------*
L10:    
           MVKL    .S1     SL4+0,A0          ; |174| 

           MVKH    .S1     SL4+0,A0          ; |174| 
||         MVKL    .S2     _angle_d,B4       ; |174| 

           STW     .D2T1   A0,*+SP(4)        ; |174| 
||         MVKH    .S2     _angle_d,B4       ; |174| 

           LDW     .D2T2   *B4,B4            ; |174| 
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L11
;** --------------------------------------------------------------------------*
L11:    
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L12:    
           MVKL    .S1     _tmp_string,A4    ; |174| 
           MVKL    .S2     RL32,B3           ; |174| 
           MVKH    .S2     RL32,B3           ; |174| 
           SPDP    .S2     B4,B5:B4          ; |174| 
           MVKL    .S1     _angle,A0         ; |174| 
           STW     .D2T2   B4,*+SP(8)        ; |174| 

           MVKH    .S1     _angle,A0         ; |174| 
||         STW     .D2T2   B5,*+SP(12)       ; |174| 

           LDW     .D1T1   *A0,A0            ; |174| 
           MVKL    .S2     _sprintf,B4       ; |174| 
           MVKH    .S2     _sprintf,B4       ; |174| 
           B       .S2     B4                ; |174| 
           MVKH    .S1     _tmp_string,A4    ; |174| 
           SPDP    .S1     A0,A1:A0          ; |174| 
           NOP             1
           STW     .D2T1   A0,*+SP(16)       ; |174| 
           STW     .D2T1   A1,*+SP(20)       ; |174| 
RL32:      ; CALL OCCURS                     ; |174| 
           MVKL    .S1     _Report,A0        ; |174| 
           MVKH    .S1     _Report,A0        ; |174| 
           B       .S2X    A0                ; |174| 
           MVKL    .S2     RL34,B3           ; |174| 
           MVKH    .S2     RL34,B3           ; |174| 
           NOP             3
RL34:      ; CALL OCCURS                     ; |174| 
           MVKL    .S2     _startFlag,B4     ; |176| 
           MVKH    .S2     _startFlag,B4     ; |176| 
           LDW     .D2T2   *B4,B0            ; |176| 
           NOP             4
   [ B0]   B       .S1     L12               ; |176| 
   [ B0]   MVKL    .S1     SL4+0,A0          ; |174| 

   [ B0]   MVKL    .S2     _angle_d,B4       ; |174| 
|| [ B0]   MVKH    .S1     SL4+0,A0          ; |174| 

   [!B0]   MVKL    .S1     _i,A0             ; |177| 
|| [ B0]   MVKH    .S2     _angle_d,B4       ; |174| 
|| [ B0]   STW     .D2T1   A0,*+SP(4)        ; |174| 

   [!B0]   MVKH    .S1     _i,A0             ; |177| 
|| [ B0]   LDW     .D2T2   *B4,B4            ; |174| 

   [!B0]   LDW     .D1T1   *A0,A0            ; |177| 
           ; BRANCH OCCURS                   ; |176| 
;** --------------------------------------------------------------------------*
           NOP             4
           CMPGT   .L1     A0,3,A1           ; |177| 
   [ A1]   B       .S1     L11               ; |177| 
   [!A1]   MVKL    .S2     _PWMOut,B5        ; |178| 
   [ A1]   MVKL    .S1     SL4+0,A0          ; |174| 

   [ A1]   MVKL    .S2     _angle_d,B4       ; |174| 
|| [ A1]   MVKH    .S1     SL4+0,A0          ; |174| 

   [ A1]   MVKH    .S2     _angle_d,B4       ; |174| 
|| [ A1]   STW     .D2T1   A0,*+SP(4)        ; |174| 

   [ A1]   LDW     .D2T2   *B4,B4            ; |174| 
           ; BRANCH OCCURS                   ; |177| 
;** --------------------------------------------------------------------------*
           MVKL    .S2     _t,B4             ; |178| 
           MVKH    .S2     _PWMOut,B5        ; |178| 
           MVKH    .S2     _t,B4             ; |178| 
           B       .S2     B5                ; |178| 
           LDW     .D2T1   *B4,A4            ; |178| 
           MVKL    .S2     RL36,B3           ; |178| 
           MVKH    .S2     RL36,B3           ; |178| 
           NOP             2
RL36:      ; CALL OCCURS                     ; |178| 
           MVKL    .S1     _WaitTFlagCnt,A0  ; |179| 
           MVKH    .S1     _WaitTFlagCnt,A0  ; |179| 
           B       .S2X    A0                ; |179| 
           MVKL    .S2     RL38,B3           ; |179| 
           MVKH    .S2     RL38,B3           ; |179| 
           MVK     .S1     0x1f4,A4          ; |179| 
           NOP             2
RL38:      ; CALL OCCURS                     ; |179| 

           MVKL    .S1     _PWMOut,A0        ; |180| 
||         MVKL    .S2     _t,B4             ; |180| 

           MVKH    .S1     _PWMOut,A0        ; |180| 
||         MVKH    .S2     _t,B4             ; |180| 

           B       .S2X    A0                ; |180| 
||         LDW     .D2T2   *B4,B4            ; |180| 

           ZERO    .D1     A3                ; |180| 
           MVKL    .S2     RL40,B3           ; |180| 
           SET     .S1     A3,31,31,A3       ; |180| 
           MVKH    .S2     RL40,B3           ; |180| 
           XOR     .S1X    B4,A3,A4          ; |180| 
RL40:      ; CALL OCCURS                     ; |180| 
           MVKL    .S2     _WaitTFlagCnt,B4  ; |181| 
           MVKH    .S2     _WaitTFlagCnt,B4  ; |181| 
           B       .S2     B4                ; |181| 
           MVKL    .S2     RL42,B3           ; |181| 
           MVK     .S1     0x1f4,A4          ; |181| 
           MVKH    .S2     RL42,B3           ; |181| 
           NOP             2
RL42:      ; CALL OCCURS                     ; |181| 
           MVKL    .S1     _t,A0             ; |183| 
           MVKH    .S1     _t,A0             ; |183| 
           LDW     .D1T1   *A0,A0            ; |183| 
           MVKL    .S2     0x4004147a,B5     ; |183| 
           MVKH    .S2     0x4004147a,B5     ; |183| 
           MVKL    .S2     0xe147ae14,B4     ; |183| 
           MVKH    .S2     0xe147ae14,B4     ; |183| 
           SPDP    .S1     A0,A1:A0          ; |183| 
           NOP             1
           ADDDP   .L2X    B5:B4,A1:A0,B5:B4 ; |183| 
           NOP             6
           DPSP    .L2     B5:B4,B4          ; |183| 
           MVKL    .S1     _i,A3             ; |184| 
           MVKL    .S1     _t,A0             ; |183| 
           MVKH    .S1     _t,A0             ; |183| 

           MVKH    .S1     _i,A3             ; |184| 
||         STW     .D1T2   B4,*A0            ; |183| 

           LDW     .D1T1   *A3,A0            ; |184| 
           B       .S1     L10               ; |187| 
           NOP             3
           ADD     .D1     1,A0,A0           ; |184| 
           STW     .D1T1   A0,*A3            ; |184| 
           ; BRANCH OCCURS                   ; |187| 


;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
SL1:	.string	13,10,13,10,0
SL2:	.string	"Mechatronics Course %d",13,10,0
SL3:	.string	"FPGA Ver%2x.%02x",13,10,0
SL4:	.string	"Cart_A: %f, Pendulum_A: %f",13,10,0
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
