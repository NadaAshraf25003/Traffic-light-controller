#line 1 "C:/Users/W.I/Desktop/Embedded Mikroc/Final Project/SoftFinal/Final2.c"










int count=0, count2=0 , count3=0;
void main() {
 adcon1=0x07;
 trisc=0b00110000;
 trisa=1;
 trisb=0;
 trisd=0;
 portc=15;
  portb =0;
 portd=0;

 for( ; ; ){
 if( portc.b4 ==0){
 portd=0;
 for(count=2;count>=0;count--){
  portb =count;
 for(count2=9;count2>=0;count2--){
 if(count==2 && (count2>3)) continue;
  portb =(count2<<4) | count;
 if(count==2 && count2==3) { portd.b2 =1;  portd.b3 =1;}
 if(count==0 && count2==3) { portd.b2 =0;  portd.b1 =1;}
 delay_ms( 1000 );
 if( portc.b4 ==1) {portd=0;break;}
 }
 if( portc.b4 ==1) { portd=0;break;}
 }

 for(count=1;count>=0;count--){
 if( portc.b4 ==1) { portd=0;break;}
  portb =count;
 for(count2=9;count2>=0;count2--){
 if(count==1 && (count2>5)) continue;
  portb =(count2<<4) | count;
 if(count==1 && count2==5) { portd.b1 =0;  portd.b3 =0; portd.b4 =1; portd.b0 =1;}
 if(count==1 && count2==2) { portd.b4 =0; portd.b5 =1; }
 delay_ms( 1000 );
 if( portc.b4 ==1) {portd=0;break;}
 }
 if( portc.b4 ==1) { portd=0;break;}
 }

 }

 else {

  portb =0;

 if ( portc.b5 ==0){
  portd.b5 =0;  portd.b0 =0;
  portd.b4 =1;  portd.b1 =1;
 for(count3=3;count3>=0;count3--){
 if(count3==0){ portb =count3<<4;break;}
 else{
  portb =count3<<4;delay_ms( 1000 );}
 if( portc.b4 ==0) { portd=0;break;}
 }
  portb =0;
  portd.b4 =0;  portd.b1 =0;
  portd.b2 =1;  portd.b3 =1;
 while( portc.b5 ==0 &&  portc.b4 ==1);
 }
 else {
  portd.b2 =0;  portd.b3 =0;
  portd.b4 =1;  portd.b1 =1;
 for(count3=3;count3>=0;count3--){
 if(count3==0){ portb =count3<<4;break;}
 else{
  portb =count3<<4;delay_ms( 1000 );}
 if( portc.b4 ==0) { portd=0;break;}
 }
  portb =0;
  portd.b4 =0;  portd.b1 =0;
  portd.b5 =1;  portd.b0 =1;
 while( portc.b5 ==1 &&  portc.b4 ==1);
 }
 }
 }




}
