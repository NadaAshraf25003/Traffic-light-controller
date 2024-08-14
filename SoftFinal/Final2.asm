
_main:

;Final2.c,12 :: 		void main() {
;Final2.c,13 :: 		adcon1=0x07;
	MOVLW      7
	MOVWF      ADCON1+0
;Final2.c,14 :: 		trisc=0b00110000;
	MOVLW      48
	MOVWF      TRISC+0
;Final2.c,15 :: 		trisa=1;
	MOVLW      1
	MOVWF      TRISA+0
;Final2.c,16 :: 		trisb=0;
	CLRF       TRISB+0
;Final2.c,17 :: 		trisd=0;
	CLRF       TRISD+0
;Final2.c,18 :: 		portc=15;
	MOVLW      15
	MOVWF      PORTC+0
;Final2.c,19 :: 		Display=0;
	CLRF       PORTB+0
;Final2.c,20 :: 		portd=0;
	CLRF       PORTD+0
;Final2.c,22 :: 		for( ; ; ){
L_main0:
;Final2.c,23 :: 		if(SW_M_A==0){
	BTFSC      PORTC+0, 4
	GOTO       L_main3
;Final2.c,24 :: 		portd=0;
	CLRF       PORTD+0
;Final2.c,25 :: 		for(count=2;count>=0;count--){
	MOVLW      2
	MOVWF      _count+0
	MOVLW      0
	MOVWF      _count+1
L_main4:
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main75
	MOVLW      0
	SUBWF      _count+0, 0
L__main75:
	BTFSS      STATUS+0, 0
	GOTO       L_main5
;Final2.c,26 :: 		Display=count;
	MOVF       _count+0, 0
	MOVWF      PORTB+0
;Final2.c,27 :: 		for(count2=9;count2>=0;count2--){
	MOVLW      9
	MOVWF      _count2+0
	MOVLW      0
	MOVWF      _count2+1
L_main7:
	MOVLW      128
	XORWF      _count2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main76
	MOVLW      0
	SUBWF      _count2+0, 0
L__main76:
	BTFSS      STATUS+0, 0
	GOTO       L_main8
;Final2.c,28 :: 		if(count==2 && (count2>3)) continue;
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main77
	MOVLW      2
	XORWF      _count+0, 0
L__main77:
	BTFSS      STATUS+0, 2
	GOTO       L_main12
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main78
	MOVF       _count2+0, 0
	SUBLW      3
L__main78:
	BTFSC      STATUS+0, 0
	GOTO       L_main12
L__main73:
	GOTO       L_main9
L_main12:
;Final2.c,29 :: 		Display=(count2<<4) | count;
	MOVLW      4
	MOVWF      R1+0
	MOVF       _count2+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main79:
	BTFSC      STATUS+0, 2
	GOTO       L__main80
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main79
L__main80:
	MOVF       _count+0, 0
	IORWF      R0+0, 0
	MOVWF      PORTB+0
;Final2.c,30 :: 		if(count==2 && count2==3) {LED_GREEN1=1;  LED_RED2=1;}
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main81
	MOVLW      2
	XORWF      _count+0, 0
L__main81:
	BTFSS      STATUS+0, 2
	GOTO       L_main15
	MOVLW      0
	XORWF      _count2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main82
	MOVLW      3
	XORWF      _count2+0, 0
L__main82:
	BTFSS      STATUS+0, 2
	GOTO       L_main15
L__main72:
	BSF        PORTD+0, 2
	BSF        PORTD+0, 3
L_main15:
;Final2.c,31 :: 		if(count==0 && count2==3) {LED_GREEN1=0; LED_YELLOW1=1;}
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main83
	MOVLW      0
	XORWF      _count+0, 0
L__main83:
	BTFSS      STATUS+0, 2
	GOTO       L_main18
	MOVLW      0
	XORWF      _count2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main84
	MOVLW      3
	XORWF      _count2+0, 0
L__main84:
	BTFSS      STATUS+0, 2
	GOTO       L_main18
L__main71:
	BCF        PORTD+0, 2
	BSF        PORTD+0, 1
L_main18:
;Final2.c,32 :: 		delay_ms(Wait);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main19:
	DECFSZ     R13+0, 1
	GOTO       L_main19
	DECFSZ     R12+0, 1
	GOTO       L_main19
	DECFSZ     R11+0, 1
	GOTO       L_main19
	NOP
	NOP
;Final2.c,33 :: 		if(SW_M_A==1) {portd=0;break;}
	BTFSS      PORTC+0, 4
	GOTO       L_main20
	CLRF       PORTD+0
	GOTO       L_main8
L_main20:
;Final2.c,34 :: 		}
L_main9:
;Final2.c,27 :: 		for(count2=9;count2>=0;count2--){
	MOVLW      1
	SUBWF      _count2+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count2+1, 1
;Final2.c,34 :: 		}
	GOTO       L_main7
L_main8:
;Final2.c,35 :: 		if(SW_M_A==1) { portd=0;break;}
	BTFSS      PORTC+0, 4
	GOTO       L_main21
	CLRF       PORTD+0
	GOTO       L_main5
L_main21:
;Final2.c,25 :: 		for(count=2;count>=0;count--){
	MOVLW      1
	SUBWF      _count+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count+1, 1
;Final2.c,36 :: 		}
	GOTO       L_main4
L_main5:
;Final2.c,38 :: 		for(count=1;count>=0;count--){
	MOVLW      1
	MOVWF      _count+0
	MOVLW      0
	MOVWF      _count+1
L_main22:
	MOVLW      128
	XORWF      _count+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main85
	MOVLW      0
	SUBWF      _count+0, 0
L__main85:
	BTFSS      STATUS+0, 0
	GOTO       L_main23
;Final2.c,39 :: 		if(SW_M_A==1) { portd=0;break;}
	BTFSS      PORTC+0, 4
	GOTO       L_main25
	CLRF       PORTD+0
	GOTO       L_main23
L_main25:
;Final2.c,40 :: 		Display=count;
	MOVF       _count+0, 0
	MOVWF      PORTB+0
;Final2.c,41 :: 		for(count2=9;count2>=0;count2--){
	MOVLW      9
	MOVWF      _count2+0
	MOVLW      0
	MOVWF      _count2+1
L_main26:
	MOVLW      128
	XORWF      _count2+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main86
	MOVLW      0
	SUBWF      _count2+0, 0
L__main86:
	BTFSS      STATUS+0, 0
	GOTO       L_main27
;Final2.c,42 :: 		if(count==1 && (count2>5)) continue;
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main87
	MOVLW      1
	XORWF      _count+0, 0
L__main87:
	BTFSS      STATUS+0, 2
	GOTO       L_main31
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _count2+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main88
	MOVF       _count2+0, 0
	SUBLW      5
L__main88:
	BTFSC      STATUS+0, 0
	GOTO       L_main31
L__main70:
	GOTO       L_main28
L_main31:
;Final2.c,43 :: 		Display=(count2<<4) | count;
	MOVLW      4
	MOVWF      R1+0
	MOVF       _count2+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main89:
	BTFSC      STATUS+0, 2
	GOTO       L__main90
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main89
L__main90:
	MOVF       _count+0, 0
	IORWF      R0+0, 0
	MOVWF      PORTB+0
;Final2.c,44 :: 		if(count==1 && count2==5) {LED_YELLOW1=0;  LED_RED2=0;LED_YELLOW2=1;LED_RED1=1;}
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main91
	MOVLW      1
	XORWF      _count+0, 0
L__main91:
	BTFSS      STATUS+0, 2
	GOTO       L_main34
	MOVLW      0
	XORWF      _count2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main92
	MOVLW      5
	XORWF      _count2+0, 0
L__main92:
	BTFSS      STATUS+0, 2
	GOTO       L_main34
L__main69:
	BCF        PORTD+0, 1
	BCF        PORTD+0, 3
	BSF        PORTD+0, 4
	BSF        PORTD+0, 0
L_main34:
;Final2.c,45 :: 		if(count==1 && count2==2) {LED_YELLOW2=0;LED_GREEN2=1; }
	MOVLW      0
	XORWF      _count+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main93
	MOVLW      1
	XORWF      _count+0, 0
L__main93:
	BTFSS      STATUS+0, 2
	GOTO       L_main37
	MOVLW      0
	XORWF      _count2+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main94
	MOVLW      2
	XORWF      _count2+0, 0
L__main94:
	BTFSS      STATUS+0, 2
	GOTO       L_main37
L__main68:
	BCF        PORTD+0, 4
	BSF        PORTD+0, 5
L_main37:
;Final2.c,46 :: 		delay_ms(Wait);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main38:
	DECFSZ     R13+0, 1
	GOTO       L_main38
	DECFSZ     R12+0, 1
	GOTO       L_main38
	DECFSZ     R11+0, 1
	GOTO       L_main38
	NOP
	NOP
;Final2.c,47 :: 		if(SW_M_A==1) {portd=0;break;}
	BTFSS      PORTC+0, 4
	GOTO       L_main39
	CLRF       PORTD+0
	GOTO       L_main27
L_main39:
;Final2.c,48 :: 		}
L_main28:
;Final2.c,41 :: 		for(count2=9;count2>=0;count2--){
	MOVLW      1
	SUBWF      _count2+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count2+1, 1
;Final2.c,48 :: 		}
	GOTO       L_main26
L_main27:
;Final2.c,49 :: 		if(SW_M_A==1) { portd=0;break;}
	BTFSS      PORTC+0, 4
	GOTO       L_main40
	CLRF       PORTD+0
	GOTO       L_main23
L_main40:
;Final2.c,38 :: 		for(count=1;count>=0;count--){
	MOVLW      1
	SUBWF      _count+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count+1, 1
;Final2.c,50 :: 		}
	GOTO       L_main22
L_main23:
;Final2.c,52 :: 		}
	GOTO       L_main41
L_main3:
;Final2.c,56 :: 		Display=0;
	CLRF       PORTB+0
;Final2.c,58 :: 		if (SW_M==0){  //West Street
	BTFSC      PORTC+0, 5
	GOTO       L_main42
;Final2.c,59 :: 		LED_GREEN2=0;   LED_RED1=0;
	BCF        PORTD+0, 5
	BCF        PORTD+0, 0
;Final2.c,60 :: 		LED_YELLOW2=1;  LED_YELLOW1=1;
	BSF        PORTD+0, 4
	BSF        PORTD+0, 1
;Final2.c,61 :: 		for(count3=3;count3>=0;count3--){
	MOVLW      3
	MOVWF      _count3+0
	MOVLW      0
	MOVWF      _count3+1
L_main43:
	MOVLW      128
	XORWF      _count3+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main95
	MOVLW      0
	SUBWF      _count3+0, 0
L__main95:
	BTFSS      STATUS+0, 0
	GOTO       L_main44
;Final2.c,62 :: 		if(count3==0){Display=count3<<4;break;}
	MOVLW      0
	XORWF      _count3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main96
	MOVLW      0
	XORWF      _count3+0, 0
L__main96:
	BTFSS      STATUS+0, 2
	GOTO       L_main46
	MOVLW      4
	MOVWF      R1+0
	MOVF       _count3+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main97:
	BTFSC      STATUS+0, 2
	GOTO       L__main98
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main97
L__main98:
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	GOTO       L_main44
L_main46:
;Final2.c,64 :: 		Display=count3<<4;delay_ms(Wait);}
	MOVLW      4
	MOVWF      R1+0
	MOVF       _count3+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main99:
	BTFSC      STATUS+0, 2
	GOTO       L__main100
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main99
L__main100:
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main48:
	DECFSZ     R13+0, 1
	GOTO       L_main48
	DECFSZ     R12+0, 1
	GOTO       L_main48
	DECFSZ     R11+0, 1
	GOTO       L_main48
	NOP
	NOP
;Final2.c,65 :: 		if(SW_M_A==0) { portd=0;break;}
	BTFSC      PORTC+0, 4
	GOTO       L_main49
	CLRF       PORTD+0
	GOTO       L_main44
L_main49:
;Final2.c,61 :: 		for(count3=3;count3>=0;count3--){
	MOVLW      1
	SUBWF      _count3+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count3+1, 1
;Final2.c,66 :: 		}
	GOTO       L_main43
L_main44:
;Final2.c,67 :: 		Display=0;
	CLRF       PORTB+0
;Final2.c,68 :: 		LED_YELLOW2=0;  LED_YELLOW1=0;
	BCF        PORTD+0, 4
	BCF        PORTD+0, 1
;Final2.c,69 :: 		LED_GREEN1=1;  LED_RED2=1;
	BSF        PORTD+0, 2
	BSF        PORTD+0, 3
;Final2.c,70 :: 		while(SW_M==0 && SW_M_A==1);
L_main50:
	BTFSC      PORTC+0, 5
	GOTO       L_main51
	BTFSS      PORTC+0, 4
	GOTO       L_main51
L__main67:
	GOTO       L_main50
L_main51:
;Final2.c,71 :: 		}
	GOTO       L_main54
L_main42:
;Final2.c,73 :: 		LED_GREEN1=0;   LED_RED2=0;
	BCF        PORTD+0, 2
	BCF        PORTD+0, 3
;Final2.c,74 :: 		LED_YELLOW2=1;  LED_YELLOW1=1;
	BSF        PORTD+0, 4
	BSF        PORTD+0, 1
;Final2.c,75 :: 		for(count3=3;count3>=0;count3--){
	MOVLW      3
	MOVWF      _count3+0
	MOVLW      0
	MOVWF      _count3+1
L_main55:
	MOVLW      128
	XORWF      _count3+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main101
	MOVLW      0
	SUBWF      _count3+0, 0
L__main101:
	BTFSS      STATUS+0, 0
	GOTO       L_main56
;Final2.c,76 :: 		if(count3==0){Display=count3<<4;break;}
	MOVLW      0
	XORWF      _count3+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main102
	MOVLW      0
	XORWF      _count3+0, 0
L__main102:
	BTFSS      STATUS+0, 2
	GOTO       L_main58
	MOVLW      4
	MOVWF      R1+0
	MOVF       _count3+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main103:
	BTFSC      STATUS+0, 2
	GOTO       L__main104
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main103
L__main104:
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	GOTO       L_main56
L_main58:
;Final2.c,78 :: 		Display=count3<<4;delay_ms(Wait);}
	MOVLW      4
	MOVWF      R1+0
	MOVF       _count3+0, 0
	MOVWF      R0+0
	MOVF       R1+0, 0
L__main105:
	BTFSC      STATUS+0, 2
	GOTO       L__main106
	RLF        R0+0, 1
	BCF        R0+0, 0
	ADDLW      255
	GOTO       L__main105
L__main106:
	MOVF       R0+0, 0
	MOVWF      PORTB+0
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main60:
	DECFSZ     R13+0, 1
	GOTO       L_main60
	DECFSZ     R12+0, 1
	GOTO       L_main60
	DECFSZ     R11+0, 1
	GOTO       L_main60
	NOP
	NOP
;Final2.c,79 :: 		if(SW_M_A==0) { portd=0;break;}
	BTFSC      PORTC+0, 4
	GOTO       L_main61
	CLRF       PORTD+0
	GOTO       L_main56
L_main61:
;Final2.c,75 :: 		for(count3=3;count3>=0;count3--){
	MOVLW      1
	SUBWF      _count3+0, 1
	BTFSS      STATUS+0, 0
	DECF       _count3+1, 1
;Final2.c,80 :: 		}
	GOTO       L_main55
L_main56:
;Final2.c,81 :: 		Display=0;
	CLRF       PORTB+0
;Final2.c,82 :: 		LED_YELLOW2=0;  LED_YELLOW1=0;
	BCF        PORTD+0, 4
	BCF        PORTD+0, 1
;Final2.c,83 :: 		LED_GREEN2=1;   LED_RED1=1;
	BSF        PORTD+0, 5
	BSF        PORTD+0, 0
;Final2.c,84 :: 		while(SW_M==1 && SW_M_A==1);
L_main62:
	BTFSS      PORTC+0, 5
	GOTO       L_main63
	BTFSS      PORTC+0, 4
	GOTO       L_main63
L__main66:
	GOTO       L_main62
L_main63:
;Final2.c,85 :: 		}
L_main54:
;Final2.c,86 :: 		}
L_main41:
;Final2.c,87 :: 		}
	GOTO       L_main0
;Final2.c,92 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
