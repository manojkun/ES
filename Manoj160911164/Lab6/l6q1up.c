#include<LPC17xx.h>
unsigned int i,j;
unsigned long led=0x00000010;
int main(void)
{
	SystemInit();
	SystemCoreClockUpdate();
	
	
	LPC_PINCON->PINSEL0 &=0XFF0000FF;
	LPC_GPIO0->FIODIR |=0X00000FF0;
	while(1)
	{
		led=0x00000010;
		while(led != 0x00000800)
		{
			LPC_GPIO0->FIOPIN=led;
			for(j=1;j<150000;j++);
			//LPC_GPIO0->FIOCLR=led;
			led += 0x00000010;
		}
	}
}