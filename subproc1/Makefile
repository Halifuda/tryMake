include ../config.mk

.PHONY: all
all: subproc1

subproc1: subproc1.c
	$(CC) $(CFLAGS) $(patsubst -I./%, -I../%, $(INCLUDES)) $^ -o $@ $(LIBS)

.PHONY: clean
clean:
	$(RM) subproc1