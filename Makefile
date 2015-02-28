SOURCES = monoid.mli monoid.ml
RESULT = monoid

all: byte-code-library native-code-library

install : libinstall
uninstall : libuninstall

include OCamlMakefile
