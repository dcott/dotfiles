DESTDIR?=$(HOME)

COLOR_RED=\e[0;31m
COLOR_OFF=\e[0m

all:
	@echo "Nothing to build. Try 'make install'.";

# Diff the src tree against the install path.
.PHONY: diff
diff: clean
	find src -type f | while read FILE; do echo -ne "### $$FILE: $(COLOR_RED)"; diff -q "$(DESTDIR)/$${FILE#src/}" "$${FILE}" && echo ""; echo -ne "$(COLOR_OFF)"; done

.PHONY: clean
clean:
	@echo "Nothing to clean.";

.PHONY: install
install:
	for FILE in src/.[^.]*; do rsync -avz --delete $${FILE} $(DESTDIR); done
