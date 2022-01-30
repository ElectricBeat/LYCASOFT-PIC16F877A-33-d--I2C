#include<pic.h>
#define _XTAL_FREQ 20000000
void start();
void stop();
char receive();
void cmd(char x,char y)
{
	RB0=y;
	RB1=0;
	RB2=1;
	PORTD=x;

	RB2=0;

	__delay_ms(70);
	}
	void main()
	{
int i;
char ch;
char a[]="STRING";
		TRISB=0x00;
		PORTB=0x00;
		TRISD=0x00;
        PORTD=0x00;
		TRISC3=1;
		TRISC4=1;
		PORTC=0x00;
		cmd(0x38,0);
		cmd(0x06,0);
		cmd(0x01,0);
		cmd(0x80,0);
cmd(0x0d,0);
		__delay_ms(50);
		SSPSTAT=0x84;
		SSPCON=0x66;
		SSPCON2=0x00;
        SSPADD=0x24;
        SSPBUF=0;
SSPIF=0;
		while(1)
		{
		start();

		if(ACKSTAT==0)
		{
     
        SSPBUF=0;
	     ch=receive();
        for(int i=0;i<6;i++)
		{
         if(a[i]==ch)
         {
	    	cmd(ch,1);
__delay_ms(70);
         }
        }
		CKP=1;

		stop();
	}
	
	}
}
		
	void start()
	{
	SEN=1;
SSPIF=0;

__delay_ms(70);
	}
	void stop()
	{
	
	PEN=1;
SSPIF=1;
__delay_ms(70);
	} 

char receive()
{
char s;
SSPIF=1;
s=SSPBUF;
__delay_ms(100);
return s;
}