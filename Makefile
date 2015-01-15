package = jupiter
version =1.0
tarname =$(package)
distdir =$(tarname)-$(version)

prefix=~
export prefix	
all clean check install jupiter uninstall:
	cd src && $(MAKE) $@
.PHONY: all clean
