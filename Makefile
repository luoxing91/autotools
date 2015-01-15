package = jupiter
version =1.0
tarname =$(package)
distdir =$(tarname)-$(version)

prefix=~
export prefix	
all clean check install jupiter uninstall:
	cd src && $(MAKE) $@
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
	cd $(distdir) && $(MAKE) check
	cd $(distdir) && $(MAKE) prefix=$${PWD}/_inst install
	cd $(distdir) && $(MAKE) prefix=$${PWD}/_inst uninstall
	@remaining=$$(find $${PWD}/$(distdir)/_inst -type f | wc -l) ; \
	if test "$${remaining}" -ne 0 ; then \
		echo "***$${remaining} files remaining in stage directory!"; \
		exit 1; \
	fi
	cd $(distdir) && $(MAKE) clean
	rm -rf $(distdir)
.PHONY: all clean
