#include<pic.h>
#define _XTAL_FREQ 20000000
void start();
void send(char m);
void stop();
char k[]="STRING";
void main()
{
	int i;
	TRISC3=1;
	TRISC4=1;
	PORTC=0X00;
	SSPSTAT=0X80;
	SSPCON=0XA8;
	SSPCON2=0X00;
	SSPADD=7;
    
	while(1)
	{
		start();
		send(0X24);
		if(ACKSTAT==0)
		{
					for(i=0;i<6;i++)
					{
						send(k[i]);
						__delay_ms(10);
					}
		}
			if(ACKSTAT==0)
			{
			while(SSPIF==0);
			SSPIF=0;
			stop();
			__delay_ms(500);
			}	
		
	}
}
void start()
{
	
__delay_ms(500);
    SEN=1;
	SSPIF=0;

 
}
void stop()
{
	__delay_ms(500);
	PEN=1;
 	SSPIF=0;

	 
}
void send(char m)
{
    while(SSPIF==0);
    SSPIF=0;
	SSPBUF=m;
__delay_ms(500);
}