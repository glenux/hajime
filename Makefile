
REMOTE?=1


all: build

build:
	@echo "Building locally..."
	corebuild src/cli/jyrkkaCli.native
	corebuild src/daemon/jyrkkaDaemon.native

install:
	@echo "Installing..."


.PHONY: watch
watch:
	PREV="" ; \
	while inotifywait -e modify -r src/ ; do \
		if [ ! -z "$$PREV" ] ; then \
			while kill -0 "$$PREV" ; do \
				sleep 1 ; \
			done ; \
		fi ; \
		$(MAKE) & PREV=$$! ; \
	done

clean:
	@echo "Cleaning..."
	rm -fr _build

TAGS:
	ctags --links=no -R src
