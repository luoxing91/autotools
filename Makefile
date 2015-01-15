package = jupiter
version =1.0
tarname =$(package)
distdir =$(tarname)-$(version)

	
all clean :
	cd src && $(MAKE) $@
dist: 
$(distdir).tar.gz: $(distdir)
	tar chof - $(distdir) | gzip -9 -c > $@
	rm -rf $(distdir)
$(distdir):
	mkdir -p $(distdir)/src
	cp Makefile $(distdir)
	cp src/Makefile $(distdir)
	cp src/main.c $(distdir)
.PHONY: all clean
