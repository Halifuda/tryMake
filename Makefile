# an example Makefile

# ---- INCLUDE ----
# use 'include' to import another Makefile.
# make will firstly draw it in.
include config.mk


# ---- ARGUEMENT ----
# use = to define an arguement.
SOURCES = ./main/main.c
# use += to add member in an arguement.
SOURCES += ./mymath/mymath.c
# arguement defined by := will be parse immediately when make starts.
TARGET := try


# ---- PHONY TARGET ----
# use '.PHONY' to note a target that does not represent a target filename.
# call this type of target 'phony target', or a 'label'.
# if we do not use it, when there is a file named 'clean' under working 
# directory and the target 'clean' has no dependency, make will ignore
# clean for it will be regarded as newest.
.PHONY: all main
all: main subproc

# use $() to call make-function or argument.
main: $(TARGET)

# ---- AUTO ARG ----
$(TARGET): $(SOURCES)
# $^ representing all dependencies in this target;
# $@ representing the target;
# $< representing the first dependency;
# $? representing the dependencies that changed since last make.
	$(CC) $(CFLAGS) $^ -o $@ $(INCLUDES) $(LIBS)


# ---- RECURSIVE MAKE ----
# to run 'make' in subdirs, first define an arguement,
# includes all the subdirs, and define a target for this end.
SUBPROC = subproc1
SUBPROC += subproc2

# note the target and the subdirs in the arguement as .PHONY.
.PHONY: subproc $(SUBPROC)
# let the arguement be the dependency.
subproc: $(SUBPROC)
# for each subdir in the arguement, make will run the command below.
$(SUBPROC): 
# MAKE = make, provided by make
# use -C <dir> to decide the working dir for a make process
	$(MAKE) -C $@

# use PHONY targets to run some useful commands.
.PHONY: clean cleanmain
clean: cleanmain cleansubproc
cleanmain:
# RM = rm -f, provided by make.
	$(RM) $(TARGET)

# use the same method to run 'make clean' in subdirs.
# $(patsubst A, B, C) changes all the A pattern to B for each string in C.
# we use this to avoid a override targeting for $(SUBPROC).
CLEANSUBPROC = $(patsubst %, clean%, $(SUBPROC))
.PHONY: cleansubproc $(CLEANSUBPROC)
cleansubproc: $(CLEANSUBPROC)
$(CLEANSUBPROC):
# when running command, use patsubst to change the dirname back.
	$(MAKE) -C $(patsubst clean%, %, $@) clean
	

.PHONY: build
build: all

.PHONY: run
run: build
# use @ to run command with out an ECHO.
	@ echo 'running $(TARGET):'
	@ ./$(TARGET)