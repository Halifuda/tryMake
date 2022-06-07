include ../config.mk

.PHONY: all
all: subproc2

subproc2: subproc2.c
	$(CC) $(CFLAGS) $(patsubst -I./%, -I../%, $(INCLUDES)) $^ -o $@ $(LIBS)

.PHONY: clean
clean:
	$(RM) subproc2