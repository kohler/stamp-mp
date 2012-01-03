# ==============================================================================
#
# Defines.common.mk
#
# ==============================================================================


CC       := gcc
CFLAGS   += -g -Wall -pthread
CFLAGS   += -O3
CFLAGS   += -I$(LIB)
CPP      := g++
CPPFLAGS += $(CFLAGS)
LD       := g++
LIBS     += -lpthread
ODIR     := ../build

# Remove these files when doing clean
OUTPUT +=

LIB := ../lib

STM := ../../tl2

# ==============================================================================
#
# End of Defines.common.mk
#
# ==============================================================================
