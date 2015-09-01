export THIS_MAKEFILE_PATH:=$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
export PROJECT_PATH:=$(shell cd $(dir $(THIS_MAKEFILE_PATH));pwd)
export CONFIGS=$(shell cat config)

PHONY+=test

obj-y=a b

test:built-in.o
	$(GCC) $^ -o $@

clean:clean.rec
	@:

cleanall:cleanall.rec
	rm -f test

-include Makefile.build

