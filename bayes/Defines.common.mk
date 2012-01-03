# ==============================================================================
#
# Defines.common.mk
#
# ==============================================================================


PROG := bayes

LIB_SRCS := \
	$(LIB)/bitmap.c \
	$(LIB)/list.c \
	$(LIB)/mt19937ar.c \
	$(LIB)/queue.c \
	$(LIB)/random.c \
	$(LIB)/thread.c \
	$(LIB)/vector.c \

SRCS += \
	adtree.c \
	bayes.c \
	data.c \
	learner.c \
	net.c \
	sort.c \
	$(LIB_SRCS)
#
CFLAGS += -DLIST_NO_DUPLICATES
CFLAGS += -DLEARNER_TRY_REMOVE
CFLAGS += -DLEARNER_TRY_REVERSE


# ==============================================================================
#
# End of Defines.common.mk
#
# ==============================================================================
