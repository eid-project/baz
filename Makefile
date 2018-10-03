NAME = bar

prefix := /usr
exec_prefix := $(prefix)
libdir := $(exec_prefix)/lib

CFLAGS += -I.
LDFLAGS := -shared

TARGET := lib$(NAME).so

$(TARGET): $(NAME).o
	$(CC) $(LDFLAGS) $(NAME).o -o $@

.PHONY: install clean

install:
	install -d $(DESTDIR)/$(libdir)
	install -m 0755 $(TARGET) $(DESTDIR)/$(libdir)

clean:
	rm -f $(TARGET) *.o
