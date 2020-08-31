CC=gcc
CFLAGS=-Wall -O
LDFLAGS=
EXEC=hello
SRC=$(wildcard src/*.c)
OBJ=$(SRC:.c=.o)

ifeq ($(PREFIX),)
	PREFIX := /usr/local
endif

all: $(EXEC)

$(EXEC): $(OBJ)
	@$(CC) -o $@ $^ $(LDFLAGS)

%.o: %.c
	@$(CC) -o $@ -c $< $(CFLAGS)

clean:
	@rm -rf $(EXEC) src/*.o

mrproper: clean
	@rm -f $(EXEC)

install: $(EXEC)
	@install -d $(DESTDIR)$(PREFIX)/bin/
	@install -m 755 $(EXEC) $(DESTDIR)$(PREFIX)/bin/

