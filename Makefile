CC=gcc
CFLAGS=-g -Wall
LDFLAGS=
LIB_OBJS=error.o wrapsock.o wrapstdio.o wrapunix.o
LIBS=./libunp.a -lpthread
PROGS=daytimetcpcli daytimetcpsrv
OBJS= $(LIB_OBJS) $(PROGS:=.o)

.PHONY: clean

all:libunp.a $(PROGS)

libunp.a:$(LIB_OBJS)
	ar rv libunp.a $?
	ranlib libunp.a

daytimetcpcli: daytimetcpcli.o
	$(CC) $(CFLAGS) -o $@ $< $(LIBS)

daytimetcpsrv: daytimetcpsrv.o
	$(CC) $(CFLAGS) -o $@ $< $(LIBS)

clean:
	-rm -f $(OBJS)

