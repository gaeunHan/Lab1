;******************************************************************************
;* TMS320C6x ANSI C Codegen                                      Version 4.10 *
;* Date/Time created: Tue May 28 15:53:09 2024                                *
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
	.field  	_TFlag+0,32
	.field  	0,32			; _TFlag @ 0
	.sect	".text"
	.global	_TFlag
_TFlag:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI16380_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI16380_3 --object_file interrupt.obj --opt_shell 9 interrupt.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 interrupt.c 
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
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,B0,B1,B2,  *
;*                           B3,B4,B5,B6,B7,B8,B9,B10,SP                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,A12,B0,B1,B2,  *
;*                           B3,B4,B5,B6,B7,B8,B9,B10,SP                      *
;*   Local Frame Size  : 0 Args + 32 Auto + 100 Save = 132 byte               *
;******************************************************************************
_ISRtimer0:
;** --------------------------------------------------------------------------*
           ADDK    .S2     -136,SP           ; |77| 
           STW     .D2T2   B4,*+SP(112)      ; |77| 
           STW     .D2T2   B3,*+SP(108)      ; |77| 
           STW     .D2T2   B8,*+SP(128)      ; |77| 
           STW     .D2T2   B7,*+SP(124)      ; |77| 
           STW     .D2T2   B6,*+SP(120)      ; |77| 
           STW     .D2T2   B5,*+SP(116)      ; |77| 
           STW     .D2T2   B2,*+SP(104)      ; |77| 
           STW     .D2T2   B1,*+SP(100)      ; |77| 
           STW     .D2T2   B0,*+SP(96)       ; |77| 
           STW     .D2T1   A12,*+SP(92)      ; |77| 
           STW     .D2T1   A11,*+SP(88)      ; |77| 
           STW     .D2T1   A10,*+SP(84)      ; |77| 
           STW     .D2T1   A9,*+SP(80)       ; |77| 
           STW     .D2T1   A8,*+SP(76)       ; |77| 
           STW     .D2T1   A7,*+SP(72)       ; |77| 
           STW     .D2T1   A6,*+SP(68)       ; |77| 

           STW     .D2T1   A5,*+SP(64)       ; |77| 
||         MVKL    .S2     _GetPendulumPos,B4 ; |88| 

           STW     .D2T1   A4,*+SP(60)       ; |77| 
||         MVKH    .S2     _GetPendulumPos,B4 ; |88| 

           B       .S2     B4                ; |88| 
||         STW     .D2T2   B9,*+SP(132)      ; |77| 

           STW     .D2T1   A3,*+SP(56)       ; |77| 
           STW     .D2T1   A2,*+SP(52)       ; |77| 
           STW     .D2T1   A1,*+SP(48)       ; |77| 

           STW     .D2T1   A0,*+SP(44)       ; |77| 
||         MVKL    .S2     RL2,B3            ; |88| 

           MVKH    .S2     RL2,B3            ; |88| 
||         STW     .D2T2   B10,*+SP(136)     ; |77| 

RL2:       ; CALL OCCURS                     ; |88| 
           MVKL    .S1     _GetCartPos,A0    ; |89| 
           MVKH    .S1     _GetCartPos,A0    ; |89| 
           B       .S2X    A0                ; |89| 
           STW     .D2T1   A4,*+SP(4)        ; |88| 
           NOP             2
           MVKL    .S2     RL4,B3            ; |89| 
           MVKH    .S2     RL4,B3            ; |89| 
RL4:       ; CALL OCCURS                     ; |89| 
           MVKL    .S2     _R_pend,B4        ; |92| 

           MVKH    .S2     _R_pend,B4        ; |92| 
||         STW     .D2T1   A4,*+SP(16)       ; |89| 

           LDW     .D2T2   *B4,B5            ; |92| 
||         MVKL    .S1     _R_cart,A3        ; |93| 

           MVKL    .S2     0xbd4ccccd,B4     ; |105| 
||         MVKL    .S1     _prevErr_pend,A8  ; |101| 
||         LDW     .D2T1   *+SP(4),A4        ; |92| 

           MVKH    .S2     0xbd4ccccd,B4     ; |105| 
||         MVKL    .S1     _prevErr_pend,A11 ; |100| 

           MVKL    .S2     _sumErr_pend,B6   ; |99| 
||         MVKL    .S1     0xb951b717,A10    ; |105| 

           MVKL    .S2     _PWMOut,B0        ; |110| 
||         MVKL    .S1     _sumErr_cart,A9   ; |105| 

           MVKL    .S2     _prevErr_cart,B9  ; |105| 
||         MVKL    .S1     _prevErr_cart,A5  ; |106| 

           MVKL    .S2     0xbe4ccccd,B1     ; |105| 
||         MVKH    .S1     _R_cart,A3        ; |93| 
||         SUBSP   .L2X    B5,A4,B5          ; |92| 

           MVKL    .S2     _PWMOut,B2        ; |113| 
||         MVKL    .S1     _sumErr_pend,A12  ; |100| 

           MVKH    .S2     _sumErr_pend,B6   ; |99| 
||         ZERO    .D1     A4                ; |96| 
||         MVKL    .S1     0x3e0f5c29,A6     ; |100| 

           ZERO    .D2     B6                ; |96| 
||         MV      .L1X    B6,A7             ; |99| 
||         MVKH    .S1     0x41200000,A4     ; |96| 
||         MVKH    .S2     _PWMOut,B0        ; |110| 

           MV      .L2     B5,B8             ; |110| 
||         MV      .S2     B5,B7             ; |105| 
||         STW     .D2T2   B5,*+SP(8)        ; |92| 
||         MVKH    .S1     _prevErr_pend,A8  ; |101| 

           LDW     .D2T2   *+SP(16),B5       ; |93| 
||         MVKH    .S2     0xc1200000,B6     ; |96| 
||         CMPGTSP .S1X    B7,A4,A4          ; |96| 
||         LDW     .D1T1   *A3,A3            ; |93| 

           CMPLTSP .S2     B8,B6,B6          ; |96| 
||         MVKH    .S1     _prevErr_pend,A11 ; |100| 

           XOR     .L1X    1,B6,A1           ; |96| 
||         XOR     .S1     1,A4,A2           ; |96| 
||         MVKH    .S2     _prevErr_cart,B9  ; |105| 

           MVKH    .S1     0xb951b717,A10    ; |105| 
|| [!A2]   MV      .D1     A2,A1             ; |96| 
||         MVKH    .S2     0xbe4ccccd,B1     ; |105| 

           ZERO    .D2     B10               ; |100| 
||         MVKH    .S1     _sumErr_cart,A9   ; |105| 
|| [!A1]   B       .S2     L9                ; |96| 

           SUBSP   .L2X    A3,B5,B5          ; |93| 
||         MVKH    .S1     _prevErr_cart,A5  ; |106| 
||         MVKH    .S2     0x41200000,B10    ; |100| 

           MVKH    .S2     _PWMOut,B2        ; |113| 
||         MVKH    .S1     _sumErr_pend,A12  ; |100| 

           MVKL    .S2     RL6,B3            ; |110| 
||         MVKH    .S1     0x3e0f5c29,A6     ; |100| 

           MVKL    .S1     _sumErr_cart,A0   ; |104| 
||         ZERO    .D2     B7                ; |100| 
||         MVKH    .S2     RL6,B3            ; |110| 

           STW     .D2T2   B5,*+SP(20)       ; |93| 
||         MVKH    .S1     _sumErr_cart,A0   ; |104| 
||         ZERO    .D1     A4                ; |113| 
||         MVKH    .S2     0x41a00000,B7     ; |100| 
||         MV      .L1X    B8,A3             ; |96| 

           ; BRANCH OCCURS                   ; |96| 
;** --------------------------------------------------------------------------*
           LDW     .D1T1   *A7,A4            ; |99| 
           NOP             4
           ADDSP   .L1     A3,A4,A3          ; |99| 
           NOP             3
           STW     .D1T1   A3,*A7            ; |99| 

           LDW     .D1T1   *A11,A4           ; |100| 
||         LDW     .D2T2   *+SP(8),B6        ; |100| 

           LDW     .D1T1   *A12,A3           ; |100| 
           NOP             3
           MV      .D2     B6,B5             ; |100| 

           MPYSP   .M1     A3,A6,A3          ; |100| 
||         SUBSP   .L2X    B6,A4,B5          ; |100| 
||         MPYSP   .M2     B5,B7,B6          ; |100| 

           NOP             3

           MPYSP   .M2     B5,B10,B5         ; |100| 
||         ADDSP   .L1X    A3,B6,A3          ; |100| 

           NOP             3

           LDW     .D2T1   *+SP(8),A3        ; |101| 
||         ADDSP   .L2X    B5,A3,B5          ; |100| 

           NOP             3
           STW     .D2T2   B5,*+SP(12)       ; |100| 
           STW     .D1T1   A3,*A8            ; |101| 

           LDW     .D1T1   *A0,A3            ; |104| 
||         LDW     .D2T2   *+SP(20),B5       ; |104| 

           NOP             4
           ADDSP   .L2X    B5,A3,B5          ; |104| 
           NOP             3
           STW     .D1T2   B5,*A0            ; |104| 
           LDW     .D2T2   *+SP(20),B7       ; |105| 
           LDW     .D2T2   *B9,B6            ; |105| 
           LDW     .D1T1   *A9,A0            ; |105| 
           NOP             3
           SUBSP   .L2     B7,B6,B5

           MPYSP   .M2     B7,B1,B6          ; |105| 
||         MPYSP   .M1     A0,A10,A0         ; |105| 

           NOP             3

           ADDSP   .L1X    A0,B6,A0          ; |105| 
||         MPYSP   .M2     B5,B4,B4          ; |105| 

           NOP             3
           ADDSP   .L2X    B4,A0,B4          ; |105| 
           MV      .S1X    B7,A0             ; |105| 
           NOP             2
           STW     .D2T2   B4,*+SP(24)       ; |105| 
           STW     .D1T1   A0,*A5            ; |106| 
           LDW     .D2T2   *+SP(24),B4       ; |109| 
           LDW     .D2T2   *+SP(12),B5       ; |109| 
           NOP             3
           B       .S2     B0                ; |110| 
           ADDSP   .L2     B4,B5,B4          ; |109| 
           NOP             3

           STW     .D2T2   B4,*+SP(28)       ; |109| 
||         MV      .S1X    B4,A4             ; |109| 

RL6:       ; CALL OCCURS                     ; |110| 
           B       .S1     L10               ; |111| 
           MVKL    .S2     _UMAddData,B5     ; |116| 
           STW     .D2T1   A4,*+SP(32)       ; |113| 
           MVKL    .S2     _R_pend,B7        ; |116| 

           LDW     .D2T2   *+SP(20),B4       ; |116| 
||         MVKH    .S2     _UMAddData,B5     ; |116| 

           LDW     .D2T1   *+SP(8),A6        ; |116| 
||         MVKH    .S2     _R_pend,B7        ; |116| 

           ; BRANCH OCCURS                   ; |111| 
;** --------------------------------------------------------------------------*
L9:    
           B       .S2     B2                ; |113| 
           MVKL    .S2     RL8,B3            ; |113| 
           MVKH    .S2     RL8,B3            ; |113| 
           NOP             3
RL8:       ; CALL OCCURS                     ; |113| 
           MVKL    .S2     _UMAddData,B5     ; |116| 

           MVKL    .S2     _R_pend,B7        ; |116| 
||         STW     .D2T1   A4,*+SP(32)       ; |113| 

           MVKH    .S2     _UMAddData,B5     ; |116| 
||         LDW     .D2T2   *+SP(20),B4       ; |116| 

           MVKH    .S2     _R_pend,B7        ; |116| 
||         LDW     .D2T1   *+SP(8),A6        ; |116| 

;** --------------------------------------------------------------------------*
L10:    

           B       .S2     B5                ; |116| 
||         LDW     .D2T2   *+SP(32),B6       ; |116| 

           LDW     .D2T1   *B7,A4            ; |116| 
           MVKL    .S2     RL10,B3           ; |116| 
           MVKH    .S2     RL10,B3           ; |116| 
           NOP             2
RL10:      ; CALL OCCURS                     ; |116| 
           MVKL    .S1     _TINTCnt,A0       ; |119| 
           MVKH    .S1     _TINTCnt,A0       ; |119| 
           LDW     .D1T1   *A0,A3            ; |119| 
           MVKL    .S1     _TFlag,A4         ; |120| 
           MVK     .S2     1,B4              ; |120| 
           MVKH    .S1     _TFlag,A4         ; |120| 
           NOP             1
           ADD     .D1     1,A3,A3           ; |119| 
           STW     .D1T1   A3,*A0            ; |119| 
           STW     .D1T2   B4,*A4            ; |120| 
           LDW     .D2T2   *+SP(136),B10     ; |121| 
           LDW     .D2T2   *+SP(132),B9      ; |121| 
           LDW     .D2T2   *+SP(128),B8      ; |121| 
           LDW     .D2T2   *+SP(104),B2      ; |121| 
           LDW     .D2T2   *+SP(100),B1      ; |121| 
           LDW     .D2T2   *+SP(96),B0       ; |121| 
           LDW     .D2T1   *+SP(92),A12      ; |121| 
           LDW     .D2T1   *+SP(88),A11      ; |121| 
           LDW     .D2T1   *+SP(84),A10      ; |121| 
           LDW     .D2T1   *+SP(80),A9       ; |121| 
           LDW     .D2T1   *+SP(76),A8       ; |121| 
           LDW     .D2T1   *+SP(72),A7       ; |121| 
           LDW     .D2T1   *+SP(64),A5       ; |121| 
           LDW     .D2T1   *+SP(52),A2       ; |121| 
           LDW     .D2T1   *+SP(48),A1       ; |121| 
           LDW     .D2T2   *+SP(116),B5      ; |121| 
           LDW     .D2T2   *+SP(124),B7      ; |121| 
           LDW     .D2T2   *+SP(108),B3      ; |121| 
           LDW     .D2T2   *+SP(120),B6      ; |121| 
           LDW     .D2T1   *+SP(68),A6       ; |121| 
           LDW     .D2T1   *+SP(56),A3       ; |121| 
           LDW     .D2T1   *+SP(44),A0       ; |121| 

           B       .S2     IRP               ; |121| 
||         LDW     .D2T2   *+SP(112),B4      ; |121| 

           LDW     .D2T1   *+SP(60),A4       ; |121| 
           ADDK    .S2     136,SP            ; |121| 
           NOP             3
           ; BRANCH OCCURS                   ; |121| 


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
