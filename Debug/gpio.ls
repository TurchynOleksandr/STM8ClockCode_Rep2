   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.13.3 - 22 May 2025
   3                     ; Generator (Limited) V4.6.5 - 22 May 2025
  73                     ; 23 void GPIO_Config_Pin(gpio_port_t port, gpio_pin_t pins,
  73                     ; 24 	unsigned char pin_mode) {
  75                     	switch	.text
  76  0000               _GPIO_Config_Pin:
  78  0000 89            	pushw	x
  79       00000000      OFST:	set	0
  82                     ; 26 	if(pin_mode > 0x07) {
  84  0001 7b06          	ld	a,(OFST+6,sp)
  85  0003 a108          	cp	a,#8
  86  0005 244c          	jruge	L22
  87                     ; 28 		return; //for now, supported modes are 0 to 7
  89                     ; 33 	((pin_mode & ( 1 << 2)) >> 2) == 1 ? 
  89                     ; 34 	*(port + GPIO_OFST_DDR) = pins & 0xFF :
  89                     ; 35 	pins & 0x00;
  91  0007 7b06          	ld	a,(OFST+6,sp)
  92  0009 44            	srl	a
  93  000a 44            	srl	a
  94  000b 5f            	clrw	x
  95  000c a401          	and	a,#1
  96  000e 5f            	clrw	x
  97  000f 5f            	clrw	x
  98  0010 97            	ld	xl,a
  99  0011 a30001        	cpw	x,#1
 100  0014 260c          	jrne	L6
 101  0016 7b05          	ld	a,(OFST+5,sp)
 102  0018 1e01          	ldw	x,(OFST+1,sp)
 103  001a e702          	ld	(2,x),a
 104  001c e602          	ld	a,(2,x)
 105  001e 5f            	clrw	x
 106  001f 97            	ld	xl,a
 107  0020 2001          	jra	L01
 108  0022               L6:
 109  0022 5f            	clrw	x
 110  0023               L01:
 111                     ; 38 	((pin_mode & ( 1 << 1)) >> 1) == 1 ? 
 111                     ; 39 	*(port + GPIO_OFST_CR1) = pins & 0xFF :
 111                     ; 40 	pins & 0x00;
 113  0023 7b06          	ld	a,(OFST+6,sp)
 114  0025 44            	srl	a
 115  0026 5f            	clrw	x
 116  0027 a401          	and	a,#1
 117  0029 5f            	clrw	x
 118  002a 5f            	clrw	x
 119  002b 97            	ld	xl,a
 120  002c a30001        	cpw	x,#1
 121  002f 260c          	jrne	L21
 122  0031 7b05          	ld	a,(OFST+5,sp)
 123  0033 1e01          	ldw	x,(OFST+1,sp)
 124  0035 e703          	ld	(3,x),a
 125  0037 e603          	ld	a,(3,x)
 126  0039 5f            	clrw	x
 127  003a 97            	ld	xl,a
 128  003b 2001          	jra	L41
 129  003d               L21:
 130  003d 5f            	clrw	x
 131  003e               L41:
 132                     ; 43 	((pin_mode & ( 1 << 0)) >> 0) == 1 ? 
 132                     ; 44 	*(port + GPIO_OFST_CR2) = pins & 0xFF :
 132                     ; 45 	pins & 0x00;
 134  003e 7b06          	ld	a,(OFST+6,sp)
 135  0040 a401          	and	a,#1
 136  0042 a101          	cp	a,#1
 137  0044 260c          	jrne	L61
 138  0046 7b05          	ld	a,(OFST+5,sp)
 139  0048 1e01          	ldw	x,(OFST+1,sp)
 140  004a e704          	ld	(4,x),a
 141  004c e604          	ld	a,(4,x)
 142  004e 5f            	clrw	x
 143  004f 97            	ld	xl,a
 144  0050 2001          	jra	L02
 145  0052               L61:
 146  0052 5f            	clrw	x
 147  0053               L02:
 148                     ; 46 }
 149  0053               L22:
 152  0053 85            	popw	x
 153  0054 81            	ret
 197                     ; 59 void GPIO_Set_Pin_High(gpio_port_t port, gpio_pin_t pins) {
 198                     	switch	.text
 199  0055               _GPIO_Set_Pin_High:
 201  0055 89            	pushw	x
 202       00000000      OFST:	set	0
 205                     ; 60 	*port |= pins;
 207  0056 f6            	ld	a,(x)
 208  0057 1a05          	or	a,(OFST+5,sp)
 209  0059 f7            	ld	(x),a
 210                     ; 61 }
 213  005a 85            	popw	x
 214  005b 81            	ret
 258                     ; 73 void GPIO_Set_Pin_Low(gpio_port_t port, gpio_pin_t pins) {
 259                     	switch	.text
 260  005c               _GPIO_Set_Pin_Low:
 262  005c 89            	pushw	x
 263       00000000      OFST:	set	0
 266                     ; 74 	*port &= ~(pins);
 268  005d 7b05          	ld	a,(OFST+5,sp)
 269  005f 43            	cpl	a
 270  0060 f4            	and	a,(x)
 271  0061 f7            	ld	(x),a
 272                     ; 75 }
 275  0062 85            	popw	x
 276  0063 81            	ret
 320                     ; 87 void GPIO_Toggle_Pin(gpio_port_t port, gpio_pin_t pins) {
 321                     	switch	.text
 322  0064               _GPIO_Toggle_Pin:
 324  0064 89            	pushw	x
 325       00000000      OFST:	set	0
 328                     ; 88 	*port ^= pins;
 330  0065 f6            	ld	a,(x)
 331  0066 1805          	xor	a,(OFST+5,sp)
 332  0068 f7            	ld	(x),a
 333                     ; 89 }
 336  0069 85            	popw	x
 337  006a 81            	ret
 381                     ; 94 unsigned char GPIO_Read_Pin(gpio_port_t port, gpio_pin_t pin) {
 382                     	switch	.text
 383  006b               _GPIO_Read_Pin:
 385  006b 89            	pushw	x
 386       00000000      OFST:	set	0
 389                     ; 95 	return *(port + GPIO_OFST_IDR) & pin;
 391  006c e601          	ld	a,(1,x)
 392  006e 1405          	and	a,(OFST+5,sp)
 395  0070 85            	popw	x
 396  0071 81            	ret
 431                     ; 101 unsigned char GPIO_Read_Port(gpio_port_t port) {
 432                     	switch	.text
 433  0072               _GPIO_Read_Port:
 437                     ; 102 	return *(port + GPIO_OFST_IDR);
 439  0072 e601          	ld	a,(1,x)
 442  0074 81            	ret
 455                     	xdef	_GPIO_Read_Port
 456                     	xdef	_GPIO_Read_Pin
 457                     	xdef	_GPIO_Toggle_Pin
 458                     	xdef	_GPIO_Set_Pin_Low
 459                     	xdef	_GPIO_Set_Pin_High
 460                     	xdef	_GPIO_Config_Pin
 479                     	end
