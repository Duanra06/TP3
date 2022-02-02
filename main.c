#include <avr/io.h>
#define F_CPU 16000000UL
#include "delay.h"

int main (void)
{
	DDRB |= 1<<PORTB5;
	DDRB |= 1<<PORTE6;
	PORTB |= 1<<PORTB5;
	PORTE &= -(1<<PORTE6);

	while(1)
	{
		PORTB ^= 1<<PORTB5;
		PORTE ^= 1<<PORTE6;
		MonDelai(0xffff);
	}
	return 0;
}
