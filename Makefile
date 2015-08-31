export THIS_MAKEFILE_PATH:=$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
export PROJECT_PATH:=$(shell cd $(dir $(THIS_MAKEFILE_PATH));pwd)

PHONY+=test

PROG=make_test

obj-y=a b

#OBJS=cps.o fact.o fib.o event.o
#$(PROG): $(OBJS)
#	$(CC) -o $@ $^

test:do
	@echo $@ PHONY:$(PHONY)
	@echo $@ obj-y:$(obj-y)
	@echo $@ subdirs:$(subdirs)
	@echo $@ objs:$(objs)
	@echo $@ TARGETS:$(TARGETS)

clean:
	rm -rf *.o

cleanall: clean
	rm -rf tags $(PROG)

-include Makefile.build

