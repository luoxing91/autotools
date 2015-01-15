all: jupiter

jupiter: main.c
	gcc -g -O0 -o $@ main.c

clean:
	-rm jupiter

install:jupiter
	install -d $(prefix)/bin/
	install -m 0755 	./jupiter $(prefix)/bin
uninstall:
	-rm $(prefix)/bin/jupiter
	
check: all
	./jupiter |grep "Hello from .*jupiter!"
	@echo "**** All test passed ***"
.PHONY: FORCE all clean check dist distcheck install uninstall


