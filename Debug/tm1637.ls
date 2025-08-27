   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.5 - 22 May 2025
  15                     .const:	section	.text
  16  0000               _cDigit2Seg:
  17  0000 3f            	dc.b	63
  18  0001 06            	dc.b	6
  19  0002 5b            	dc.b	91
  20  0003 4f            	dc.b	79
  21  0004 66            	dc.b	102
  22  0005 6d            	dc.b	109
  23  0006 7d            	dc.b	125
  24  0007 07            	dc.b	7
  25  0008 7f            	dc.b	127
  26  0009 6f            	dc.b	111
  67                     ; 51 void usleep(int milliseconds)
  67                     ; 52 {
  69                     	switch	.text
  70  0000               _usleep:
  74                     ; 53 	CLK_Delay_ms(milliseconds);
  76  0000 cd0000        	call	c_itolx
  78  0003 be02          	ldw	x,c_lreg+2
  79  0005 89            	pushw	x
  80  0006 be00          	ldw	x,c_lreg
  81  0008 89            	pushw	x
  82  0009 cd0000        	call	_CLK_Delay_ms
  84  000c 5b04          	addw	sp,#4
  85                     ; 54 }
  88  000e 81            	ret
 157                     ; 59 int tm1637Init(gpio_port_t bClock, gpio_pin_t bClockP, gpio_port_t bData, gpio_pin_t bDataP)
 157                     ; 60 {
 158                     	switch	.text
 159  000f               _tm1637Init:
 161  000f 89            	pushw	x
 162       00000000      OFST:	set	0
 165                     ; 61 	bClockPort = bClock;
 167  0010 bf02          	ldw	L32_bClockPort,x
 168                     ; 62 	bDataPort = bData;
 170  0012 1e06          	ldw	x,(OFST+6,sp)
 171  0014 bf00          	ldw	L52_bDataPort,x
 172                     ; 63 	bClockPin = bClockP;
 174  0016 7b05          	ld	a,(OFST+5,sp)
 175  0018 b705          	ld	L71_bClockPin,a
 176                     ; 64 	bDataPin = bDataP;
 178  001a 7b08          	ld	a,(OFST+8,sp)
 179  001c b704          	ld	L12_bDataPin,a
 180                     ; 65 	GPIO_Config_Pin(bClockPort, bClockPin, PIN_MODE_OUTPUT_PP);
 182  001e 4b06          	push	#6
 183  0020 3b0005        	push	L71_bClockPin
 184  0023 be02          	ldw	x,L32_bClockPort
 185  0025 cd0000        	call	_GPIO_Config_Pin
 187  0028 85            	popw	x
 188                     ; 66 	GPIO_Config_Pin(bDataPort, bDataPin, PIN_MODE_OUTPUT_PP);
 190  0029 4b06          	push	#6
 191  002b 3b0004        	push	L12_bDataPin
 192  002e be00          	ldw	x,L52_bDataPort
 193  0030 cd0000        	call	_GPIO_Config_Pin
 195  0033 85            	popw	x
 196                     ; 67 	GPIO_Set_Pin_Low(bClockPort, bClockPin);
 198  0034 3b0005        	push	L71_bClockPin
 199  0037 be02          	ldw	x,L32_bClockPort
 200  0039 cd0000        	call	_GPIO_Set_Pin_Low
 202  003c 84            	pop	a
 203                     ; 68 	GPIO_Set_Pin_Low(bDataPort, bDataPin);
 205  003d 3b0004        	push	L12_bDataPin
 206  0040 be00          	ldw	x,L52_bDataPort
 207  0042 cd0000        	call	_GPIO_Set_Pin_Low
 209  0045 84            	pop	a
 210                     ; 69 	return 0;
 212  0046 5f            	clrw	x
 215  0047 5b02          	addw	sp,#2
 216  0049 81            	ret
 246                     ; 75 static void tm1637Start(void)
 246                     ; 76 {
 247                     	switch	.text
 248  004a               L3_tm1637Start:
 252                     ; 77 	GPIO_Set_Pin_High(bDataPort, bDataPin);
 254  004a 3b0004        	push	L12_bDataPin
 255  004d be00          	ldw	x,L52_bDataPort
 256  004f cd0000        	call	_GPIO_Set_Pin_High
 258  0052 84            	pop	a
 259                     ; 78 	GPIO_Set_Pin_High(bClockPort, bClockPin);
 261  0053 3b0005        	push	L71_bClockPin
 262  0056 be02          	ldw	x,L32_bClockPort
 263  0058 cd0000        	call	_GPIO_Set_Pin_High
 265  005b 84            	pop	a
 266                     ; 79 	usleep(CLOCK_DELAY);
 268  005c 5f            	clrw	x
 269  005d ada1          	call	_usleep
 271                     ; 80 	GPIO_Set_Pin_Low(bDataPort, bDataPin);
 273  005f 3b0004        	push	L12_bDataPin
 274  0062 be00          	ldw	x,L52_bDataPort
 275  0064 cd0000        	call	_GPIO_Set_Pin_Low
 277  0067 84            	pop	a
 278                     ; 81 }
 281  0068 81            	ret
 311                     ; 86 static void tm1637Stop(void)
 311                     ; 87 {
 312                     	switch	.text
 313  0069               L5_tm1637Stop:
 317                     ; 89 	GPIO_Set_Pin_Low(bClockPort, bClockPin);
 319  0069 3b0005        	push	L71_bClockPin
 320  006c be02          	ldw	x,L32_bClockPort
 321  006e cd0000        	call	_GPIO_Set_Pin_Low
 323  0071 84            	pop	a
 324                     ; 90 	usleep(CLOCK_DELAY);
 326  0072 5f            	clrw	x
 327  0073 ad8b          	call	_usleep
 329                     ; 92 	GPIO_Set_Pin_Low(bDataPort, bDataPin);
 331  0075 3b0004        	push	L12_bDataPin
 332  0078 be00          	ldw	x,L52_bDataPort
 333  007a cd0000        	call	_GPIO_Set_Pin_Low
 335  007d 84            	pop	a
 336                     ; 93 	usleep(CLOCK_DELAY);
 338  007e 5f            	clrw	x
 339  007f cd0000        	call	_usleep
 341                     ; 95 	GPIO_Set_Pin_High(bClockPort, bClockPin);
 343  0082 3b0005        	push	L71_bClockPin
 344  0085 be02          	ldw	x,L32_bClockPort
 345  0087 cd0000        	call	_GPIO_Set_Pin_High
 347  008a 84            	pop	a
 348                     ; 96 	usleep(CLOCK_DELAY);
 350  008b 5f            	clrw	x
 351  008c cd0000        	call	_usleep
 353                     ; 98 	GPIO_Set_Pin_High(bDataPort, bDataPin);
 355  008f 3b0004        	push	L12_bDataPin
 356  0092 be00          	ldw	x,L52_bDataPort
 357  0094 cd0000        	call	_GPIO_Set_Pin_High
 359  0097 84            	pop	a
 360                     ; 99 } 
 363  0098 81            	ret
 402                     ; 104 static unsigned char tm1637GetAck(void)
 402                     ; 105 {
 403                     	switch	.text
 404  0099               L7_tm1637GetAck:
 406  0099 88            	push	a
 407       00000001      OFST:	set	1
 410                     ; 106 	unsigned char bAck = 1;
 412  009a a601          	ld	a,#1
 413  009c 6b01          	ld	(OFST+0,sp),a
 415                     ; 110 	GPIO_Set_Pin_Low(bClockPort, bClockPin);
 417  009e 3b0005        	push	L71_bClockPin
 418  00a1 be02          	ldw	x,L32_bClockPort
 419  00a3 cd0000        	call	_GPIO_Set_Pin_Low
 421  00a6 84            	pop	a
 422                     ; 113 	usleep(CLOCK_DELAY);
 424  00a7 5f            	clrw	x
 425  00a8 cd0000        	call	_usleep
 427                     ; 116 	GPIO_Set_Pin_High(bClockPort, bClockPin);
 429  00ab 3b0005        	push	L71_bClockPin
 430  00ae be02          	ldw	x,L32_bClockPort
 431  00b0 cd0000        	call	_GPIO_Set_Pin_High
 433  00b3 84            	pop	a
 434                     ; 117 	usleep(CLOCK_DELAY);
 436  00b4 5f            	clrw	x
 437  00b5 cd0000        	call	_usleep
 439                     ; 119 	GPIO_Set_Pin_Low(bClockPort, bClockPin);
 441  00b8 3b0005        	push	L71_bClockPin
 442  00bb be02          	ldw	x,L32_bClockPort
 443  00bd cd0000        	call	_GPIO_Set_Pin_Low
 445  00c0 84            	pop	a
 446                     ; 120 	return bAck;
 448  00c1 7b01          	ld	a,(OFST+0,sp)
 451  00c3 5b01          	addw	sp,#1
 452  00c5 81            	ret
 502                     ; 127 static void tm1637WriteByte(unsigned char b)
 502                     ; 128 {
 503                     	switch	.text
 504  00c6               L11_tm1637WriteByte:
 506  00c6 88            	push	a
 507  00c7 88            	push	a
 508       00000001      OFST:	set	1
 511                     ; 131 	for (i=0; i<8; i++)
 513  00c8 0f01          	clr	(OFST+0,sp)
 515  00ca               L561:
 516                     ; 134 		GPIO_Set_Pin_Low(bClockPort, bClockPin);
 518  00ca 3b0005        	push	L71_bClockPin
 519  00cd be02          	ldw	x,L32_bClockPort
 520  00cf cd0000        	call	_GPIO_Set_Pin_Low
 522  00d2 84            	pop	a
 523                     ; 136 		if (b & 1) 
 525  00d3 7b02          	ld	a,(OFST+1,sp)
 526  00d5 a501          	bcp	a,#1
 527  00d7 270b          	jreq	L371
 528                     ; 137 			GPIO_Set_Pin_High(bDataPort, bDataPin);
 530  00d9 3b0004        	push	L12_bDataPin
 531  00dc be00          	ldw	x,L52_bDataPort
 532  00de cd0000        	call	_GPIO_Set_Pin_High
 534  00e1 84            	pop	a
 536  00e2 2009          	jra	L571
 537  00e4               L371:
 538                     ; 139 			GPIO_Set_Pin_Low(bDataPort, bDataPin);
 540  00e4 3b0004        	push	L12_bDataPin
 541  00e7 be00          	ldw	x,L52_bDataPort
 542  00e9 cd0000        	call	_GPIO_Set_Pin_Low
 544  00ec 84            	pop	a
 545  00ed               L571:
 546                     ; 140 		usleep(CLOCK_DELAY);
 548  00ed 5f            	clrw	x
 549  00ee cd0000        	call	_usleep
 551                     ; 142 		GPIO_Set_Pin_High(bClockPort, bClockPin);
 553  00f1 3b0005        	push	L71_bClockPin
 554  00f4 be02          	ldw	x,L32_bClockPort
 555  00f6 cd0000        	call	_GPIO_Set_Pin_High
 557  00f9 84            	pop	a
 558                     ; 143 		usleep(CLOCK_DELAY);
 560  00fa 5f            	clrw	x
 561  00fb cd0000        	call	_usleep
 563                     ; 144 		b >>= 1;
 565  00fe 0402          	srl	(OFST+1,sp)
 566                     ; 131 	for (i=0; i<8; i++)
 568  0100 0c01          	inc	(OFST+0,sp)
 572  0102 7b01          	ld	a,(OFST+0,sp)
 573  0104 a108          	cp	a,#8
 574  0106 25c2          	jrult	L561
 575                     ; 146 }
 578  0108 85            	popw	x
 579  0109 81            	ret
 645                     ; 151 static void tm1637Write(unsigned char *pData, unsigned char bLen)
 645                     ; 152 {
 646                     	switch	.text
 647  010a               L31_tm1637Write:
 649  010a 89            	pushw	x
 650  010b 89            	pushw	x
 651       00000002      OFST:	set	2
 654                     ; 154 	bAck = 1;
 656  010c a601          	ld	a,#1
 657  010e 6b01          	ld	(OFST-1,sp),a
 659                     ; 155 	tm1637Start();
 661  0110 cd004a        	call	L3_tm1637Start
 663                     ; 156 	for (b=0; b<bLen; b++)
 665  0113 0f02          	clr	(OFST+0,sp)
 668  0115 2013          	jra	L532
 669  0117               L132:
 670                     ; 158 		tm1637WriteByte(pData[b]);
 672  0117 7b02          	ld	a,(OFST+0,sp)
 673  0119 5f            	clrw	x
 674  011a 97            	ld	xl,a
 675  011b 72fb03        	addw	x,(OFST+1,sp)
 676  011e f6            	ld	a,(x)
 677  011f ada5          	call	L11_tm1637WriteByte
 679                     ; 159 		bAck &= tm1637GetAck();
 681  0121 cd0099        	call	L7_tm1637GetAck
 683  0124 1401          	and	a,(OFST-1,sp)
 684  0126 6b01          	ld	(OFST-1,sp),a
 686                     ; 156 	for (b=0; b<bLen; b++)
 688  0128 0c02          	inc	(OFST+0,sp)
 690  012a               L532:
 693  012a 7b02          	ld	a,(OFST+0,sp)
 694  012c 1107          	cp	a,(OFST+5,sp)
 695  012e 25e7          	jrult	L132
 696                     ; 161 	tm1637Stop();
 698  0130 cd0069        	call	L5_tm1637Stop
 700                     ; 162 } 
 703  0133 5b04          	addw	sp,#4
 704  0135 81            	ret
 749                     ; 167 void tm1637SetBrightness(unsigned char b)
 749                     ; 168 {
 750                     	switch	.text
 751  0136               _tm1637SetBrightness:
 753  0136 88            	push	a
 754  0137 88            	push	a
 755       00000001      OFST:	set	1
 758                     ; 170 	if (b == 0) 
 760  0138 4d            	tnz	a
 761  0139 2606          	jrne	L362
 762                     ; 172 		bControl = 0x80; 
 764  013b a680          	ld	a,#128
 765  013d 6b01          	ld	(OFST+0,sp),a
 768  013f 2011          	jra	L562
 769  0141               L362:
 770                     ; 175 		if (b > 8) b = 8;
 772  0141 7b02          	ld	a,(OFST+1,sp)
 773  0143 a109          	cp	a,#9
 774  0145 2504          	jrult	L762
 777  0147 a608          	ld	a,#8
 778  0149 6b02          	ld	(OFST+1,sp),a
 779  014b               L762:
 780                     ; 176 		bControl = 0x88 | (b - 1);
 782  014b 7b02          	ld	a,(OFST+1,sp)
 783  014d 4a            	dec	a
 784  014e aa88          	or	a,#136
 785  0150 6b01          	ld	(OFST+0,sp),a
 787  0152               L562:
 788                     ; 178 	tm1637Write(&bControl, 1);
 790  0152 4b01          	push	#1
 791  0154 96            	ldw	x,sp
 792  0155 1c0002        	addw	x,#OFST+1
 793  0158 adb0          	call	L31_tm1637Write
 795  015a 84            	pop	a
 796                     ; 179 } 
 799  015b 85            	popw	x
 800  015c 81            	ret
 874                     ; 185 void tm1637ShowDigits(char *pString)
 874                     ; 186 {
 875                     	switch	.text
 876  015d               _tm1637ShowDigits:
 878  015d 89            	pushw	x
 879  015e 5215          	subw	sp,#21
 880       00000015      OFST:	set	21
 883                     ; 191 	j = 0;
 885  0160 0f03          	clr	(OFST-18,sp)
 887                     ; 193 	bTemp[0] = 0x40;
 889  0162 a640          	ld	a,#64
 890  0164 6b05          	ld	(OFST-16,sp),a
 892                     ; 194 	tm1637Write(bTemp, 1);
 894  0166 4b01          	push	#1
 895  0168 96            	ldw	x,sp
 896  0169 1c0006        	addw	x,#OFST-15
 897  016c ad9c          	call	L31_tm1637Write
 899  016e 84            	pop	a
 900                     ; 197 	bTemp[j++] = 0xc0;
 902  016f 96            	ldw	x,sp
 903  0170 1c0005        	addw	x,#OFST-16
 904  0173 1f01          	ldw	(OFST-20,sp),x
 906  0175 7b03          	ld	a,(OFST-18,sp)
 907  0177 97            	ld	xl,a
 908  0178 0c03          	inc	(OFST-18,sp)
 910  017a 9f            	ld	a,xl
 911  017b 5f            	clrw	x
 912  017c 97            	ld	xl,a
 913  017d 72fb01        	addw	x,(OFST-20,sp)
 914  0180 a6c0          	ld	a,#192
 915  0182 f7            	ld	(x),a
 916                     ; 198 	for (i=0; i<5; i++)
 918  0183 0f15          	clr	(OFST+0,sp)
 920  0185               L723:
 921                     ; 201 		if (i == 2) 
 923  0185 7b15          	ld	a,(OFST+0,sp)
 924  0187 a102          	cp	a,#2
 925  0189 2614          	jrne	L533
 926                     ; 204 			if (pString[i] == ':')
 928  018b 7b15          	ld	a,(OFST+0,sp)
 929  018d 5f            	clrw	x
 930  018e 97            	ld	xl,a
 931  018f 72fb16        	addw	x,(OFST+1,sp)
 932  0192 f6            	ld	a,(x)
 933  0193 a13a          	cp	a,#58
 934  0195 2647          	jrne	L143
 935                     ; 207 				bTemp[2] |= 0x80;
 937  0197 7b07          	ld	a,(OFST-14,sp)
 938  0199 aa80          	or	a,#128
 939  019b 6b07          	ld	(OFST-14,sp),a
 941  019d 203f          	jra	L143
 942  019f               L533:
 943                     ; 212 			b = 0;
 945  019f 0f04          	clr	(OFST-17,sp)
 947                     ; 213 			if (pString[i] >= '0' && pString[i] <= '9')
 949  01a1 7b15          	ld	a,(OFST+0,sp)
 950  01a3 5f            	clrw	x
 951  01a4 97            	ld	xl,a
 952  01a5 72fb16        	addw	x,(OFST+1,sp)
 953  01a8 f6            	ld	a,(x)
 954  01a9 a130          	cp	a,#48
 955  01ab 251d          	jrult	L343
 957  01ad 7b15          	ld	a,(OFST+0,sp)
 958  01af 5f            	clrw	x
 959  01b0 97            	ld	xl,a
 960  01b1 72fb16        	addw	x,(OFST+1,sp)
 961  01b4 f6            	ld	a,(x)
 962  01b5 a13a          	cp	a,#58
 963  01b7 2411          	jruge	L343
 964                     ; 216 				b = cDigit2Seg[pString[i] & 0xf]; 
 966  01b9 7b15          	ld	a,(OFST+0,sp)
 967  01bb 5f            	clrw	x
 968  01bc 97            	ld	xl,a
 969  01bd 72fb16        	addw	x,(OFST+1,sp)
 970  01c0 f6            	ld	a,(x)
 971  01c1 a40f          	and	a,#15
 972  01c3 5f            	clrw	x
 973  01c4 97            	ld	xl,a
 974  01c5 d60000        	ld	a,(_cDigit2Seg,x)
 975  01c8 6b04          	ld	(OFST-17,sp),a
 977  01ca               L343:
 978                     ; 218 			bTemp[j++] = b;
 980  01ca 96            	ldw	x,sp
 981  01cb 1c0005        	addw	x,#OFST-16
 982  01ce 1f01          	ldw	(OFST-20,sp),x
 984  01d0 7b03          	ld	a,(OFST-18,sp)
 985  01d2 97            	ld	xl,a
 986  01d3 0c03          	inc	(OFST-18,sp)
 988  01d5 9f            	ld	a,xl
 989  01d6 5f            	clrw	x
 990  01d7 97            	ld	xl,a
 991  01d8 72fb01        	addw	x,(OFST-20,sp)
 992  01db 7b04          	ld	a,(OFST-17,sp)
 993  01dd f7            	ld	(x),a
 994  01de               L143:
 995                     ; 198 	for (i=0; i<5; i++)
 997  01de 0c15          	inc	(OFST+0,sp)
1001  01e0 7b15          	ld	a,(OFST+0,sp)
1002  01e2 a105          	cp	a,#5
1003  01e4 259f          	jrult	L723
1004                     ; 222 	tm1637Write(bTemp, j); 
1006  01e6 7b03          	ld	a,(OFST-18,sp)
1007  01e8 88            	push	a
1008  01e9 96            	ldw	x,sp
1009  01ea 1c0006        	addw	x,#OFST-15
1010  01ed cd010a        	call	L31_tm1637Write
1012  01f0 84            	pop	a
1013                     ; 223 }
1016  01f1 5b17          	addw	sp,#23
1017  01f3 81            	ret
1080                     	switch	.ubsct
1081  0000               L52_bDataPort:
1082  0000 0000          	ds.b	2
1083  0002               L32_bClockPort:
1084  0002 0000          	ds.b	2
1085  0004               L12_bDataPin:
1086  0004 00            	ds.b	1
1087  0005               L71_bClockPin:
1088  0005 00            	ds.b	1
1089                     	xdef	_cDigit2Seg
1090                     	xref	_CLK_Delay_ms
1091                     	xdef	_tm1637ShowDigits
1092                     	xdef	_tm1637SetBrightness
1093                     	xdef	_tm1637Init
1094                     	xdef	_usleep
1095                     	xref	_GPIO_Set_Pin_Low
1096                     	xref	_GPIO_Set_Pin_High
1097                     	xref	_GPIO_Config_Pin
1098                     	xref.b	c_lreg
1118                     	xref	c_itolx
1119                     	end
