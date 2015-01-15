all: jupiter

jupiter: main.c
	gcc -g -O0 -o $@ main.c

clean:
	-rm jupiter
dist: $(distdir).tar.gz
$(distdir).tar.gz: $(distdir)
	tar chof - $(distdir) | gzip -9 -c > $@
	rm -rf $(distdir)
$(distdir):FORCE
	mkdir -p $(distdir)/src
	cp Makefile $(distdir)
	cp src/Makefile $(distdir)
	cp src/main.c $(distdir)
FORCE:
	-rm $(distdir).tar.gz >/dev/null 2>&1
	-rm -rf $(distdir) >/dev/null 2>&1
distcheck: $(distdir).tar.gz
	tar xvf $(distdir).tar.gz
	cd $(distdir) && $(MAKE) all
	cd $(distdir) && $(make) check	
	cd $(distdir) && $(MAKE) clean

install:jupiter
	install ./jupiter $(prefix)/bin/
uninstall:
	-rm $(prefix)/bin/jupiter
	
check: all
	./jupiter |grep "Hello from .*jupiter!"
	@echo "**** All test passed ***"
.PHONY: all clean check dist distcheck


