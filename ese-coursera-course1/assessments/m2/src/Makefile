#******************************************************************************
# Copyright (C) 2017 by Alex Fosdick - University of Colorado
#
# Redistribution, modification or use of this software in source or binary
# forms is permitted as long as the files maintain this copyright. Users are 
# permitted to modify this and use it to learn about the field of embedded
# software. Alex Fosdick and the University of Colorado are not liable for any
# misuse of this material. 
#
#*****************************************************************************

#------------------------------------------------------------------------------
# <Put a Description Here>
#
# Use: make [TARGET] [PLATFORM-OVERRIDES]
#
# Build Targets:
#      <Put a description of the supported targets here>
#
# Platform Overrides:
#      <Put a description of the supported Overrides here
#
#------------------------------------------------------------------------------
include sources.mk

# Platform Overrides

TARGET = c1m2
ifeq ($(PLATFORM),MSP432)
	# Compiler Flags and Defines
	CC = arm-none-eabi-gcc
	LINKER_FILE = ../msp432p4014.lds
	LDFLAGS = -Wl, -Map=$(TARGET).map -T $(LINKER_FILE)
	PLATFORM = -mcpu=cortex-m4 -mthumb -march=armv7e-m -mfloat-abi=hard -mfpu=fpv4-sp-d16 --specs=nosys.specs
	SIZE = arm-none-eabi-size
	OBJDUMP = arm-none-eabi-objdump
else
	# Compiler Flags and Defines
	CC = gcc
	LDFLAGS = -Wl,-Map=$(TARGET).map
	OBJDUMP = objdump
	SIZE = size
endif


# General Flags
CFLAGS = -Wall -Werror -g -O0 -std=c99 -D$(PLATFORM)

OBJS = $(SOURCES:.c=.o)
DEPS = $(SOURCES:.c=.d)
ASMS = $(SOURCES:.c=.i)
PREP = $(SOURCES:.c=.asm)
%.i : %.c
	$(CC) $(CFLAGS) $(INCLUDES) -E $< -o $@
%.o : %.c
	$(CC) $(INCLUDES) $(CFLAGS) -c $< -o $@
%.asm : %.c
	$(CC) $(INCLUDES) -S $(CFLAGS) $< -o $@
%.d : %.c
	$(CC) $(INCLUDES) -M $< $(CFLAGS) -o $@

.PHONY: compile-all
compile-all: $(OBJS)

.PHONY: build
build: $(TARGET).out	
$(TARGET).out: $(OBJS) $(DEPS)
	$(CC) $(OBJS) $(INCLUDES) $(CFLAGS) $(LDFLAGS) -o $@
	$(SIZE) $@

.PHONY: clean
clean:
	rm -f $(OBJS) $(TARGET).out $(TARGET).map $(TARGET).asm $(DEPS) $(PREP) $(ASMS)
