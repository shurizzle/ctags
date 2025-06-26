APE=/sys/src/ape
<$APE/config

CFLAGS=-DNDEBUG

HFILES=\
	args.h ctags.h debug.h entry.h general.h get.h keyword.h\
	main.h options.h parse.h parsers.h read.h routines.h sort.h\
	strlist.h vstring.h gnu_regex/regex.h e_plan9.h

OFILES=\
	args.$O\
	ant.$O\
	asm.$O\
	asp.$O\
	awk.$O\
	basic.$O\
	beta.$O\
	c.$O\
	cobol.$O\
	dosbatch.$O\
	eiffel.$O\
	entry.$O\
	erlang.$O\
	flex.$O\
	fortran.$O\
	get.$O\
	html.$O\
	jscript.$O\
	keyword.$O\
	lisp.$O\
	lregex.$O\
	lua.$O\
	main.$O\
	make.$O\
	matlab.$O\
	ocaml.$O\
	options.$O\
	parse.$O\
	pascal.$O\
	perl.$O\
	php.$O\
	python.$O\
	read.$O\
	rexx.$O\
	routines.$O\
	ruby.$O\
	scheme.$O\
	sh.$O\
	slang.$O\
	sml.$O\
	sort.$O\
	sql.$O\
	strlist.$O\
	tcl.$O\
	tex.$O\
	verilog.$O\
	vhdl.$O\
	vim.$O\
	yacc.$O\
	vstring.$O\
	gnu_regex/regex.$O\

default:V: all

</sys/src/cmd/mkmany

all: $O.ctags

%.$O:	%.c
	$CC \
		-D_POSIX_SOURCE -D_PLAN9_SOURCE -D_RESEARCH_SOURCE \
		-D_BSD_EXTENSION \
		-DHAVE_REGCOMP -D__USE_GNU '-Dbool=int' '-Dfalse=0' '-Dtrue=1' \
		-I. -Ignu_regex \
		-D__$objtype'__' -D__plan9__ \
		-c $CFLAGS -o $stem.$O $stem.c

$O.ctags:	$OFILES
	$LD -o $target $prereq

$O.readtags: readtags.c
	$CC -DREADTAGS_MAIN \
		-D_POSIX_SOURCE -D_PLAN9_SOURCE -D_RESEARCH_SOURCE \
		-D_BSD_EXTENSION \
		-DHAVE_REGCOMP -D__USE_GNU '-Dbool=int' '-Dfalse=0' '-Dtrue=1' \
		-I. -Ignu_regex \
		-D__$objtype'__' -D__plan9__ \
		$CFLAGS -o $target $prereq

install:V: install-ctags

install-strip:V: install

install-ctags:V: install-cbin install-cman

install-bin:V: install-cbin

install-cbin:V: /$objtype/bin/ctags

/$objtype/bin/ctags: $O.ctags
	cp $O.ctags /$objtype/bin/ctags

install-man:V: install-cman

install-cman:V: /sys/man/1/ctags

/sys/man/1/ctags: ctags.1
	cp ctags.1 /sys/man/1/ctags

clean:V:
	rm -f *.[$OS] *.a[$OS] gnu_regex/*.[$OS] y.tab.? lex.yy.c y.debug y.output [$OS].??* $TARG $CLEANFILES

uninstall:V:	uninstall-ctags

uninstall-ctags:V:	uninstall-cbin uninstall-cman

uninstall-bin:V:	uninstall-cbin

uninstall-cbin:V:
	rm -f /$objtype/bin/ctags

uninstall-man:V: uninstall-cman

uninstall-cman:V:
	rm -f /sys/man/1/ctags

nuke:V:	clean uninstall

syms:V: ${OFILES:%.$O=%.acid}
