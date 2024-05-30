;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Thu May 30 11:25:40 2024                                *
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
	.field  	_prevErr_pend+0,32
	.word	000000000h		; _prevErr_pend @ 0
	.sect	".text"
	.global	_prevErr_pend
_prevErr_pend:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_sumErr_pend+0,32
	.word	000000000h		; _sumErr_pend @ 0
	.sect	".text"
	.global	_sumErr_pend
_sumErr_pend:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_prevErr_cart+0,32
	.word	000000000h		; _prevErr_cart @ 0
	.sect	".text"
	.global	_prevErr_cart
_prevErr_cart:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_sumErr_cart+0,32
	.word	000000000h		; _sumErr_cart @ 0
	.sect	".text"
	.global	_sumErr_cart
_sumErr_cart:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_prevErr_swup_cart+0,32
	.word	000000000h		; _prevErr_swup_cart @ 0
	.sect	".text"
	.global	_prevErr_swup_cart
_prevErr_swup_cart:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_sumErr_swup_cart+0,32
	.word	000000000h		; _sumErr_swup_cart @ 0
	.sect	".text"
	.global	_sumErr_swup_cart
_sumErr_swup_cart:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_mostPlusPos+0,32
	.word	000000000h		; _mostPlusPos @ 0
	.sect	".text"
	.global	_mostPlusPos
_mostPlusPos:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_mostMinusPos+0,32
	.word	000000000h		; _mostMinusPos @ 0
	.sect	".text"
	.global	_mostMinusPos
_mostMinusPos:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_prevPendPos+0,32
	.word	000000000h		; _prevPendPos @ 0
	.sect	".text"
	.global	_prevPendPos
_prevPendPos:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_remainedAngleToTheGoal+0,32
	.word	000000000h		; _remainedAngleToTheGoal @ 0
	.sect	".text"
	.global	_remainedAngleToTheGoal
_remainedAngleToTheGoal:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_TFlag+0,32
	.field  	0,32			; _TFlag @ 0
	.sect	".text"
	.global	_TFlag
_TFlag:	.usect	.far,4,4
	.global	_y_pend
_y_pend:	.usect	.far,4,4
	.global	_err_pend
_err_pend:	.usect	.far,4,4
	.global	_u_pend
_u_pend:	.usect	.far,4,4
	.global	_y_cart
_y_cart:	.usect	.far,4,4
	.global	_err_cart
_err_cart:	.usect	.far,4,4
	.global	_u_cart
_u_cart:	.usect	.far,4,4
	.global	_y_swup_cart
_y_swup_cart:	.usect	.far,4,4
	.global	_err_swup_cart
_err_swup_cart:	.usect	.far,4,4
	.global	_u_swup_cart
_u_swup_cart:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI6116_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI6116_3 --object_file interrupt.obj --opt_shell 9 interrupt.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 interrupt.c 
	.sect	".text"
	.global	_ISRextint4

;******************************************************************************
;* FUNCTION NAME: _ISRextint4                                                 *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_ISRextint4:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |11| 
           NOP             5
           ; BRANCH OCCURS                   ; |11| 


	.sect	".text"
	.global	_ISRextint5

;******************************************************************************
;* FUNCTION NAME: _ISRextint5                                                 *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_ISRextint5:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |17| 
           NOP             5
           ; BRANCH OCCURS                   ; |17| 


	.sect	".text"
	.global	_c_int08

;******************************************************************************
;* FUNCTION NAME: _c_int08                                                    *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_c_int08:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |29| 
           NOP             5
           ; BRANCH OCCURS                   ; |29| 


	.sect	".text"
	.global	_c_int09

;******************************************************************************
;* FUNCTION NAME: _c_int09                                                    *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_c_int09:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |35| 
           NOP             5
           ; BRANCH OCCURS                   ; |35| 


	.sect	".text"
	.global	_ISRNMI

;******************************************************************************
;* FUNCTION NAME: _ISRNMI                                                     *
;*                                                                            *
;*   Regs Modified     :                                                      *
;*   Regs Used         :                                                      *
;*   Local Frame Size  : 0 Args + 0 Auto + 0 Save = 0 byte                    *
;******************************************************************************
_ISRNMI:
;** --------------------------------------------------------------------------*
           B       .S2     IRP               ; |19| 
           NOP             5
           ; BRANCH OCCURS                   ; |19| 


	.sect	".text"
	.global	_ISRextint6

;******************************************************************************
;* FUNCTION NAME: _ISRextint6                                                 *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 4 Auto + 84 Save = 88 byte                  *
;******************************************************************************
_ISRextint6:
;** --------------------------------------------------------------------------*
           STW     .D2T2   B9,*SP--(88)      ; |22| 
           STW     .D2T1   A0,*+SP(12)       ; |22| 
           STW     .D2T2   B7,*+SP(80)       ; |22| 
           STW     .D2T2   B6,*+SP(76)       ; |22| 
           STW     .D2T2   B5,*+SP(72)       ; |22| 
           STW     .D2T2   B4,*+SP(68)       ; |22| 
           STW     .D2T2   B3,*+SP(64)       ; |22| 
           STW     .D2T2   B2,*+SP(60)       ; |22| 
           STW     .D2T2   B1,*+SP(56)       ; |22| 
           STW     .D2T2   B0,*+SP(52)       ; |22| 
           STW     .D2T1   A9,*+SP(48)       ; |22| 
           STW     .D2T1   A8,*+SP(44)       ; |22| 
           STW     .D2T1   A7,*+SP(40)       ; |22| 
           STW     .D2T1   A6,*+SP(36)       ; |22| 
           STW     .D2T1   A5,*+SP(32)       ; |22| 
           STW     .D2T1   A4,*+SP(28)       ; |22| 
           STW     .D2T1   A3,*+SP(24)       ; |22| 
           STW     .D2T1   A2,*+SP(20)       ; |22| 

           STW     .D2T1   A1,*+SP(16)       ; |22| 
||         MVKL    .S1     0x2000008,A0      ; |25| 

           MVKH    .S1     0x2000008,A0      ; |25| 
||         STW     .D2T2   B8,*+SP(84)       ; |22| 

           LDW     .D1T1   *A0,A0            ; |25| 
           NOP             4
           AND     .S1     15,A0,A0          ; |25| 
           CMPEQ   .L1     A0,1,A1           ; |25| 
   [ A1]   B       .S1     L8                ; |25| 
           STW     .D2T1   A0,*+SP(4)        ; |25| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |59| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |59| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |59| 
   [ A1]   LDW     .D2T2   *+SP(68),B4       ; |59| 
           ; BRANCH OCCURS                   ; |25| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(4),B4        ; |26| 
           NOP             3
;** --------------------------------------------------------------------------*
;**   BEGIN LOOP L1
;** --------------------------------------------------------------------------*
L1:    
           NOP             1
           CMPEQ   .L2     B4,4,B0           ; |26| 
   [!B0]   B       .S1     L3                ; |26| 

   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |38| 
|| [ B0]   MVKL    .S1     0x2000014,A0      ; |27| 

   [ B0]   MVKH    .S1     0x2000014,A0      ; |27| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |27| 
           NOP             2
           ; BRANCH OCCURS                   ; |26| 
;** --------------------------------------------------------------------------*
           NOP             2
           AND     .S1     1,A0,A1           ; |27| 
   [!A1]   B       .S1     L7                ; |27| 
   [!A1]   MVKL    .S1     0x2000008,A0      ; |58| 
   [!A1]   MVKH    .S1     0x2000008,A0      ; |58| 

   [ A1]   ZERO    .D2     B4                ; |28| 
|| [ A1]   MVKL    .S2     _compacket+124,B5 ; |28| 
|| [!A1]   LDW     .D1T1   *A0,A0            ; |58| 

   [ A1]   MVKH    .S2     0x2000000,B4      ; |28| 

   [ A1]   MVKH    .S2     _compacket+124,B5 ; |28| 
|| [ A1]   LDW     .D2T2   *B4,B4            ; |28| 

           ; BRANCH OCCURS                   ; |27| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *B5,B5            ; |28| 
           NOP             1
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L2:    
           MVKL    .S1     _compacket+124,A0 ; |29| 
           MVKH    .S1     _compacket+124,A0 ; |29| 
           EXTU    .S2     B4,24,24,B4       ; |28| 
           STB     .D2T2   B4,*B5            ; |28| 
           LDW     .D1T1   *A0,A3            ; |29| 
           MVKL    .S1     _SendByte,A0      ; |29| 
           MVKH    .S1     _SendByte,A0      ; |29| 
           MVKL    .S2     RL0,B3            ; |29| 
           B       .S2X    A0                ; |29| 
           LDB     .D1T1   *A3,A4            ; |29| 
           MVKH    .S2     RL0,B3            ; |29| 
           NOP             3
RL0:       ; CALL OCCURS                     ; |29| 
           MVKL    .S2     _compacket+124,B4 ; |30| 
           MVKH    .S2     _compacket+124,B4 ; |30| 
           LDW     .D2T2   *B4,B4            ; |30| 
           MVKL    .S1     _compacket+99,A0  ; |30| 
           MVKH    .S1     _compacket+99,A0  ; |30| 
           NOP             2
           CMPEQ   .L1X    B4,A0,A1          ; |30| 
   [!A1]   MVKL    .S2     _compacket+124,B4 ; |34| 
   [!A1]   MVKH    .S2     _compacket+124,B4 ; |34| 
   [!A1]   LDW     .D2T2   *B4,B5            ; |34| 
   [ A1]   MVKL    .S2     _compacket+124,B4 ; |31| 
   [ A1]   MVKL    .S1     _compacket,A0     ; |31| 
   [ A1]   MVKH    .S2     _compacket+124,B4 ; |31| 
   [ A1]   MVKH    .S1     _compacket,A0     ; |31| 

           MVKL    .S2     0x2000014,B5      ; |36| 
|| [!A1]   ADD     .D2     1,B5,B6           ; |34| 

   [!A1]   STW     .D2T2   B6,*B4            ; |34| 

   [ A1]   STW     .D2T1   A0,*B4            ; |31| 
||         MVKH    .S2     0x2000014,B5      ; |36| 

           LDW     .D2T2   *B5,B4            ; |36| 
           NOP             4
           AND     .S2     1,B4,B0           ; |36| 
   [ B0]   B       .S1     L2                ; |36| 

   [ B0]   ZERO    .D2     B4                ; |28| 
|| [ B0]   MVKL    .S2     _compacket+124,B5 ; |28| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |28| 

   [ B0]   MVKH    .S2     _compacket+124,B5 ; |28| 
|| [ B0]   LDW     .D2T2   *B4,B4            ; |28| 

   [ B0]   LDW     .D2T2   *B5,B5            ; |28| 
           NOP             1
           ; BRANCH OCCURS                   ; |36| 
;** --------------------------------------------------------------------------*
           B       .S1     L7                ; |37| 
           MVKL    .S1     0x2000008,A0      ; |58| 
           MVKH    .S1     0x2000008,A0      ; |58| 
           LDW     .D1T1   *A0,A0            ; |58| 
           NOP             2
           ; BRANCH OCCURS                   ; |37| 
;** --------------------------------------------------------------------------*
L3:    
           CMPEQ   .L2     B4,2,B0           ; |38| 
   [!B0]   B       .S1     L4                ; |38| 
   [ B0]   MVKL    .S2     _respacket+200,B4 ; |39| 
           NOP             3
   [!B0]   LDW     .D2T2   *+SP(4),B4        ; |47| 
           ; BRANCH OCCURS                   ; |38| 
;** --------------------------------------------------------------------------*
           MVKH    .S2     _respacket+200,B4 ; |39| 
           LDW     .D2T2   *B4,B5            ; |39| 
           NOP             4
           CMPGT   .L2     B5,0,B0           ; |39| 

   [ B0]   MVKL    .S1     _respacket+204,A0 ; |40| 
||         SUB     .D2     B5,1,B5           ; |39| 

   [ B0]   MVKH    .S1     _respacket+204,A0 ; |40| 
||         STW     .D2T2   B5,*B4            ; |39| 

   [ B0]   LDW     .D1T1   *A0,A3            ; |40| 
   [ B0]   MVKL    .S1     _respacket,A4     ; |40| 
   [ B0]   MVKH    .S1     _respacket,A4     ; |40| 
   [!B0]   MVKL    .S1     0x2000004,A0      ; |43| 
   [!B0]   MVKL    .S2     _respacket+208,B4 ; |44| 
   [ B0]   ADD     .D1     1,A3,A5           ; |40| 
   [ B0]   STW     .D1T1   A5,*A0            ; |40| 

           B       .S1     L6                ; |46| 
|| [ B0]   LDB     .D1T1   *+A3[A4],A0       ; |40| 

   [!B0]   MVKH    .S1     0x2000004,A0      ; |43| 
   [!B0]   MVK     .S2     1,B5              ; |43| 

   [!B0]   ZERO    .D2     B5                ; |44| 
|| [ B0]   ZERO    .L2     B4                ; |40| 
|| [!B0]   MVKH    .S2     _respacket+208,B4 ; |44| 
|| [!B0]   STW     .D1T2   B5,*A0            ; |43| 

   [ B0]   MVKH    .S2     0x2000000,B4      ; |40| 
|| [!B0]   STW     .D2T2   B5,*B4            ; |44| 

   [ B0]   STW     .D2T1   A0,*B4            ; |40| 
           ; BRANCH OCCURS                   ; |46| 
;** --------------------------------------------------------------------------*
L4:    
           NOP             4
           CMPEQ   .L2     B4,12,B0          ; |47| 
   [!B0]   B       .S1     L6                ; |47| 
           NOP             2
   [ B0]   MVKL    .S1     0x2000014,A0      ; |48| 
   [ B0]   MVKH    .S1     0x2000014,A0      ; |48| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |48| 
           ; BRANCH OCCURS                   ; |47| 
;** --------------------------------------------------------------------------*
           NOP             4
           AND     .S1     1,A0,A1           ; |48| 
   [!A1]   B       .S1     L6                ; |48| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |49| 
           ; BRANCH OCCURS                   ; |48| 
;*----------------------------------------------------------------------------*
;*   SOFTWARE PIPELINE INFORMATION
;*      Disqualified loop: software pipelining disabled
;*----------------------------------------------------------------------------*
L5:    

           MVKH    .S2     0x2000000,B4      ; |49| 
||         MVKL    .S1     _compacket+124,A0 ; |49| 

           LDW     .D2T2   *B4,B4            ; |49| 
||         MVKH    .S1     _compacket+124,A0 ; |49| 

           LDW     .D1T1   *A0,A3            ; |49| 
           MVKL    .S1     _compacket+124,A0 ; |50| 
           MVKH    .S1     _compacket+124,A0 ; |50| 
           NOP             1
           EXTU    .S2     B4,24,24,B4       ; |49| 
           STB     .D1T2   B4,*A3            ; |49| 
           LDW     .D1T1   *A0,A0            ; |50| 
           MVKL    .S2     _compacket+99,B4  ; |50| 
           MVKH    .S2     _compacket+99,B4  ; |50| 
           NOP             2
           CMPEQ   .L2X    A0,B4,B0          ; |50| 
   [!B0]   MVKL    .S1     _compacket+124,A0 ; |54| 
   [!B0]   MVKH    .S1     _compacket+124,A0 ; |54| 
   [!B0]   MV      .D1     A0,A4             ; |54| 
   [!B0]   LDW     .D1T1   *A4,A0            ; |54| 
   [ B0]   MVKL    .S1     _compacket+124,A0 ; |51| 
   [ B0]   MVKL    .S2     _compacket,B4     ; |51| 
   [ B0]   MVKH    .S1     _compacket+124,A0 ; |51| 
   [ B0]   MVKH    .S2     _compacket,B4     ; |51| 

           MVKL    .S1     0x2000014,A0      ; |56| 
|| [!B0]   ADD     .L1     1,A0,A3           ; |54| 
|| [ B0]   STW     .D1T2   B4,*A0            ; |51| 

           MVKH    .S1     0x2000014,A0      ; |56| 
|| [!B0]   STW     .D1T1   A3,*A4            ; |54| 

           LDW     .D1T1   *A0,A0            ; |56| 
           NOP             4
           AND     .S1     1,A0,A1           ; |56| 
   [ A1]   B       .S1     L5                ; |56| 
           NOP             4
   [ A1]   ZERO    .D2     B4                ; |49| 
           ; BRANCH OCCURS                   ; |56| 
;** --------------------------------------------------------------------------*
L6:    
           MVKL    .S1     0x2000008,A0      ; |58| 
           MVKH    .S1     0x2000008,A0      ; |58| 
           LDW     .D1T1   *A0,A0            ; |58| 
           NOP             2
;** --------------------------------------------------------------------------*
L7:    
           NOP             2
           AND     .S1     15,A0,A0          ; |58| 
           CMPEQ   .L1     A0,1,A1           ; |58| 
   [!A1]   B       .S1     L1                ; |58| 
           STW     .D2T1   A0,*+SP(4)        ; |58| 
   [!A1]   LDW     .D2T2   *+SP(4),B4        ; |26| 
   [ A1]   LDW     .D2T2   *+SP(80),B7       ; |59| 
   [ A1]   LDW     .D2T2   *+SP(76),B6       ; |59| 
   [ A1]   LDW     .D2T2   *+SP(72),B5       ; |59| 
           ; BRANCH OCCURS                   ; |58| 
;** --------------------------------------------------------------------------*
           LDW     .D2T2   *+SP(68),B4       ; |59| 
;** --------------------------------------------------------------------------*
L8:    
           LDW     .D2T2   *+SP(64),B3       ; |59| 
           LDW     .D2T2   *+SP(60),B2       ; |59| 
           LDW     .D2T2   *+SP(56),B1       ; |59| 
           LDW     .D2T2   *+SP(52),B0       ; |59| 
           LDW     .D2T1   *+SP(48),A9       ; |59| 
           LDW     .D2T1   *+SP(44),A8       ; |59| 
           LDW     .D2T1   *+SP(40),A7       ; |59| 
           LDW     .D2T1   *+SP(36),A6       ; |59| 
           LDW     .D2T1   *+SP(32),A5       ; |59| 
           LDW     .D2T1   *+SP(28),A4       ; |59| 
           LDW     .D2T1   *+SP(24),A3       ; |59| 
           LDW     .D2T1   *+SP(20),A2       ; |59| 
           LDW     .D2T1   *+SP(16),A1       ; |59| 
           LDW     .D2T1   *+SP(12),A0       ; |59| 

           B       .S2     IRP               ; |59| 
||         LDW     .D2T2   *+SP(84),B8       ; |59| 

           LDW     .D2T2   *++SP(88),B9      ; |59| 
           NOP             4
           ; BRANCH OCCURS                   ; |59| 


	.sect	".text"
	.global	_ISRtimer0

;******************************************************************************
;* FUNCTION NAME: _ISRtimer0                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP                                           *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,A13,A14,   *
;*                           A15,B0,B1,B2,B3,B4,B5,B6,B7,B8,B9,B10,B11,B12,   *
;*                           B13,SP                                           *
;*   Local Frame Size  : 0 Args + 16 Auto + 124 Save = 140 byte               *
;******************************************************************************
_ISRtimer0:
;** --------------------------------------------------------------------------*
           ADDK    .S2     -144,SP           ; |98| 
           STW     .D2T2   B4,*+SP(108)      ; |98| 
           STW     .D2T2   B3,*+SP(104)      ; |98| 
           STW     .D2T2   B11,*+SP(136)     ; |98| 
           STW     .D2T2   B10,*+SP(132)     ; |98| 
           STW     .D2T2   B9,*+SP(128)      ; |98| 
           STW     .D2T2   B8,*+SP(124)      ; |98| 
           STW     .D2T2   B7,*+SP(120)      ; |98| 
           STW     .D2T2   B6,*+SP(116)      ; |98| 
           STW     .D2T2   B5,*+SP(112)      ; |98| 
           STW     .D2T2   B2,*+SP(100)      ; |98| 
           STW     .D2T2   B1,*+SP(96)       ; |98| 
           STW     .D2T2   B0,*+SP(92)       ; |98| 
           STW     .D2T1   A15,*+SP(88)      ; |98| 
           STW     .D2T1   A14,*+SP(84)      ; |98| 
           STW     .D2T1   A13,*+SP(80)      ; |98| 
           STW     .D2T1   A12,*+SP(76)      ; |98| 
           STW     .D2T1   A11,*+SP(72)      ; |98| 
           STW     .D2T1   A10,*+SP(68)      ; |98| 
           STW     .D2T1   A9,*+SP(64)       ; |98| 
           STW     .D2T1   A8,*+SP(60)       ; |98| 
           STW     .D2T1   A7,*+SP(56)       ; |98| 
           STW     .D2T1   A6,*+SP(52)       ; |98| 

           STW     .D2T1   A5,*+SP(48)       ; |98| 
||         MVKL    .S2     _GetPendulumPos,B4 ; |103| 

           STW     .D2T1   A4,*+SP(44)       ; |98| 
||         MVKH    .S2     _GetPendulumPos,B4 ; |103| 

           B       .S2     B4                ; |103| 
||         STW     .D2T2   B12,*+SP(140)     ; |98| 

           STW     .D2T1   A3,*+SP(40)       ; |98| 
           STW     .D2T1   A2,*+SP(36)       ; |98| 
           STW     .D2T1   A1,*+SP(32)       ; |98| 

           STW     .D2T1   A0,*+SP(28)       ; |98| 
||         MVKL    .S2     RL2,B3            ; |103| 

           MVKH    .S2     RL2,B3            ; |103| 
||         STW     .D2T2   B13,*+SP(144)     ; |98| 

RL2:       ; CALL OCCURS                     ; |103| 
           MVKL    .S1     _GetCartPos,A0    ; |104| 
           MVKH    .S1     _GetCartPos,A0    ; |104| 
           B       .S2X    A0                ; |104| 
           MVKL    .S2     _y_pend,B4        ; |103| 
           MVKH    .S2     _y_pend,B4        ; |103| 
           MVKL    .S2     RL4,B3            ; |104| 
           STW     .D2T1   A4,*B4            ; |103| 
           MVKH    .S2     RL4,B3            ; |104| 
RL4:       ; CALL OCCURS                     ; |104| 
           MVKL    .S2     _y_cart,B5        ; |104| 
           MVKH    .S2     _y_cart,B5        ; |104| 

           MV      .L2X    A4,B6             ; |104| 
||         MVKL    .S2     _R_pend,B4        ; |107| 
||         MVKL    .S1     _y_pend,A0        ; |107| 

           STW     .D2T2   B6,*B5            ; |104| 
||         MVKH    .S2     _R_pend,B4        ; |107| 
||         MVKH    .S1     _y_pend,A0        ; |107| 

           LDW     .D2T2   *B4,B4            ; |107| 
||         LDW     .D1T1   *A0,A0            ; |107| 

           MVKL    .S1     _y_cart,A3        ; |108| 
           MVKH    .S1     _y_cart,A3        ; |108| 
           ZERO    .D1     A5                ; |112| 
           MVKH    .S1     0x41200000,A5     ; |112| 
           SUBSP   .L2X    B4,A0,B5          ; |107| 
           MVKL    .S1     _err_pend,A0      ; |107| 
           MVKH    .S1     _err_pend,A0      ; |107| 
           MVKL    .S2     _R_cart,B4        ; |108| 

           MVKH    .S2     _R_cart,B4        ; |108| 
||         STW     .D1T2   B5,*A0            ; |107| 

           LDW     .D1T1   *A3,A0            ; |108| 
||         LDW     .D2T2   *B4,B4            ; |108| 

           NOP             4
           SUBSP   .L1X    B4,A0,A3          ; |108| 
           MVKL    .S2     _err_cart,B4      ; |108| 
           MVKH    .S2     _err_cart,B4      ; |108| 
           MVKL    .S1     _mode,A0          ; |111| 

           STW     .D2T1   A3,*B4            ; |108| 
||         MVKH    .S1     _mode,A0          ; |111| 

           LDW     .D1T1   *A0,A0            ; |111| 
           NOP             4
           CMPEQ   .L1     A0,1,A1           ; |111| 
   [!A1]   B       .S1     L9                ; |111| 
           MVKL    .S1     _err_pend,A6      ; |112| 
           MVKH    .S1     _err_pend,A6      ; |112| 
   [ A1]   MVKL    .S2     0xbd4ccccd,B4     ; |120| 

   [ A1]   MVKL    .S2     _prevErr_cart,B4  ; |120| 
|| [ A1]   STW     .D2T2   B4,*+SP(12)       ; |120| 

   [ A1]   MVKL    .S2     _sumErr_cart,B4   ; |120| 
|| [ A1]   STW     .D2T2   B4,*+SP(16)       ; |120| 

           ; BRANCH OCCURS                   ; |111| 
;** --------------------------------------------------------------------------*

           MVKL    .S2     0xb951b717,B4     ; |120| 
||         MV      .S1X    B4,A0             ; |120| 

           LDW     .D2T2   *+SP(12),B4       ; |120| 
||         MV      .S2     B4,B6

           MVKL    .S1     _err_pend,A14     ; |112| 
           MVKL    .S2     _err_pend,B8      ; |115| 
           MVKL    .S1     _prevErr_pend,A7  ; |116| 
           MVKL    .S2     _prevErr_pend,B5  ; |115| 
           MVKH    .S2     0xbd4ccccd,B4     ; |120| 
           STW     .D2T2   B4,*+SP(12)       ; |120| 
           LDW     .D2T2   *+SP(16),B4       ; |115| 
           MVKL    .S1     0xbe4ccccd,A11    ; |120| 

           MVKL    .S2     _u_pend,B11       ; |115| 
||         MVKL    .S1     _sumErr_pend,A4   ; |114| 

           MVKL    .S2     RL6,B3            ; |125| 
||         MVKL    .S1     _err_cart,A2      ; |120| 

           MVKL    .S1     _err_pend,A8      ; |116| 
||         MVKL    .S2     _err_cart,B1      ; |119| 

           MVKH    .S2     _prevErr_cart,B4  ; |120| 
||         MVKL    .S1     _err_cart,A1      ; |120| 

           STW     .D2T2   B4,*+SP(16)       ; |114| 
||         MVKL    .S1     _err_pend,A10     ; |115| 
||         MVKL    .S2     _PWMOut,B7        ; |125| 

           LDW     .D1T1   *A6,A15           ; |112| 
||         MVKL    .S1     _u_cart,A9        ; |120| 
||         MVKL    .S2     _prevErr_cart,B2  ; |121| 

           MVKL    .S2     _u_cart,B10       ; |124| 
||         MVKL    .S1     _err_cart,A12     ; |121| 

           MVKL    .S2     _err_pend,B13     ; |114| 
||         MVKL    .S1     _u_pend,A13       ; |124| 
||         ZERO    .D2     B12               ; |112| 

           MVKH    .S2     0xc1200000,B12    ; |112| 
||         MVKH    .S1     _err_pend,A14     ; |112| 
||         ZERO    .D2     B9                ; |115| 

           MVKH    .S1     _prevErr_pend,A7  ; |116| 
||         MVKH    .S2     0x41a00000,B9     ; |115| 

           CMPGTSP .S1     A15,A5,A5         ; |112| 
||         MVKH    .S2     _err_pend,B8      ; |115| 

           XOR     .L2X    1,A5,B0           ; |112| 
||         MVKH    .S2     _prevErr_pend,B5  ; |115| 
||         MVKH    .S1     0xbe4ccccd,A11    ; |120| 

   [ B0]   LDW     .D1T1   *A14,A5           ; |112| 
||         MVKH    .S2     _u_pend,B11       ; |115| 
||         MVKH    .S1     _sumErr_pend,A4   ; |114| 

           MVKH    .S2     RL6,B3            ; |125| 
||         MVKH    .S1     _err_cart,A2      ; |120| 

           MVKH    .S1     _err_pend,A8      ; |116| 
||         MVKH    .S2     _err_cart,B1      ; |119| 

           MVKH    .S2     _PWMOut,B7        ; |125| 
||         MVKH    .S1     _err_cart,A1      ; |120| 

           MVKH    .S1     _err_pend,A10     ; |115| 
||         MVKH    .S2     _prevErr_cart,B2  ; |121| 

   [ B0]   CMPLTSP .S2X    A5,B12,B12        ; |112| 
||         MVKH    .S1     _u_cart,A9        ; |120| 

   [ B0]   XOR     .L2     1,B12,B0          ; |112| 
||         MVKH    .S2     _u_cart,B10       ; |124| 
||         MVKH    .S1     _err_cart,A12     ; |121| 

   [!B0]   B       .S1     L9                ; |112| 
||         MV      .L2X    A0,B4             ; |115| 
||         MVKH    .S2     0xb951b717,B6     ; |120| 

           MVKH    .S2     _sumErr_cart,B4   ; |120| 
||         MVKH    .S1     _u_pend,A13       ; |124| 

           MVKL    .S2     _sumErr_cart,B4   ; |119| 
||         MV      .L1X    B4,A0             ; |120| 
||         MVKL    .S1     _sumErr_pend,A6   ; |115| 

           MVKH    .S1     _sumErr_pend,A6   ; |115| 
||         MVKH    .S2     _sumErr_cart,B4   ; |119| 
||         ZERO    .D2     B6                ; |115| 
||         MV      .L1X    B6,A3             ; |116| 

           MV      .D2     B13,B4            ; |119| 
||         MV      .L1X    B4,A5             ; |119| 
||         MVKL    .S1     0x3e0f5c29,A15    ; |115| 
||         MVKH    .S2     0x41200000,B6     ; |115| 

           MVKH    .S2     _err_pend,B4      ; |114| 
||         MVKH    .S1     0x3e0f5c29,A15    ; |115| 

           ; BRANCH OCCURS                   ; |112| 
;** --------------------------------------------------------------------------*

           LDW     .D2T2   *B4,B4            ; |114| 
||         LDW     .D1T1   *A4,A14           ; |114| 

           NOP             4
           ADDSP   .L1X    B4,A14,A14        ; |114| 
           NOP             3
           STW     .D1T1   A14,*A4           ; |114| 

           LDW     .D1T1   *A6,A6            ; |115| 
||         LDW     .D2T2   *B5,B5            ; |115| 

           LDW     .D1T1   *A10,A4           ; |115| 
||         LDW     .D2T2   *B8,B4            ; |115| 

           NOP             4

           MPYSP   .M1     A6,A15,A4         ; |115| 
||         MPYSP   .M2     B4,B9,B4          ; |115| 
||         SUBSP   .L2X    A4,B5,B5          ; |115| 

           NOP             3

           ADDSP   .L2X    A4,B4,B4          ; |115| 
||         MPYSP   .M2     B5,B6,B5          ; |115| 

           NOP             3
           ADDSP   .L2     B5,B4,B4          ; |115| 
           NOP             3
           STW     .D2T2   B4,*B11           ; |115| 
           LDW     .D1T1   *A8,A4            ; |116| 
           NOP             4
           STW     .D1T1   A4,*A7            ; |116| 

           LDW     .D2T2   *B1,B4            ; |119| 
||         LDW     .D1T1   *A5,A4            ; |119| 

           NOP             4
           ADDSP   .L1X    B4,A4,A4          ; |119| 
           MV      .S2X    A0,B4             ; |119| 
           NOP             2
           STW     .D1T1   A4,*A5            ; |119| 
           LDW     .D2T2   *B4,B6            ; |120| 
           LDW     .D2T2   *+SP(16),B4       ; |120| 
           LDW     .D1T1   *A1,A0            ; |120| 
           LDW     .D1T1   *A2,A4            ; |120| 
           NOP             2
           LDW     .D2T2   *B4,B5            ; |120| 
           MV      .S2X    A3,B4
           NOP             3

           LDW     .D2T2   *+SP(12),B6
||         SUBSP   .L2X    A0,B5,B4          ; |120| 
||         MPYSP   .M2     B6,B4,B5          ; |120| 

           MPYSP   .M1     A4,A11,A0         ; |120| 
           NOP             3

           MPYSP   .M2     B4,B6,B4          ; |120| 
||         ADDSP   .L1X    B5,A0,A0          ; |120| 

           NOP             3
           ADDSP   .L1X    B4,A0,A0          ; |120| 
           NOP             3
           STW     .D1T1   A0,*A9            ; |120| 
           LDW     .D1T2   *A12,B4           ; |121| 
           NOP             4
           STW     .D2T2   B4,*B2            ; |121| 

           LDW     .D2T2   *B10,B4           ; |124| 
||         LDW     .D1T1   *A13,A0           ; |124| 

           NOP             3
           B       .S2     B7                ; |125| 
           ADDSP   .L2X    B4,A0,B4          ; |124| 
           NOP             3

           STW     .D2T2   B4,*+SP(4)        ; |124| 
||         MV      .S1X    B4,A4             ; |124| 

RL6:       ; CALL OCCURS                     ; |125| 
           STW     .D2T1   A4,*+SP(8)        ; |125| 
;** --------------------------------------------------------------------------*
L9:    

           MVKL    .S1     _sumErr_swup_cart,A6 ; |133| 
||         MVKL    .S2     _mode,B7          ; |129| 

           MVKL    .S2     0x3c23d70a,B6     ; |134| 
||         MVKL    .S1     _u_swup_cart,A9   ; |138| 

           MVKL    .S2     RL8,B3            ; |138| 
||         MVKL    .S1     _err_swup_cart,A1 ; |133| 

           MVKL    .S1     _err_swup_cart,A8 ; |130| 
||         MVKL    .S2     _prevErr_swup_cart,B8 ; |135| 

           MVKL    .S1     _err_swup_cart,A0 ; |134| 
||         MVKL    .S2     _err_swup_cart,B9 ; |135| 

           MVKL    .S1     _y_cart,A7        ; |130| 
||         MVKL    .S2     _PWMOut,B4        ; |138| 

           MVKL    .S1     _y_pend,A4        ; |146| 
||         MVKL    .S2     _sumErr_swup_cart,B10 ; |134| 

           MVKL    .S1     _err_swup_cart,A3 ; |134| 
||         MVKL    .S2     _prevErr_swup_cart,B2 ; |134| 

           MVKL    .S1     _u_swup_cart,A10  ; |134| 
||         MVKH    .S2     _mode,B7          ; |129| 

           MVKH    .S1     _sumErr_swup_cart,A6 ; |133| 
||         LDW     .D2T2   *B7,B0            ; |129| 
||         MVKL    .S2     _R_swup_cart,B5   ; |130| 

           MVKH    .S1     _u_swup_cart,A9   ; |138| 
||         MVKL    .S2     0x3dcccccd,B1     ; |134| 

           MVKH    .S2     0x3c23d70a,B6     ; |134| 
||         MVKH    .S1     _err_swup_cart,A1 ; |133| 
||         ZERO    .D1     A5                ; |134| 

           MVKH    .S2     RL8,B3            ; |138| 
||         MVKH    .S1     0x40a00000,A5     ; |134| 

           MVKH    .S1     _err_swup_cart,A8 ; |130| 
||         MVKH    .S2     _prevErr_swup_cart,B8 ; |135| 

   [ B0]   B       .S1     L10               ; |129| 
||         MVKH    .S2     _err_swup_cart,B9 ; |135| 

           MVKH    .S2     _PWMOut,B4        ; |138| 
||         MVKH    .S1     _err_swup_cart,A0 ; |134| 

           MVKH    .S1     _y_cart,A7        ; |130| 
||         MVKH    .S2     _sumErr_swup_cart,B10 ; |134| 

           MVKH    .S1     _y_pend,A4        ; |146| 
||         MVKH    .S2     _prevErr_swup_cart,B2 ; |134| 

           MVKH    .S2     _R_swup_cart,B5   ; |130| 
||         MVKH    .S1     _err_swup_cart,A3 ; |134| 

           MV      .L2X    A6,B7             ; |133| 
||         MVKH    .S1     _u_swup_cart,A10  ; |134| 
||         MVKH    .S2     0x3dcccccd,B1     ; |134| 
||         ZERO    .L1     A2                ; |146| 
|| [!B0]   LDW     .D2T2   *B5,B5            ; |130| 
|| [!B0]   LDW     .D1T1   *A7,A4            ; |130| 

           ; BRANCH OCCURS                   ; |129| 
;** --------------------------------------------------------------------------*
           NOP             4
           SUBSP   .L1X    B5,A4,A4          ; |130| 
           NOP             3
           STW     .D1T1   A4,*A8            ; |130| 

           LDW     .D1T1   *A1,A4            ; |133| 
||         LDW     .D2T2   *B7,B5            ; |133| 

           NOP             4
           ADDSP   .L2X    A4,B5,B5          ; |133| 
           NOP             3
           STW     .D2T2   B5,*B7            ; |133| 

           LDW     .D2T2   *B2,B7            ; |134| 
||         LDW     .D1T1   *A3,A3            ; |134| 

           LDW     .D2T2   *B10,B5           ; |134| 
||         LDW     .D1T1   *A0,A0            ; |134| 

           NOP             4

           SUBSP   .L2X    A3,B7,B6          ; |134| 
||         MPYSP   .M1     A0,A5,A0          ; |134| 
||         MPYSP   .M2     B5,B6,B5          ; |134| 

           NOP             3

           MPYSP   .M2     B6,B1,B5          ; |134| 
||         ADDSP   .L1X    B5,A0,A0          ; |134| 

           NOP             3
           ADDSP   .L1X    B5,A0,A0          ; |134| 
           NOP             3
           STW     .D1T1   A0,*A10           ; |134| 
           LDW     .D2T2   *B9,B5            ; |135| 
           NOP             4

           STW     .D2T2   B5,*B8            ; |135| 
||         B       .S2     B4                ; |138| 

           LDW     .D1T1   *A9,A4            ; |138| 
           NOP             4
RL8:       ; CALL OCCURS                     ; |138| 
           B       .S1     L17               ; |139| 

           STW     .D2T1   A4,*+SP(8)        ; |138| 
||         MVKL    .S2     _err_pend,B4      ; |175| 

           MVKL    .S2     _UMAddData,B5     ; |175| 
           MVKL    .S2     _R_pend,B7        ; |175| 
           MVKH    .S2     _err_pend,B4      ; |175| 
           MVKH    .S2     _UMAddData,B5     ; |175| 
           ; BRANCH OCCURS                   ; |139| 
;** --------------------------------------------------------------------------*
L10:    
           LDW     .D1T1   *A4,A4            ; |146| 
           MVKL    .S1     _mostPlusPos,A3   ; |147| 
           MVKH    .S1     _mostPlusPos,A3   ; |147| 
           MVKL    .S2     _y_pend,B4        ; |147| 
           MVKH    .S2     _y_pend,B4        ; |147| 
           CMPGTSP .S1     A4,A2,A1          ; |146| 

   [ A1]   LDW     .D1T1   *A3,A3            ; |147| 
|| [ A1]   LDW     .D2T2   *B4,B4            ; |147| 

           MVKL    .S1     _y_pend,A0        ; |150| 
   [ A1]   B       .S1     L11               ; |148| 
           ZERO    .D1     A4                ; |150| 
           MVKH    .S1     _y_pend,A0        ; |150| 
   [ A1]   CMPLTSP .S2X    A3,B4,B0          ; |147| 
   [ A1]   MVKL    .S2     _mostPlusPos,B4   ; |147| 
   [ A1]   MVKH    .S2     _mostPlusPos,B4   ; |147| 
           ; BRANCH OCCURS                   ; |148| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A0,A3            ; |150| 
           MVKL    .S1     _mostMinusPos,A0  ; |151| 
           MVKL    .S2     _y_pend,B4        ; |151| 
           MVKH    .S1     _mostMinusPos,A0  ; |151| 
           MVKH    .S2     _y_pend,B4        ; |151| 
           CMPLTSP .S1     A3,A4,A1          ; |150| 
   [!A1]   B       .S1     L12               ; |150| 
   [ A1]   LDW     .D1T1   *A0,A3            ; |151| 
           NOP             3
   [ A1]   LDW     .D2T2   *B4,B4            ; |151| 
           ; BRANCH OCCURS                   ; |150| 
;** --------------------------------------------------------------------------*
           NOP             4
           CMPGTSP .S2X    A3,B4,B0          ; |151| 
           MVKL    .S2     _mostMinusPos,B4  ; |151| 
           MVKH    .S2     _mostMinusPos,B4  ; |151| 
;** --------------------------------------------------------------------------*
L11:    
           MVKL    .S1     _y_pend,A0        ; |151| 
           MVKH    .S1     _y_pend,A0        ; |151| 
   [ B0]   LDW     .D1T1   *A0,A0            ; |151| 
           NOP             4
   [ B0]   STW     .D2T1   A0,*B4            ; |151| 
;** --------------------------------------------------------------------------*
L12:    

           MVKL    .S2     _R_pend,B4        ; |154| 
||         MVKL    .S1     _mostPlusPos,A0   ; |154| 

           MVKH    .S2     _R_pend,B4        ; |154| 
||         MVKH    .S1     _mostPlusPos,A0   ; |154| 

           LDW     .D2T2   *B4,B4            ; |154| 
||         LDW     .D1T1   *A0,A0            ; |154| 

           MVKL    .S2     _prevPendPos,B5   ; |159| 
           MVKH    .S2     _prevPendPos,B5   ; |159| 
           MVKL    .S2     RL10,B3           ; |160| 
           MVKH    .S2     RL10,B3           ; |160| 
           SUBSP   .L1X    B4,A0,A3          ; |154| 
           MVKL    .S2     _remainedAngleToTheGoal,B4 ; |154| 
           MVKL    .S1     _y_pend,A0        ; |159| 
           MVKH    .S2     _remainedAngleToTheGoal,B4 ; |154| 

           MVKH    .S1     _y_pend,A0        ; |159| 
||         STW     .D2T1   A3,*B4            ; |154| 

           LDW     .D1T1   *A0,A3            ; |159| 
           ZERO    .D1     A0                ; |159| 
           MVKL    .S2     _PWMOut,B4        ; |160| 
           MVKH    .S2     _PWMOut,B4        ; |160| 
           ZERO    .D2     B6                ; |163| 
           CMPEQSP .S1     A3,A0,A1          ; |159| 
   [ A1]   LDW     .D2T1   *B5,A4            ; |159| 
           ZERO    .D1     A3                ; |159| 
           MVKL    .S2     _y_pend,B5        ; |163| 
           MVKL    .S1     _remainedAngleToTheGoal,A0 ; |160| 
           MVKH    .S2     _y_pend,B5        ; |163| 
   [ A1]   CMPEQSP .S1     A4,A3,A1          ; |159| 
   [!A1]   B       .S1     L13               ; |159| 
           MVKH    .S1     _remainedAngleToTheGoal,A0 ; |160| 
           NOP             4
           ; BRANCH OCCURS                   ; |159| 
;** --------------------------------------------------------------------------*
           B       .S2     B4                ; |160| 
           LDW     .D1T1   *A0,A4            ; |160| 
           NOP             4
RL10:      ; CALL OCCURS                     ; |160| 
           B       .S1     L16               ; |161| 

           MVKL    .S1     _y_pend,A0        ; |171| 
||         STW     .D2T1   A4,*+SP(8)        ; |168| 

           MVKH    .S1     _y_pend,A0        ; |171| 
           LDW     .D1T1   *A0,A0            ; |171| 
           NOP             2
           ; BRANCH OCCURS                   ; |161| 
;** --------------------------------------------------------------------------*
L13:    
           LDW     .D2T2   *B5,B4            ; |163| 
           MVKL    .S1     _prevPendPos,A0   ; |163| 
           MVKH    .S1     _prevPendPos,A0   ; |163| 
           ZERO    .D1     A5                ; |163| 
           MVKL    .S2     RL12,B3           ; |164| 
           CMPEQSP .S2     B4,B6,B0          ; |163| 
   [ B0]   LDW     .D1T1   *A0,A6            ; |163| 
           MV      .S1X    B0,A0             ; |163| 
           MVKL    .S1     _remainedAngleToTheGoal,A4 ; |164| 
           MVKL    .S2     _y_pend,B4        ; |167| 
           SET     .S1     A3,31,31,A3       ; |164| 
   [ B0]   CMPGTSP .S1     A6,A5,A0          ; |163| 
           MV      .S2X    A0,B0             ; |163| 
   [!B0]   B       .S1     L14               ; |163| 
           MVKL    .S2     _PWMOut,B5        ; |164| 
           MVKH    .S2     RL12,B3           ; |164| 
           MVKH    .S2     _PWMOut,B5        ; |164| 
           MVKH    .S2     _y_pend,B4        ; |167| 
           MVKH    .S1     _remainedAngleToTheGoal,A4 ; |164| 
           ; BRANCH OCCURS                   ; |163| 
;** --------------------------------------------------------------------------*

           B       .S2     B5                ; |164| 
||         LDW     .D1T1   *A4,A0            ; |164| 

           NOP             4
           XOR     .S1     A0,A3,A4          ; |164| 
RL12:      ; CALL OCCURS                     ; |164| 
           B       .S1     L16               ; |165| 

           MVKL    .S1     _y_pend,A0        ; |171| 
||         STW     .D2T1   A4,*+SP(8)        ; |168| 

           MVKH    .S1     _y_pend,A0        ; |171| 
           LDW     .D1T1   *A0,A0            ; |171| 
           NOP             2
           ; BRANCH OCCURS                   ; |165| 
;** --------------------------------------------------------------------------*
L14:    
           LDW     .D2T2   *B4,B4            ; |167| 
           MVKL    .S1     _prevPendPos,A0   ; |167| 
           MVKH    .S1     _prevPendPos,A0   ; |167| 
           ZERO    .D1     A4                ; |167| 
           MVKL    .S2     RL14,B3           ; |168| 
           CMPEQSP .S2     B4,B6,B0          ; |167| 
   [ B0]   LDW     .D1T1   *A0,A5            ; |167| 
           MV      .S1X    B0,A0             ; |167| 
           MVKH    .S2     RL14,B3           ; |168| 
           MVKL    .S2     _PWMOut,B4        ; |168| 
           MVKL    .S1     _remainedAngleToTheGoal,A3 ; |168| 
   [ B0]   CMPLTSP .S1     A5,A4,A0          ; |167| 
           MV      .S2X    A0,B0             ; |167| 
   [!B0]   B       .S1     L15               ; |167| 
           MVKH    .S2     _PWMOut,B4        ; |168| 
           MVKH    .S1     _remainedAngleToTheGoal,A3 ; |168| 
   [!B0]   MVKL    .S1     _y_pend,A0        ; |171| 
           NOP             2
           ; BRANCH OCCURS                   ; |167| 
;** --------------------------------------------------------------------------*
           B       .S2     B4                ; |168| 
           LDW     .D1T1   *A3,A4            ; |168| 
           NOP             4
RL14:      ; CALL OCCURS                     ; |168| 
           STW     .D2T1   A4,*+SP(8)        ; |168| 
           MVKL    .S1     _y_pend,A0        ; |171| 
;** --------------------------------------------------------------------------*
L15:    
           MVKH    .S1     _y_pend,A0        ; |171| 
           LDW     .D1T1   *A0,A0            ; |171| 
           NOP             2
;** --------------------------------------------------------------------------*
L16:    
           MVKL    .S2     _prevPendPos,B4   ; |171| 
           MVKH    .S2     _prevPendPos,B4   ; |171| 
           STW     .D2T1   A0,*B4            ; |171| 
           MVKL    .S2     _err_pend,B4      ; |175| 
           MVKL    .S2     _UMAddData,B5     ; |175| 
           MVKL    .S2     _R_pend,B7        ; |175| 
           MVKH    .S2     _err_pend,B4      ; |175| 
           MVKH    .S2     _UMAddData,B5     ; |175| 
;** --------------------------------------------------------------------------*
L17:    

           LDW     .D2T2   *+SP(8),B6        ; |175| 
||         MVKH    .S2     _R_pend,B7        ; |175| 
||         MVKL    .S1     _err_cart,A0      ; |175| 

           B       .S2     B5                ; |175| 
||         LDW     .D2T1   *B4,A6            ; |175| 
||         MVKH    .S1     _err_cart,A0      ; |175| 

           LDW     .D1T2   *A0,B4            ; |175| 
||         LDW     .D2T1   *B7,A4            ; |175| 

           MVKL    .S2     RL16,B3           ; |175| 
           MVKH    .S2     RL16,B3           ; |175| 
           NOP             2
RL16:      ; CALL OCCURS                     ; |175| 
           MVKL    .S1     _TINTCnt,A0       ; |178| 
           MVKH    .S1     _TINTCnt,A0       ; |178| 
           LDW     .D1T1   *A0,A3            ; |178| 
           MVK     .S2     1,B4              ; |179| 
           NOP             3

           MVKL    .S1     _TFlag,A3         ; |179| 
||         ADD     .D1     1,A3,A4           ; |178| 

           STW     .D1T1   A4,*A0            ; |178| 
||         MVKH    .S1     _TFlag,A3         ; |179| 

           STW     .D1T2   B4,*A3            ; |179| 
           LDW     .D2T2   *+SP(144),B13     ; |180| 
           LDW     .D2T2   *+SP(140),B12     ; |180| 
           LDW     .D2T2   *+SP(136),B11     ; |180| 
           LDW     .D2T2   *+SP(132),B10     ; |180| 
           LDW     .D2T2   *+SP(128),B9      ; |180| 
           LDW     .D2T2   *+SP(124),B8      ; |180| 
           LDW     .D2T2   *+SP(100),B2      ; |180| 
           LDW     .D2T2   *+SP(96),B1       ; |180| 
           LDW     .D2T2   *+SP(92),B0       ; |180| 
           LDW     .D2T1   *+SP(88),A15      ; |180| 
           LDW     .D2T1   *+SP(84),A14      ; |180| 
           LDW     .D2T1   *+SP(80),A13      ; |180| 
           LDW     .D2T1   *+SP(76),A12      ; |180| 
           LDW     .D2T1   *+SP(72),A11      ; |180| 
           LDW     .D2T1   *+SP(68),A10      ; |180| 
           LDW     .D2T1   *+SP(64),A9       ; |180| 
           LDW     .D2T1   *+SP(60),A8       ; |180| 
           LDW     .D2T1   *+SP(56),A7       ; |180| 
           LDW     .D2T1   *+SP(48),A5       ; |180| 
           LDW     .D2T1   *+SP(36),A2       ; |180| 
           LDW     .D2T1   *+SP(32),A1       ; |180| 
           LDW     .D2T2   *+SP(120),B7      ; |180| 
           LDW     .D2T2   *+SP(112),B5      ; |180| 
           LDW     .D2T2   *+SP(104),B3      ; |180| 
           LDW     .D2T2   *+SP(116),B6      ; |180| 
           LDW     .D2T1   *+SP(52),A6       ; |180| 
           LDW     .D2T1   *+SP(28),A0       ; |180| 
           LDW     .D2T1   *+SP(44),A4       ; |180| 

           B       .S2     IRP               ; |180| 
||         LDW     .D2T2   *+SP(108),B4      ; |180| 

           LDW     .D2T1   *+SP(40),A3       ; |180| 
           ADDK    .S2     144,SP            ; |180| 
           NOP             3
           ; BRANCH OCCURS                   ; |180| 


;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_SendByte
	.global	_PWMOut
	.global	_GetCartPos
	.global	_GetPendulumPos
	.global	_UMAddData
	.global	_compacket
	.global	_respacket
	.global	_TINTCnt
	.global	_R_pend
	.global	_R_cart
	.global	_R_swup_cart
	.global	_mode
