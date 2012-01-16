# ==============================================================================
#
# Defines.common.mk
#
# ==============================================================================


CC       := gcc
CFLAGS   += -g -Wall -pthread -Werror
CFLAGS   += -O3
CFLAGS   += -I$(LIB) -I$(LIB)/$(TARGET)
CPP      := g++
CPPFLAGS += $(CFLAGS)
LD       := g++
LIBS     += -lpthread
ODIR     := ../$(TARGET)

# Remove these files when doing clean
OUTPUT +=

LIB := ../lib

OBJ_DIR = $(ODIR)/$(PROG)_objs

# ==============================================================================
#
# End of Defines.common.mk
#
# ==============================================================================
