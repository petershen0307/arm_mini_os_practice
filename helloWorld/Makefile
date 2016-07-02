# CC ?= xxx 表示CC如果已經被定義, xxx就不要覆蓋原先定義的CC
CC = arm-none-eabi-gcc
LD = arm-none-eabi-ld
OBJCOPY = arm-none-eabi-objcopy
CFLAGS = -O2 -g
ASFLAGS = -O2 -g
LDFLAGS =

OBJ = start.o helloWorld.o

EXEC = helloWorld.bin

all = $(EXEC)

helloWorld.bin: helloWorld
	$(OBJCOPY) -O binary $^ $@

helloWorld: $(OBJ)
	$(LD) -T $@.lds $(OBJ) -o $@

# %表示萬用字元, 這行意義為xxx.o是由xxx.c而來的
# $^表示產生目標的來源, 這是裡是xxx.c
# $@表示要產生的目標, 這裡是xxx.o
%.o: %.c
	$(CC) $(CFLAGS) -c $^ -o $@

%.o: %.s
	$(CC) $(ASFLAGS) -c $^ -o $@

clean:
	rm -f $(EXEC) $(OBJ) helloWorld
