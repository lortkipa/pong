
# paths
bin_path := ../bin
src_path := ../src

# general settings
srcs := $(wildcard $(src_path)/*.c) $(wildcard $(src_path)/*/*.c) $(wildcard $(src_path)/*/*/*.c)
libs :=
format :=
project := pong
compiler := gcc
flags :=

# add config specific flags
ifeq ($(config), debug)
	flags += -DDEBUG -O0
else ifeq ($(config), dev)
	flags += -DDEV -Ofast
else
	flags += -DSHIP -Ofast
endif

# load os sxpecific stuff
ifeq ($(OS), Windows_NT)
	include windows.mk
else
	include linux.mk
endif

# scripts
.PHONY: bin build run all

all: bin build run

build:
	@echo --------------------building $(project) in $(config) mode--------------------
	$(compiler) $(srcs) $(libs) $(flags) -o $(bin_path)/$(project)$(format)

ifeq ($(config), debug)
	run_cmd = gdb ./$(bin_path)/$(project)$(format)
else
	run_cmd = ./$(bin_path)/$(project)$(format)
endif

run:
	@echo --------------------running $(project) in $(config) mode--------------------
	$(run_cmd)
