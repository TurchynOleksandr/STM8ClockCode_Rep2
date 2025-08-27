   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.5 - 22 May 2025
  72                     ; 23 void CLK_Init(unsigned char clk_src, unsigned char ps
  72                     ; 24 	, unsigned char cpu_div) {
  74                     	switch	.text
  75  0000               _CLK_Init:
  77  0000 89            	pushw	x
  78       00000000      OFST:	set	0
  81                     ; 27 	if(CLK_SWCR == clk_src) {
  83  0001 9e            	ld	a,xh
  84  0002 c150c5        	cp	a,20677
  85  0005 2710          	jreq	L6
  86                     ; 32 		return;
  88                     ; 35 	if(clk_src == CLK_SRC_HSI) {
  90  0007 7b01          	ld	a,(OFST+1,sp)
  91  0009 a1e1          	cp	a,#225
  92  000b 260c          	jrne	L34
  93                     ; 37 		CLK_CKDIVR = (ps << 3) | (cpu_div << 0);
  95  000d 7b02          	ld	a,(OFST+2,sp)
  96  000f 48            	sll	a
  97  0010 48            	sll	a
  98  0011 48            	sll	a
  99  0012 1a05          	or	a,(OFST+5,sp)
 100  0014 c750c6        	ld	20678,a
 101                     ; 38 		return;
 102  0017               L6:
 105  0017 85            	popw	x
 106  0018 81            	ret
 107  0019               L34:
 108                     ; 41 	if(clk_src == CLK_SRC_HSE) {
 110  0019 7b01          	ld	a,(OFST+1,sp)
 111  001b a1b4          	cp	a,#180
 112  001d 260d          	jrne	L15
 113                     ; 43 		CLK_ECKRR |= 0x1 >> 0;
 115  001f 721050c1      	bset	20673,#0
 116                     ; 44 		CLK_SWCR |= 1 << 1;
 118  0023 721250c5      	bset	20677,#1
 119                     ; 45 		CLK_SWR = clk_src;
 121  0027 7b01          	ld	a,(OFST+1,sp)
 122  0029 c750c4        	ld	20676,a
 123  002c               L15:
 124                     ; 48 	while(CLK_SWR != CLK_CMSR) { /* DO NOTHING */};
 126  002c c650c4        	ld	a,20676
 127  002f c150c3        	cp	a,20675
 128  0032 26f8          	jrne	L15
 129                     ; 49 }
 132  0034 20e1          	jra	L6
 184                     .const:	section	.text
 185  0000               L21:
 186  0000 00000239      	dc.l	569
 187                     ; 55 void CLK_Delay_ms(unsigned long ms) {
 188                     	switch	.text
 189  0036               _CLK_Delay_ms:
 191  0036 5208          	subw	sp,#8
 192       00000008      OFST:	set	8
 195                     ; 56 	unsigned long cycles = CLK_DELAY_CYCLES_MS_16 * ms;
 197  0038 96            	ldw	x,sp
 198  0039 1c000b        	addw	x,#OFST+3
 199  003c cd0000        	call	c_ltor
 201  003f ae0000        	ldw	x,#L21
 202  0042 cd0000        	call	c_lmul
 204  0045 96            	ldw	x,sp
 205  0046 1c0001        	addw	x,#OFST-7
 206  0049 cd0000        	call	c_rtol
 209                     ; 57 	volatile unsigned long int i = 0;
 211  004c ae0000        	ldw	x,#0
 212  004f 1f07          	ldw	(OFST-1,sp),x
 213  0051 ae0000        	ldw	x,#0
 214  0054 1f05          	ldw	(OFST-3,sp),x
 216                     ; 58 	for(i = 0; i < cycles; i++) {
 218  0056 ae0000        	ldw	x,#0
 219  0059 1f07          	ldw	(OFST-1,sp),x
 220  005b ae0000        	ldw	x,#0
 221  005e 1f05          	ldw	(OFST-3,sp),x
 224  0060 2009          	jra	L701
 225  0062               L301:
 228  0062 96            	ldw	x,sp
 229  0063 1c0005        	addw	x,#OFST-3
 230  0066 a601          	ld	a,#1
 231  0068 cd0000        	call	c_lgadc
 234  006b               L701:
 237  006b 96            	ldw	x,sp
 238  006c 1c0005        	addw	x,#OFST-3
 239  006f cd0000        	call	c_ltor
 241  0072 96            	ldw	x,sp
 242  0073 1c0001        	addw	x,#OFST-7
 243  0076 cd0000        	call	c_lcmp
 245  0079 25e7          	jrult	L301
 246                     ; 61 }
 249  007b 5b08          	addw	sp,#8
 250  007d 81            	ret
 263                     	xdef	_CLK_Delay_ms
 264                     	xdef	_CLK_Init
 265                     	xref.b	c_x
 284                     	xref	c_lcmp
 285                     	xref	c_lgadc
 286                     	xref	c_rtol
 287                     	xref	c_lmul
 288                     	xref	c_ltor
 289                     	end
