CC=gcc
CFLAGS=-g -Wall
LDFLAGS=
LIB_OBJS=error.o wraplib.o wrapsock.o wrapstdio.o wrapunix.o wrappthread.o sockfd_to_family.o sock_bind_wild.o sock_cmp_addr.o sock_cmp_port.o sock_get_port.o sock_ntop.o sock_ntop_host.o sock_set_addr.o sock_set_port.o sock_set_wild.o
LIBS=./libunp.a -lpthread
PROGS=daytimetcpcli daytimetcpsrv daytimetcpsrv1
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

daytimetcpsrv1: daytimetcpsrv1.o
	$(CC) $(CFLAGS) -o $@ $< $(LIBS)

clean:
	-rm -f $(OBJS)

