export THIS_MAKEFILE_PATH:=$(word $(words $(MAKEFILE_LIST)),$(MAKEFILE_LIST))
export PROJECT_PATH:=$(shell cd $(dir $(THIS_MAKEFILE_PATH));pwd)

PHONY+=test

obj-y=a b

test:built-in.o
	$(LD) -o $@ $^

-include Makefile.build

