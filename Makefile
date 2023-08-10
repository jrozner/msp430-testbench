NAME            = testbench
OBJECTS         = testbench.o inc.o
CPU             = msp430g2553
CFLAGS          = -mmcu=${CPU} -O2 -Wall -g
CC              = msp430-gcc

.PHONY: all FORCE symbols clean

#all: ${NAME}.elf ${NAME}.hex ${NAME}.lst
all: ${NAME}.elf ${NAME}.hex symbols

${NAME}.elf: ${OBJECTS}
	${CC} -mmcu=${CPU} -o $@ ${OBJECTS}

${NAME}.hex: ${NAME}.elf
	msp430-objcopy -O ihex $^ $@

symbols:
	nm ${NAME}.elf > symbols

clean:
	rm -f ${NAME}.elf ${NAME}.hex ${OBJECTS} symbols

testbed.o: testbench.c
inc.o: inc.S
