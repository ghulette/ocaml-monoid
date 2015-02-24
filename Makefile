SOURCES = base.ml \
          monoid.mli monoid.ml \
	  functor.mli functor.ml \
          monad.mli monad.ml \
          option.ml \
          mylist.ml
RESULT  = modlib

all: byte-code-library native-code-library

include OCamlMakefile
