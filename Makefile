SHELL = /bin/sh

# root for installation
prefix      = /usr/local
exec_prefix = ${prefix}

# executables
bindir     = ${exec_prefix}/bin
sbindir    = ${exec_prefix}/sbin
libexecdir = ${exec_prefix}/libexec

# data
datarootdir    = ${prefix}/share
datadir        = ${datarootdir}
sysconfdir     = ${prefix}/etc
sharedstatedir = ${prefix}/com
localstatedir  = ${prefix}/var

# misc
includedir    = ${prefix}/include
oldincludedir = /usr/include
docdir        = ${datarootdir}/doc/${PACKAGE_TARNAME}
infodir       = ${datarootdir}/info
libdir        = ${exec_prefix}/lib
localedir     = ${datarootdir}/locale
mandir        = ${datarootdir}/man
man1dir       = $(mandir)/man1
man2dir       = $(mandir)/man2
man3dir       = $(mandir)/man3
man4dir       = $(mandir)/man4
man5dir       = $(mandir)/man5
man6dir       = $(mandir)/man6
man7dir       = $(mandir)/man7
man8dir       = $(mandir)/man8
man9dir       = $(mandir)/man9
manext        = .1
srcdir        = .

INSTALL         = /usr/bin/install -c
INSTALL_PROGRAM = ${INSTALL}
INSTALL_DATA    = ${INSTALL} -m 644

LN_S        = ln -s
SED_INPLACE = sed -i

PACKAGE   = music
PROG      = music
#VERSION   = 0.0.0
BUGREPORT = https://github.com/DMBuce/music/issues
URL       = https://github.com/DMBuce/music

BINFILES         = $(wildcard bin/*)
ETCFILES         = $(shell find etc/ -type f)
BINFILES_INSTALL = $(BINFILES:bin/%=$(DESTDIR)$(bindir)/%)
ETCFILES_INSTALL = $(ETCFILES:etc/%=$(DESTDIR)$(sysconfdir)/%)
INSTALL_FILES    = $(BINFILES_INSTALL) $(ETCFILES_INSTALL)
INSTALL_DIRS     = $(sort $(dir $(INSTALL_FILES)))

.PHONY: all
all:

.PHONY: install
install: all installdirs $(INSTALL_FILES)

.PHONY: installdirs
installdirs: $(INSTALL_DIRS)

$(INSTALL_DIRS):
	$(INSTALL) -d $@

$(DESTDIR)$(bindir)/%: bin/%
	$(INSTALL_PROGRAM) $< $@

$(DESTDIR)$(sysconfdir)/%: etc/%
	$(INSTALL_DATA) $< $@

$(DESTDIR)$(bindir)/music: bin/music
	$(INSTALL_PROGRAM) $< $@
	$(SED_INPLACE) '/sysconfdir=/ s,.*,sysconfdir="$(sysconfdir)",' $@

# vim: set ft=make:
