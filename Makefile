SOURCES = base.ml \
          monoid.mli monoid.ml \
          monad.mli monad.ml \
          option.ml \
          mylist.ml
RESULT  = modlib

all: byte-code-library native-code-library

include OCamlMakefile
