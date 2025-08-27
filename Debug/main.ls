   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.5 - 22 May 2025
  44                     ; 24 static void init_gpio(void) {
  46                     	switch	.text
  47  0000               L71_init_gpio:
  51                     ; 25 	GPIO_Config_Pin(GPIO_PORT_C, GPIO_PIN_4, PIN_MODE_OUTPUT_PP);
  53  0000 4b06          	push	#6
  54  0002 4b10          	push	#16
  55  0004 ae500a        	ldw	x,#20490
  56  0007 cd0000        	call	_GPIO_Config_Pin
  58  000a 85            	popw	x
  59                     ; 26 	GPIO_Config_Pin(GPIO_PORT_B, GPIO_PIN_4, PIN_MODE_OUTPUT_PP);
  61  000b 4b06          	push	#6
  62  000d 4b10          	push	#16
  63  000f ae5005        	ldw	x,#20485
  64  0012 cd0000        	call	_GPIO_Config_Pin
  66  0015 85            	popw	x
  67                     ; 27 }
  70  0016 81            	ret
 137                     ; 29 main() {
 138                     	switch	.text
 139  0017               _main:
 141  0017 520e          	subw	sp,#14
 142       0000000e      OFST:	set	14
 145                     ; 30 	int hours = 0, min = 0, secs = 0;
 151                     ; 33 	CLK_Init(CLK_SRC_HSI, CLK_HSI_DIV_NONE, CLK_CPU_DIV_MASTER_NONE);
 153  0019 4b00          	push	#0
 154  001b aee100        	ldw	x,#57600
 155  001e cd0000        	call	_CLK_Init
 157  0021 84            	pop	a
 158                     ; 37 	tm1637Init(GPIO_PORT_C, GPIO_PIN_4, GPIO_PORT_B, GPIO_PIN_4); 
 160  0022 4b10          	push	#16
 161  0024 ae5005        	ldw	x,#20485
 162  0027 89            	pushw	x
 163  0028 4b10          	push	#16
 164  002a ae500a        	ldw	x,#20490
 165  002d cd0000        	call	_tm1637Init
 167  0030 5b04          	addw	sp,#4
 168                     ; 38 	tm1637SetBrightness(4);
 170  0032 a604          	ld	a,#4
 171  0034 cd0000        	call	_tm1637SetBrightness
 173                     ; 41 	sprintf(szTemp, "%02d %02d", 14, 83); 
 175  0037 ae0053        	ldw	x,#83
 176  003a 89            	pushw	x
 177  003b ae000e        	ldw	x,#14
 178  003e 89            	pushw	x
 179  003f ae0000        	ldw	x,#L17
 180  0042 89            	pushw	x
 181  0043 96            	ldw	x,sp
 182  0044 1c000d        	addw	x,#OFST-1
 183  0047 cd0000        	call	_sprintf
 185  004a 5b06          	addw	sp,#6
 186                     ; 42 	tm1637ShowDigits(szTemp);
 188  004c 96            	ldw	x,sp
 189  004d 1c0007        	addw	x,#OFST-7
 190  0050 cd0000        	call	_tm1637ShowDigits
 192  0053               L37:
 193                     ; 44 	while(1);
 195  0053 20fe          	jra	L37
 230                     ; 82 void assert_failed(uint8_t* file, uint32_t line)
 230                     ; 83 {
 231                     	switch	.text
 232  0055               _assert_failed:
 236  0055               L511:
 237  0055 20fe          	jra	L511
 250                     	xdef	_main
 251                     	xref	_tm1637ShowDigits
 252                     	xref	_tm1637SetBrightness
 253                     	xref	_tm1637Init
 254                     	xref	_GPIO_Config_Pin
 255                     	xref	_sprintf
 256                     	xref	_CLK_Init
 257                     	xdef	_assert_failed
 258                     .const:	section	.text
 259  0000               L17:
 260  0000 253032642025  	dc.b	"%02d %02d",0
 280                     	end
