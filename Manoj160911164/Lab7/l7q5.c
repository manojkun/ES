#include<LPC17xx.h>
#include<stdio.h>

#define FIRST_SEG  0XF87FFFFF
#define SECOND_SEG 0XF8FFFFFF
#define THIRD_SEG  0XF97FFFFF
#define FOURTH_SEG 0XF9FFFFFF
#define DISABLE_ALL 0XFA7FFFFF

unsigned int dig1=0x00, dig2=0x00, dig3=0x01, dig4=0x00;
unsigned int count = 0x00, dig_count= 0x00, temp1=0x00;
unsigned char array_dec[10]={0x3f,0x06,0x5b,0x4f,0x66,0x6d,0x7d,0x07,0x7f,0x6f};
unsigned char array_dec1[10]={0xbf,0x86,0xdb,0xcf,0xe6,0xed,0xfd,0x87,0xff,0xef};
unsigned char tmr0_flg= 0x00,one_sec_flg =0x00,one_min_flag=0x00,one_hour_flag=0x00;
unsigned long int temp2 =0x00000000, i=0;
unsigned int temp3=0x00;
void delay(void);
void display(void);

int main(void)
{
	SystemInit();
	SystemCoreClockUpdate();
	
	
	LPC_PINCON->PINSEL0 &=0XFF0000FF;
	
	
	LPC_PINCON->PINSEL3 &= 0XFFC03FFF;
	LPC_GPIO0->FIODIR |= 0X00000FF0;
	LPC_GPIO1->FIODIR |= 0X07800000;
	
	
	
	while(1)
	{	
	  delay();
		dig_count +=1;
		if(dig_count == 0x05)
		{
			dig_count =0x00;
		}
		if(one_sec_flg == 0xff)
		{
			one_sec_flg = 0x00;
			one_min_flag++;
			dig1 += 1;
		}
	if(((LPC_GPIO2->FIOPIN) & 1)){
		
			if(dig4 ==2 || (dig4 ==1 && dig3 >= 0x03)){
				dig3 -= 0x02;
			  dig4 -= 0x01;
				if(dig3 >= 0x0a)
				{
					dig4 -= 0x01;
					dig3 = 0x0a + dig3;
				}
				display();
		}
		
			if(dig4 ==2 || (dig4 ==1 && dig3 >= 0x03)){
				dig3 -= 0x02;
			  dig4 -= 0x01;
				if(dig3 >= 0x0a)
				{
					dig4 -= 0x01;
					dig3 = 0x0a + dig3;
				}
				display();
		}
		
		
		if(dig1 == 0x0a)
		{
      dig1 =0x00;
			dig2 +=1;
			if(dig2 == 0x06)
			{
				dig2 =0;
				dig3 +=1;
				if(dig3 == 0x0a)
				{
					dig3 =0;
					dig4 +=1;
					if(dig4 == 0x06)
					{
						dig4 = 0;
					}
				}
				if(dig3 == 0x03 && dig4 == 0x01){
					dig3 = dig4;
					dig4 = 0x00;
				}
			}
		}
	}
	else {
		
	
		
		if(dig1 == 0x0a)
		{
      dig1 =0x00;
			dig2 +=1;
			if(dig2 == 0x06)
			{
				dig2 =0;
				dig3 +=1;
				if(dig3 == 0x0a)
				{
					dig3 =0;
					dig4 +=1;
					if(dig4 == 0x06)
					{
						dig4 = 0;
					}
				}
				if(dig3 == 0x04 && dig4 == 0x02){
					dig3 = 0x00;
					dig4 = 0x00;
				}
			}
		}
	}
		display();
	}
}
	void display(void){
		if(dig_count == 0x01){
			temp1 = dig1;
			LPC_GPIO1->FIOPIN = FIRST_SEG;
			temp1 &= 0x0f;
		temp2 = array_dec[temp1];
		}
		if(dig_count == 0x02){
			temp1 = dig2;
			LPC_GPIO1->FIOPIN = SECOND_SEG;
			temp1 &= 0x0f;
		temp2 = array_dec[temp1];
		}
		if(dig_count == 0x03){
			temp1 = dig3;
			LPC_GPIO1->FIOPIN = THIRD_SEG;
			temp1 &= 0x0f;
			temp2 = array_dec1[temp1];
		}
		if(dig_count == 0x04){
			temp1 = dig4;
			LPC_GPIO1->FIOPIN = FOURTH_SEG;
			temp1 &= 0x0f;
		temp2 = array_dec[temp1];
		}
		
		temp2 = temp2 << 4;
		LPC_GPIO0->FIOPIN = temp2;
		for(i=0;i<500;i++);
		LPC_GPIO0->FIOCLR = 0x00000FF0;
		LPC_GPIO1->FIOPIN = DISABLE_ALL;
	}
	void delay(void){
			unsigned int i;
			for(i=0;i<1000;i++);
			if(count == 20)
			{
					one_sec_flg = 0XFF;
					count = 0X00;
			}
			else
					count +=1;
	}