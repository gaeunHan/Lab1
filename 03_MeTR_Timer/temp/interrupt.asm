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


	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_prevErr+0,32
	.word	000000000h		; _prevErr @ 0
	.sect	".text"
	.global	_prevErr
_prevErr:	.usect	.far,4,4

	.sect	".cinit"
	.align	8
	.field  	4,32
	.field  	_sumErr+0,32
	.word	000000000h		; _sumErr @ 0
	.sect	".text"
	.global	_sumErr
_sumErr:	.usect	.far,4,4

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
	.field  	_TFlag+0,32
	.field  	0,32			; _TFlag @ 0
	.sect	".text"
	.global	_TFlag
_TFlag:	.usect	.far,4,4
;	acp6x -q -D_FAR_RTS=1 --large_model=3 --version=6701 -m --i_output_file C:\Users\hge42\AppData\Local\Temp\TI20924_2 --template_info_file C:\Users\hge42\AppData\Local\Temp\TI20924_3 --object_file interrupt.obj --opt_shell 9 interrupt.c -as -k -mr1 -ml3 -q -fstemp -fftemp -mv6701 interrupt.c 
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
	.global	_PID

;******************************************************************************
;* FUNCTION NAME: _PID                                                        *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,B0,B1,B2,B3,B4,B5,B6,  *
;*                           B7,B8,B9,SP                                      *
;*   Local Frame Size  : 0 Args + 16 Auto + 4 Save = 20 byte                  *
;******************************************************************************
_PID:
;** --------------------------------------------------------------------------*

           MVKL    .S2     _GetAngle,B6      ; |75| 
||         MV      .S1X    B6,A0             ; |66| 

           MVKH    .S2     _GetAngle,B6      ; |75| 
           B       .S2     B6                ; |75| 
           STW     .D2T2   B3,*SP--(24)      ; |66| 
           STW     .D2T1   A6,*+SP(12)       ; |66| 

           STW     .D2T2   B4,*+SP(8)        ; |66| 
||         MV      .S2X    A4,B5             ; |66| 

           STW     .D2T2   B5,*+SP(4)        ; |66| 
||         MVKL    .S2     RL2,B3            ; |75| 

           STW     .D2T1   A0,*+SP(16)       ; |66| 
||         MVKH    .S2     RL2,B3            ; |75| 

RL2:       ; CALL OCCURS                     ; |75| 
           LDW     .D2T1   *+SP(8),A0        ; |75| 
           ZERO    .D2     B6                ; |82| 
           NOP             3
           STW     .D1T1   A4,*A0            ; |75| 
           LDW     .D2T1   *+SP(8),A0        ; |78| 
           LDW     .D2T2   *+SP(4),B4        ; |78| 
           LDW     .D2T2   *+SP(12),B5       ; |78| 
           NOP             2
           LDW     .D1T1   *A0,A0            ; |78| 
           NOP             4
           SUBSP   .L2X    B4,A0,B4          ; |78| 
           NOP             3
           STW     .D2T2   B4,*B5            ; |78| 
           LDW     .D2T1   *+SP(12),A3       ; |81| 
           MVKL    .S2     _sumErr,B4        ; |81| 
           MVKH    .S2     _sumErr,B4        ; |81| 
           MV      .S1X    B4,A0             ; |81| 
           LDW     .D1T2   *A0,B4            ; |81| 
           LDW     .D1T1   *A3,A3            ; |81| 
           MVKL    .S2     _sumErr,B5        ; |82| 
           MVKH    .S2     _sumErr,B5        ; |82| 
           NOP             2
           ADDSP   .L2X    A3,B4,B4          ; |81| 
           NOP             3
           STW     .D1T2   B4,*A0            ; |81| 
           LDW     .D2T1   *+SP(12),A3       ; |82| 
           MVKL    .S1     _prevErr,A0       ; |82| 
           MVKH    .S1     _prevErr,A0       ; |82| 
           LDW     .D1T1   *A0,A4            ; |82| 
           LDW     .D2T2   *B5,B5            ; |82| 

           LDW     .D1T1   *A3,A3            ; |82| 
||         MV      .L2X    A3,B4             ; |82| 

           LDW     .D2T2   *B4,B4            ; |82| 
           MVKL    .S1     0x3e99999a,A0     ; |82| 
           MVKH    .S1     0x3e99999a,A0     ; |82| 
           NOP             1
           SUBSP   .L1     A3,A4,A3          ; |82| 

           MPYSP   .M1X    B4,A0,A0          ; |82| 
||         MPYSP   .M2     B5,B6,B5          ; |82| 

           MVKL    .S2     0x3e99999a,B4     ; |82| 
           MVKH    .S2     0x3e99999a,B4     ; |82| 
           MPYSP   .M1X    A3,B4,A3          ; |82| 
           ADDSP   .L1X    B5,A0,A0          ; |82| 
           LDW     .D2T2   *+SP(16),B4       ; |82| 
           NOP             2
           ADDSP   .L1     A3,A0,A0          ; |82| 
           NOP             3
           STW     .D2T1   A0,*B4            ; |82| 
           LDW     .D2T1   *+SP(12),A0       ; |83| 
           NOP             4
           LDW     .D1T1   *A0,A3            ; |83| 
           MVKL    .S1     _prevErr,A0       ; |83| 
           MVKH    .S1     _prevErr,A0       ; |83| 
           NOP             2
           STW     .D1T1   A3,*A0            ; |83| 
           LDW     .D2T2   *++SP(24),B3      ; |84| 
           NOP             4
           B       .S2     B3                ; |84| 
           NOP             5
           ; BRANCH OCCURS                   ; |84| 


	.sect	".text"
	.global	_ISRtimer0

;******************************************************************************
;* FUNCTION NAME: _ISRtimer0                                                  *
;*                                                                            *
;*   Regs Modified     : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,SP                            *
;*   Regs Used         : A0,A1,A2,A3,A4,A5,A6,A7,A8,A9,A10,A11,B0,B1,B2,B3,B4,*
;*                           B5,B6,B7,B8,B9,B10,SP                            *
;*   Local Frame Size  : 32 Args + 32 Auto + 96 Save = 160 byte               *
;******************************************************************************
_ISRtimer0:
;** --------------------------------------------------------------------------*
           ADDK    .S2     -160,SP           ; |91| 
           STW     .D2T2   B4,*+SP(136)      ; |91| 
           STW     .D2T2   B5,*+SP(140)      ; |91| 
           STW     .D2T1   A0,*+SP(72)       ; |91| 
           STW     .D2T1   A6,*+SP(96)       ; |91| 
           STW     .D2T2   B3,*+SP(132)      ; |91| 
           STW     .D2T1   A4,*+SP(88)       ; |91| 
           STW     .D2T2   B8,*+SP(152)      ; |91| 
           STW     .D2T2   B7,*+SP(148)      ; |91| 
           STW     .D2T2   B6,*+SP(144)      ; |91| 
           STW     .D2T2   B2,*+SP(128)      ; |91| 
           STW     .D2T2   B1,*+SP(124)      ; |91| 
           STW     .D2T2   B0,*+SP(120)      ; |91| 
           STW     .D2T1   A11,*+SP(116)     ; |91| 
           STW     .D2T1   A10,*+SP(112)     ; |91| 
           STW     .D2T1   A9,*+SP(108)      ; |91| 
           STW     .D2T1   A8,*+SP(104)      ; |91| 
           STW     .D2T1   A7,*+SP(100)      ; |91| 

           STW     .D2T1   A5,*+SP(92)       ; |91| 
||         ZERO    .S2     B4                ; |94| 

           STW     .D2T1   A3,*+SP(84)       ; |91| 
||         MVKH    .S2     0x40a00000,B4     ; |94| 
||         ZERO    .L2     B5                ; |94| 

           STW     .D2T2   B4,*+SP(60)       ; |94| 
||         MVKH    .S2     0x40400000,B5     ; |94| 

           STW     .D2T2   B5,*+SP(56)       ; |94| 
||         MVKL    .S1     _GetRefAngle,A0   ; |98| 

           STW     .D2T1   A2,*+SP(80)       ; |91| 
||         MVKH    .S1     _GetRefAngle,A0   ; |98| 

           B       .S2X    A0                ; |98| 
||         LDW     .D2T1   *+SP(60),A6       ; |98| 

           LDW     .D2T2   *+SP(56),B4       ; |98| 
           STW     .D2T1   A1,*+SP(76)       ; |91| 

           ZERO    .L2     B5                ; |93| 
||         MVKL    .S2     RL6,B3            ; |98| 
||         STW     .D2T2   B9,*+SP(156)      ; |91| 

           MVKH    .S2     0x43340000,B5     ; |93| 
||         STW     .D2T2   B10,*+SP(160)     ; |91| 

           MV      .S1X    B5,A4             ; |98| 
||         STW     .D2T2   B5,*+SP(52)       ; |93| 
||         MVKH    .S2     RL6,B3            ; |98| 

RL6:       ; CALL OCCURS                     ; |98| 
           MVKL    .S2     _PID,B5           ; |101| 
           MVKH    .S2     _PID,B5           ; |101| 
           B       .S2     B5                ; |101| 
           ADDAD   .D2     SP,5,B7           ; |101| 
           ADDAW   .D2     SP,11,B6          ; |101| 
           ADDAW   .D2     SP,9,B4           ; |101| 
           MVKL    .S2     RL8,B3            ; |101| 

           MV      .S1X    B7,A6             ; |101| 
||         STW     .D2T1   A4,*+SP(64)       ; |98| 
||         MVKH    .S2     RL8,B3            ; |101| 

RL8:       ; CALL OCCURS                     ; |101| 
           MVKL    .S2     _PWMOut,B4        ; |104| 
           MVKH    .S2     _PWMOut,B4        ; |104| 
           B       .S2     B4                ; |104| 
           LDW     .D2T1   *+SP(44),A4       ; |104| 
           MVKL    .S2     RL10,B3           ; |104| 
           MVKH    .S2     RL10,B3           ; |104| 
           NOP             2
RL10:      ; CALL OCCURS                     ; |104| 

           STW     .D2T1   A4,*+SP(48)       ; |104| 
||         MVKL    .S1     _UMAddData,A0     ; |106| 

           LDW     .D2T1   *+SP(52),A4       ; |106| 
||         MV      .S2X    A4,B6             ; |104| 
||         MVKH    .S1     _UMAddData,A0     ; |106| 

           LDW     .D2T1   *+SP(44),A6       ; |106| 
||         B       .S2X    A0                ; |106| 

           LDW     .D2T2   *+SP(36),B4       ; |106| 
           MVKL    .S2     RL12,B3           ; |106| 
           MVKH    .S2     RL12,B3           ; |106| 
           NOP             2
RL12:      ; CALL OCCURS                     ; |106| 
           MVKL    .S1     _TINTCnt,A0       ; |109| 
           MVKH    .S1     _TINTCnt,A0       ; |109| 
           LDW     .D1T1   *A0,A3            ; |109| 
           MVKL    .S2     _sprintf,B8       ; |113| 
           MVKL    .S2     _timerCheckCnt,B7 ; |113| 
           MVKH    .S2     _sprintf,B8       ; |113| 
           MVKL    .S2     _tmp_string,B6    ; |113| 

           MVKL    .S1     _TINTCnt,A3       ; |110| 
||         ADD     .D1     1,A3,A4           ; |109| 

           MVKH    .S1     _TINTCnt,A3       ; |110| 
||         STW     .D1T1   A4,*A0            ; |109| 

           LDW     .D1T1   *A3,A4            ; |110| 
           MVKL    .S2     _Report,B10       ; |113| 
           MVK     .S2     2000,B4           ; |110| 
           MVKL    .S2     SL1+0,B5          ; |113| 
           MVKH    .S2     _timerCheckCnt,B7 ; |113| 
           CMPLTU  .L2X    A4,B4,B0          ; |110| 
   [ B0]   B       .S1     L10               ; |110| 
           MVKH    .S2     _tmp_string,B6    ; |113| 

           MVKH    .S2     _Report,B10       ; |113| 
||         MVKL    .S1     _TINTCnt,A3       ; |111| 

           MVKH    .S2     SL1+0,B5          ; |113| 
||         MVKH    .S1     _TINTCnt,A3       ; |111| 

           MV      .L1X    B6,A4             ; |113| 
||         MVKL    .S2     RL14,B3           ; |113| 
||         ZERO    .D1     A10               ; |116| 
||         MVKL    .S1     0x40668000,A11    ; |116| 

           MV      .L1X    B7,A0             ; |113| 
||         MVKH    .S2     RL14,B3           ; |113| 
||         MVKH    .S1     0x40668000,A11    ; |116| 
||         ZERO    .D1     A5                ; |111| 
|| [ B0]   LDW     .D2T2   *+SP(156),B9      ; |124| 

           ; BRANCH OCCURS                   ; |110| 
;** --------------------------------------------------------------------------*
           STW     .D1T1   A5,*A3            ; |111| 
           STW     .D2T2   B5,*+SP(4)        ; |113| 
           LDW     .D1T1   *A0,A3            ; |113| 
           NOP             1
           B       .S2     B8                ; |113| 
           NOP             2
           ADD     .D1     1,A3,A5           ; |113| 
           STW     .D1T1   A5,*A0            ; |113| 
           STW     .D2T1   A3,*+SP(8)        ; |113| 
RL14:      ; CALL OCCURS                     ; |113| 
           B       .S2     B10               ; |113| 
           MVKL    .S2     RL16,B3           ; |113| 
           MVKH    .S2     RL16,B3           ; |113| 
           NOP             3
RL16:      ; CALL OCCURS                     ; |113| 
           LDW     .D2T2   *+SP(52),B5       ; |116| 
           ZERO    .D2     B8                ; |116| 
           NOP             3
           SPDP    .S1X    B5,A1:A0          ; |116| 
           MV      .D2     B5,B4             ; |116| 
           CMPEQDP .S1     A1:A0,A11:A10,A1  ; |116| 
           ZERO    .L2     B7:B6             ; |117| 
   [ A1]   B       .S1     L9                ; |116| 
   [ A1]   STW     .D2T2   B8,*+SP(52)       ; |116| 
           SPDP    .S2     B4,B5:B4          ; |117| 
   [!A1]   ZERO    .D1     A0                ; |117| 
           CMPEQDP .S2     B5:B4,B7:B6,B0    ; |117| 
   [ A1]   MVKL    .S1     _sprintf,A6       ; |120| 
           ; BRANCH OCCURS                   ; |116| 
;** --------------------------------------------------------------------------*
           MVKH    .S1     0x43340000,A0     ; |117| 
   [ B0]   STW     .D2T1   A0,*+SP(52)       ; |117| 
           MVKL    .S1     _sprintf,A6       ; |120| 
;** --------------------------------------------------------------------------*
L9:    
           MVKL    .S1     0x33333333,A0     ; |120| 

           MVKL    .S1     0x3fd33333,A5     ; |120| 
||         ZERO    .L2     B5:B4             ; |120| 

           MVKL    .S2     RL18,B3           ; |120| 
||         STW     .D2T2   B4,*+SP(24)       ; |120| 
||         MVKH    .S1     _sprintf,A6       ; |120| 

           B       .S2X    A6                ; |120| 
||         STW     .D2T2   B5,*+SP(28)       ; |120| 
||         MVKH    .S1     0x33333333,A0     ; |120| 

           STW     .D2T1   A0,*+SP(16)       ; |120| 
||         MVKL    .S2     SL2+0,B4          ; |120| 
||         MVKH    .S1     0x3fd33333,A5     ; |120| 

           STW     .D2T1   A5,*+SP(20)       ; |120| 
||         MVKH    .S2     SL2+0,B4          ; |120| 
||         MVKL    .S1     0x33333333,A3     ; |120| 

           MVKL    .S2     0x3fd33333,B4     ; |120| 
||         STW     .D2T2   B4,*+SP(4)        ; |120| 
||         MVKH    .S1     0x33333333,A3     ; |120| 

           MVKH    .S2     0x3fd33333,B4     ; |120| 
||         STW     .D2T1   A3,*+SP(8)        ; |120| 
||         MVKL    .S1     _tmp_string,A4    ; |120| 

           STW     .D2T2   B4,*+SP(12)       ; |120| 
||         MVKH    .S2     RL18,B3           ; |120| 
||         MVKH    .S1     _tmp_string,A4    ; |120| 

RL18:      ; CALL OCCURS                     ; |120| 
           MVKL    .S2     _Report,B4        ; |120| 
           MVKH    .S2     _Report,B4        ; |120| 
           B       .S2     B4                ; |120| 
           MVKL    .S2     RL20,B3           ; |120| 
           MVKH    .S2     RL20,B3           ; |120| 
           NOP             3
RL20:      ; CALL OCCURS                     ; |120| 
           MVKL    .S1     _GetAngle,A0      ; |121| 
           MVKH    .S1     _GetAngle,A0      ; |121| 
           B       .S2X    A0                ; |121| 
           MVKL    .S2     RL24,B3           ; |121| 
           MVKH    .S2     RL24,B3           ; |121| 
           NOP             3
RL24:      ; CALL OCCURS                     ; |121| 
           MVKL    .S1     SL3+0,A0          ; |121| 

           MVKH    .S1     SL3+0,A0          ; |121| 
||         MVKL    .S2     _timerCheckCnt,B4 ; |121| 

           MVKH    .S2     _timerCheckCnt,B4 ; |121| 
||         STW     .D2T1   A0,*+SP(4)        ; |121| 

           LDW     .D2T2   *B4,B5            ; |121| 
||         SPDP    .S2X    A4,B9:B8          ; |121| 

           NOP             1

           MVKL    .S2     _sprintf,B8       ; |121| 
||         MV      .D2     B8,B7             ; |121| 

           MVKH    .S2     _sprintf,B8       ; |121| 
           B       .S2     B8                ; |121| 
           ADD     .D2     1,B5,B1           ; |121| 

           STW     .D2T2   B1,*B4            ; |121| 
||         MV      .L2     B9,B6             ; |121| 
||         MVKL    .S2     _tmp_string,B0    ; |121| 

           STW     .D2T2   B6,*+SP(20)       ; |121| 
||         MVKL    .S2     RL26,B3           ; |121| 

           STW     .D2T2   B7,*+SP(16)       ; |121| 
||         MVKH    .S2     _tmp_string,B0    ; |121| 

           MVKH    .S2     RL26,B3           ; |121| 
||         STW     .D2T2   B5,*+SP(8)        ; |121| 
||         MV      .S1X    B0,A4             ; |121| 

RL26:      ; CALL OCCURS                     ; |121| 
           MVKL    .S1     _Report,A0        ; |121| 
           MVKH    .S1     _Report,A0        ; |121| 
           B       .S2X    A0                ; |121| 
           MVKL    .S2     RL28,B3           ; |121| 
           MVKH    .S2     RL28,B3           ; |121| 
           NOP             3
RL28:      ; CALL OCCURS                     ; |121| 
           MVKL    .S2     SL4+0,B4          ; |122| 

           MVKH    .S2     SL4+0,B4          ; |122| 
||         MVKL    .S1     _timerCheckCnt,A0 ; |122| 

           STW     .D2T2   B4,*+SP(4)        ; |122| 
||         MVKH    .S1     _timerCheckCnt,A0 ; |122| 

           LDW     .D1T1   *A0,A3            ; |122| 
           MVKL    .S2     RL30,B3           ; |122| 
           MVKH    .S2     RL30,B3           ; |122| 
           NOP             2
           ADD     .D1     1,A3,A4           ; |122| 

           MVKL    .S1     0x200020c,A0      ; |122| 
||         STW     .D1T1   A4,*A0            ; |122| 

           MVKL    .S1     _sprintf,A3       ; |122| 
||         STW     .D2T1   A3,*+SP(8)        ; |122| 

           MVKH    .S1     0x200020c,A0      ; |122| 

           MVKH    .S1     _sprintf,A3       ; |122| 
||         LDW     .D1T1   *A0,A0            ; |122| 

           B       .S2X    A3                ; |122| 
           NOP             2
           MVKL    .S1     _tmp_string,A4    ; |122| 
           EXTU    .S1     A0,16,16,A0       ; |122| 

           STW     .D2T1   A0,*+SP(12)       ; |122| 
||         MVKH    .S1     _tmp_string,A4    ; |122| 

RL30:      ; CALL OCCURS                     ; |122| 
           MVKL    .S2     _Report,B4        ; |122| 
           MVKH    .S2     _Report,B4        ; |122| 
           B       .S2     B4                ; |122| 
           MVKL    .S2     RL32,B3           ; |122| 
           MVKH    .S2     RL32,B3           ; |122| 
           NOP             3
RL32:      ; CALL OCCURS                     ; |122| 
           LDW     .D2T2   *+SP(156),B9      ; |124| 
;** --------------------------------------------------------------------------*
L10:    
           LDW     .D2T2   *+SP(152),B8      ; |124| 
           LDW     .D2T2   *+SP(148),B7      ; |124| 
           LDW     .D2T2   *+SP(144),B6      ; |124| 
           LDW     .D2T2   *+SP(140),B5      ; |124| 
           LDW     .D2T2   *+SP(136),B4      ; |124| 
           LDW     .D2T2   *+SP(132),B3      ; |124| 
           LDW     .D2T2   *+SP(128),B2      ; |124| 
           LDW     .D2T2   *+SP(124),B1      ; |124| 
           LDW     .D2T2   *+SP(120),B0      ; |124| 
           LDW     .D2T1   *+SP(116),A11     ; |124| 
           LDW     .D2T1   *+SP(112),A10     ; |124| 
           LDW     .D2T1   *+SP(108),A9      ; |124| 
           LDW     .D2T1   *+SP(104),A8      ; |124| 
           LDW     .D2T1   *+SP(100),A7      ; |124| 
           LDW     .D2T1   *+SP(96),A6       ; |124| 
           LDW     .D2T1   *+SP(92),A5       ; |124| 
           LDW     .D2T1   *+SP(88),A4       ; |124| 
           LDW     .D2T1   *+SP(84),A3       ; |124| 
           LDW     .D2T1   *+SP(80),A2       ; |124| 
           LDW     .D2T1   *+SP(76),A1       ; |124| 

           B       .S2     IRP               ; |124| 
||         LDW     .D2T2   *+SP(160),B10     ; |124| 

           LDW     .D2T1   *+SP(72),A0       ; |124| 
           ADDK    .S2     160,SP            ; |124| 
           NOP             3
           ; BRANCH OCCURS                   ; |124| 


;******************************************************************************
;* STRINGS                                                                    *
;******************************************************************************
	.sect	".const"
SL1:	.string	"Timer Check: %d ",13,10,0
SL2:	.string	"current kp, kd, ki: %.2f, %.2f, %.2f",13,10,0
SL3:	.string	"Timer Check: %d %6.2f ",13,10,0
SL4:	.string	"Timer Check: %d 0x%04x ",13,10,0
;******************************************************************************
;* UNDEFINED EXTERNAL REFERENCES                                              *
;******************************************************************************
	.global	_sprintf
	.global	_SendByte
	.global	_Report
	.global	_PWMOut
	.global	_GetAngle
	.global	_GetRefAngle
	.global	_UMAddData
	.global	_compacket
	.global	_respacket
	.global	_tmp_string
	.global	_TINTCnt
