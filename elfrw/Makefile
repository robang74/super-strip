#
# (c) 2026, Roberto A. Foglietta <roberto.foglietta@gmail.com>, GPLv2 license
#     Previous authors: Aun-Ali Zaidi @aunali1, Ajam Azathothas <ajamx101@gmail.com> 
#
#  Makefile for libelfrw.a

AR ?= ar
CC ?= gcc
CFLAGS += -g0 -O1 -pipe -w -Wno-error -Ielfrw
CFLAGS += -falign-functions=32 $(CFLAGS_EXTRA)

LIBOBJS = elfrw.o elfrw_dyn.o elfrw_ehdr.o elfrw_phdr.o elfrw_rel.o \
          elfrw_shdr.o elfrw_sym.o elfrw_ver.o

libelfrw.a: $(LIBOBJS)
	$(AR) crs $@ $^

%.o: %.c %.h elfrw_int.h

clean:
	rm -f $(LIBOBJS)

distclean: clean
	rm -f libelfrw.a

