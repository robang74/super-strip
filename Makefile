#
# (c) 2026, Roberto A. Foglietta <roberto.foglietta@gmail.com>, GPLv2 license
#     Previous authors: Aun-Ali Zaidi @aunali1, Ajam Azathothas <ajamx101@gmail.com> 
#
#  Makefile for sstrip

CC ?= gcc
LDFLAGS += -flto=4 -fno-plt 
CFLAGS += -g0 -O1 -pipe -w -Wno-error -Ielfrw -falign-functions=32

sstrip: sstrip.c elfrw/libelfrw.a
	$(CC) $(CFLAGS) -o $@ $^ $(LDFLAGS)

elfrw/libelfrw.a:
	$(MAKE) CFLAGS_EXTRA="$(LDFLAGS)" -C elfrw libelfrw.a

clean:
	$(MAKE) -C elfrw $@

distclean: clean
	rm -f sstrip elfrw/libelfrw.a
	$(MAKE) -C elfrw $@

