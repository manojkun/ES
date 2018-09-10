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
	if(!(LPC_GPIO2->FIOPIN &(1<<12)))
	{
		//up		
		if(led != 0x00000800)
		{
			LPC_GPIO0->FIOPIN=led;
			for(j=1;j<150000;j++);
			led += 0x00000010;
		}
		else{
				led=0x00000010;
		}
	}
		else{	
		if(led != 0x00000000)
			{
			LPC_GPIO0->FIOPIN=led;
			for(j=1;j<100000;j++);
			led -= 0x00000010;
			}
			else{
			led=0x00000800;
			}
		}
}
}