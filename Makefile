PROG ?= file
PREFIX ?= /usr
DESTDIR ?=
LIBDIR ?= $(PREFIX)/lib
SYSTEM_EXTENSION_DIR ?= $(LIBDIR)/password-store/extensions
MANDIR ?= $(PREFIX)/share/man
BASHCOMPDIR ?= $(PREFIX)/share/bash-completion/completions

all:
	@echo "pass-$(PROG) is a shell script and does not need compilation, it can be simply executed."
	@echo ""
	@echo "To install it try \"make install\" instead."
	@echo
	@echo "To run pass $(PROG) one needs to have some tools installed on the system:"
	@echo "     password store"

install:
	@install -v -d "$(DESTDIR)$(MANDIR)/man1"
	@install -v -d "$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/"
	@install -v -d "$(DESTDIR)$(BASHCOMPDIR)"
	@install -v -m 0755 $(PROG).bash "$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/$(PROG).bash"
	@install -v -m 0644 pass-$(PROG).1 "$(DESTDIR)$(MANDIR)/man1/pass-$(PROG).1"
	@install -v -m 0644 $(PROG).bash.completion "$(DESTDIR)$(BASHCOMPDIR)/pass-$(PROG)"
	@echo
	@echo "pass-$(PROG) is installed succesfully"
	@echo

uninstall:
	@rm -vrf \
		"$(DESTDIR)$(SYSTEM_EXTENSION_DIR)/$(PROG).bash" \
		"$(DESTDIR)$(MANDIR)/man1/pass-$(PROG).1" \

test:
	make -C tests

lint:
	shellcheck -s bash $(PROG).bash $(PROG).bash.completion


.PHONY: install uninstall test lint
