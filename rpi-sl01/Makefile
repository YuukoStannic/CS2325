# Makefile for the simple rpi-sl01.S file
#

rpi-sl01	:  rpi-sl01.o
	gcc -gstabs+ -o rpi-sl01 rpi-sl01.o

rpi-sl01.o  :  rpi-sl01.s
	gcc -gstabs+ -c rpi-sl01.s

listing :  rpi-sl01.s
	gcc -c -gstabs+ -Wa,-alms,-L rpi-sl01.s > rpi-sl01.lst

rpi-sl01c :  rpi-sl01c.o
	gcc -gstabs+ -o rpi-sl01c rpi-sl01c.o

rpi-sl01c.o  :  rpi-sl01c.c
	gcc -gstabs+ -c rpi-sl01c.c

clean	:
	rm -f *.o *.lst rpi-sl01 rpi-sl01c
