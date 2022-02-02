#CFLAGS=I./entete
TARGET=main
MCU=atmega32u4

all: $(TARGET).out

$(TARGET).out: delay.o $(TARGET).o
	avr-gcc -mmcu=atmega32u4 -Os -Wall -o $(TARGET).out $(TARGET).o delay.o

delay.o: delay.c entete/delay.h
	avr-gcc -mmcu=$(MCU) -Os -Wall -I./entete -c delay.c

main.o: main.c
	avr-gcc -mmcu=$(MCU) -Os -Wall -I./entete -c main.c

clean:
	rm *.o $(TARGET).out

flash: $(TARGET).out
	avrdude -c avr109 -b57600 -D-p atmega32u4 -P /dev/ttyACM0 -e -U flash:w:$(TARGET).out
