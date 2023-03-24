# st - suckless terminal build

src:
	git clone https://git.suckless.org/st src

wipe:
	rm -rf src

revert: src
	cd src && git reset --hard origin/master
	rm patch

patch: src
	cd src && git am --whitespace=nowarn --keep-non-patch ../patches/*.patch
	date > patch

clean:
	$(MAKE) -C src clean $(MTHREAD_FLAG)
	rm src/config.h

all: src
	$(MAKE) -C src all $(MTHREAD_FLAG)

install: src
	$(MAKE) -C src install $(MTHREAD_FLAG)

.PHONY: clean revert build install wipe all
