CC=gcc
CFLAGS=-Wall -Wextra -std=c99
EXEC=main

SRCDIR=src/
OBJDIR=obj

SRCFILES := $(wildcard $(SRCDIR)/*.c) $(wildcard $(SRCDIR)/**/*.c)
OBJFILES:=  $(patsubst $(SRCDIR)/%.c,$(OBJDIR)/%.o,$(SRCFILES))


# Create obj directory at the beginning
$(shell mkdir -p $(OBJDIR))

$(OBJDIR)/%.o: $(SRCDIR)/%.c
	$(CC) -c -o $@ $< $(CFLAGS)


.PHONY: all, clean 

all: $(EXEC)

main: $(OBJFILES) 
	$(CC) -o $@ $^ $(CFLAGS)
	

clean:
	rm -rf $(OBJDIR) $(EXEC) test



