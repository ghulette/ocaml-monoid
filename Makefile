SOURCES = monoid.mli monoid.ml
RESULT  = monoidlib

all: byte-code-library native-code-library

include OCamlMakefile
