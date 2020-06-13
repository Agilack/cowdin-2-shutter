##
 # @file  Makefile
 # @brief Script to compile sources and create flat binary using "make" program
 #
 # @author Saint-Genest Gwenael <gwen@agilack.fr>
 # @copyright Agilack (c) 2020
 #
 # @page License
 # This firmware is free software: you can redistribute it and/or modify it
 # under the terms of the GNU General Public License version 3 as published
 # by the Free Software Foundation. You should have received a copy of the
 # GNU General Public License along with this program, see LICENSE.md file
 # for more details.
 # This program is distributed WITHOUT ANY WARRANTY.
##
CROSS=arm-none-eabi-
TARGET=cowdin-shutter

SRC  = main.c hardware.c inputs.c relay.c time.c
ASRC = startup.s

BUILDDIR = build

CC = $(CROSS)gcc
OC = $(CROSS)objcopy
OD = $(CROSS)objdump
EDBG = sudo edbg

CFLAGS  = -mcpu=cortex-m0plus -mthumb
CFLAGS += -nostdlib -Os -ffunction-sections
CFLAGS += -fno-builtin-memset -fno-builtin-memcpy
CFLAGS += -Isrc
CFLAGS += -pedantic -Wall -Wextra -Wstrict-prototypes
CFLAGS += -Wimplicit -Wcast-align -Wpointer-arith -Wswitch
CFLAGS += -Wredundant-decls -Wreturn-type -Wshadow -Wunused
CFLAGS += -g

LDFLAGS  = -nostartfiles -T src/cowdin-shutter.ld
LDFLAGS += -Wl,-Map=$(TARGET).map,--cref,--gc-sections
LDFLAGS += -static

COBJ = $(patsubst %.c, $(BUILDDIR)/%.o,$(SRC))
AOBJ = $(patsubst %.s, $(BUILDDIR)/%.o,$(ASRC))

## Directives ##################################################################

all: $(BUILDDIR) $(AOBJ) $(COBJ)
	@echo "  [LD] $(TARGET)"
	@$(CC) $(CFLAGS) $(LDFLAGS) -o $(TARGET).elf $(AOBJ) $(COBJ)
	@echo "  [OC] $(TARGET).bin"
	@$(OC) -S $(TARGET).elf -O binary $(TARGET).bin
	@echo "  [OD] $(TARGET).dis"
	@$(OD) -D $(TARGET).elf > $(TARGET).dis

clean:
	@echo "  [RM] $(TARGET).*"
	@rm -f $(TARGET).elf $(TARGET).map $(TARGET).bin $(TARGET).dis
	@echo "  [RM] Temporary object (*.o)"
	@rm -f $(BUILDDIR)/*.o
	@rm -f *~

mrproper: clean
	@echo "  [RM] $(BUILDDIR)"
	@rm -rf $(BUILDDIR)

$(BUILDDIR):
	@echo "  [MKDIR] $@"
	@mkdir build

$(AOBJ) : $(BUILDDIR)/%.o : src/%.s
	@echo "  [AS] $@"
	@$(CC) $(CFLAGS) -c $< -o $@

$(COBJ) : $(BUILDDIR)/%.o: src/%.c
	@echo "  [CC] $@"
	@$(CC) $(CFLAGS) -c $< -o $@

# Use ataradov/edbg program to load the firmware using CMSIS-DAP probe
load:
	$(EDBG) -b -t atmel_cm0p -epv -f $(TARGET).bin
