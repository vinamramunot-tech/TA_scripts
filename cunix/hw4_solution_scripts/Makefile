all: 
	gcc -c -O3 pyrotechnics.c -o pyrotechnics.o
	gcc -c -g theBomb.c -o theBomb.o
	gcc -g theBomb.o pyrotechnics.o bombDriver.c -o theBomb

clean:
	-rm *.o
	-rm theBomb
	-rm thePracticeBomb
